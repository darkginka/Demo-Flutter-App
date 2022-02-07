import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe.dart';
import 'package:flutter_application_1/models/recipe_api.dart';
import 'package:flutter_application_1/widgets/recipe_table.dart';
import 'package:flutter_application_1/utils/widgets_decoration.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;
  final _itemExtent = 90.0;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: Widgets.appBar('Table Food Recipe'),
          body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          DataTable(
                            columns: const [
                              DataColumn(
                                label: Text('Recipe',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              DataColumn(
                                  label: Text('Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Time',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Rating',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ],
                            //Data Disp
                            rows: const [
                              DataRow(
                                cells: [
                                  DataCell(Text('')),
                                  DataCell(Text('')),
                                  DataCell(Text('')),
                                  DataCell(Text('')),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SliverFixedExtentList(
                      itemExtent: _itemExtent, // I'm forcing item heights
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                          onTap: () {
                            Widgets.showCardFunc(
                                context,
                                _recipes[index].images,
                                _recipes[index].name,
                                _recipes[index].totalTime);
                          },
                          child: Recipetbl(
                              title: _recipes[index].name,
                              cookTime: _recipes[index].totalTime,
                              rating: _recipes[index].rating.toString(),
                              thumbnailUrl: _recipes[index].images),
                        ),
                        childCount: _recipes.length,
                      ),
                    ),
                  ],
                )

////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
          ),
    );
  }
}
