import 'package:flutter/material.dart';

class SearchPlayrs extends StatelessWidget {
  const SearchPlayrs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 80, bottom: 40),
        padding: EdgeInsets.only(left: 20, right: 20),

        // first part search
        child: Row(
          // to make back arrow at the left and serch icon at the right
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: Color(0xffFAF0E6),
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ), 
            Center(
              child: Container(
                width: 45,
                height: 45,
                child: IconButton(
                  icon: Icon(Icons.search),
                  color: Color(0xffFAF0E6),
                  onPressed: () {},
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff5C5470),
                ),
              ),
            )
          ],
        ));
  }
}