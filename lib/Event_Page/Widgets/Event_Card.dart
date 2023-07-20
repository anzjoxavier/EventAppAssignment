// ignore_for_file: must_be_immutable

import 'package:eventapp/Constants/app_layout.dart';
import 'package:eventapp/Models/Event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Constants/constants.dart';


class EventCard extends StatelessWidget {
   EventCard({super.key,required this.eventModel});
  EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(125),
      width: AppLayout.getWidth(360),
      margin:  EdgeInsets.symmetric(horizontal:AppLayout.getWidth(10)).copyWith(top: AppLayout.getHeight(15)),
      padding: EdgeInsets.all( AppLayout.getWidth(10)),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(AppLayout.getWidth(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: AppLayout.getHeight(105),
            width: AppLayout.getWidth(135),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(eventModel.banner_image,fit: BoxFit.fill,),
          ),
          SizedBox(width: AppLayout.getWidth(16),),
          SizedBox(
            height: AppLayout.getHeight(105),
            width: AppLayout.getWidth(178),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(convertToCustomFormat(eventModel.date_time),style:  DateAndTimeStyle ,overflow: TextOverflow.ellipsis,),
                SizedBox(height:AppLayout.getHeight(8),),
                Text(eventModel.title,
                overflow: TextOverflow.ellipsis,maxLines: 2,
                style: EventCardNameTextStyle,
                ),
                SizedBox(height: AppLayout.getHeight(12),),
                Row(
                  children: [
                    Icon(CupertinoIcons.location_solid,size: AppLayout.getWidth(20),color: Colors.grey,
                    
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(150),
                      child: Text(eventModel.venue_name,overflow: TextOverflow.ellipsis,style: LocationNameTextStyle,)),
                  ],
                ),
          
              ],
            ),
          )
        ],
      ),
    );
  }
}


String convertToCustomFormat(String inputDateTime) {
  // Parse the inputDateTime to a DateTime object
  DateTime dateTime = DateTime.parse(inputDateTime);
  // Format the date and time components
  String formattedDate = DateFormat('EEE, MMM d').format(dateTime);
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  // Concatenate the date, time, and offset in the required format
  String formattedDateTime = '$formattedDate • $formattedTime ';

  return formattedDateTime;
}
