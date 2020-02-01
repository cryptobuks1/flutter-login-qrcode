import 'package:flutter/material.dart';
import 'package:qr_code_app_v1/pages/CodigoPage.dart';
import 'designCourseAppTheme.dart';

import 'dart:math';

class DetalhesPage extends StatefulWidget {
  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  final infoHeight = 364.0;
  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;



  //provide the same scrollController for list and draggableScrollbar
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pop(context);
      },
    );

    AlertDialog alerta = AlertDialog(
      content: Text("Vistoria realizada com sucesso!"),
      actions: [
        okButton,
      ],
    );

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    double height1 = height - padding.top - padding.bottom;

    final tempHight = (MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 2.0) +
        24.0);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Flávia Dias Pereira Campos",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            letterSpacing: 0.27,
            color: DesignCourseAppTheme.darkerText,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(

                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[

                      SizedBox(
                        height: height1, // fixed height
                        child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AspectRatio(
                                  aspectRatio: 1.5,
                                  child: Image.asset(
                                    'assets/images/funcionario.png'
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 50.0
                                ),
                                child: Container (
                                  decoration: BoxDecoration(
                                    color: DesignCourseAppTheme.nearlyWhite,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32.0),
                                        topRight: Radius.circular(32.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: DesignCourseAppTheme.grey.withOpacity(0.2),
                                          offset: Offset(1.1, 1.1),
                                          blurRadius: 10.0),
                                    ],
                                  ),
                                  child: Column (
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "AUXILIAR ADMNISTRATIVA",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                letterSpacing: 0.50,
                                                color: Colors.black54,

                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 8, top: 0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "CÓDIGO: 02542",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                letterSpacing: 0.40,
                                                color: Colors.black,

                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      AnimatedOpacity(
                                        duration: Duration(milliseconds: 500),
                                        opacity: 1,
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(9.0),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[

                                                  getTimeBoxUI("02/2017", "Admissão"),
                                                  getTimeBoxUI("04/2019", "Periódico"),
                                                  getTimeBoxUI("0", "Acidentes"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      ExpandableListView(),

                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            child: Ink(
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: CircleBorder(),
                                              ),
                                              child: IconButton(
                                                icon: Icon(Icons.android),
                                                color: Colors.white,
                                                onPressed: () {
                                                  print("filled background");
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                      ),
                ],
              ),
             ]
            )
            ),
          );
        },
      ),
      floatingActionButton: Transform.scale(
        scale: 1.0,
        child: FloatingActionButton.extended(
          onPressed: () {

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alerta;
              },
            );

          },
          label: Text('Vistoria Realizada',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 0.40,
                color: DesignCourseAppTheme.nearlyWhite,
              )),
          icon: Icon(Icons.check),
          backgroundColor: Colors.green,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: DesignCourseAppTheme.nearlyWhite,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: DesignCourseAppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 12.0, bottom: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  text1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 0.30,
                    color: Colors.black,
                  ),
                ),
                Text(
                  txt2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                    letterSpacing: 0.40,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  
}

class ExpandableListView extends StatelessWidget {

  static final List<String> _listViewData = [
    "NP-23 PROTEÇÃO CONTRA INCÊNDIOS",
    "NR-35 TRABALHO EM ALTURA",
    "NR-10 SEGURANÇA EM INSTALAÇÕES E SERVIÇOS",
    "NR-33 SEGURANÇA E SAÚDE",
  ];

  static final List<String> _listViewData2 = [
    "01/02/2017 - ADMISSIONAL",
    "04/05/2018 - PERIÓDICO",
    "10/04/2019 - PERIÓDICO",
  ];

  int i = 0;

  List<ExpansionTile> _listOfExpansions = List<ExpansionTile>.generate(
      1,
          (i) => ExpansionTile(

            title: Text("Treinamentos Realizados",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )),
            children: _listViewData
                .map((data) => ListTile(
                  title: Text(
                    data,
                    style: TextStyle (
                      color: Colors.red,
                    )
                  ),

                subtitle: Text("Realizado em: 10/01/2019 | Válido até: 10/10/2019 ",
                    style: TextStyle(
                    fontWeight: FontWeight.bold
                )
              ),

            ))
                .toList(),
          ));

  List<ExpansionTile> _listOfExpansions2 = List<ExpansionTile>.generate(
      1,
          (i) => ExpansionTile(
        title: Text("Exames Realizados",
            style: TextStyle(
                fontWeight: FontWeight.bold
            )),
        children: _listViewData2
            .map((data) => ListTile(
          title: Text(
            data,
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
              ),
          subtitle: Text("Válido até: 10/10/2019 ",
              style: TextStyle(
              fontWeight: FontWeight.bold
          )),
        ))
            .toList(),
      ));


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Column (
          children: _listOfExpansions.map((expansionTile) => expansionTile).toList(),
        ),

        Column (
          children: _listOfExpansions2.map((expansionTile) => expansionTile).toList(),
        )

      ],

    );
  }

}

