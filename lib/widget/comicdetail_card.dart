import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:collection/collection.dart';

class ComicDetailCard extends StatelessWidget {
  const ComicDetailCard.cart({
    Key? key,
    required this.volume,
    required this.volumesImage,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  final Volume volume;
  final List<Imagen> volumesImage;

  final Color iconColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    var img = volumesImage
        .firstWhereOrNull((element) => element.id == volume.id)
        ?.image
        ?.originalUrl;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ComicImage(
              volume: img,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ComicInformation(
              volume: volume,
              fontColor: fontColor,
              isOrderSummary: false,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class ComicImage extends StatelessWidget {
  const ComicImage({
    Key? key,
    required this.volume,
  }) : super(key: key);

  final String? volume;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CachedNetworkImage(
        imageUrl: volume ?? '',
        fit: BoxFit.cover,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

class ComicInformation extends StatelessWidget {
  const ComicInformation({
    Key? key,
    required this.volume,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity,
  }) : super(key: key);

  final Volume volume;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${volume.name ?? ''} ',
        maxLines: 4,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.green),
      ),
    );
  }
}
