import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sundevs/blocs/blocs.dart';
import 'package:sundevs/widget/comicdetail_card.dart';
import 'package:sundevs/widget/custom_appbar.dart';
import '/models/models.dart';

class ComicScreen extends StatelessWidget {
  static const String routeName = '/comic';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ComicScreen(),
    );
  }

  const ComicScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<ComicDetailBloc, ComicDetailState>(
          builder: (context, state) {
        if (state is ComicDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ComicDetailLoaded) {
          return LayoutBuilder(builder: (context, boxcontainer) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    (boxcontainer.maxWidth < 700)
                        ? Column(
                            children: [
                              Column(
                                children: [
                                  BuildGridView(
                                    volumes:
                                        state.comic?.detail?.characterCredits,
                                    title: 'Characters',
                                    volumesImage: state.comic?.chacarter,
                                  ),
                                  BuildGridView(
                                    volumes: state.comic?.detail?.teamCredits,
                                    title: 'Teams',
                                    volumesImage: state.comic?.credits,
                                  ),
                                  BuildGridView(
                                    volumes:
                                        state.comic?.detail?.locationCredits,
                                    title: 'Locations',
                                    volumesImage: state.comic?.location,
                                  ),
                                ],
                              ),
                              if (state.comic?.detail?.image?.originalUrl !=
                                  null)
                                SizedBox(
                                  child: CachedNetworkImage(
                                    imageUrl: state
                                        .comic!.detail!.image!.originalUrl!,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        BuildGridView(
                                          volumes: state
                                              .comic?.detail?.characterCredits,
                                          title: 'Characters',
                                          volumesImage: state.comic?.chacarter,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        BuildGridView(
                                          volumes:
                                              state.comic?.detail?.teamCredits,
                                          title: 'Teams',
                                          volumesImage: state.comic?.credits,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        BuildGridView(
                                          volumes: state
                                              .comic?.detail?.locationCredits,
                                          title: 'Locations',
                                          volumesImage: state.comic?.location,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              if (state.comic?.detail?.image?.originalUrl !=
                                  null)
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl: state
                                        .comic!.detail!.image!.originalUrl!,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                            ],
                          ),
                  ],
                ),
              ),
            );
          });
        }
        return const Text('Something went wrong.');
      }),
    );
  }
}

class BuildGridView extends StatelessWidget {
  const BuildGridView({
    Key? key,
    required this.volumes,
    required this.title,
    required this.volumesImage,
  }) : super(key: key);
  final List<Volume?>? volumes;
  final List<Imagen>? volumesImage;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.black),
          ),
        const Divider(
          color: Colors.grey,
          thickness: 2,
        ),
        if (volumes?.isNotEmpty == true && volumesImage != null)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              mainAxisExtent: 150,
            ),
            itemCount: volumes?.length,
            itemBuilder: (context, index) {
              var volume = volumes?[index];
              return ComicDetailCard.cart(
                volume: volume ?? Volume(),
                volumesImage: volumesImage ?? [],
              );
            },
          ),
      ],
    );
  }
}
