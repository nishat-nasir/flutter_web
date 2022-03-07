import 'package:flutter_web/presentation/template/template.dart';

class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}

List<Person> get people => [
      Person('Mike', 'Barron', 64),
      Person('Todd', 'Black', 30),
      Person('Ahmad', 'Edwards', 55),
      Person('Anthony', 'Johnson', 67),
      Person('Annette', 'Brooks', 39),
      Person('Annettesdkfhsdfhdusfghdsuifg', 'Brooks', 39),
    ];

class DefaultHeader extends StatelessWidget implements PreferredSizeWidget {
  String? titleText;
  bool showLeadingBack;
  bool showTitleDate;
  bool showLeadingMenuBtn;
  VoidCallback? showLeadingX;
  VoidCallback? showActionExit;
  VoidCallback? showActionAdd;
  VoidCallback? showActionSearch;
  VoidCallback? showActionQr;
  VoidCallback? showActionPrint;
  VoidCallback? showActionCalendar;
  VoidCallback? showActionClear;
  VoidCallback? showActionSend;
  VoidCallback? showActionClock;
  VoidCallback? showActionSettings;
  VoidCallback? showActionDelete;
  DefaultHeader(
      {this.showLeadingBack = false,
      this.showTitleDate = false,
      this.showLeadingMenuBtn = false,
      this.showLeadingX,
      this.showActionExit,
      this.showActionAdd,
      this.showActionSearch,
      this.showActionQr,
      this.showActionPrint,
      this.showActionCalendar,
      this.showActionClear,
      this.showActionSend,
      this.showActionClock,
      this.showActionSettings,
      this.titleText,
      this.showActionDelete});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: showTitleDate,
      title: _buildTitleText(),
      leading: _buildLeading(),
      actions: _buildActions(),
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize =>
      Size(double.infinity, ThemeSizeStyle.appBarHeight.h);

  List<Widget>? _buildActions() {
    return [
      if (showActionExit != null)
        IconButton(
            alignment: Alignment.centerLeft,
            onPressed: showActionExit,
            icon: Icon(Icons.logout, size: 52.h)),
      if (showActionAdd != null)
        IconButton(
            alignment: Alignment.centerLeft,
            onPressed: showActionAdd,
            icon: Icon(Icons.add, size: 62.h)),
      if (showActionSearch != null)
        IconButton(
            alignment: Alignment.centerLeft,
            onPressed: _showSearch,
            icon: Icon(Icons.search, size: 48.h)),
    ];
  }

  Widget? _buildTitleText() {
    if (titleText != null) {
      return Text(``
        text: titleText!,
      );
    }
  ;
    }
  }

  String dateFormat() {
    initializeDateFormatting(null, null);
    return DateFormat.yMMMd('ru').add_jm().format(DateTime.now());
  }

  Widget? _buildLeading() {
    if (showLeadingBack) {
      return IconButton(
        onPressed: _onBackTap,
        icon: Icon(Icons.chevronLeft, size: 46.h),
      );
    }
    if (showLeadingMenuBtn) {
      return Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu, size: 48.h),
        );
      });
    }
    if (showLeadingX != null) {
      return IconButton(
        onPressed: showLeadingX,
        icon: Icon(Icons.x, size: 46.h),
      );
    }
  }

  _onBackTap() {
    appStore.dispatch(NavigateToAction(to: 'up'));
  }

  _showSearch() async {
    // appStore.dispatch(UpdateSearchAction(searchType: SearchType.WARE_SEARCH));

    await showSearch(
        context: Get.context!,
        delegate: SearchPage<Person>(
          items: people,
          filter: (person) => [
            person.name,
            person.surname,
            person.age.toString(),
          ],
        ));

    showActionSearch!();
  }
}

const searchByBarcode = 'Поиск по называнию, штрихкоду';
// testing the git delete branch
// ? hello there
// ! how ar you doing
// ? testing it
// ! testing the branch