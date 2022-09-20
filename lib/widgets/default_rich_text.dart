import 'package:flutter/material.dart';

class DefaultRichText extends StatelessWidget {
  final InlineSpan text;
  final int? maxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final TextDirection? textDirection;

  const DefaultRichText({
    Key? key,
    required this.text,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: text,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
