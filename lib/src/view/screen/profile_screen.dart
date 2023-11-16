import 'package:e_commerce/core/app_color.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
                minRadius: 50,
                maxRadius: 75,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ProfileMenu(
              title: "Name",
              subtitle: "Muhammad Ady",
            ),
            ProfileMenu(
              title: "Email",
              subtitle: "ady29@gmail.com",
            ),
            ProfileMenu(
              title: "Phone",
              subtitle: "+6281234567890",
            ),
            ProfileMenu(
              title: "Address",
              subtitle: "Jl. Jendral Sudirman No.1, Jakarta",
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String title, subtitle;

  const ProfileMenu({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(
        14.0,
      ),
      margin: const EdgeInsets.only(
        bottom: 15.0,
      ),
      decoration: BoxDecoration(
        color: AppColor.secondary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black87,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: AppColor.primary,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
