import 'package:flutter/material.dart';
import 'package:location_time_tracker/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [

    WorldTime(region: 'Europe/Tallinn', location: 'Tallinn', flag: 'est.png'),
    WorldTime(region: 'Africa/Lagos', location: 'Nigeria', flag: 'nigeria.png'),
    WorldTime(region: 'America/Chicago', location: 'Chicago', flag: 'chicago.png'),
    WorldTime(region: 'Australia/Adelaide', location: 'South-Australia', flag: 'adelaide.png'),
    WorldTime(region: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(region: 'Africa/Johannesburg', location: 'South-Africa', flag: 'SA.png'),
    WorldTime(region: 'Europe/Berlin', location: 'Germany', flag: 'germany.png'),
    WorldTime(region: 'America/New_York', location: 'New York', flag: 'newyork.png'),
    WorldTime(region: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(region: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(region: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(region: 'Australia/Sydney', location: 'Australia', flag: 'NSW.png'),
    WorldTime(region: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(region: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(region: 'Europe/Oslo', location: 'Norway', flag: 'norway.png'),
    WorldTime(region: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),

  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),


      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}