import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/teamsRanking.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/widgets/navbar.dart';

class TeamRank extends StatefulWidget {
  final String pouleid;
  final String division;
  const TeamRank({
    Key key,
    @required this.pouleid,
    @required this.division,
  }) : super(key: key);

  @override
  State<TeamRank> createState() => _TeamRankState();
}

class _TeamRankState extends State<TeamRank> {
  List<TeamRanking> teamsRanking = [];
  @override
  void initState() {
    super.initState();
    fetchTeamsRanking(widget.pouleid, widget.division).then((result) {
      setState(() {
        teamsRanking = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Classement Équipe",
        ),
        drawer: MaterialDrawer(currentPage: "Classement Équipe"),
        backgroundColor: MaterialColors.bgColorScreen,
        body: teamsRanking.length > 0
            ? SizedBox(
                width: double.infinity,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('Nom'),
                    ),
                    DataColumn(
                      label: Text('Classement'),
                    ),
                    DataColumn(
                      label: Text('Victoires'),
                    ),
                    DataColumn(
                      label: Text('Défaites'),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    teamsRanking.length,
                    (int index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(teamsRanking[index].name)),
                        DataCell(Text(teamsRanking[index].ranking)),
                        DataCell(Text(teamsRanking[index].victory)),
                        DataCell(Text(teamsRanking[index].defeat))
                      ],
                    ),
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
