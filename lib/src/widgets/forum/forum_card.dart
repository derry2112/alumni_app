part of '../widgets.dart';

class ForumCarousel extends StatelessWidget {
  final PageController controller;

  const ForumCarousel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: SizedBox(
          height: 200,
          child: PageView(
            controller: controller,
            children: const [
              EventCardItem(
                title: "Alumni Gathering 2025",
                imagePath: "assets/home/maskgroup.png",
                buttonText: "More",
              ),
              EventCardItem(
                title: "Workshop Flutter",
                imagePath: "assets/home/happy.png",
                buttonText: "Join",
              ),
              EventCardItem(
                title: "Networking Event",
                imagePath: "assets/home/party.png",
                buttonText: "Details",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
