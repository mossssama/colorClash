import 'package:demo_app/trash/presentation/widgets/row_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/counter_provider.dart';
import 'container_button_widget.dart';

class AppRow extends StatefulWidget {
  const AppRow({super.key, required this.btnBackground,required this.mainBackground,required this.index});
  final Color btnBackground;
  final Color mainBackground;
  final int index;

  @override
  State<AppRow> createState() => AppRowState();
}

class AppRowState extends State<AppRow> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            ContainerButton(
                buttonSign: "-",
                buttonBackground: widget.btnBackground,
                // onPressed: () => context.read<CounterProvider>().decrement(widget.index)
                  onPressed: () => context.read<CounterCubit>().decrement(widget.index)
            ),
            BlocBuilder<CounterCubit, List<int>>(
              builder: (context, count) {
                return RowCounter(count: count[widget.index], counterBackground: widget.mainBackground);
              },
            ),
            ContainerButton(
              buttonSign: "+",
              buttonBackground: widget.btnBackground,
              onPressed: () => context.read<CounterCubit>().increment(widget.index)
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}