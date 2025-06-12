import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/widgets/menu_item_card.dart';
import 'package:propedia/presentation/home/widgets/transfer_method_card.dart';

class MenuSection extends StatelessWidget {
  final List<Map<String, dynamic>> allMenuItems;
  final Function(int index)? onItemTap;

  const MenuSection({super.key, required this.allMenuItems, this.onItemTap});

  void _showAllCategoriesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (_, scrollController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 10.w,
                    top: 20.h,
                    bottom: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'All Categories',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Select category to view more',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.close, size: 24.w),
                        color: Colors.grey[600],
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 0,
                    ),
                    itemCount: allMenuItems.length,
                    itemBuilder: (context, index) {
                      final item = allMenuItems[index];
                      String subtitle;

                      switch (item['title']) {
                        case 'Rumah':
                          subtitle = 'Cari rumah idamanmu';
                          break;
                        case 'Tanah':
                          subtitle = 'Temukan lahan untuk investasimu';
                          break;
                        case 'Kuliner':
                          subtitle = 'Aneka hidangan lezat';
                          break;
                        case 'Pengiriman':
                          subtitle = 'Kirim barang lebih cepat';
                          break;
                        case 'Lainnya':
                          subtitle = 'Jelajahi kategori lainnya';
                          break;
                        case 'Properti':
                          subtitle = 'Apartemen, ruko, kantor';
                          break;
                        case 'Kesehatan':
                          subtitle = 'Layanan medis dan konsultasi';
                          break;
                        case 'Otomotif':
                          subtitle = 'Jual beli kendaraan & servis';
                          break;
                        case 'Makanan':
                          subtitle = 'Pesan makanan favoritmu';
                          break;
                        case 'Belanja':
                          subtitle = 'Berbagai produk kebutuhan';
                          break;
                        case 'Edukasi':
                          subtitle = 'Kursus & pelatihan online';
                          break;
                        case 'Olahraga':
                          subtitle = 'Fasilitas & perlengkapan olahraga';
                          break;
                        default:
                          subtitle = 'Deskripsi kategori';
                      }

                      return TransferMethodCard(
                        icon: item['icon'],
                        title: item['title'],
                        subtitle: subtitle,
                        iconColor: item['iconColor'],
                        onTap: () {
                          if (onItemTap != null) {
                            onItemTap!(index);
                          }
                          Navigator.pop(context);
                          debugPrint(
                            '${item['title']} tapped from Bottom Sheet',
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayedItems = allMenuItems.take(4).toList();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            children:
                displayedItems.map((item) {
                  final index = allMenuItems.indexOf(item);
                  return MenuItemCard(
                    icon: item['icon'],
                    title: item['title'],
                    iconColor: item['iconColor'],
                    backgroundColor: item['backgroundColor'],
                    onTap: () {
                      if (onItemTap != null) {
                        onItemTap!(index);
                      }
                      debugPrint('${item['title']} tapped from Main Menu');
                    },
                  );
                }).toList(),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => _showAllCategoriesBottomSheet(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.apps_outlined,
                    size: 20.w,
                    color: Colors.blue.shade700,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'All Category',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
