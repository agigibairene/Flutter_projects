import 'package:flutter/material.dart';

class ChoiceChipWidget extends StatelessWidget{
  final String icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ChoiceChipWidget({
    super.key, 
    required this.icon, 
    required this.isSelected, 
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final Color background = isSelected ? Color(0xFF005C5C) : Colors.white;
    final Color content = isSelected ? Colors.white : Color(0xFF1F2832);
    final Color borderColor = isSelected ? Color(0xFF00CA9B) : Color(0xFFBDBDBD);
    final Color shadowColor = isSelected ? Color(0x4D006666) : Color(0x40000000);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: background,
          border: Border.all(
            color: borderColor,
            width: 1.5
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 5.0,
              offset: const Offset(0, 2)
            )
          ]
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/$icon',
              width: 30,
              height: 30,
              errorBuilder: (context, error, stackTrace){
                return Icon(Icons.image_not_supported);
              },
            ),
            SizedBox(width: 8,),
            Text(text, style: TextStyle(color: content, fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}