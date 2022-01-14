

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
   bool isSearching=false;
  List<WorldTime> locations=[
    WorldTime(url: 'Asia/Dhaka', location: 'Bangladesh', flag: 'bangladesh.png',time: '',isDaytime: true),
    WorldTime(url: 'Asia/Karachi', location: 'Pakistan', flag: 'pakistan.png', time: '', isDaytime: true),
    WorldTime(url: 'Europe/London', location: 'England', flag: 'uk.png',time: '',isDaytime: true),
    WorldTime(url: 'Europe/Berlin', location: 'Greece', flag: 'greece.png', time: '', isDaytime: true),
    WorldTime(url: 'Africa/Cairo', location: 'Egypt', flag: 'egypt.png',  time: '',isDaytime: true),
    WorldTime(url: 'Africa/Nairobi', location: 'Kenya', flag: 'kenya.png',  time: '',isDaytime: true,),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png', time: '',isDaytime: true, ),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png',time: '',isDaytime: true),
    WorldTime(url: 'Asia/Kabul', location: 'Afghanistan', flag: 'afghanistan.png',time: '',isDaytime: true),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Argentina', flag: 'argentina.png',time: '',isDaytime: true),
    WorldTime(url: 'America/Belem', location: 'Brazil', flag: 'brazil.png',time: '',isDaytime: true),
    WorldTime(url: 'Asia/Riyadh', location: 'Saudi Arabia', flag: 'arabia.png',time: '',isDaytime: true),
    WorldTime(url: 'Asia/Muscat', location: 'Oman', flag: 'oman.png',time: '',isDaytime: true),

  ];

  void updateTime(index)async{
  WorldTime instance=locations[index];
  await instance.getTime();
  Navigator.pop(context,{
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDaytime':instance.isDaytime
  });
  }

  @override
  void initState() {

    super.initState();
  }
 void _filterCountries(value){
    locations.length;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:!isSearching? Text('Choose a Location'):
        TextField(
          onChanged: (value){
            _filterCountries(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(

          icon: Icon(Icons.search,
          color: Colors.white,
          ),
          hintText: 'Search Countries here',
          hintStyle: TextStyle(color: Colors.white)
        ),),
        centerTitle: true,
        elevation: 0,
        actions: [
          isSearching?
       IconButton(

           onPressed: (){
             setState(() {
               this.isSearching=!this.isSearching;
             });
           },
           icon: Icon(Icons.cancel)
       ):
          IconButton(

           onPressed: (){
             setState(() {
               this.isSearching=!this.isSearching;
             });
           },
           icon: Icon(Icons.search)
       ),

        ],
      ),
      body: ListView.builder(

       itemCount: locations.length,
       itemBuilder: (context,index){
         return Padding(
           padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
           child: Card(
             color: Colors.blueGrey,
             child: ListTile(
               onTap: (){
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