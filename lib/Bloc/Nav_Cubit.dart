import 'package:eventapp/Models/Event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<EventModel?> {
  NavCubit() : super(null);

  void showEventDetails(EventModel event) => emit(event);
  void popToEvents() => emit(null);
}


