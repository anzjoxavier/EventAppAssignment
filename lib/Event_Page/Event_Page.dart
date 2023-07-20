import 'package:eventapp/Bloc/EventsBloc.dart';
import 'package:eventapp/Bloc/Nav_Cubit.dart';
import 'package:eventapp/Constants/constants.dart';
import 'package:eventapp/Event_Page/Widgets/Event_Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants/app_layout.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Events",
          style: AppBarTitleStyle,
          textScaleFactor: ScaleSize.textScaleFactor(context),
        ),
        toolbarHeight: AppLayout.getHeight(60),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.ellipsis_vertical,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          if (state is LoadingEventsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedEventsState) {
            return RefreshIndicator(
              onRefresh: () async => BlocProvider.of<EventsBloc>(context)
                  .add(PullToRefreashEventsEvent()),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(10)),
                child: ListView.builder(
                    itemCount: state.events.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: EventCard(eventModel: state.events[index]),
                        onTap: () => BlocProvider.of<NavCubit>(context)
                          .showEventDetails(state.events[index]),
                        );
                    }),
              ),
            );
          } else if (state is FailedToLoadEventsState) {
            return const Center(
              child: Text("Error Occurred"),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
