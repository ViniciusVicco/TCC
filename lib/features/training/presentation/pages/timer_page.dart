import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/common/presentation/drawer/custom_drawer_widget.dart';

import '../../data/models/events/end_event.dart';
import '../../data/models/events/start_event.dart';
import '../../data/models/events/training_event.dart';
import '../../domain/entities/training_event.dart';
import '../cubit/timer_cubit.dart';

class TrainingMainPage extends StatefulWidget {
  const TrainingMainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TrainingMainPage> createState() => _TrainingMainPageState();
}

class _TrainingMainPageState extends State<TrainingMainPage> {
  final cubit = Modular.get<TrainingCubit>();
  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawerWidget(sessionManager: cubit.sessionManager),
        appBar: AppBar(title: const Text("Meus Treinos")),
        body: BlocBuilder<TrainingCubit, TrainingState>(
          bloc: Modular.get<TrainingCubit>(),
          builder: (context, state) {
            if (state is TrainingInitialState) {
              return Center(
                child: ElevatedButton(
                  child: const Text("Iniciar"),
                  onPressed: () {
                    cubit.initTimerCounting();
                  },
                ),
              );
            }
            if (state is TrainingCountingState) {
              return Center(
                  child: StreamBuilder<AbstractTrainingEvent>(
                      stream: Modular.get<TrainingCubit>().start(),
                      builder: (context, snapshot) {
                        AbstractTrainingEvent? event = snapshot.data;
                        if (snapshot.hasError) {
                          return const Text("Erro ao carregar treino");
                        } else if (event is StartEvent) {
                          return const Text("Iniciando treino");
                        } else if (event is EndEvent) {
                          return const Text("Finalizando treino");
                        } else if (event is ExerciseEvent) {
                          return Text(event.now.toString());
                        }
                        return Center(
                          child: Text(snapshot.data.toString()),
                        );
                      }));
            }
            if (state is TrainingFinishedState) {
              return const Center(
                child: Text("Finalizado"),
              );
            }
            return Container();
          },
        ));
  }
}
