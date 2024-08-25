import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_details/verse_list_widget.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/sura_title_widget.dart';

class VersesProvider extends StatefulWidget {
  const VersesProvider({super.key, required this.suraArgs});
  final SuraArgs suraArgs;
  @override
  State<VersesProvider> createState() => _VersesProviderState();
}

class _VersesProviderState extends State<VersesProvider> {
  var future;
  @override
  void initState() {
    super.initState();
    future = getFileData(widget.suraArgs.index);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          //else if (snapshot.hasError) {
          //   return Center(child: Text('Error: ${snapshot.error}'));
          // } else if (snapshot.hasData) {
          else {
            return VerseListWidget(suraVerses: snapshot.data!);
          }
        });
  }

  Future<List<String>> getFileData(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${fileIndex + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    print(suraLines.length);

    return suraLines;
  }
}
