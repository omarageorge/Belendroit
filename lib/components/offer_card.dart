import 'package:belendroit/providers/offer_provider.dart';
import 'package:flutter/material.dart';
import 'package:belendroit/models/offer_model.dart';
import 'package:provider/provider.dart';

class OfferCard extends StatefulWidget {
  const OfferCard({Key? key, required this.offer}) : super(key: key);

  final Offer offer;

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 0.2,
              spreadRadius: 0.1,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.offer.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.offer.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          // color: Colors.blue,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
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
                            widget.offer.hangout!,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                fontSize: 12.0,
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      if (widget.offer.bookmark == true) {
                        return;
                      } else {
                        setState(() {
                          widget.offer.toggleBookmark();
                          Provider.of<OfferProvider>(context, listen: false)
                              .save(widget.offer);
                        });
                      }
                    },
                    child: widget.offer.bookmark
                        ? Icon(
                            Icons.bookmark,
                            size: 32.0,
                            color: Colors.black87.withOpacity(0.8),
                          )
                        : Icon(
                            Icons.bookmark_add_outlined,
                            size: 32.0,
                            color: Colors.black87.withOpacity(0.8),
                          ),
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
