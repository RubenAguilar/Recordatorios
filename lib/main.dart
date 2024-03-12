import 'package:recordatorios_app/screen/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


//void main() => runApp(const MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}



