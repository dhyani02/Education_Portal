import 'package:flutter/material.dart';

void main() {
  runApp(EducationApp());
}

class EducationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education Portal',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 9, 65, 110),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
        scaffoldBackgroundColor: Colors.black, // Changed background color to black
        fontFamily: 'Roboto',
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Mock authentication logic
    if (usernameController.text == '21it035' && passwordController.text == '1234') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CourseListScreen()));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid username or password.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Username',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: usernameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your Username',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                textStyle: TextStyle(color: const Color.fromARGB(255, 7, 7, 7), fontWeight: FontWeight.bold),
              ),
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationPage(),
                  ),
                ).then((result) {
                  if (result != null && result is UserCredentials) {
                    // Update the login fields with new credentials
                    usernameController.text = result.username;
                    passwordController.text = result.password;
                  }
                });
              },
              child: Text(
                'Don\'t have an account? Register',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Registration Form',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            // Container to enter registration information
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username:',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: usernameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter your username',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Password:',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Email:',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ),
                  // Add more registration fields as needed
                ],
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Perform registration logic
                // In this example, we simply return the entered credentials
                Navigator.pop(context, UserCredentials(
                  username: usernameController.text,
                  password: passwordController.text,
                  email: emailController.text,
                ));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                textStyle: TextStyle(color: const Color.fromARGB(255, 7, 7, 7), fontWeight: FontWeight.bold),
              ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseListScreen extends StatelessWidget {
  final List<Course> courses = [
    Course(
      name: 'MAD',
      instructor: 'XYZ',
      imageUrl: 'assets/book.jpg',
      chapters: ['Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'Chapter 7', 'Chapter 8'],
      color: const Color.fromARGB(255, 31, 227, 41)!,
    ),
    Course(
      name: 'CRNS',
      instructor: 'XYZ',
      imageUrl: 'assets/book.jpg',
      chapters: ['Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'Chapter 7', 'Chapter 8'],
      color: Color.fromARGB(255, 94, 7, 164)!,
    ),
    Course(
      name: 'ML',
      instructor: 'ABC',
      imageUrl: 'assets/book.jpg',
      chapters: ['Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'Chapter 7', 'Chapter 8'],
      color: const Color.fromARGB(255, 232, 77, 77)!,
    ),
    Course(
      name: 'CN',
      instructor: 'DEF',
      imageUrl: 'assets/book.jpg',
      chapters: ['Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'Chapter 7', 'Chapter 8'],
      color: Colors.orange[300]!,
    ),
    Course(
      name: 'BT',
      instructor: 'UVW',
      imageUrl: 'assets/book.jpg',
      chapters: ['Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'Chapter 7', 'Chapter 8'],
      color: const Color.fromARGB(255, 237, 16, 130)!,
    ),
    Course(
      name: 'DevOps',
      instructor: 'PQR',
      imageUrl: 'assets/book.jpg',
      chapters: ['Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'Chapter 7', 'Chapter 8'],
      color: Color.fromARGB(255, 7, 132, 125)!,
    ),
    Course(
      name: 'DAA',
      instructor: 'ABC',
      imageUrl: 'assets/book.jpg',
      chapters: ['Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'Chapter 7', 'Chapter 8'],
      color: Color.fromARGB(255, 228, 189, 16)!,
    ),
    Course(
      name: 'DBMS',
      instructor: 'XYZ',
      imageUrl: 'assets/book.jpg',
      chapters: ['Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'Chapter 7', 'Chapter 8'],
      color: Color.fromARGB(255, 186, 29, 230)!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CourseDetailScreen(course: courses[index])),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: courses[index].color,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white, // Changed color to white
                    backgroundImage: AssetImage(courses[index].imageUrl),
                    radius: 40,
                  ),
                  SizedBox(height: 8),
                  Text(
                    courses[index].name,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Instructor: ${courses[index].instructor}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  CourseDetailScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.name,
          style: TextStyle(color: Colors.white), // Changed text color to white
        ),
        backgroundColor: Colors.black, // Changed background color to black
        iconTheme: IconThemeData(color: Colors.white), // Set icon (arrow) color to white
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.black, // Changed background color to black
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Instructor: ${course.instructor}',
              style: TextStyle(fontSize: 18, color: Colors.white), // Changed text color to white
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: course.chapters.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChapterDetailScreen(chapterTitle: course.chapters[index])),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 169, 1, 83),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(
                        course.chapters[index],
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Make chapter titles bold
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Start the course
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Background color set to white
                  textStyle: TextStyle(color: const Color.fromARGB(255, 7, 7, 7), fontWeight: FontWeight.bold), // Text color set to black and bold
                ),
                child: Text('Start Course'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChapterDetailScreen extends StatelessWidget {
  final String chapterTitle;

  ChapterDetailScreen({required this.chapterTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chapterTitle,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white), // Set icon (arrow) color to white
        centerTitle: true, // Center the title horizontally
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              chapterTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            // Add chapter content here
          ],
        ),
      ),
    );
  }
}

class Course {
  final String name;
  final String instructor;
  final String imageUrl;
  final List<String> chapters;
  final Color color;

  Course({required this.name, required this.instructor, required this.imageUrl, required this.chapters, required this.color});
}

class UserCredentials {
  final String username;
  final String password;
  final String email;

  UserCredentials({required this.username, required this.password, required this.email});
}
