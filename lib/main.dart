import 'package:flutter/material.dart';
import 'package:flutter_news/injection_container.dart';
import 'package:flutter_news/my_app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  await init();
  runApp(const MyApp());
}
