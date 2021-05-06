import 'package:softshop_mobile/core/utils/exports.dart';
import './home_view.dart';
import './search_view.dart';
import './orders_view.dart';
import './profile_view.dart';
import 'home_model.dart';

class HomeBaseView extends StatelessWidget {
  Widget getCurrentScreen(int index) {
    switch (index) {
      case 0:
        return HomeView();

      case 1:
        return SearchView();
      case 2:
        return OrdersView();
      case 3:
        return ProfileView();
      default:
        return HomeView();
    }
  }

  Color isColorActive({int screenIndex, int currentIndex}) {
    if (currentIndex == screenIndex) return BrandColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: getCurrentScreen(model.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            onTap: model.setIndex,
            currentIndex: model.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('home'.svg,
                      color: isColorActive(
                          screenIndex: 0, currentIndex: model.currentIndex)),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('search_bar'.svg,
                      color: isColorActive(
                          screenIndex: 1, currentIndex: model.currentIndex)),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('orders'.svg,
                      color: isColorActive(
                          screenIndex: 2, currentIndex: model.currentIndex)),
                  label: 'Orders'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('profile'.svg,
                      color: isColorActive(
                          screenIndex: 3, currentIndex: model.currentIndex)),
                  label: 'Profile'),
            ],
          ),
        );
      },
      viewModelBuilder: () => HomeModel(),
    );
  }
}

// class HomeViewModel extends StatefulWidget {
//   @override
//   _HomeViewModelState createState() => _HomeViewModelState();
// }

// class _HomeViewModelState extends State<HomeViewModel> {
//   int _currentIndex = 0;

//   final List<Widget> _children = [
//     HomeView(),
//     SearchView(),
//     OrdersView(),
//     ProfileView()
//   ];

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTabTapped,
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset('home'.svg), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset('search_bar'.svg), label: 'Search'),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset('orders'.svg), label: 'Orders'),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset('profile'.svg), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }
