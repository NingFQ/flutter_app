import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final double height;
  final List<Color> colors;
  final double width;
  final Widget child;
  final GestureTapCallback onPressed;

  const GradientButton(
      {Key key,
      this.width,
      this.height,
      this.colors,
      this.onPressed,
      @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: height, width: width),
          child: Center(
            child: Text(
              'Button',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
