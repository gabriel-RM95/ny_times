import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/features/most_popular/presentation/bloc/details/bloc/details_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/service_locator.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _textAnimation;
  late Animation<double> _dataAnimation;
  late Animation<double> _linkAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750))
      ..forward();
    _textAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.5, curve: Curves.ease)));
    _dataAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.25, 0.75, curve: Curves.ease)));
    _linkAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.5, 1.0, curve: Curves.ease)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider.value(
      value: serviceLocator<DetailsBloc>(),
      child: Builder(builder: (context) {
        final article =
            (context.read<DetailsBloc>().state as DetailsSelected).article;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 100,
            backgroundColor: Colors.black,
            title: Text(
              article.title,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (article.media.isNotEmpty)
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      itemCount: article.media.length,
                      itemBuilder: (context, index) {
                        return Hero(
                          tag: article.media[index]
                              .getImageByFormat('Standard Thumbnail'),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                article.media[index]
                                    .getImageByFormat('mediumThreeByTwo210'),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                AnimatedBuilder(
                    animation: _textAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(_textAnimation.value * size.width, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            article.abstract,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      );
                    }),
                AnimatedBuilder(
                  animation: _dataAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          article.byline,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Source: ${article.source}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Section: ${article.section}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Type: ${article.type}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Published: ${article.publishedDate}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Updated: ${article.updated}'),
                      ),
                    ],
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      offset: Offset(_dataAnimation.value * size.width, 0.0),
                      child: child,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _linkAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () async {
                        if (await canLaunchUrl(Uri.parse(article.url))) {
                          await launchUrl(Uri.parse(article.url),
                              mode: LaunchMode.externalApplication);
                        } else {
                          throw "Could not launch ${article.url}";
                        }
                      },
                      child: Text(article.url),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      offset: Offset(_linkAnimation.value * size.width, 0.0),
                      child: child,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
