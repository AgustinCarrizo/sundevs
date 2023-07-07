import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sundevs/widget/comic_card.dart';
import 'package:sundevs/widget/custom_appbar.dart';
import '/blocs/blocs.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: LayoutBuilder(builder: (context, boxcontainer) {
          return BlocBuilder<ComicBloc, ComicState>(builder: (context, state) {
            if (state is ComicLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ComicLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest Issues',
                          maxLines: 4,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.black),
                        ),
                        Row(
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                context
                                    .read<ComicBloc>()
                                    .add(FormatView(!state.list));
                              },
                              icon: const Icon(Icons.list),
                              label: const Text('List'),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  return state.list
                                      ? Colors.green
                                      : Colors.black;
                                }),
                              ),
                            ),
                            TextButton.icon(
                                onPressed: () {
                                  context
                                      .read<ComicBloc>()
                                      .add(FormatView(!state.list));
                                },
                                icon: const Icon(Icons.grid_view_sharp),
                                label: const Text('Grid'),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    return !state.list
                                        ? Colors.green
                                        : Colors.black;
                                  }),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                  ),
                  if (!state.list)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  mainAxisExtent: (boxcontainer.maxWidth > 700)
                                      ? 800
                                      : 450),
                          itemCount: state.comic?.length,
                          itemBuilder: (context, index) {
                            var comic = state.comic?[index];
                            return ComicCard.catalog(comic: comic!);
                          },
                        ),
                      ),
                    ),
                  if (state.list)
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: state.comic?.length,
                        itemBuilder: (context, index) {
                          var comic = state.comic?[index];

                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0, top: 10),
                            child: Column(
                              children: [
                                ComicCard.cart(comic: comic!),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 2,
                                  indent: 20,
                                  endIndent: 20,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                ],
              );
            }
            return const Text('Something went wrong.');
          });
        }),
      ),
    );
  }
}
