part of 'screens.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int bottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Kontak'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarIndex,
        onTap: (value) {
          setState(() {
            bottomNavBarIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Listview'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_3x3), label: 'GridView')
        ],
      ),
      body:
          (bottomNavBarIndex == 0) ? const ListProduct() : const GridProduct(),
    );
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // GridView.count(
    //     crossAxisCount: 2,
    //     children: contacts
    //         .map((e) => Text(
    //               e.name
    //             ))
    //         .toList());
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ContactWidget(
          data: contacts[index],
        );
      },
    );
  }
}
