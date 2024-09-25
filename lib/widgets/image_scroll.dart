import 'package:flutter/material.dart';

class HorizontalImageScroll extends StatelessWidget {
  final List<String> imageUrls = [
    'https://cdn.wallpapersafari.com/0/67/9VBuKU.jpg',
    'https://th.bing.com/th/id/OIP.ZNyQx_iXKaoeOxYDjsZHxgHaHa?rs=1&pid=ImgDetMain',
    'https://2.bp.blogspot.com/-sd49CoKIWLY/Txa4uS7r1NI/AAAAAAAAGE8/x3NIwpATiw8/s1600/reindeer5.jpg',
    'https://cdn.wallpapersafari.com/0/67/9VBuKU.jpg',
    'https://th.bing.com/th/id/OIP.ZNyQx_iXKaoeOxYDjsZHxgHaHa?rs=1&pid=ImgDetMain',
    // Add more URLs as needed
  ];

 HorizontalImageScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Set the height for the image row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding on left and right
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0), // Rounded corners
              child: SizedBox(
                width: 100, // Set the width for each image
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover, // Adjust the image fit as needed
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
