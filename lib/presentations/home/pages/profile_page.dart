import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/data/datasources/auth_local_datasource.dart';
import 'package:flutter_agribisnisku/presentations/auth/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page',style: TextStyle(color: Colors.white),),
        // Tambahkan icon panah untuk kembali ke halaman sebelumnya
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthLocalDatasource().removeAuthData();
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }),
            );
          },
          child: const Text('Log Out'),
        ),
      ),
    );
  }
}
