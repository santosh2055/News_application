import 'package:flutter/material.dart';

class SearchBarHeader extends StatelessWidget {
  const SearchBarHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SizedBox(
      height: _size.height * .1,
      child: Stack(
        children: [
          Container(
            height: _size.height * 0.9,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              margin: const EdgeInsets.symmetric(horizontal: 7),
              height: _size.height * 08,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.blueAccent.withOpacity(0.50),
                  )
                ],
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search by Company Name',
                  hintStyle: TextStyle(),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
