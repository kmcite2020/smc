import 'package:uuid/uuid.dart';

import '../er/presentation/bloc/patients_bloc.dart';
import '../settings/settings_bloc.dart';

const applicationName = 'SUBHAN MEDICAL CENTER';
const dashboardPageName = 'Dashboard';
bool get isWaiting => settingsBloc.isWaiting || patientsBloc.isWaiting;
// ignore: prefer_const_constructors
String get randomID => Uuid().v4();
void log(Object? object) => print(object);

class MedicalCenter {}
