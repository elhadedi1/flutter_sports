import 'package:flutter/material.dart';
import 'package:flutter_sports/settings.dart';
import 'account_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      drawer:Drawer(elevation: 0.0,
          child: Container(height: MediaQuery.of(context).size.height,
            child: ListView(
              children: <Widget>[
                drawerHeader(),
                _createDrawerItem(icon: Icons.event, text: 'Events',),
                _createDrawerItem(icon: Icons.note, text: 'Notes',),
                Divider(),
                _createDrawerItem(icon: Icons.collections_bookmark, text:'Memories'),
                _createDrawerItem(icon: Icons.face, text: 'Authors'),
                _createDrawerItem(icon: Icons.account_box, text: 'Clubs info'),
                _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
                Divider(),
                _createDrawerItem(icon: Icons.power_settings_new,text: 'Logout',onTap: (){}),
                _createDrawerItem(icon: Icons.settings,text:'Settings',onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));}),
                _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),

                ListTile(
                  title: Text('0.0.1'),
                  onTap: () {},
                ),







              ],),
          ),
        ),
    );
  }
  Widget drawerHeader(){
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/1.jpg')

        )
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AccountScreen()));
              },
              child: Row(children: <Widget>[
                Text('mmfj@gmail.com',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w500),),
                Icon(Icons.arrow_drop_down,color: Colors.white,),

              ],),
            ),

          )
        ],
      ),
    );
  }
  Widget drawerAccountDetails(){
    return new Card(
      child: UserAccountsDrawerHeader(
        accountName: new Text("محمد الشرقاوي"),
        accountEmail: new Text("M.sh@gmail.com"),
        onDetailsPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AccountScreen()));
        },
        decoration: new BoxDecoration(
          backgroundBlendMode: BlendMode.difference,
          color: Colors.white30,

          /* image: new DecorationImage(
               //   image: new ExactAssetImage('assets/images/lake.jpeg'),
                  fit: BoxFit.cover,
                ),*/
        ),
        currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.fakenamegenerator.com/images/sil-male.png")),
      ),
    );
  }
  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }


}
