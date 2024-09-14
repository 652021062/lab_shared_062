import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/first_page.dart';
import 'package:labshared_pref/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // Declare your variable for data
  String? myname;

  // Declare your function to load data
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myname = prefs.getString("myname");
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Another Page",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black, 
        elevation: 4, 
        centerTitle: true, 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            // Show Your name
            Text(
              myname ?? "รอสักครู่",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent, 
              ),
              textAlign: TextAlign.center, 
            ),
            const SizedBox(height: 30), 
            // Row to arrange buttons horizontally
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                // Button go to First Page (Left)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), 
                    ),
                    backgroundColor: Colors.redAccent, 
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    elevation: 4, 
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(fontSize: 18, color: Colors.white), 
                  ),
                ),
                // Button go to Home Page (Right)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), 
                    ),
                    backgroundColor: Colors.redAccent, 
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    elevation: 4, 
                  ),
                  child: const Text(
                    'Home',
                    style: TextStyle(fontSize: 18, color: Colors.white), 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black, 
    );
  }
}
