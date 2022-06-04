part of 'separated.dart';

class DigitSeparatedItem extends BaseDigitsSeparated {
  const DigitSeparatedItem({
    Key? key,
    required double height,
    required double width,
    required Decoration decoration,
    required ValueNotifier<int> firstDigit,
    required ValueNotifier<int> secondDigit,
    required TextStyle textStyle,
    required TextStyle separatorStyle,
    required int initValue,
    required SlideDirection slideDirection,
    required bool showZeroValue,
    required Curve curve,
    required bool countUp,
    required Duration slideAnimationDuration,
    required List<Color> gradientColor,
    required String separator,
    bool? showSeparator,
    bool? fade,
    EdgeInsets? separatorPadding,
    TextDirection? textDirection,
    List<String>? digitsNumber,
  }) : super(
          key: key,
          height: height,
          width: width,
          decoration: decoration,
          firstDigit: firstDigit,
          secondDigit: secondDigit,
          textStyle: textStyle,
          separatorStyle: separatorStyle,
          initValue: initValue,
          slideDirection: slideDirection,
          showZeroValue: showZeroValue,
          curve: curve,
          countUp: countUp,
          slideAnimationDuration: slideAnimationDuration,
          gradientColor: gradientColor,
          fade: fade,
          separatorPadding: separatorPadding,
          separator: separator,
          showSeparator: showSeparator ?? true,
          textDirection: textDirection,
          digitsNumber: digitsNumber,
        );

  @override
  Widget build(BuildContext context) {
    final withOutAnimation = slideDirection == SlideDirection.none;
    final firstDigitWidget = withOutAnimation
        ? TextWithoutAnimation(
            value: firstDigit,
            textStyle: textStyle,
            initValue: initValue,
          )
        : TextAnimation(
            slideAnimationDuration: slideAnimationDuration,
            value: firstDigit,
            textStyle: textStyle,
            slideDirection: slideDirection,
            curve: curve,
            countUp: countUp,
            digitsNumber: digitsNumber,
          );

    final secondDigitWidget = withOutAnimation
        ? TextWithoutAnimation(
            value: secondDigit,
            textStyle: textStyle,
            initValue: initValue,
          )
        : TextAnimation(
            slideAnimationDuration: slideAnimationDuration,
            value: secondDigit,
            textStyle: textStyle,
            slideDirection: slideDirection,
            curve: curve,
            countUp: countUp,
            digitsNumber: digitsNumber,
          );

    final separatorWidget = Separator(
      padding: separatorPadding,
      show: true,
      separator: separator,
      style: separatorStyle,
    );

    final box = BoxSeparated(
      height: height,
      width: width,
      decoration: decoration,
      gradientColors: gradientColor,
      fade: fade ?? false,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          firstDigitWidget,
          secondDigitWidget,
        ],
      ),
    );

    return Visibility(
      visible: showSeparator,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: textDirection.isRtl
            ? [
                separatorWidget,
                box,
              ]
            : [
                box,
                separatorWidget,
              ],
      ),
      replacement: box,
    );
  }
}