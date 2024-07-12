import 'package:flutter/material.dart';

Widget buildInstrumentCard(
    BuildContext context,
    String imageUrl,
    String title,
    String instrumentName,
    String description,
    String more,
  ) {
    return Container(
      width: 156,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 156,
                height: 156,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.04,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            instrumentName,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.4,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

