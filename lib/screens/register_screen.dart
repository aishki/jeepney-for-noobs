// import 'package:flutter/material.dart';
// import '../services/api_service.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController unameController = TextEditingController();
//   final TextEditingController upassController = TextEditingController();
//   bool isLoading = false;

//   void register() async {
//     setState(() => isLoading = true);

//     final response = await ApiService.registerUser(
//       nameController.text,
//       unameController.text,
//       upassController.text,
//     );

//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(response['message'])));

//     if (response['status'] == "success") {
//       Navigator.pop(context);
//     }

//     setState(() => isLoading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Register")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: "Full Name")),
//             TextField(
//                 controller: unameController,
//                 decoration: InputDecoration(labelText: "Username")),
//             TextField(
//                 controller: upassController,
//                 decoration: InputDecoration(labelText: "Password"),
//                 obscureText: true),
//             SizedBox(height: 20),
//             ElevatedButton(
//                 onPressed: isLoading ? null : register, child: Text("Register"))
//           ],
//         ),
//       ),
//     );
//   }
// }
