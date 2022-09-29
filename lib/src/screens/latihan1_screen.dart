part of 'screens.dart';

class LatihanPertama extends StatelessWidget {
  const LatihanPertama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: Text(
                    'Strawberry Pavlovas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: Text('Strawberry Pavlovas'),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: Image.network(
                    'https://media.istockphoto.com/photos/sunflower-wearing-sunglasses-with-smile-face-on-vintage-tone-for-picture-id1295767500?b=1&k=20&m=1295767500&s=170667a&w=0&h=7xifVf3mhQhbSU9R7pwQ6vhIPwpZ1uafQGHFMSg-p9I=')),
          ],
        ),
      ),
    );
  }
}
