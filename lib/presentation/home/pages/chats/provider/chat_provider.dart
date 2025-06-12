import 'package:flutter/foundation.dart';

class ChatProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _chatList = [];

  List<Map<String, dynamic>> get chatList => _chatList;

  void addChat({
    required String imageUrl,
    required String name,
    String lastMessage = 'Mulai percakapan!',
    String time = 'Sekarang',
    int unreadCount = 0,
  }) {
    final existingChatIndex = _chatList.indexWhere(
      (chat) => chat['name'] == name,
    );

    if (existingChatIndex == -1) {
      _chatList.add({
        'imageUrl': imageUrl,
        'name': name,
        'lastMessage': lastMessage,
        'time': time,
        'unreadCount': unreadCount,
      });
      debugPrint(
        'ChatProvider: Chat added for: $name. Current list count: ${_chatList.length}',
      );
      notifyListeners();
    } else {
      debugPrint(
        'ChatProvider: Chat for $name already exists. Not adding duplicate.',
      );
    }
  }
}
