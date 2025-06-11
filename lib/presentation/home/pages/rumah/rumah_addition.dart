import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc
import 'package:dio/dio.dart'; // Import Dio untuk PropertyApiService
import 'package:propedia/models/request/stores/property_request.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';
import 'package:propedia/presentation/home/cubit/property_state.dart';
import 'package:propedia/services/stores/properties_api_services.dart'; // Sesuaikan path ini


class RumahAdditionPage extends StatefulWidget {
  const RumahAdditionPage({Key? key}) : super(key: key);

  @override
  State<RumahAdditionPage> createState() => _RumahAdditionPageState();
}

class _RumahAdditionPageState extends State<RumahAdditionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaRumahController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _tipeRumahController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();

  final List<String> _houseTypes = [
    'Rumah',
    'Apartemen',
    'Villa',
    'Ruko',
    'Tanah',
    'Gudang',
    'Kantor',
    'Lainnya',
  ];

  @override
  void dispose() {
    _namaRumahController.dispose();
    _hargaController.dispose();
    _tipeRumahController.dispose();
    _deskripsiController.dispose();
    _lokasiController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final String namaRumah = _namaRumahController.text;
      final int harga = int.tryParse(_hargaController.text.replaceAll('.', '')) ?? 0;
      final String tipeRumah = _tipeRumahController.text;
      final String deskripsi = _deskripsiController.text;
      final String lokasi = _lokasiController.text;

      // Buat instance CreatePropertyRequest dari data form
      final CreatePropertyRequest request = CreatePropertyRequest(
        title: namaRumah,
        price: harga,
        type: tipeRumah,
        description: deskripsi,
        location: lokasi,
        imageUrl: null, // Anda bisa menambahkan input untuk ini nanti
      );

      // Anda harus menentukan 'role' berdasarkan logika autentikasi aplikasi Anda.
      // Untuk contoh ini, saya akan hardcode sebagai 'penjual'.
      const String role = 'penjual';

      // Panggil Cubit untuk melakukan proses pembuatan properti
      // KOREKSI: Gunakan metode 'create' sesuai PropertyCubit Anda
      context.read<PropertyCubit>().create(role, request);
    }
  }

  void _showHouseTypeBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
          ),
          child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.8,
            expand: false,
            builder: (_, scrollController) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                    child: Container(
                      height: 5.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pilih Tipe Properti',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close_rounded, size: 24.w, color: Colors.grey[600]),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1.h, color: Colors.grey[200]),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: _houseTypes.length,
                      itemBuilder: (context, index) {
                        final type = _houseTypes[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                type,
                                style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                              ),
                              trailing: _tipeRumahController.text == type
                                  ? Icon(Icons.check_circle_rounded, color: Colors.blue.shade600, size: 20.w)
                                  : null,
                              onTap: () {
                                _tipeRumahController.text = type;
                                Navigator.pop(context);
                              },
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                            ),
                            if (index < _houseTypes.length - 1)
                              Divider(height: 1.h, indent: 20.w, endIndent: 20.w, color: Colors.grey[100]),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PropertyCubit(PropertiesApiService(Dio())), // Inisialisasi Cubit
      child: BlocListener<PropertyCubit, PropertyState>(
        listener: (context, state) {
          state.whenOrNull(
            created: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Properti berhasil ditambahkan!'),
                  backgroundColor: Colors.green,
                ),
              );
              // Bersihkan form setelah sukses
              _formKey.currentState!.reset();
              _namaRumahController.clear();
              _hargaController.clear();
              _tipeRumahController.clear();
              _deskripsiController.clear();
              _lokasiController.clear();
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            title: const Text('Tambah Properti Baru', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(15.r),
              shadowColor: Colors.blue.shade100,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Properti',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Isi detail properti Anda agar mudah ditemukan.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 25.h),

                      _buildTextField(
                        controller: _namaRumahController,
                        labelText: 'Nama Properti',
                        hintText: 'Contoh: Rumah Minimalis Elite',
                        prefixIcon: Icons.house_rounded,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama properti tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 18.h),
                      _buildTextField(
                        controller: _hargaController,
                        labelText: 'Harga (Rp)',
                        hintText: 'Contoh: 1.500.000.000',
                        keyboardType: TextInputType.number,
                        prefixIcon: Icons.attach_money_rounded,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harga tidak boleh kosong';
                          }
                          if (int.tryParse(value.replaceAll('.', '')) == null) {
                            return 'Harga harus berupa angka';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          final text = value.replaceAll('.', '');
                          if (text.isNotEmpty) {
                            final number = int.tryParse(text);
                            if (number != null) {
                              final formatter = NumberFormat('#,###', 'id_ID');
                              final formattedText = formatter.format(number);
                              _hargaController.value = TextEditingValue(
                                text: formattedText,
                                selection: TextSelection.collapsed(offset: formattedText.length),
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: 18.h),
                      TextFormField(
                        controller: _tipeRumahController,
                        readOnly: true,
                        onTap: _showHouseTypeBottomSheet,
                        decoration: InputDecoration(
                          labelText: 'Tipe Properti',
                          hintText: 'Pilih tipe properti',
                          prefixIcon: Icon(Icons.category_rounded, size: 22.w, color: Colors.blue.shade600),
                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, size: 24.w, color: Colors.grey.shade700),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.grey.shade200, width: 1.w),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.blue.shade600, width: 2.w),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.red.shade600, width: 2.w),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.red.shade600, width: 2.w),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                          labelStyle: TextStyle(fontSize: 15.sp, color: Colors.grey.shade700),
                          hintStyle: TextStyle(fontSize: 13.sp, color: Colors.grey.shade500),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tipe properti tidak boleh kosong';
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 15.sp, color: Colors.black87),
                        cursorColor: Colors.blue.shade600,
                      ),
                      SizedBox(height: 18.h),
                      _buildTextField(
                        controller: _deskripsiController,
                        labelText: 'Deskripsi Properti',
                        hintText: 'Tuliskan deskripsi lengkap properti Anda...',
                        maxLines: 4,
                        prefixIcon: Icons.description_rounded,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Deskripsi tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 18.h),
                      _buildTextField(
                        controller: _lokasiController,
                        labelText: 'Lokasi Properti',
                        hintText: 'Contoh: Bandung, Jawa Barat',
                        prefixIcon: Icons.location_on_rounded,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lokasi tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30.h),

                      BlocBuilder<PropertyCubit, PropertyState>(
                        builder: (context, state) {
                          // KOREKSI: Gunakan .when atau .maybeWhen untuk memeriksa state Freezed
                          final bool isLoading = state.maybeWhen(
                            loading: () => true, // Jika state adalah loading, set isLoading ke true
                            orElse: () => false, // Untuk state lainnya, set isLoading ke false
                          );
                          return SizedBox(
                            width: double.infinity,
                            height: 55.h,
                            child: ElevatedButton.icon(
                              onPressed: isLoading ? null : _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade600,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                elevation: 5,
                                shadowColor: Colors.blue.shade200,
                              ),
                              icon: isLoading
                                  ? SizedBox(
                                      width: 24.w,
                                      height: 24.w,
                                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.w),
                                    )
                                  : Icon(Icons.add_home_rounded, size: 24.w),
                              label: Text(
                                isLoading ? 'Menambahkan...' : 'Tambah Properti',
                                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    IconData? prefixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 22.w, color: Colors.blue.shade600) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.blue.shade600, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red.shade600, width: 2.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red.shade600, width: 2.w),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        labelStyle: TextStyle(fontSize: 15.sp, color: Colors.grey.shade700),
        hintStyle: TextStyle(fontSize: 13.sp, color: Colors.grey.shade500),
      ),
      style: TextStyle(fontSize: 15.sp, color: Colors.black87),
      cursorColor: Colors.blue.shade600,
    );
  }
}