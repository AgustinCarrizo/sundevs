import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '/blocs/blocs.dart';
import '/models/models.dart';

class ComicCard extends StatelessWidget {
  const ComicCard.catalog({
    Key? key,
    required this.comic,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 150,
    this.isCatalog = true,
    this.isCart = false,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  const ComicCard.cart({
    Key? key,
    required this.comic,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 150,
    this.isCatalog = false,
    this.isCart = true,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  final Comic comic;
  final int? quantity;
  final double widthFactor;
  final double height;
  final bool isCatalog;
  final bool isCart;
  final Color iconColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double heightadj = (MediaQuery.of(context).size.width) > 700 ? 350 : height ;
    final double adjWidth = width / widthFactor;

    return InkWell(
      onTap: () async{
        context
            .read<ComicDetailBloc>()
            .add(LoadComicDetail(comic.apiDetailUrl));
        Navigator.pushNamed(
          context,
          '/comic',
        );
      },
      child: isCart 
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ComicImage(
                      adjWidth: adjWidth,
                      height: heightadj,
                      comic: comic,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: ComicInformation(
                      comic: comic,
                      fontColor: fontColor,
                      quantity: quantity,
                      isOrderSummary:  false,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: ComicImage(
                      adjWidth: adjWidth,
                      height: heightadj,
                      comic: comic,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ComicInformation(
                      comic: comic,
                      fontColor: fontColor,
                      quantity: quantity,
                      isOrderSummary:  false,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
    );
  }
}

class ComicImage extends StatelessWidget {
  const ComicImage({
    Key? key,
    required this.adjWidth,
    required this.height,
    required this.comic,
  }) : super(key: key);

  final double adjWidth;
  final double height;
  final Comic comic;

  @override
  Widget build(BuildContext context) {
    var string = comic.image?.originalUrl;
    return SizedBox(
      child: CachedNetworkImage(
        width: adjWidth,
        height: height,
        imageUrl: string ?? '',
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
    required this.comic,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity,
  }) : super(key: key);

  final Comic comic;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMMM d y');
    DateTime fecha = DateTime.parse(comic.dateAdded ?? '');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            '${comic.name ?? ''} ${comic.issueNumber} ',
            maxLines: 4,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: fontColor),
          ),
        ),
        Text(
          '${formatter.format(fecha)} ',
          style:
              Theme.of(context).textTheme.bodySmall!.copyWith(color: fontColor),
        ),
      ],
    );
  }
}
