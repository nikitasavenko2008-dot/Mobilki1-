import 'dart:math' as math;
import 'package:flutter/material.dart';

class MeditateScreen extends StatefulWidget {
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _MeditateScreenState();
}

class _MeditateScreenState extends State<MeditateScreen> {
  static const Color teal = Color(0xFF1A9E8F);

  static const List<String> tabs = [
    'All',
    'Bible In a Year',
    'Dailies',
    'Minutes',
    'Novena',
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Meditate',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                const Icon(Icons.search, size: 26),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final active = i == selected;
                  return GestureDetector(
                    onTap: () => setState(() => selected = i),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: active ? teal : const Color(0xFFEAF6F4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tabs[i],
                        style: TextStyle(
                          fontSize: 13,
                          color: active ? Colors.white : teal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
            _featured(),
            const SizedBox(height: 18),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.78,
              children: const [
                _MiniCard(
                  color: Color(0xFFF5A623),
                  art: _MiniArt.sunset,
                  title: 'The Sleep Hour',
                  author: 'Ashna Mukherjee',
                  meta: '3 Sessions',
                ),
                _MiniCard(
                  color: Color(0xFFBFE3E0),
                  art: _MiniArt.moon,
                  title: 'Easy on the Mission',
                  author: 'Peter Mach',
                  meta: '5 minutes',
                ),
                _MiniCard(
                  color: Color(0xFF3B6FE0),
                  art: _MiniArt.mountain,
                  title: 'Relax with Me',
                  author: 'Amanda James',
                  meta: '3 Sessions',
                ),
                _MiniCard(
                  color: Color(0xFF0FA08F),
                  art: _MiniArt.sky,
                  title: 'Sun and Energy',
                  author: 'MICHAEL HIU',
                  meta: '5 minutes',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _featured() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: 190,
            color: const Color(0xFFF7C645),
            child: CustomPaint(
              size: const Size(double.infinity, 190),
              painter: _SunMoonPainter(),
            ),
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'A Song of Moon',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 4),
        const Text('Start with the basics',
            style: TextStyle(fontSize: 14, color: Colors.black87)),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.favorite_border, size: 16),
            const SizedBox(width: 6),
            const Text('Sessions', style: TextStyle(fontSize: 13)),
            const Spacer(),
            Text('Start',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
            const SizedBox(width: 2),
            Icon(Icons.chevron_right,
                size: 16, color: Colors.grey.shade600),
          ],
        ),
      ],
    );
  }
}

enum _MiniArt { sunset, moon, mountain, sky }

class _MiniCard extends StatelessWidget {
  const _MiniCard({
    required this.color,
    required this.art,
    required this.title,
    required this.author,
    required this.meta,
  });

  final Color color;
  final _MiniArt art;
  final String title;
  final String author;
  final String meta;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CustomPaint(
              painter: _MiniArtPainter(art: art),
              child: const SizedBox.expand(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        const SizedBox(height: 2),
        Text(author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.favorite_border, size: 13, color: Colors.grey.shade600),
            const SizedBox(width: 4),
            Text(meta,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            const Spacer(),
            Text('Start',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            Icon(Icons.chevron_right,
                size: 13, color: Colors.grey.shade600),
          ],
        ),
      ],
    );
  }
}

class _SunMoonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final cx = w * 0.42;
    final cy = h * 0.5;

    final rayPaint = Paint()
      ..color = const Color(0xFFE9552F)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < 12; i++) {
      final a = i * math.pi / 6;
      canvas.drawLine(
        Offset(cx + math.cos(a) * w * 0.19, cy + math.sin(a) * w * 0.19),
        Offset(cx + math.cos(a) * w * 0.25, cy + math.sin(a) * w * 0.25),
        rayPaint,
      );
    }

    canvas.drawCircle(
        Offset(cx, cy), w * 0.17, Paint()..color = const Color(0xFFF2653A));
    canvas.drawCircle(
        Offset(cx + w * 0.16, cy - h * 0.04),
        w * 0.16,
        Paint()..color = const Color(0xFF3A3F4B));

    final face = Paint()
      ..color = const Color(0xFF7A2E12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(cx - w * 0.05, cy - h * 0.02),
            width: w * 0.04,
            height: h * 0.05),
        math.pi * 0.15,
        math.pi * 0.7,
        false,
        face);
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(cx + w * 0.05, cy - h * 0.02),
            width: w * 0.04,
            height: h * 0.05),
        math.pi * 0.15,
        math.pi * 0.7,
        false,
        face);
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(cx, cy + h * 0.05),
            width: w * 0.06,
            height: h * 0.06),
        math.pi * 0.15,
        math.pi * 0.7,
        false,
        face);

    final cloud = Paint()..color = Colors.white;
    for (final p in [
      Offset(w * 0.10, h * 0.18),
      Offset(w * 0.86, h * 0.24),
      Offset(w * 0.14, h * 0.82),
      Offset(w * 0.82, h * 0.80),
    ]) {
      canvas.drawOval(
          Rect.fromCenter(
              center: p, width: w * 0.16, height: h * 0.10), cloud);
      canvas.drawCircle(Offset(p.dx + w * 0.03, p.dy - h * 0.04), w * 0.05, cloud);
    }
  }

  @override
  bool shouldRepaint(covariant _SunMoonPainter oldDelegate) => false;
}

class _MiniArtPainter extends CustomPainter {
  _MiniArtPainter({required this.art});

  final _MiniArt art;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final white = Paint()..color = Colors.white;
    final soft = Paint()
      ..color = Colors.white.withValues(alpha: 0.85);

    switch (art) {
      case _MiniArt.sunset:
        canvas.drawCircle(Offset(w * 0.72, h * 0.3), w * 0.1, soft);
        _bird(canvas, Offset(w * 0.25, h * 0.3), w * 0.06, white);
        _bird(canvas, Offset(w * 0.45, h * 0.2), w * 0.05, white);
        _cloud(canvas, Offset(w * 0.3, h * 0.72), w * 0.5, h * 0.22, white);
        break;
      case _MiniArt.moon:
        canvas.drawCircle(Offset(w * 0.68, h * 0.38), w * 0.22,
            Paint()..color = const Color(0xFF3F4656));
        canvas.drawCircle(Offset(w * 0.60, h * 0.32), w * 0.2,
            Paint()..color = const Color(0xFFBFE3E0));
        _cloud(canvas, Offset(w * 0.35, h * 0.62), w * 0.55, h * 0.24, white);
        break;
      case _MiniArt.mountain:
        final peak = Paint()..color = Colors.white;
        canvas.drawPath(
          Path()
            ..moveTo(w * 0.1, h * 0.85)
            ..lineTo(w * 0.42, h * 0.35)
            ..lineTo(w * 0.74, h * 0.85)
            ..close(),
          peak,
        );
        canvas.drawCircle(Offset(w * 0.78, h * 0.26), w * 0.08, soft);
        break;
      case _MiniArt.sky:
        canvas.drawCircle(Offset(w * 0.5, h * 0.45), w * 0.2,
            Paint()..color = const Color(0xFFF5C33B));
        _cloud(canvas, Offset(w * 0.24, h * 0.24), w * 0.4, h * 0.18, white);
        _bird(canvas, Offset(w * 0.76, h * 0.3), w * 0.06, white);
        _cloud(canvas, Offset(w * 0.7, h * 0.78), w * 0.45, h * 0.18, white);
        break;
    }
  }

  void _cloud(Canvas canvas, Offset c, double cw, double ch, Paint p) {
    canvas.drawOval(Rect.fromCenter(center: c, width: cw, height: ch), p);
    canvas.drawCircle(Offset(c.dx - cw * 0.18, c.dy - ch * 0.45), cw * 0.16, p);
    canvas.drawCircle(Offset(c.dx + cw * 0.12, c.dy - ch * 0.35), cw * 0.13, p);
  }

  void _bird(Canvas canvas, Offset c, double s, Paint p) {
    p = Paint()
      ..color = p.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Rect.fromCenter(center: c, width: s, height: s), math.pi, math.pi, false, p);
    canvas.drawArc(
        Rect.fromCenter(center: Offset(c.dx + s, c.dy), width: s, height: s),
        math.pi,
        math.pi,
        false,
        p);
  }

  @override
  bool shouldRepaint(covariant _MiniArtPainter oldDelegate) => false;
}
