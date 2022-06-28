import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_khairat/controllers/announcement_controller.dart';
import 'package:my_khairat/models/announcement.dart';

class AnnouncementDAO extends ChangeNotifier {
  List<Announcement> _announcements = [];

  AnnouncementDAO(String mosqueID) {
    initData(mosqueID);
  }

  get announcements => _announcements;

  initData(String mosqueID) async {
    List<Announcement> data =
        await AnnouncementController.getAnnouncements(mosqueID);
    //TODO cache with Hive

    _announcements = data;
    notifyListeners();
  }

  // Caught exception purpose
  bool _disposed = false;

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
