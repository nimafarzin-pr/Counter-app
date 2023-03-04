import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/animated_box.dart';
import '../../core/widgets/counter_slider.dart';
import '../../core/widgets/custom_text_widget.dart';
import '../cubit/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
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
