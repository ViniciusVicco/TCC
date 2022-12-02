import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/common/presentation/drawer/widgets/avatar_widget.dart';
import 'package:tcc/common/presentation/drawer/widgets/drawer_menu_item.dart';
import 'package:tcc/core/session/session_manager.dart';

class CustomDrawerWidget extends StatefulWidget {
  final SessionManager sessionManager;

  const CustomDrawerWidget({
    super.key,
    required this.sessionManager,
  });

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                AvatarWidget(
                  onTap: () {},
                  imageUrl:
                      "https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg",
                ),
                DrawerMenuItem(
                  onTap: () {
                    Modular.to.popAndPushNamed("/profile/");
                  },
                  leadingIcon: Icons.account_circle,
                  title: "Perfil",
                  subTitle: "Suas informações",
                ),
              ],
            ),
          ),
          DrawerMenuItem(
            onTap: () async {
              await widget.sessionManager.cleanSession();
              Modular.to.popUntil(ModalRoute.withName('/'));
            },
            leadingIcon: Icons.logout,
            title: "Logout",
            subTitle: "Versão 1.0.0",
          ),
        ],
      ),
    );
  }
}
