import 'package:flutter/material.dart';

class CustomTxtfield extends StatefulWidget {
  const CustomTxtfield({
    Key? key,
    required this.hintText,
    required this.inputType,
    required this.controller,
    this.onTap,
    this.isPassword = false,
    this.height,
    this.width,
  }) : super(key: key);

  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final bool isPassword;
  final double? height;
  final double? width;

  @override
  _CustomTxtfieldState createState() => _CustomTxtfieldState();
}

class _CustomTxtfieldState extends State<CustomTxtfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: SizedBox(
        height: widget.height ?? height * 0.078,
        width: widget.width,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: widget.controller,
            cursorColor: Color.fromARGB(255, 1, 35, 70),
            style: const TextStyle(
              color: Color.fromARGB(255, 1, 35, 70),
            ),
            keyboardType: widget.inputType,
            textInputAction: TextInputAction.next,
            onTap: widget.onTap,
            obscureText: widget.isPassword ? _obscureText : false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 05.0, horizontal: 15.0),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  color: Colors.black), // Adjust hint text color here
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 50, 49, 49),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';

// class CustomTxtfield extends StatefulWidget {
//   const CustomTxtfield({
//     Key? key,
//     required this.hintText,
//     required this.inputType,
//     required this.controller,
//     this.onTap,
//     this.isPassword = false,
//   }) : super(key: key);

//   final String hintText;
//   final TextInputType inputType;
//   final TextEditingController controller;
//   final VoidCallback? onTap;
//   final bool isPassword;

//   @override
//   _CustomTxtfieldState createState() => _CustomTxtfieldState();
// }

// class _CustomTxtfieldState extends State<CustomTxtfield> {
//   bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
//       child: SizedBox(
//         height: height * 0.078,
//         child: Card(
//           color: Colors.white,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: TextFormField(
//             controller: widget.controller,
//             cursorColor: Color.fromARGB(255, 229, 173, 50),
//             style: TextStyle(
//               color: Color.fromARGB(255, 229, 173, 50),
//             ),
//             keyboardType: widget.inputType,
//             textInputAction: TextInputAction.next,
//             onTap: widget.onTap,
//             obscureText: widget.isPassword ? _obscureText : false,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'This field is required';
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//               contentPadding:
//                   EdgeInsets.symmetric(vertical: 05.0, horizontal: 15.0),
//               hintText: widget.hintText,
//               hintStyle:
//                   TextStyle(color: Colors.black), // Adjust hint text color here
//               suffixIcon: widget.isPassword
//                   ? IconButton(
//                       icon: Icon(
//                         _obscureText ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _obscureText = !_obscureText;
//                         });
//                       },
//                     )
//                   : null,
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.grey,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(18),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: const Color.fromARGB(255, 50, 49, 49),
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(18),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
