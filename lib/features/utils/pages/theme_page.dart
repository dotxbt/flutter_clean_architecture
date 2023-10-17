import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unlee/config/theme/app_theme.dart';
import 'package:unlee/config/theme/light_theme.dart';
import 'package:unlee/usecase/bloc/theme_bloc.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Themes"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate(
                AppTheme.values.map((e) {
                  return Card(
                    color: appThemeData[e]?.appBarTheme.backgroundColor,
                    child: ListTile(
                      title: Center(
                        child: Text(
                          e.toString().split(".")[1].toUpperCase(),
                          style: appThemeData[e]?.textTheme.bodyMedium,
                        ),
                      ),
                      onTap: () {
                        BlocProvider.of<ThemeBloc>(context).add(
                          ChangeTheme(
                            themeData: appThemeData[e] ?? lightTheme,
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DialogCustom extends StatelessWidget {
  const DialogCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.amber,
        height: 300,
        width: double.infinity,
      ),
    );
  }
}
