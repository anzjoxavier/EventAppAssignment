import 'package:eventapp/Constants/app_layout.dart';
import 'package:eventapp/Models/Event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Constants/constants.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
        },
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.getWidth(15)),
          
        ),
        label: SizedBox(
          width: AppLayout.getWidth(150),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child:  Text('Book Now',textScaleFactor: ScaleSize.textScaleFactor(context),)),
              SizedBox(width:  AppLayout.getWidth(20),),
              CircleAvatar(radius: AppLayout.getWidth(15),child: const Icon(Icons.arrow_forward),)
            ],
          ),
        ),
        
        
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  SizedBox(
                    height: AppLayout.getHeight(250),
                    width:AppLayout.getWidth(390),
                    child: Image.network(
                      eventModel.banner_image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    //Place it at the top, and not use the entire screen
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Padding(
                      padding: EdgeInsets.only(right:AppLayout.getHeight(15)),
                      child: AppBar(
                        title: Container(
                          padding: EdgeInsets.all(AppLayout.getWidth(10)),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppLayout.getWidth(15)),color: Colors.blue.withOpacity(0.2)),
                          child: Text("Event Details",
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          style: AppBarTitleStyle.copyWith(color: Colors.white)),
                        ),
                        actions: [
                          Container(
                            height:AppLayout.getHeight(32),
                            width:AppLayout.getWidth(50),
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppLayout.getWidth(15)),color: Colors.white.withOpacity(0.3)),
                            child: Icon(CupertinoIcons.bookmark_fill),
                          )
                        ],
                        backgroundColor: Colors.transparent, //No more green
                        elevation: 0.0, //Shadow gone
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppLayout.getHeight(30),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                Text(eventModel.title, textScaleFactor: ScaleSize.textScaleFactor(context),style: EventDetailsPageTitle,maxLines: 2,textAlign: TextAlign.left,),
                SizedBox(height: AppLayout.getHeight(20),),
                SizedBox(
                  height: AppLayout.getHeight(48),
                  child: Row(
                    children: [
                       Container(
                height: AppLayout.getHeight(48),
                width: AppLayout.getWidth(48),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppLayout.getWidth(15))),
                child: Image(image: NetworkImage(eventModel.organiser_icon),fit: BoxFit.fill,),
              ),
              SizedBox(width: AppLayout.getWidth(13),),
              SizedBox(
                width:AppLayout.getWidth(295),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(eventModel.organiser_name, textScaleFactor: ScaleSize.textScaleFactor(context),style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                   Text("Organizer", textScaleFactor: ScaleSize.textScaleFactor(context),style: TextStyle(color: Colors.grey,fontSize: 16),overflow: TextOverflow.ellipsis)
                  ],
                ),
              )
               ],
                  ),
                ),
        
                SizedBox(height: AppLayout.getHeight(30),),
                SizedBox(
                  height: AppLayout.getHeight(48),
                  child: Row(
                    children: [
                       Container(
                height: AppLayout.getHeight(48),
                width: AppLayout.getWidth(48),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppLayout.getWidth(15)),color: const Color.fromARGB(255, 89, 180, 255).withOpacity(0.3)),
                child: const Icon(Icons.calendar_month_outlined,color: Colors.blue,),
              ),
              SizedBox(width:  AppLayout.getWidth(13),),
              SizedBox(
                width: AppLayout.getWidth(295),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(formatDate(DateTime.parse(eventModel.date_time)), textScaleFactor: ScaleSize.textScaleFactor(context),style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                   Text(formatTime(DateTime.parse(eventModel.date_time)), textScaleFactor: ScaleSize.textScaleFactor(context),style: TextStyle(color: Colors.grey,fontSize: 16),overflow: TextOverflow.ellipsis)
                  ],
                ),
              )
               ],
                  ),
                ),
                SizedBox(height: AppLayout.getHeight(30),),
                SizedBox(
                  height: AppLayout.getHeight(48),
                  child: Row(
                    children: [
                       Container(
                height: AppLayout.getHeight(48),
                width:AppLayout.getWidth(48),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppLayout.getWidth(15)),color: Color.fromARGB(255, 89, 180, 255).withOpacity(0.3)),
                child: const Icon(CupertinoIcons.location_solid,color: Colors.blue,),
              ),
              SizedBox(width:AppLayout.getWidth(13),),
              SizedBox(
                width: AppLayout.getHeight(295),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(eventModel.venue_name, textScaleFactor: ScaleSize.textScaleFactor(context),style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                   Text("${eventModel.venue_city},${eventModel.venue_country}", textScaleFactor: ScaleSize.textScaleFactor(context),style: TextStyle(color: Colors.grey,fontSize: 16),overflow: TextOverflow.ellipsis)
                  ],
                ),
              ),

              ],
             ),
             ),
             SizedBox(height:AppLayout.getHeight(30),),
             Text("About Event", textScaleFactor: ScaleSize.textScaleFactor(context),style: AppBarTitleStyle.copyWith(fontSize: 22),),
             SizedBox(height: AppLayout.getHeight(20),),
             Text(eventModel.description, textScaleFactor: ScaleSize.textScaleFactor(context),style: const TextStyle(fontSize: 20,height: 1.5),),
             SizedBox(height: AppLayout.getHeight(80),),
            ],),),
            ],
          ),
        ),
      ),
    );
  }
}



String formatDate(DateTime dateTime) {

  return DateFormat('d MMMM, yyyy').format(dateTime);
}

String formatTime(DateTime dateTime) {

  String formattedStartTime = DateFormat('h:mma').format(dateTime);
  String formattedEndTime =
  DateFormat('h:mma').format(dateTime.add(const Duration(hours: 5))); // Adding 5 hours to get the end time

  String dayOfWeek = DateFormat('EEEE').format(dateTime);

  return '$dayOfWeek, $formattedStartTime - $formattedEndTime';
}