import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factory Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    DashboardPage(),
    EngineerListPage(),
    NotificationSettingsPage(),
    ActivationPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red, // Set background color to red
        unselectedItemColor: Colors.red, // Unselected items in white
        selectedItemColor: Colors.green, // Selected item in green
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.engineering),
            label: 'Engineers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.key),
            label: 'Activate Account',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedFactoryIndex = 0;
  List<String> factoryTitles = ['Factory 1', 'Factory 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
                selectedFactoryIndex == 0 ? 'images/picture1.png' : 'images/picture2.png',
                fit: BoxFit.cover
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: factoryTitles.map((title) {
                int index = factoryTitles.indexOf(title);
                return Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedFactoryIndex = index;
                      });
                    },
                    child: Text(
                      title,
                      style: TextStyle(
                        color: selectedFactoryIndex == index ? Colors.blue : Colors.grey,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: selectedFactoryIndex == index ? Colors.lightBlueAccent : Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class EngineerListPage extends StatefulWidget {
  @override
  _EngineerListPageState createState() => _EngineerListPageState();
}

class _EngineerListPageState extends State<EngineerListPage> {
  int selectedFactoryIndex = 0;
  List<String> factoryImages = ['images/picture3.png', 'images/picture4.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Engineer List')),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(factoryImages[selectedFactoryIndex], fit: BoxFit.cover),
          ),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(2, (index) {
                return Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedFactoryIndex = index;
                      });
                    },
                    child: Text('Factory ${index + 1}'),
                    style: TextButton.styleFrom(
                      backgroundColor: index == selectedFactoryIndex ? Colors.blue : Colors.grey,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool showImage = true;  // Initially showing the image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
      ),
      body: Column(
        children: [
          if (showImage) // Condition to show the image
            Expanded(  // Using Expanded to make use of all available space
              child: Image.asset('images/p5.png', fit: BoxFit.cover),
            ),
          Container(  // Container for buttons
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => setState(() => showImage = !showImage),
                    child: Text('Factory 1', style: TextStyle(color: Colors.green)),
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},  // No functionality for Factory 2
                    child: Text('Factory 2', style: TextStyle(color: Colors.grey)),
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class ActivationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Activate Account')),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100, // Adjust the size as needed
              height: 100, // Adjust the size as needed
              padding: EdgeInsets.all(8), // Adds some padding around the image
              child: Image.asset('images/picture6.png', fit: BoxFit.contain),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text('Enter your activation code below:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Activation Code',
                          hintText: 'Enter Code Here'
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your activation code verification logic here
                    },
                    child: Text('Activate'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Use backgroundColor instead of primary
                      foregroundColor: Colors.white, // Use foregroundColor instead of onPrimary
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
