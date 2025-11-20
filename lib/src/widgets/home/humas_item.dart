part of '../widgets.dart';

class HumasCardCarousel extends StatefulWidget {
  const HumasCardCarousel({super.key});

  @override
  State<HumasCardCarousel> createState() => _HumasCardCarouselState();
}

class _HumasCardCarouselState extends State<HumasCardCarousel> {
  final List<Map<String, dynamic>> _data = [
    {
      'title': 'Human News #1: Update HR Policies',
      'subtitle': 'Join us for an evening of celebration and ...',
      'image': 'assets/human_news/news1.png',
    },
    {
      'title': 'Human News #2: Employee of the Month',
      'subtitle': 'Join us for an evening of celebration and ...',
      'image': 'assets/human_news/news2.png',
    },
    {
      'title': 'Human News #3: New Training Program',
      'subtitle': 'Join us for an evening of celebration and ...',
      'image': 'assets/human_news/news3.png',
    },
  ];

  void _loadMore() {
    setState(() {
      final nextIndex = _data.length + 1;
      _data.addAll([
        {
          'title': 'Human News #$nextIndex: New Update',
          'subtitle': 'Join us for an evening of celebration and ...',
          'image': 'assets/human_news/news1.png',
        },
        {
          'title': 'Human News #${nextIndex + 1}: New Event',
          'subtitle': 'Join us for an evening of celebration and ...',
          'image': 'assets/human_news/news2.png',
        },
        {
          'title': 'Human News #${nextIndex + 2}: Training Session',
          'subtitle': 'Join us for an evening of celebration and ...',
          'image': 'assets/human_news/news3.png',
        },
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _data.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = _data[index];
            return HumasCard(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(right: 19),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item['image'] as String,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 222,
                          height: 16,
                          child: Text(
                            item['title'] as String,
                            style: const TextStyle(
                              color: Color(0xFF344561),
                              fontFamily: 'DM Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.28,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 198.85,
                          height: 19.403,
                          child: Text(
                            item['subtitle'] as String,
                            style: const TextStyle(
                              color: Color(0xFFA3AED0),
                              fontFamily: 'DM Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.25,
                              letterSpacing: -0.24,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 77,
                            height: 19,
                            child: Text(
                              'See news details',
                              style: const TextStyle(
                                color: Color(0xFF344561),
                                fontFamily: 'DM Sans',
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                height: 2.0,
                                letterSpacing: -0.2,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: Color(0xFF344561),
                              ),
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Center(
          child: GestureDetector(
            onTap: _loadMore,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Garis kiri
                Container(
                  width: 140,
                  height: 1,
                  color: const Color(0xFF344561),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Load More',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    color: Color(0xFF344561),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 140,
                  height: 1,
                  color: const Color(0xFF344561),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
