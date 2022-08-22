import 'package:flutter/material.dart';

class OfferCard extends StatefulWidget {
  const OfferCard({Key? key}) : super(key: key);

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  bool bookmarked = false;

  void bookmarkHandler() {
    setState(() {
      bookmarked = !bookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 0.4,
              spreadRadius: 0.1,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/250?image=9'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        '30% discount Avengers Endgame movie tickets at showmax cinema',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          // color: Colors.blue,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Bioviands bar',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: bookmarkHandler,
                    child: bookmarked
                        ? Icon(
                            Icons.bookmark_add,
                            size: 32.0,
                            color: Colors.black87.withOpacity(0.8),
                          )
                        : Icon(
                            Icons.bookmark_add_outlined,
                            size: 32.0,
                            color: Colors.black87.withOpacity(0.8),
                          ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
