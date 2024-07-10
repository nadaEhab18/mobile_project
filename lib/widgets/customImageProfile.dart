import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              'assets/images/profile.png',
            ),
          ),
          Positioned(
            right: 11,
              bottom: 11,
              child: InkWell(
                onTap: () {
                  // Show
                },
                child: Icon(
            Icons.camera_alt,
            color: Color(0xff003c70),
                  size: 25,
          ),
              ))
        ],
      ),
    );
  }
}


Widget bottomSheet() {
  return Container(
    height: 100,
    // width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: [
        Text('Choose profile photo',
        style: TextStyle(
          fontSize: 20,
        ),
        ),
        SizedBox(height: 20,),
        // Row(
        //   children: [
        //     FlatButton.icon(
        //       icon: Icon(Icons.camera_alt),
        //       onPressed: () {},
        //       label: Text('camera'),
        //     ),
        //     FlatButton.icon(
        //       icon: Icon(Icons.image),
        //       onPressed: () {},
        //       label: Text('Gallery'),
        //     )
        //   ],
        // ),

      ],
    ),

  );
}