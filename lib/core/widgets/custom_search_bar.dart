// import 'package:flutter/material.dart';
// import 'package:supabase_project/core/constants/colors.dart';
// import 'package:supabase_project/core/constants/text_style.dart';

// // import 'package:zivomap/core/constants/colors.dart'; // Uncomment if you have this

// class CustomSearchBar extends StatelessWidget {
//   final TextEditingController? controller;
//   final VoidCallback? onCameraTap;
//   final VoidCallback? onSearchTap;
//   final bool readOnly;

//   const CustomSearchBar({
//     super.key,
//     this.controller,
//     this.onCameraTap,
//     this.onSearchTap,
//     this.readOnly = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: whiteColor,
//         borderRadius: BorderRadius.circular(30), // Pill shape
//         boxShadow: [
//           BoxShadow(
//             color: blackColor.withOpacity(0.08), // Subtle shadow
//             blurRadius: 15,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: controller,
//         readOnly: readOnly,
//         onTap: onSearchTap,
//         textAlignVertical: TextAlignVertical.center,
//         decoration: InputDecoration(
//           hintText: "Search for place ...",
//           hintStyle:
//               styqle14.copyWith(fontWeight: FontWeight.w400, color: blackColor),
//           border: InputBorder.none,
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 20, vertical: 14),

//           // Leading Search Icon
//           prefixIcon: Padding(
//             padding: const EdgeInsets.only(left: 12.0, right: 8.0),
//             child: SizedBox(
//               width: 20,
//               height: 20,
//               child: Image.asset(AppAssets().search),
//             ),
//           ),
//           prefixIconConstraints:
//               const BoxConstraints(minWidth: 40, minHeight: 40),

//           // Trailing Camera Icon
//           suffixIcon: GestureDetector(
//             onTap: onCameraTap,
//             child: Padding(
//                 padding: EdgeInsets.only(right: 16.0),
//                 child: SizedBox(
//                     width: 20.w,
//                     height: 20.h,
//                     child: Image.asset(AppAssets().camera))),
//           ),
//           suffixIconConstraints:
//               const BoxConstraints(minWidth: 40, minHeight: 40),
//         ),
//       ),
//     );
//   }
// }
