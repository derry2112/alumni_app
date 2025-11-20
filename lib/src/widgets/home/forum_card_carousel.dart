part of '../widgets.dart';

class ForumCardCarousel extends StatelessWidget {
  const ForumCardCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final forums = [
      {
        "title": "Career & Professional Growth",
        "topImage": "assets/home/forum1.png",
        "centerImage": "assets/home/forum1-1.png",
        "icon": Icons.group,
        "bottomText": "23.600 members",
      },
      {
        "title": "College & Higher Education Talk",
        "topImage": "assets/home/forum2.png",
        "centerImage": "assets/home/forum2-1.png",
        "icon": Icons.group,
        "bottomText": "7.600 members",
      },
      {
        "title": "Networking",
        "topImage": "assets/forum/top3.png",
        "centerImage": "assets/forum/center3.png",
        "icon": Icons.group,
        "bottomText": "5 Events",
      },
      {
        "title": "Personal Branding",
        "topImage": "assets/forum/top4.png",
        "centerImage": "assets/forum/center4.png",
        "icon": Icons.group,
        "bottomText": "7.600 members",
      },
    ];

    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        itemCount: forums.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final forum = forums[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ForumCard(
              title: forum["title"] as String,
              topImagePath: forum["topImage"] as String?,
              centerImagePath: forum["centerImage"] as String?,
              bottomIcon: forum["icon"] as IconData?,
              bottomText: forum["bottomText"] as String?,
            ),
          );
        },
      ),
    );
  }
}
