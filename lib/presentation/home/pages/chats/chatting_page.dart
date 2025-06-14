import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

enum MessageSender { user, receiver }

class ChattingPage extends StatefulWidget {
  final String receiverName;
  final String receiverImageUrl;

  const ChattingPage({
    super.key,
    required this.receiverName,
    required this.receiverImageUrl,
  });

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false;

  final List<String> _cannedResponses = [
    "Baik, saya mengerti. Ada hal lain yang bisa saya bantu?",
    "Menarik sekali! Bisakah Anda memberikan detail lebih lanjut?",
    "Oke, saya akan memproses permintaan Anda.",
    "Tentu saja! Apa yang ingin Anda lakukan selanjutnya?",
    "Mohon tunggu sebentar, saya sedang mencari informasinya.",
    "Siap! Saya di sini untuk membantu Anda.",
  ];

  final List<String> _quickChatMessages = [
    "Oke, saya segera ke sana.",
    "Bisa tunggu sebentar?",
    "Maaf, agak telat sedikit.",
    "Sudah di depan ya.",
    "Ada yang bisa dibantu?",
  ];

  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _messages.add({
      'sender': MessageSender.receiver,
      'message': 'Halo! Ada yang bisa saya bantu hari ini?',
      'time': _getCurrentTime(),
      'imageUrl': widget.receiverImageUrl,
    });
    _scrollToBottom();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  void _sendMessage({String? quickMessage}) {
    final text = quickMessage ?? _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({
          'sender': MessageSender.user,
          'message': text,
          'time': _getCurrentTime(),
        });
        _messageController.clear();
        _isTyping = true;
      });
      _scrollToBottom();

      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        setState(() {
          _isTyping = false;
          _messages.add({
            'sender': MessageSender.receiver,
            'message':
                _cannedResponses[_random.nextInt(_cannedResponses.length)],
            'time': _getCurrentTime(),
            'imageUrl': widget.receiverImageUrl,
          });
        });
        _scrollToBottom();
      });
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
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
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(widget.receiverImageUrl),
              onBackgroundImageError: (exception, stackTrace) {
                debugPrint(
                  'ChattingPage: Error loading receiver image: $exception',
                );
              },
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.receiverName,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  _isTyping ? 'Typing...' : 'Active Now',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: _isTyping ? Colors.blue : Colors.green,
                  ),
                ),
              ],
            ),
          ],
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
                icon: Icon(Icons.more_vert, color: Colors.black, size: 24.w),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                if (message['sender'] == MessageSender.user) {
                  return _buildSenderMessage(
                    message: message['message'],
                    time: message['time'],
                  );
                } else {
                  return _buildReceiverMessage(
                    imageUrl: message['imageUrl'],
                    message: message['message'],
                    time: message['time'],
                  );
                }
              },
            ),
          ),
          if (_isTyping)
            _buildReceiverTypingIndicator(imageUrl: widget.receiverImageUrl),

          _buildQuickChatSuggestions(),

          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildQuickChatSuggestions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children:
            _quickChatMessages.map((message) {
              return GestureDetector(
                onTap: () => _sendMessage(quickMessage: message),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildReceiverMessage({
    required String imageUrl,
    required String message,
    required String time,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: NetworkImage(imageUrl),
            onBackgroundImageError: (exception, stackTrace) {
              debugPrint('Error loading image: $exception');
            },
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.receiverName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  time,
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSenderMessage({required String message, required String time}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFFDCF8C6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(fontSize: 14.sp, color: Colors.black87),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              time,
              style: TextStyle(fontSize: 10.sp, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiverTypingIndicator({required String imageUrl}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, left: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: NetworkImage(imageUrl),
            onBackgroundImageError: (exception, stackTrace) {
              debugPrint('Error loading image: $exception');
            },
          ),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
                bottomRight: Radius.circular(15.r),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.more_horiz, size: 24.w, color: Colors.grey[700]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.only(
        bottom: 20.h,
        left: 16.w,
        right: 16.w,
        top: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attachment, color: Colors.grey[600], size: 28.w),
            onPressed: () {},
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Type your message',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF28B446),
            ),
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white, size: 24.w),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
