import 'package:counter_app/logic/cubit/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/animated_box.dart';
import '../../widgets/counter_slider.dart';
import '../../widgets/custom_text_widget.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            AnimatedBox(
              child: CustomText(
                text: context.select(
                    (CounterCubit value) => value.state.value.toString()),
              ),
            ),
            const CounterSlider(),
          ],
        ),
      ),
    );
  }
}
