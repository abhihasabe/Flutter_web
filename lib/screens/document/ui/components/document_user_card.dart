import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const imageSet =
    'https://www.tourmyindia.com/genral_information/fair_festival/images/holi1.jpg';

class DocumentUserCard extends StatefulWidget {
  const DocumentUserCard({Key? key}) : super(key: key);

  @override
  _DocumentUserCardState createState() => _DocumentUserCardState();
}

class _DocumentUserCardState extends State<DocumentUserCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            CachedNetworkImage(
              imageUrl: imageSet,
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fill)),
                );
              },
              placeholder: (context, url) => Container(
                height: 50,
                width: 50,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                child: Text('Error'),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Welcome Back !',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Pax Bat',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
