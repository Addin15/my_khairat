import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_khairat/controllers/announcement_controller.dart';
import 'package:my_khairat/models/announcement.dart';
import 'package:my_khairat/models/mosque.dart';

class GuestDAO extends ChangeNotifier {
  Mosque? _mosque;
  List<Announcement> _announcements = [];

  Mosque? get mosque => _mosque;
  List<Announcement> get announcements => _announcements;

  GuestDAO() {
    initData();
  }

  initData() async {
    Box _guestBox = await Hive.openBox('guest');
    Mosque? mosque = _guestBox.get('mosque');

    if (mosque != null) {
      _mosque = mosque;
      getAnnouncements();
      notifyListeners();
    }
  }

  setMosque(Mosque mosque) async {
    Box _guestBox = await Hive.openBox('guest');
    await _guestBox.put('mosque', mosque);

    _mosque = mosque;
    getAnnouncements();
    notifyListeners();
  }

  getAnnouncements() async {
    List<Announcement> data =
        await AnnouncementController.getAnnouncements(_mosque!.id!);

    _announcements = data;
    _announcements.sort(
        (a, b) => DateTime.parse(b.date!).compareTo(DateTime.parse(a.date!)));
    notifyListeners();
  }
}
