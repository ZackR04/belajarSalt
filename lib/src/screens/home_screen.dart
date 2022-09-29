part of 'screens.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({Key? key}) : super(key: key);

  Widget _gambarRow() {
    return Expanded(
      child: Image.network(
        'https://media.istockphoto.com/photos/sunflower-wearing-sunglasses-with-smile-face-on-vintage-tone-for-picture-id1295767500?b=1&k=20&m=1295767500&s=170667a&w=0&h=7xifVf3mhQhbSU9R7pwQ6vhIPwpZ1uafQGHFMSg-p9I=',
        height: 64,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _gambarColumn() {
    return Image.network(
      'https://media.istockphoto.com/photos/sunflower-wearing-sunglasses-with-smile-face-on-vintage-tone-for-picture-id1295767500?b=1&k=20&m=1295767500&s=170667a&w=0&h=7xifVf3mhQhbSU9R7pwQ6vhIPwpZ1uafQGHFMSg-p9I=',
      height: 64,
      width: 64,
      fit: BoxFit.cover,
    );
  }

  Widget _star(bool nyala) {
    return Icon(
      Icons.star,
      color: nyala ? Colors.green : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _gambarRow(),
                  _gambarRow(),
                  _gambarRow(),
                  _gambarRow()
                ],
              ),
              _gambarColumn(),
              _gambarColumn(),
              _gambarColumn(),
              _gambarColumn(),
              Row(
                children: [
                  _star(true),
                  _star(true),
                  _star(true),
                  _star(true),
                  _star(false)
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuScreen()));
                  },
                  child: Text('Go To Menu'))
            ],
          ),
        ),
      ),
    );
  }
}
