import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momento/presentation/widgets/custom_cupertino_switch.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: kBackgroundColor,
      color: Theme.of(context).backgroundColor,
      width: 340,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.0,
            ),
            ListTile(
              title: Text(
                'Momento',
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Open Sans',
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.bold,
                  // color: kAccentColor,
                  color: Theme.of(context).accentColor
                ),
              ),
            ),
            // SizedBox(
            //   height: 25.0,
            // ),
            Image.asset(
              'assets/light-illustration.png',
              semanticLabel: 'Illustration',
              width: 400,
              scale: 1.0,
              repeat: ImageRepeat.noRepeat,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Settings',
                maxLines: 1,
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  // color: Color(0xEEFFFFFF),
                  color: Theme.of(context).textTheme.bodyText2.color
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 20.0,
                  // color: Color(0xEEFFFFFF),
                  color: Theme.of(context).textTheme.bodyText2.color
                ),
              ),
              trailing:CustomCupertinoSwitch(),
            ),
            // SizedBox(
            //   height: 10.0,
            // ),
            // Container(
            //   padding: EdgeInsets.only(
            //     left: 20.0,
            //   ),
            //   child: Row(
            //     children: [
            //       Icon(Icons.info_outline, color: Color(0xEEFFFFFF)),
            //       SizedBox(
            //         width: 10.0,
            //       ),
            //       Text(
            //         'About Us',
            //         style:
            //             TextStyle(fontSize: 19.0, color: Color(0xEEFFFFFF)),
            //       ),
            //     ],
            //   ),
            // ),
            // AboutListTile(
            //   applicationName: 'Momento',
            //   applicationVersion: '1.0.0',
            //   child: Text('About Us',style: TextStyle(
            //       fontSize: 21.0,
            //       color: Color(0xEEFFFFFF),
            //     ),),
            //   icon: Icon(Icons.info_outline),

            //   aboutBoxChildren: [
            //     ListTile(
            //       title: Text('Developer'),
            //       subtitle: Text('Abrar Malek'),
            //       trailing: CircleAvatar(
            //         backgroundColor: Color(0xFFe57373),
            //       ),
            //     ),
            //   ],
            // ),
            Divider(
              indent: 16.0,
              endIndent: 16.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'About',
                maxLines: 1,
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  // color: Color(0xEEFFFFFF),
                  color: Theme.of(context).textTheme.bodyText2.color
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Abrar Malek',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Open Sans',
                  // color: Color(0xEEFFFFFF),
                  color: Theme.of(context).textTheme.bodyText2.color
                ),
              ),
              subtitle: Text(
                'Developer',
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Open Sans',
                ),
              ),
              trailing: CircleAvatar(
                // backgroundColor: kAccentColor,
                backgroundColor: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
