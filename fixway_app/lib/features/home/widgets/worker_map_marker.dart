import 'package:flutter/material.dart';

/// Circular worker avatar marker for the map.
/// Shows the worker's profession image with a blue border + shadow.
class WorkerMapMarker extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;

  const WorkerMapMarker({
    super.key,
    required this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF0047AB), width: 2.5),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0047AB).withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(2),
            child: ClipOval(
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.person, color: Colors.grey, size: 28),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
