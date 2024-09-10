import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ilk ekran
// şifreyi göster kısmı eklenebilir

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(
                height: 100,
                child: Image.asset('assets/images/performanzlogo.png')
              ),

              const SizedBox(height: 24),

              const Text(
                "Hoşgeldiniz",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 5),

              Text(
                "Devam etmek için giriş yapınız",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 50),

              // kullanıcı adı girişi
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius:
                      BorderRadius.circular(15.0), 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), 
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        'assets/icons/usericon.svg',
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFE47000),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    hintText: 'Kullanıcı Adı',
                    hintStyle: TextStyle(
                      color: Colors.grey[600], // Hint text rengi
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // şifre girişi
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius:
                      BorderRadius.circular(15.0), 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), 
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        'assets/icons/passwordicon.svg',
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFE47000),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    hintText: 'Şifre',
                    hintStyle: TextStyle(
                      color: Colors.grey[600], 
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // giriş yap butonu
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/tasks');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: const Color(0xFFE47000), 
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 15
                  ), 
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ), 
                  minimumSize: const Size(
                    double.infinity, 50
                  ), 
                ),
                child: const Text('Giriş Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}