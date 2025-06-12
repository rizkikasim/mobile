// lib/presentation/home/pages/chats/chatting_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math'; // Untuk balasan acak

// Definisikan tipe untuk pengirim pesan
enum MessageSender { user, receiver }

class ChattingPage extends StatefulWidget {
  final String receiverName; // Nama penerima chat
  final String receiverImageUrl; // URL gambar penerima chat

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
  final List<Map<String, dynamic>> _messages = []; // Daftar pesan dinamis
  bool _isTyping = false; // Indikator typing dari penerima

  // Pesan balasan acak untuk simulasi "komputer"
  final List<String> _cannedResponses = [
    "Baik, saya mengerti. Ada hal lain yang bisa saya bantu?",
    "Menarik sekali! Bisakah Anda memberikan detail lebih lanjut?",
    "Oke, saya akan memproses permintaan Anda.",
    "Tentu saja! Apa yang ingin Anda lakukan selanjutnya?",
    "Mohon tunggu sebentar, saya sedang mencari informasinya.",
    "Siap! Saya di sini untuk membantu Anda."
  ];

  // Daftar pesan cepat (quick chat)
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
    // Menambahkan pesan awal dari receiver untuk memulai percakapan
    _messages.add({
      'sender': MessageSender.receiver,
      'message': 'Halo! Ada yang bisa saya bantu hari ini?',
      'time': _getCurrentTime(),
      'imageUrl': widget.receiverImageUrl,
    });
    _scrollToBottom(); // Gulir ke bawah setelah menambahkan pesan awal
  }

  // Fungsi untuk mendapatkan waktu saat ini dalam format yang diinginkan
  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  // Fungsi untuk mengirim pesan, baik dari input teks maupun quick chat
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
        _isTyping = true; // Set isTyping menjadi true saat menunggu balasan
      });
      _scrollToBottom();

      // Simulasi balasan dari "komputer" setelah beberapa detik
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return; // Pastikan widget masih terpasang
        setState(() {
          _isTyping = false; // Nonaktifkan indikator typing
          _messages.add({
            'sender': MessageSender.receiver,
            'message': _cannedResponses[_random.nextInt(_cannedResponses.length)],
            'time': _getCurrentTime(),
            'imageUrl': widget.receiverImageUrl,
          });
        });
        _scrollToBottom();
      });
    }
  }

  // Gulir otomatis ke bagian bawah daftar pesan
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
        centerTitle: false, // Ubah menjadi false agar judul bisa diatur secara custom
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
        title: Row( // Menggunakan Row untuk menggabungkan avatar dan teks
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(widget.receiverImageUrl),
              onBackgroundImageError: (exception, stackTrace) {
                debugPrint('ChattingPage: Error loading receiver image: $exception');
              },
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.receiverName, // Nama penerima dinamis
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  _isTyping ? 'Typing...' : 'Active Now', // Status online dinamis
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
                onPressed: () {
                  // Aksi untuk menu lainnya
                },
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
          // Indikator typing dari penerima
          if (_isTyping)
            _buildReceiverTypingIndicator(imageUrl: widget.receiverImageUrl),
          
          // Bagian Quick Chat
          _buildQuickChatSuggestions(),

          // Bagian Input Pesan
          _buildMessageInput(),
        ],
      ),
    );
  }

  //--- Quick Chat Suggestions ---
  // Widget ini menampilkan tombol-tombol pesan cepat yang bisa diklik pengguna.
  Widget _buildQuickChatSuggestions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      alignment: Alignment.centerLeft, // Sesuaikan alignment
      child: Wrap(
        spacing: 8.w, // Jarak antar tombol
        runSpacing: 8.h, // Jarak antar baris tombol
        children: _quickChatMessages.map((message) {
          return GestureDetector(
            onTap: () => _sendMessage(quickMessage: message), // Kirim pesan cepat
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black87,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  //--- Message Bubbles (Pesan Terkirim dan Diterima) ---
  // Ini adalah widget untuk menampilkan gelembung pesan.

  // Widget untuk pesan yang diterima (dari penerima)
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
                  widget.receiverName, // Nama pengirim pesan dinamis
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Warna abu-abu untuk pesan yang diterima
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

  // Widget untuk pesan yang dikirim (dari Anda)
  Widget _buildSenderMessage({
    required String message,
    required String time,
  }) {
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
                color: const Color(0xFFDCF8C6), // Warna hijau muda untuk pesan yang dikirim (ala WhatsApp/Gojek)
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

  //--- Typing Indicator ---
  // Widget ini menampilkan indikator "Typing..." saat penerima sedang mengetik.
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
                Icon(Icons.more_horiz, size: 24.w, color: Colors.grey[700]), // '...'
              ],
            ),
          ),
        ],
      ),
    );
  }

  //--- Message Input Bar ---
  // Ini adalah *input field* dan tombol kirim pesan di bagian bawah.
  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w, top: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attachment, color: Colors.grey[600], size: 28.w),
            onPressed: () {
              // Aksi untuk attachment
            },
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
                controller: _messageController, // Gunakan controller
                decoration: InputDecoration(
                  hintText: 'Type your message',
                  hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                onSubmitted: (_) => _sendMessage(), // Kirim pesan saat menekan enter/submit
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF28B446), // Warna hijau khas Gojek
            ),
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white, size: 24.w),
              onPressed: _sendMessage, // Panggil fungsi kirim pesan
            ),
          ),
        ],
      ),
    );
  }
}