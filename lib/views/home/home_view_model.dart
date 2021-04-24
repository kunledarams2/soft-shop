import 'package:softshop_mobile/core/utils/exports.dart';
import './home_view.dart';
import './search_view.dart';
import './orders_view.dart';
import './profile_view.dart';

class HomeViewModel extends StatefulWidget {
  @override
  _HomeViewModelState createState() => _HomeViewModelState();
}

class _HomeViewModelState extends State<HomeViewModel> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeView(),
    SearchView(),
    OrdersView(),
    ProfileView()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('home'.svg), label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('search_bar'.svg), label: 'Search'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('orders'.svg), label: 'Orders'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('profile'.svg), label: 'Profile'),
        ],
      ),
    );
    ;
  }
}
