import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/providers/homepage_provider.dart';
import 'package:tic_tac_toe/providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Home page build');
    final homePgProvider =
        Provider.of<HomePageProvider>(context, listen: false);

    return Scaffold(
        // backgroundColor: const Color(0xFF323D5B),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tic Tac Toe',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Consumer<ThemeProvider>(
                builder: (context, provider, child) => IconButton(
                    onPressed: () {
                      provider.toggleTheme();
                    },
                    icon: (provider.themeMode == ThemeMode.light)
                        ? const Icon(Icons.dark_mode_outlined)
                        : const Icon(Icons.light_mode_outlined)))
          ],
          //backgroundColor: const Color(0xFF5F6B84),
          toolbarHeight: 70,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          )),
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Selector<HomePageProvider, String>(
              selector: (context, provider) => provider.winnerName,
              builder: (context, winnerName, child) => Text(
                    (winnerName.isEmpty)
                        ? ""
                        : (winnerName.startsWith('Match'))
                            ? winnerName
                            : 'YAY! $winnerName is winner',
                    style: GoogleFonts.dmSerifText(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: (winnerName == 'X')
                            ? const Color(0xFFE25041)
                            : (winnerName.startsWith('Match'))
                                ? const Color(0xFFFFAB40)
                                : const Color(0xFF1CBD9E)),
                  )),
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: const Color(0xFF5F6B84),
                color: Theme.of(context).colorScheme.primaryContainer),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Center(
                    child: GestureDetector(
                        onTap: () {
                          (homePgProvider.isGameOver)
                              ? null
                              : homePgProvider.playerTap(index);
                        },
                        child: Consumer<HomePageProvider>(
                          builder: (context, provider, child) => Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (provider.displayWinner.contains(index))
                                    ? Colors.yellowAccent
                                    : Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer),
                            child: Center(
                              child: Text(
                                  (provider.displayXO[index] == 1 ||
                                          (provider.displayXO[index] == 2))
                                      ? (((provider.displayXO[index] == 1)
                                          ? 'X'
                                          : 'O'))
                                      : '',
                                  style: TextStyle(
                                      color: (provider.displayXO[index] == 1)
                                          ? const Color(0xFFE25041)
                                          : const Color(0xFF1CBD9E),
                                      fontSize: 40,
                                      fontFamily: 'San Fransisco',
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        )),
                  );
                }),
          ),
          SizedBox(
            height: 40,
            width: 100,
            child: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                color: const Color(0xFFFFAB40),
                child: Text(
                  'Reset',
                  style: GoogleFonts.dmSerifText(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                onPressed: () => homePgProvider.resetButton()),
          )
        ]));
  }
}
