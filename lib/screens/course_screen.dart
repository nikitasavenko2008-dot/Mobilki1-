import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  static const Color accent = Color(0xFF5B5BF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
              child: Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDECFC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.chevron_left,
                        size: 22, color: accent),
                  ),
                  const SizedBox(width: 12),
                  const Text('3D Design Basic',
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      height: 190,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF1B1FB8),
                            Color(0xFF4B3BE8),
                            Color(0xFF0B0E63),
                          ],
                        ),
                      ),
                      child: CustomPaint(
                          size: const Size(double.infinity, 190),
                          painter: _BlobPainter()),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: const [
                      _Chip(
                          icon: Icons.remove_red_eye_outlined,
                          label: '4,569',
                          color: Color(0xFFEDECFC),
                          fg: accent),
                      SizedBox(width: 8),
                      _Chip(
                          icon: Icons.star_rounded,
                          label: '4.9',
                          color: Color(0xFFEDECFC),
                          fg: accent),
                      SizedBox(width: 8),
                      _Chip(
                          label: 'Best Seller',
                          color: accent,
                          fg: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('3D Design Basic',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 10),
                  const Text(
                    'In this course you will learn how to build a space to a 3-dimensional product. '
                    'There are 24 premium learning videos for you.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text('24 Lessons (20 hours)',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      const Text('See all',
                          style: TextStyle(
                              fontSize: 13,
                              color: accent,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 14),
                  _lesson('Introduction to 3D', '20 mins'),
                  _lesson('Modeling a Space', '35 mins'),
                  _lesson('Lighting & Materials', '28 mins'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28)),
                  ),
                  onPressed: () {},
                  child: const Text('Enroll - \$24.99',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lesson(String title, String duration) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6FB),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color(0xFF7A5CF0), Color(0xFF2B2FB5)],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700)),
                const SizedBox(height: 3),
                Text(duration,
                    style:
                        TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
            const Spacer(),
            const Icon(Icons.check_circle_outline, color: accent),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.color,
    required this.fg,
    this.icon,
  });

  final String label;
  final Color color;
  final Color fg;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: fg),
            const SizedBox(width: 5),
          ],
          Text(label,
              style: TextStyle(
                  fontSize: 12, color: fg, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    void blob(double cx, double cy, double r, Color c, double alpha) {
      final paint = Paint()
        ..color = c.withValues(alpha: alpha)
        ..style = PaintingStyle.fill;
      final path = Path();
      path.moveTo(w * cx, h * cy - r);
      path.cubicTo(w * (cx + 0.5), h * (cy - 0.4), w * (cx + 0.45),
          h * (cy + 0.45), w * cx, h * (cy + 0.5));
      path.cubicTo(w * (cx - 0.45), h * (cy + 0.45), w * (cx - 0.5),
          h * (cy - 0.4), w * cx, h * cy - r);
      path.close();
      canvas.drawPath(path, paint);
    }

    blob(0.28, 0.32, h * 0.28, const Color(0xFF6E7BFF), 0.9);
    blob(0.62, 0.55, h * 0.34, const Color(0xFF2A2FA8), 0.85);
    blob(0.82, 0.28, h * 0.2, const Color(0xFF9FB0FF), 0.7);
    blob(0.45, 0.78, h * 0.22, const Color(0xFF12146B), 0.8);

    final shine = Paint()
      ..color = Colors.white.withValues(alpha: 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(w * 0.3, h * 0.32),
            width: w * 0.22,
            height: h * 0.42),
        -1.2,
        1.6,
        false,
        shine);
  }

  @override
  bool shouldRepaint(covariant _BlobPainter oldDelegate) => false;
}
