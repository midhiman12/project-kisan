import 'package:flutter/material.dart';
import 'crop_sakha_screen.dart';
import 'mandi_sakha_screen.dart';
import 'yojana_sakha_screen.dart';

void main() {
  runApp(KisanSakhaApp());
}

class KisanSakhaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kisan Sakha',
      theme: ThemeData(
        primaryColor: Color(0xFF76b852), // Green
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF76b852),
          secondary: Color(0xFFF89E4F), // Orange
          background: Color(0xFFFCF6E3), // Beige
        ),
        scaffoldBackgroundColor: Color(0xFFFCF6E3),
        fontFamily: 'PT Sans',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF76b852),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: KisanSakhaHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KisanSakhaHomePage extends StatefulWidget {
  @override
  State<KisanSakhaHomePage> createState() => _KisanSakhaHomePageState();
}

class _KisanSakhaHomePageState extends State<KisanSakhaHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  final List<String> _languages = ['English', 'Hindi', 'Kannada', 'Telugu'];
  String _selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kisan Sakha',
              style: TextStyle(
                color: Color(0xFF76b852),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Your friendly AI farming assistant',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 0,
                ),
                child: Row(
                  children: [
                    Icon(Icons.language, color: Colors.black45, size: 20),
                    SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        'Select Your Language',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: DropdownButton<String>(
                        value: _selectedLanguage,
                        isExpanded: true, // Makes dropdown take available space
                        onChanged: (val) {
                          setState(() {
                            _selectedLanguage = val!;
                          });
                        },
                        items: _languages.map((lang) {
                          return DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Color(0xFF76b852),
                unselectedLabelColor: Colors.black54,
                indicatorColor: Color(0xFF76b852),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                tabs: [
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.eco),
                        SizedBox(width: 5),
                        Text("Crop Sakha"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.bar_chart),
                        SizedBox(width: 5),
                        Text("Mandi Sakha"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.shield),
                        SizedBox(width: 5),
                        Text("Yojana Sakha"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CropSakhaScreen(selectedLanguage: _selectedLanguage),
          MandiSakhaScreen(selectedLanguage: _selectedLanguage),
          YojanaSakhaScreen(selectedLanguage: _selectedLanguage),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.mic, color: Colors.white),
        onPressed: () {
          // You can trigger context-aware voice input here
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Voice input not implemented')),
          );
        },
      ),
    );
  }
}

