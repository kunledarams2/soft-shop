import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/components/utility_widget.dart';
import 'package:softshop_mobile/views/home/home_view.dart';
import 'package:softshop_mobile/views/order/orders_view.dart';
import 'package:softshop_mobile/views/profile/profile_view.dart';
import 'package:softshop_mobile/views/search/search_view.dart';
import 'package:softshop_mobile/views/main/main_viewmodel.dart';

class MainView extends StatelessWidget {
  final List<Widget> _pages = [
    HomeView(),
    SearchView(),
    OrdersView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, model, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: Utils.dark,
          child: Scaffold(
            body: LazyIndexedStack(
              itemBuilder: (_, index) => FadeIn(child: _pages[index]),
              reuse: false,
              index: model.currentIndex,
              itemCount: _pages.length
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              // type: BottomNavigationBarType.fixed,
              // material: (_, __) => MaterialNavBarData(type: BottomNavigationBarType.fixed, elevation: 1),
              type: BottomNavigationBarType.fixed,
              elevation: 3,
              onTap: model.setIndex,
              currentIndex: model.currentIndex,
              items: <BottomNavigationBarItem> [
                bottomBarItem('Home', 'home'.svg, 'Dashboard', 'Home Navigator is Active', model.currentIndex, 0, context),
                bottomBarItem('Search', 'search_bar'.svg, 'Search', 'Search Navigator is Active', model.currentIndex, 1, context),
                bottomBarItem('Orders', 'orders'.svg, 'Orders', 'Orders Navigator is Active', model.currentIndex, 2, context),
                bottomBarItem('Profile', 'profile'.svg, 'Profile', 'Profile Navigator is Active', model.currentIndex, 3, context)
              ]
            ),
          ),
        );
      }
    );
  }
}