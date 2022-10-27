import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:belendroit/models/offer_model.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key, required this.offer});

  static String id = 'offer_screen';

  final Offer offer;

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Uri url = Uri.parse('https://flutter.dev');
    // Uri url = Uri.parse(offer.url!);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offer Screen'),
        backgroundColor: Colors.grey[600],
      ),
      body: Column(
        children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(offer.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 15.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        _launchUrl(url);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.place,
                            size: 14.0,
                          ),
                          const SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            offer.hangout!,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                fontSize: 14.0,
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  textAlign: TextAlign.left,
                  offer.description!,
                  maxLines: 20,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
