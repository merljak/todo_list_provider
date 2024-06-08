// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, prefer_const_constructors_in_immutables, use_super_parameters, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/ui/messages.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class HomeDrawer extends StatelessWidget {
  final nameVN = ValueNotifier<String>('');

  HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor.withAlpha(50),
            ),
            child: Row(
              children: [
                Selector<AuthProvider, String>(
                    selector: (context, authProvider) {
                  return authProvider.user?.photoURL ??
                      'https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI=';
                }, builder: (_, value, __) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(value),
                    radius: 30,
                  );
                }),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Selector<AuthProvider, String>(
                          selector: (context, authProvider) {
                        return authProvider.user?.displayName ??
                            'Não informado';
                      }, builder: (_, value, __) {
                        return Text(
                          value,
                          style: context.textTheme.subtitle2,
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Selector<AuthProvider, String>(
                          selector: (context, authProvider) {
                        return authProvider.user?.email ??
                            'Email não informado';
                      }, builder: (_, value, __) {
                        return Text(
                          value,
                          style: context.textTheme.subtitle2,
                        );
                      }),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Selector<AuthProvider, String>(
                    //       selector: (context, authProvider) {
                    //     return authProvider.user?.phoneNumber ??
                    //         'telefone não informado';
                    //   }, builder: (_, value, __) {
                    //     return Text(
                    //       value,
                    //       style: context.textTheme.subtitle2,
                    //     );
                    //   }),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      //backgroundColor:Color.fromARGB(255, 39, 93, 255),
                      title: Text('Alterar Nome'),
                      content: TextField(
                        onChanged: (value) => nameVN.value = value,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                            onPressed: () async {
                              final nameValue = nameVN.value;
                              if (nameValue.isEmpty) {
                                Messages.of(context)
                                    .showError('Nome Obrigatorio');
                              } else {
                                Loader.show(context);
                                await context.read<UserService>().updateDisplayName(nameValue);
                                // Loader.hide();
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text('Alterar')),
                      ],
                    );
                  });
            },
            title: Text('Alterar Nome'),
          ),
          ListTile(
            onTap: () => context.read<AuthProvider>().logout(),
            title: Text('Sair'),
          )
        ],
      ),
    );
  }
}
