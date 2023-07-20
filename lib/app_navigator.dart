import 'package:eventapp/Bloc/Nav_Cubit.dart';
import 'package:eventapp/Event_Details_Page/Event_Details_Page.dart';
import 'package:eventapp/Event_Page/Event_Page.dart';
import 'package:eventapp/Models/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, EventModel?>(builder: (context, event) {
      return Navigator(
        pages: [
          const MaterialPage(child: EventPage()),
          if (event != null)
            MaterialPage(child: EventDetailsPage(eventModel: event))
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context)
              .popToEvents();
          return route.didPop(result);
        },
      );
    });
  }
}
