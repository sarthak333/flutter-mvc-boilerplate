import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatelessWidget {
  final bool loading;
  final double height;
  final double width;
  final action;
  final bool disabled;
  final String type;
  final IconData icon;

  CommonButton({
    this.loading = false,
    this.height = 47,
    this.width,
    this.action,
    this.disabled = false,
    this.type = PRIMARY,
    this.icon,
  });

  getBgColor() {
    switch (type) {
      case PRIMARY:
        return disabled || loading ? disabledGrey : primary;
      default:
        return Colors.transparent;
    }
  }

  getButtonBorder() {
    if (type == SECONDARY) return Border.all(width: 1, color: primary);
  }

  getTextColor() {
    switch (type) {
      case PRIMARY:
        return white;

      case SECONDARY:
        return primary;

      case TERTIARY:
        return black;
    }
  }

  getProgressBgColor() {
    if (type == PRIMARY)
      return Colors.white70;
    else
      return primary;
  }

  getProgressAnimatedColor() {
    if (type == PRIMARY)
      return Colors.black26;
    else
      return Colors.white70;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: height,
        width: loading ? 47 : width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: getButtonBorder(),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Material(
          color: getBgColor(),
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(50),
          child: InkWell(
            onTap: loading || disabled ? null : action,
            splashColor: white.withAlpha(30),
            child: Container(
              child: Center(
                child: loading
                    ? SizedBox(
                        height: 28,
                        width: 28,
                        child: CircularProgressIndicator(
                          backgroundColor: getProgressBgColor(),
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              getProgressAnimatedColor()),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (icon != null)
                            Icon(
                              icon,
                              size: 20,
                              color: getTextColor(),
                            ),
                          SizedBox(width: 4),
                          Text(
                            "Button",
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: getTextColor(),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
