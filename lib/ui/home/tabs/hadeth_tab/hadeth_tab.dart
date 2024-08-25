import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_model.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_title_widget.dart';
import 'package:islami_app/utils/image_paths.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethItem> hadethList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHadethFileData('assets/hadeth_files/ahadeth.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset(
                getImagePathByName(imageName: 'hadith_header.png'))),
        Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
                    color: Theme.of(context).dividerColor, width: 2)),
          ),
          child: Text(
            AppLocalizations.of(context)!.elahadith,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        //listView

        Expanded(
          flex: 2,
          child: ListView.builder(
              itemBuilder: (context, index) {
                return HadethTitleWidget(
                  hadethIndex: index,
                  hadethItem: hadethList[index],
                );
              },
              itemCount: hadethList.length),
        )
      ],
    );
  }

  void getHadethFileData(String filePath) async {
    String fileContent = await rootBundle.loadString(filePath);
    //contains all hadeth
    List<String> allHadeth = fileContent.split('#');
    String title = '';
    List<String> hadethLines = [];
    for (int i = 0; i < allHadeth.length; i++) {
      hadethLines = allHadeth[i].split(RegExp(r'\r?\n'));
      title = hadethLines.removeAt(0);
      if (title.isNotEmpty && hadethLines.isNotEmpty) {
        hadethList
            .add(HadethItem(hadethTitle: title, hadethContent: hadethLines));
        setState(() {});
      }
    }
  }
}
