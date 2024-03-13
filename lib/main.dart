import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inses_app/utils/url.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  try{
    final FirebaseRemoteConfig remoteConfig =
                  FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    var ep = remoteConfig.getString('endpoint');
    if(ep.isNotEmpty){
      AppUrl.BASE_URL = ep;
    }
  }catch(error){}

  runApp(
      RestartWidget(
        child: App(),
      ),
  );
}

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}


