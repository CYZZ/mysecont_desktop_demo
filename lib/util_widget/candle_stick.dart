import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CandleStick extends CustomPainter {
  final red = Colors.red;
  final green = Colors.green;

  final double mostHigh;
  final double mostLow;
  final double open;
  final double close;

  const CandleStick(
    this.mostHigh,
    this.mostLow,
    this.open,
    this.close,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint();
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    // 开始计算实体的高点和低点
    double bodyTop = size.height / 2, bodyBottom = size.height / 2;
    if (mostHigh > mostLow) {
      // 如果开盘和收盘价格不相等
      double openY =
          size.height * (1 - (open - mostLow) / (mostHigh - mostLow));
      double closeY =
          size.height * (1 - (close - mostLow) / (mostHigh - mostLow));
      bodyTop = min(openY, closeY);
      bodyBottom = max(openY, closeY);
    }
    final bodyRect = Rect.fromLTRB(0.0, bodyTop, size.width, bodyBottom);
    // 注意这一句话
//    canvas.clipRect(rect);
    paint.color = close > open ? red : green;
    paint.strokeWidth = 3;
    paint.style = PaintingStyle.stroke;
    canvas.drawRect(bodyRect, paint);
//    paint.strokeWidth = 3; // 线的粗细
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2, bodyTop), paint);
    canvas.drawLine(Offset(size.width / 2, bodyBottom),
        Offset(size.width / 2, size.height), paint);
//    canvas.drawCircle(Offset.zero, size.height, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
