import 'package:counter_app/core/extentions/size_extention.dart';
import 'package:counter_app/logic/cubit/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterSlider extends StatefulWidget {
  const CounterSlider({super.key});

  @override
  State<CounterSlider> createState() => _Stepper2State();
}

class _Stepper2State extends State<CounterSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationHorizontal;
  late Animation<Offset> _animationVertical;
  late double _startAnimationPosX;
  late double _startAnimationPosY;
  bool isHorizontal = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: -0.5,
      upperBound: 0.5,
    );
    _controller.value = 0.0;
    _controller.addListener(() {});

    _animationHorizontal = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(_controller);

    _animationVertical = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 1.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animationHorizontal = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(_controller);

    _animationVertical = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 1.0),
    ).animate(_controller);
  }

  // !test = init();

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // vertical
          const SizedBox(
            width: 120.0,
            height: 280.0,
            child: SliderContainer(isHorizontal: false),
          ),
          // horizontal
          const SizedBox(
            width: 280.0,
            height: 120.0,
            child: SliderContainer(isHorizontal: true),
          ),
          GestureDetector(
            key: const Key('conter'),
            onHorizontalDragStart: _onPanHorizontalStart,
            onHorizontalDragUpdate: _onPanHorizontalUpdate,
            onHorizontalDragEnd: _onPanHorizontalEnd,
            onVerticalDragStart: _onPanVerticalStart,
            onVerticalDragUpdate: _onPanVerticalUpdate,
            onVerticalDragEnd: _onPanVerticalEnd,
            child: SlideTransition(
              position:
                  isHorizontal ? _animationHorizontal : _animationVertical,
              child: const ControlWidget(),
            ),
          ),
        ],
      ),
    );
  }

  double offsetFromGlobalPosHorizontal(Offset globalPosition) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset local = box.globalToLocal(globalPosition);
    _startAnimationPosX = ((local.dx * 0.75) / box.size.width) - 0.4;
    _startAnimationPosY = ((local.dy * 0.75) / box.size.height) - 0.4;
    return ((local.dx * 0.75) / box.size.width) - 0.4;
  }

  double offsetFromGlobalPosVertical(Offset globalPosition) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset local = box.globalToLocal(globalPosition);
    _startAnimationPosX = ((local.dx * 0.75) / box.size.width) - 0.4;
    _startAnimationPosY = ((local.dy * 0.75) / box.size.height) - 0.4;
    return ((local.dy * 0.75) / box.size.height) - 0.4;
  }

  void _onPanHorizontalStart(DragStartDetails details) {
    setState(() {
      isHorizontal = true;
    });
    _controller.stop();
    _controller.value = offsetFromGlobalPosHorizontal(details.globalPosition);
  }

  void _onPanHorizontalUpdate(DragUpdateDetails details) {
    _controller.value = offsetFromGlobalPosHorizontal(details.globalPosition);
  }

  void _onPanHorizontalEnd(DragEndDetails details) {
    _controller.stop();
    if (_controller.value <= -0.20) {
      context.read<CounterCubit>().decrement();
    } else if (_controller.value >= 0.20) {
      context.read<CounterCubit>().increment();
    }
    final SpringDescription kDefaultSpring = SpringDescription.withDampingRatio(
      mass: 0.8,
      stiffness: 200.0,
      ratio: 0.6,
    );

    _controller.animateWith(
      SpringSimulation(
        kDefaultSpring,
        _startAnimationPosX,
        0.0,
        0.0,
      ),
    );
  }

  void _onPanVerticalStart(DragStartDetails details) {
    setState(() {
      isHorizontal = false;
    });
    _controller.stop();
    _controller.value = offsetFromGlobalPosVertical(details.globalPosition);
  }

  void _onPanVerticalUpdate(DragUpdateDetails details) {
    _controller.value = offsetFromGlobalPosVertical(details.globalPosition);
  }

  void _onPanVerticalEnd(DragEndDetails details) {
    _controller.stop();
    if (_controller.value <= -0.20) {
      context.read<CounterCubit>().increment();
    } else if (_controller.value >= 0.20) {
      context.read<CounterCubit>().decrement();
    }
    final SpringDescription kDefaultSpring = SpringDescription.withDampingRatio(
      mass: 0.8,
      stiffness: 200.0,
      ratio: 0.6,
    );

    _controller.animateWith(
      SpringSimulation(
        kDefaultSpring,
        _startAnimationPosY,
        0.0,
        0.0,
      ),
    );
  }
}

class ControlWidget extends StatelessWidget {
  const ControlWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      shadowColor: Colors.red,
      elevation: 5.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffb56576),
            ),
            height: context.height * 0.100,
            width: context.height * 0.100,
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.teal,
            ),
            height: context.height * 0.050,
            width: context.height * 0.050,
          ),
        ],
      ),
    );
  }
}

class SliderContainer extends StatelessWidget {
  const SliderContainer({
    Key? key,
    required this.isHorizontal,
  }) : super(key: key);
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(60.0),
      color: Colors.white.withOpacity(0.2),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: isHorizontal ? 10.0 : null,
            bottom: isHorizontal ? null : 10,
            child: Icon(Icons.remove,
                size: context.height * 0.040, color: Colors.white),
          ),
          Positioned(
            right: isHorizontal ? 10.0 : null,
            top: isHorizontal ? null : 10,
            child: Icon(Icons.add,
                size: context.height * 0.040, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// != carbon.sh
