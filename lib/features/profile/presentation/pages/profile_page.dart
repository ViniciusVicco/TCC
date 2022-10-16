import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/common/presentation/drawer/custom_drawer_widget.dart';
import 'package:tcc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:tcc/features/profile/presentation/widgets/dialog/factory/dialog_action.dart';
import 'package:tcc/features/profile/presentation/widgets/dialog/factory/dialog_factory.dart';

import '../../../../common/presentation/drawer/widgets/avatar_widget.dart';
import '../../../../core/session/session_manager.dart';

class ProfilePage extends StatefulWidget {
  final SessionManager sessionManager;
  const ProfilePage({super.key, required this.sessionManager});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = Modular.get<ProfileCubit>();
    cubit.getFileUrlProfile();
    //FetchImage on init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawerWidget(sessionManager: cubit.sessionManager),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return CircularProgressIndicator();
          }
          if (state is ProfileInitialState) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      AvatarWidget(
                          imageUrl: state.profileUrlImage,
                          onTap: () async {
                            await DialogFactory.showAlertDialog(context,
                                tittle: const Text(
                                    "De onde deseja buscar sua foto ?"),
                                content: const Text(""),
                                actions: [
                                  DialogAction(
                                      child: const Text("Câmera"),
                                      onPressed: () async {
                                        final fileFromCamera =
                                            await cubit.fetchImageFromCamera();
                                        if (fileFromCamera != null) {
                                          await cubit
                                              .uploadFile(fileFromCamera);
                                        }
                                      }),
                                  DialogAction(
                                      child: const Text("Galeria"),
                                      onPressed: () async {
                                        final fileFromGallery =
                                            await cubit.fetchImageFromGallery();
                                        if (fileFromGallery != null) {
                                          await cubit
                                              .uploadFile(fileFromGallery);
                                        }
                                      }),
                                  DialogAction(
                                      child: const Text(
                                        "Cancelar",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        Modular.to.pop();
                                      })
                                ]);
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Atualizar meu perfil"),
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
