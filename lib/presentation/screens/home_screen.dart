import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/business_logic/la_vie_cubit/cubit.dart';
import '../widgets/home_widgets.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int itemCounter = 1;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LaVieCubit>(context,listen: true);
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Center(
            child: Image(image: AssetImage('assets/images/La Vie Logo.png'))),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: 46,
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: HexColor('#F8F8F8'),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DefaultTabController(
            length: 5,
            initialIndex: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.height,
                    height: 40,
                    child: TabBar(tabs: [
                      Text('All'),
                      Text('Plants'),
                      Text('Seeds'),
                      Text('Tools'),
                      Text('Products'),],
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.white,
                      labelColor: Colors.green,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Colors.green)
                      ),
                    ),
                  ),
                  if(cubit.seedsModel!=null)
                  Container(
                    height: MediaQuery.of(context).size.height-299,
                    width: double.infinity,
                    child: TabBarView(children: [
                      Center(child: Text('hi') ),
                      GridView.builder(
                          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 150 / 270,
                          ),
                          itemCount:cubit.plantsModel!.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return IthemCard(title: cubit.plantsModel!.data![index].name,image:cubit.plantsModel!.data![index].imageUrl ,price: 0,);
                          }),
                      GridView.builder(
                          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 150 / 270,
                          ),
                          itemCount:cubit.seedsModel!.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return IthemCard(title: cubit.seedsModel!.data![index].name,image:cubit.seedsModel!.data![index].imageUrl ,price: 0,);
                          }),
                      GridView.builder(
                          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 150 / 270,
                          ),
                          itemCount:cubit.toolsModel!.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return IthemCard(title: cubit.toolsModel!.data![index].name,image:cubit.toolsModel!.data![index].imageUrl ,price: 0,);
                          }),
                      GridView.builder(
                          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 150 / 270,
                          ),
                          itemCount:cubit.productModel!.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return IthemCard(title: cubit.productModel!.data![index].name,image:cubit.productModel!.data![index].imageUrl ,price: cubit.productModel!.data![index].price,);
                          }),
                    ]),
                  ),
                ],
              ),

            )
        ),

      ],
    );
  }
}
