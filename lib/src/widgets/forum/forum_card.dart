part of '../widgets.dart';

class ForumCarousel extends StatelessWidget {
  final PageController controller;

  const ForumCarousel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final forums = [
      {
        "title": "Career & Professional Growth",
        "imagePath": "assets/home/forum1.png",
        "buttonText": "Sport",
      },
      {
        "title": "College & Higher Education Talk",
        "imagePath": "assets/home/forum2.png",
        "buttonText": "Sport",
      },
      {
        "title": "Networking",
        "imagePath": "assets/forum/top3.png",
        "buttonText": "Sport",
      },
      {
        "title": "Personal Branding",
        "imagePath": "assets/forum/top4.png",
        "buttonText": "Sport",
      },
    ];

    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: controller,
        itemCount: forums.length,
        itemBuilder: (context, index) {
          final forum = forums[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ForumItem(
              title: forum["title"] as String,
              imagePath: forum["imagePath"] as String,
              buttonText: (forum["buttonText"] as String?) ?? "More",
              onButtonPressed: () {
                // Tambahkan callback jika perlu
              },
            ),
          );
        },
      ),
    );
  }
}
