import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/pages/chats/provider/chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:propedia/presentation/home/pages/chats/chatting_page.dart';
import 'package:propedia/presentation/home/widgets/custom_search_bar.dart';
import 'package:propedia/presentation/home/pages/chats/seller_list_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void _openSellerListPage() async {
    debugPrint(
      'ChatPage: FloatingActionButton pressed. Navigating to SellerListPage...',
    );
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SellerListPage()),
    );

    debugPrint('ChatPage: Returned from SellerListPage. Raw result: $result');

    if (result != null && result is Map<String, dynamic>) {
      if (result.containsKey('imageUrl') &&
          result['imageUrl'] != null &&
          result.containsKey('name') &&
          result['name'] != null) {
        debugPrint(
          'ChatPage: Result is valid. Attempting to add chat via Provider...',
        );
        Provider.of<ChatProvider>(context, listen: false).addChat(
          imageUrl: result['imageUrl'] as String,
          name: result['name'] as String,
        );
        debugPrint('ChatPage: Chat add request sent to Provider.');
      } else {
        debugPrint(
          'ChatPage: Result Map is missing required keys (imageUrl or name) or their values are null.',
        );
      }
    } else {
      debugPrint(
        'ChatPage: Result is null or not of expected type Map<String, dynamic>. No chat added.',
      );
      if (result != null) {
        debugPrint('ChatPage: Raw result type is: ${result.runtimeType}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    final chatList = chatProvider.chatList;

    debugPrint('ChatPage: Building with chatList count: ${chatList.length}');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.w),
              onPressed: () {
                debugPrint('ChatPage: Back button pressed on AppBar. Popping.');
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          'Chat List',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: IconButton(
                icon: Icon(Icons.more_horiz, color: Colors.black, size: 24.w),
                onPressed: () {
                  debugPrint('ChatPage: More options button pressed.');
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: const CustomSearchBar(),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child:
                chatList.isEmpty
                    ? _buildEmptyChatState()
                    : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: chatList.length,
                      itemBuilder: (context, index) {
                        final chat = chatList[index];
                        debugPrint(
                          'ChatPage: Building chat item for: ${chat['name']}',
                        );
                        return _buildChatListItem(
                          context: context,
                          imageUrl: chat['imageUrl']!,
                          name: chat['name']!,
                          lastMessage: chat['lastMessage']!,
                          time: chat['time']!,
                          unreadCount: chat['unreadCount']!,
                        );
                      },
                    ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openSellerListPage,
        backgroundColor: const Color(0xFFFF6B00),
        child: Icon(Icons.add, size: 28.w, color: Colors.white),
      ),
    );
  }

  Widget _buildEmptyChatState() {
    debugPrint('ChatPage: Displaying empty chat state.');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_outline, size: 100.w, color: Colors.grey[400]),
          SizedBox(height: 20.h),
          Text(
            'Yah... Belum ada chat nih!',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Mulai percakapan dengan Penjual.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildChatListItem({
    required BuildContext context,
    required String imageUrl,
    required String name,
    required String lastMessage,
    required String time,
    required int unreadCount,
  }) {
    return GestureDetector(
      onTap: () {
        debugPrint(
          'ChatPage: Tapped on chat item for $name. Navigating to ChattingPage.',
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ChattingPage(
                  receiverName: name,
                  receiverImageUrl: imageUrl,
                ),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 28.r,
                  backgroundImage: NetworkImage(imageUrl),
                  onBackgroundImageError: (exception, stackTrace) {
                    debugPrint(
                      'ChatPage: Error loading image for $name: $exception',
                    );
                  },
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color:
                                  unreadCount > 0
                                      ? const Color(0xFFFF6B00)
                                      : Colors.grey[600],
                              fontWeight:
                                  unreadCount > 0
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              lastMessage,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color:
                                    unreadCount > 0
                                        ? Colors.black87
                                        : Colors.grey[700],
                                fontWeight:
                                    unreadCount > 0
                                        ? FontWeight.w500
                                        : FontWeight.normal,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (unreadCount > 0)
                            Container(
                              margin: EdgeInsets.only(left: 10.w),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6B00),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                '$unreadCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            indent: 70.w,
            height: 1.h,
            thickness: 0.5,
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }
}
