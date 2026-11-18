import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../custom_image/custom_image.dart';
import '../custom_text/custom_text.dart';

class CustomRoyelAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleName;
  final String? rightIcon;
  final Widget? rightWidget;
  final double? leftSpace;
  final Color? color;
  final Color? leftIconColor;
  final void Function()? leftOnTap;
  final void Function()? rightOnTap;
  final bool? leftIcon;
  final bool? centerTitleEnable;

  const CustomRoyelAppbar({
    super.key,
    this.titleName,
    this.color,
    this.leftIconColor,
    this.leftOnTap,
    this.rightIcon,
    this.rightWidget,
    this.rightOnTap,
    this.leftIcon = false,
    this.centerTitleEnable = true,
    this.leftSpace,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarHeight: 70,
      elevation: 0,
      foregroundColor: Colors.transparent,
      centerTitle: centerTitleEnable,
      scrolledUnderElevation: 0,
      actions: [
        if (rightWidget != null)
          rightWidget!
        else if (rightIcon != null)
          IconButton(
            onPressed: () {
              rightOnTap?.call();
            },
            icon: CustomImage(
              imageSrc: rightIcon!,
              height: 24,
              width: 24,
              imageColor: AppColors.black,
            ),
          )
        else
          const SizedBox(width: 16),
      ],
      backgroundColor: Colors.transparent,
      leading: leftIcon == true
          ? Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Center(
                child: InkWell(
                  onTap: leftOnTap ?? () => Get.back(),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0x0A000000),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: leftIconColor ?? const Color(0xFF1E293B),
                      size: 24,
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
      leadingWidth: leftIcon == true ? 64 : 0,
      title: Align(
        alignment: centerTitleEnable == true
            ? Alignment.center
            : Alignment.centerLeft,
        child: CustomText(
          text: titleName ?? "",
          left: leftSpace ?? 0,
          fontSize: 18,
          maxLines: 1,
          fontWeight: FontWeight.w600,
          color: color ?? const Color(0xFF1E293B),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
