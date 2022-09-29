part of 'widgets.dart';

class ContactWidget extends StatelessWidget {
  final ContactModel data;

  const ContactWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.only(bottom: 10, left: 10, top: 10, right: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                data.imageUrl,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(data.phone),
              ],
            )
          ],
        ),
      ),
    );
  }
}
