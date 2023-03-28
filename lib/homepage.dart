import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fetch_api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getQuote();
  }

  final themeColor = Colors.green.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Random Kanye Quotes',
          style: GoogleFonts.acme(fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getQuote(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final quote = snapshot.data;
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'lib/assets/kanyebackground.jpg',
                ),
                fit: BoxFit.fill,
              )),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: themeColor,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Card(
                      color: Colors.transparent,
                      child: SizedBox(
                        height: 450,
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "''$quote''",
                              style: GoogleFonts.acme(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container(
            color: themeColor,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.pinkAccent.withOpacity(0.3),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            getQuote();
          });
        },
        label: Text(
          'Next Quote',
          style: GoogleFonts.acme(fontSize: 20),
        ),
        backgroundColor: themeColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
