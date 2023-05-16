import 'package:flutter/material.dart';
import 'package:ny_times/core/utils/enums.dart';

class MostPopularAppBar extends StatelessWidget {
  const MostPopularAppBar({
    super.key,
    required this.option,
    required this.period,
  });

  final ValueNotifier<MostOption> option;
  final ValueNotifier<Period> period;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: const Text('Most Popular Articles'),
      backgroundColor: Colors.black,
      expandedHeight: 200,
      floating: true,
      pinned: true,
      snap: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/nyt.jpg',
                fit: BoxFit.cover,
                color: Colors.black54,
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 58,
                      child: ValueListenableBuilder(
                          valueListenable: option,
                          builder: (context, value, _) {
                            return DropdownButtonFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              value: value,
                              onChanged: (value) => option.value = value!,
                              items: const [
                                DropdownMenuItem<MostOption>(
                                  value: MostOption.emailed,
                                  child: Text('Emailed'),
                                ),
                                DropdownMenuItem<MostOption>(
                                  value: MostOption.shared,
                                  child: Text('Shared'),
                                ),
                                DropdownMenuItem<MostOption>(
                                  value: MostOption.viewed,
                                  child: Text('Viewed'),
                                ),
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      width: 110,
                      height: 58,
                      child: ValueListenableBuilder(
                          valueListenable: period,
                          builder: (context, value, _) {
                            return DropdownButtonFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              value: value,
                              onChanged: (value) => period.value = value!,
                              items: const [
                                DropdownMenuItem<Period>(
                                  value: Period.one,
                                  child: Text('1 day'),
                                ),
                                DropdownMenuItem<Period>(
                                  value: Period.seven,
                                  child: Text('7 days'),
                                ),
                                DropdownMenuItem<Period>(
                                  value: Period.thirty,
                                  child: Text('30 days'),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
