import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/common/drawer/custom_drawer_widget.dart';
import 'package:tcc/features/profile/presentation/cubit/profile_cubit.dart';

import '../../../../common/drawer/widgets/avatar_widget.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawerWidget(sessionManager: cubit.sessionManager),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [AvatarWidget(imageUrl: "", canEdit: true)],
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
      ),
    );
  }
}
