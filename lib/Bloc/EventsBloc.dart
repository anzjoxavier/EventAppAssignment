// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:eventapp/Models/Event.dart';
import 'package:eventapp/Services/EventsServices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EventsEvent {}

class LoadEventsEvent extends EventsEvent {}

class PullToRefreashEventsEvent extends EventsEvent {}

abstract class EventsState {}

class LoadingEventsState extends EventsState {}

class LoadedEventsState extends EventsState {
  List<EventModel> events;
  LoadedEventsState({
    required this.events,
  });
}

class FailedToLoadEventsState extends EventsState {
  // Error error;
  // FailedToLoadEventsState({
  //   required this.error,
  // });
}

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(LoadingEventsState()) {
    on<LoadEventsEvent>((((event, emit) async {
      emit(LoadingEventsState());
      try {
        final allEvents = await EventsServices.getAllEvents();
        emit(LoadedEventsState(events: allEvents));


      } catch (e) {
        emit(FailedToLoadEventsState());
      }
    }  
    )));


    on<PullToRefreashEventsEvent>((((event, emit) async {
      emit(LoadingEventsState());
      try {
        final allEvents = await EventsServices.getAllEvents();
        emit(LoadedEventsState(events: allEvents));


      } catch (e) {
        emit(FailedToLoadEventsState());
      }
    }  
    )));
  }
}
