import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttergoogleask/view/widgets/visibility.dart';

/**
 * Created by Dmitry Diachenko on Feb 18, 2020
 * powered by leaditteam.com
 **/

//MARK: widget ext
extension WidgetExtension on Widget {
  Widget setVisibility(VisibilityFlag flag) {
    return MyVisibility(visibility: flag, child: this);
  }

  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingOnly(
      {double left = 0, double right = 0, double top = 0, double bottom = 0}) {
    return Padding(
      padding: EdgeInsets.only(
        left: left != 0 ? left : 0,
        right: right != 0 ? right : 0,
        top: top != 0 ? top : 0,
        bottom: bottom != 0 ? bottom : 0,
      ),
      child: this,
    );
  }

  Widget addOnTap(Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  //TODO: delete
//  Widget insideScroll() {
//    return SingleChildScrollView(child: this);
//  }
//
//  Widget insideScrollAndExpand() {
//    return Expanded(child: SingleChildScrollView(child: this));
//  }

  //TODO: delete
//  Widget expand() {
//    return Expanded(child: this);
//  }

  Widget addOnTapAnimation(
      {@required Function onTap, int animation_miliseconds = 200}) {
    return AnimatedWidgetOnClick(
      child: this,
      onTap: onTap,
      animation_miliseconds: animation_miliseconds,
    );
  }
}

//MARK : future   /-native_progress_hud: ^1.0.3
//extension MyFuture<T> on Future<T> {
//  Future<T> withProgressBar({BuildContext context}) async {
//    // show hud
//    var res;
//    try {
//      NativeProgressHud.showWaiting();
//      res = await this;
//      await Future.delayed(Duration(microseconds: 100), null); //for visibility
//      NativeProgressHud.hideWaiting();
//    } catch (e) {
//      print(e);
//      NativeProgressHud.hideWaiting();
//    }
//    return res;
//  }
//}

//MARK: static methods
Widget showSnackWithoutButton(
    {@required BuildContext context, @required String text}) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: Duration(seconds: 3),
  ));
}

//MARK: supportive classes
// FIXME: вынести в отдельный класс
class AnimatedWidgetOnClick extends StatefulWidget {
  Widget child;
  Function onTap;
  int animation_miliseconds;

  AnimatedWidgetOnClick(
      {@required this.child, @required this.onTap, this.animation_miliseconds});

  @override
  _AnimatedWidgetOnClickState createState() => _AnimatedWidgetOnClickState();
}

class _AnimatedWidgetOnClickState extends State<AnimatedWidgetOnClick>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animation_miliseconds),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _onTap() {
    if (widget.onTap != null) _playAnimation();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
      widget.onTap();
    } on TickerCanceled {
      print('Error animation');
    }
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

//    return GestureDetector(
////      behavior: HitTestBehavior.opaque,
//      onTap: _onTap,
////      onTapDown: _onTapDown,
////      onTapUp: _onTapUp,
//      child: Transform.scale(
//        scale: _scale,
//        child: widget.child,
//      ),
//    );

    return RawGestureDetector(
      gestures: {
        AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<
            AllowMultipleGestureRecognizer>(
              () => AllowMultipleGestureRecognizer(),
              (AllowMultipleGestureRecognizer instance) {
            instance
              ..onTap = () async {
                _onTap();
              };
          },
        )
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}

// FIXME: вынести в отдельный класс
class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
