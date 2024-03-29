import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard(
      {Key? key,
      required this.title,
      required this.hangout,
      required this.date})
      : super(key: key);

  final String title;
  final String hangout;
  final String date;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
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
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.place,
                                size: 14.0,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                widget.hangout,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    letterSpacing: 0.8,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          Text(
                            widget.date,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
