import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String info;
  final bool isBio;
  final VoidCallback onTap;

  InfoRow({
    required this.title,
    required this.info,
    this.isBio = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: Text(
                info,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
                maxLines: isBio ? null : 1,
                overflow: isBio ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
