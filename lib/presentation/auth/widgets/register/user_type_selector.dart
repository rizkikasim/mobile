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
          child: SegmentedButton<UserType>(
            segments: const <ButtonSegment<UserType>>[
              ButtonSegment<UserType>(
                value: UserType.penjual,
                label: Text('Penjual'),
              ),
              ButtonSegment<UserType>(
                value: UserType.admin,
                label: Text('Admin'),
              ),
              ButtonSegment<UserType>(
                value: UserType.pembeli,
                label: Text('Pembeli'),
              ),
            ],
            selected: selectedUserType,
            onSelectionChanged: onSelectionChanged,
            emptySelectionAllowed: true,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>((
                Set<MaterialState> states,
              ) {
                if (states.contains(MaterialState.selected)) {
                  return const Color(0xFFFF6B00);
                }
                return Colors.grey[200]!;
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
                const Color(0xFFFF6B00).withOpacity(0.1),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: BorderSide(
                    color:
                        selectedUserType.isEmpty
                            ? Colors.grey[300]!
                            : const Color(0xFFFF6B00),
                    width: 1.w,
                  ),
                ),
              ),
              side: MaterialStateProperty.resolveWith<BorderSide>((
                Set<MaterialState> states,
              ) {
                if (states.contains(MaterialState.selected)) {
                  return BorderSide(color: const Color(0xFFFF6B00), width: 1.w);
                }
                return BorderSide(color: Colors.grey[300]!, width: 1.w);
              }),
            ),
          ),
        ),
      ],
    );
  }
}
