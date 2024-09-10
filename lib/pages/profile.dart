import 'package:flutter/material.dart';
import 'package:taskmanagerapp/widgets/bottombar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F7),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // profil foto
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://m.media-amazon.com/images/I/41miU+cgrLL._AC_UF1000,1000_QL80_.jpg'
                ),
              ),
            ),
            SizedBox(height: 20),

            // isim soyisim bilgileri girilecek
            Text(
              'İdil Sanem Gürsoy', // API'den gelecek, böyle manuel yazılmayacak
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),

            // bilgiler girilecek
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // bilgiler bold olmayacak. şimdilik bilgi olmadığı için düzeltmedim
                children: [
                  Text('Kullanıcı adı: ...',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )
                  ),
                  SizedBox(height: 20),
                  Text('URL: ...',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )
                  ),
                  SizedBox(height: 20),
                  Text('Yetki: ...',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 125,
            height: 40,
            decoration: BoxDecoration(
              /*gradient: const LinearGradient(
                colors: [Colors.orange, Color(0xFFE47000)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),*/
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                foregroundColor: Colors.black,
              ),
              child: const Text(
                'Çıkış Yap',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const BottomBar(
            selectedIndex: 2,
          ),
        ],
      ),
    );
  }
}
