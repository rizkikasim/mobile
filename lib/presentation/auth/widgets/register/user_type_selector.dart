import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/auth/widgets/utils/register_utils.dart';

class UserTypeSelector extends StatelessWidget {
  final Set<UserType> selectedUserType;
  final ValueChanged<Set<UserType>> onSelectionChanged;

  const UserTypeSelector({
    super.key,
    required this.selectedUserType,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Daftar Sebagai',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: SegmentedButton<UserType>(
              segments: <ButtonSegment<UserType>>[
                ButtonSegment<UserType>(
                  value: UserType.penjual,
                  label: Text('Penjual'),
                  icon:
                      selectedUserType.contains(UserType.penjual)
                          ? Icon(Icons.check, size: 16.sp)
                          : null,
                ),
                ButtonSegment<UserType>(
                  value: UserType.admin,
                  label: Text('Admin'),
                  icon:
                      selectedUserType.contains(UserType.admin)
                          ? Icon(Icons.check, size: 16.sp)
                          : null,
                ),
                ButtonSegment<UserType>(
                  value: UserType.pembeli,
                  label: Text('Pembeli'),
                  icon:
                      selectedUserType.contains(UserType.pembeli)
                          ? Icon(Icons.check, size: 16.sp)
                          : null,
                ),
              ],
              selected: selectedUserType,
              onSelectionChanged: onSelectionChanged,
              emptySelectionAllowed: true,
              multiSelectionEnabled: false,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                ) {
                  if (states.contains(MaterialState.selected)) {
                    return const Color(0xFF8DBCC7);
                  }
                  return Colors.white;
                }),
                foregroundColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                ) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return Colors.black87;
                }),
                overlayColor: MaterialStateProperty.all(
                  const Color(0xFF8DBCC7).withOpacity(0.1),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    side: BorderSide(
                      color:
                          selectedUserType.isEmpty
                              ? Colors.grey[300]!
                              : const Color(0xFF8DBCC7),
                      width: 1.w,
                    ),
                  ),
                ),
                side: MaterialStateProperty.resolveWith<BorderSide>((
                  Set<MaterialState> states,
                ) {
                  if (states.contains(MaterialState.selected)) {
                    return BorderSide(
                      color: const Color(0xFF8DBCC7),
                      width: 1.w,
                    );
                  }
                  return BorderSide(color: Colors.grey[300]!, width: 0.5.w);
                }),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
