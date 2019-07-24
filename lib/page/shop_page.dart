import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_client/customView/customView.dart';
import 'package:flutter_app_client/customView/main_page_widget/item_card_widget.dart';
import 'package:flutter_app_client/page/shop_car.dart';
//page1

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with AutomaticKeepAliveClientMixin{


  int  selectedIndex ;
  List<ClassifyItemBean> items ;
//  = List.generate(20,(int index){
//    return ClassifyItemBean(index== 0 ,index, '$index HH', '');
//  });


  @override
  void initState() {



    selectedIndex = 0;
    items = List.generate(20,(int index){
      return ClassifyItemBean(index== 0 ,index, '$index HH', '');
    });


    super.initState();

  }
  
  
  void changeSelectedIndex(int  index){
    
    if(selectedIndex == index) return;
    setState(() {

      ClassifyItemBean model = items[selectedIndex];
      model.selected = false;
      selectedIndex =index;
      ClassifyItemBean model2 = items[selectedIndex];
      model2.selected = true;
    });
    
  }

  bool open = true;

  void changeOpenState() {
    setState(() {
      open = !open;
    });
  }




get v1{


    if(open){
      return GridView.builder(

//        scrollDirection: Axis.horizontal,
          shrinkWrap: true,//
//         physics: NeverScrollableScrollPhysics(),
          physics: ClampingScrollPhysics(),//估计意思 contensize >size
          //而且能带动下面的视图滚动
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, //每行三列
                childAspectRatio: 1.0 //显示区域宽高相等
            ),
            itemCount:items.length,
            itemBuilder: (context, index) {

              return ClassifyItemWidget(items[index],callback: (int index2 ){

                changeSelectedIndex(index2);

              },);
            }
        );
    }else{
      return Container(
        height: 100,
        padding:EdgeInsets.all(8),
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
//            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, //每行三列
                childAspectRatio: 1.0 //显示区域宽高相等
            ),
            itemCount:items.length,
            itemBuilder: (context, index) {
              return ClassifyItemWidget(items[index],callback: (int index2 ){

                changeSelectedIndex(index2);

              },);
            }
        ),
      );
    }


  }


  get v2{

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //每行三列
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1/1.3, //显示区域宽高相等
            ),
            itemCount:40,
            itemBuilder: (context, index) {
              return ItemCardWidget();
            }
        ),
      );


  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return
//      TESTW();


      Scaffold(
        body: Container(
        color: Colors.white,
        child:
//
//      v1,


        ListView(
//        shrinkWrap: true,
          children: <Widget>[
            v1,
            IconButton(icon: Icon(Icons.build), onPressed: (){
              changeOpenState();




            }),
            v2,


          ],
        ),



    ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //购物车\
            //  Navigator.of(context).push(
            //     MaterialPageRoute(fullscreenDialog: true,builder: (context) => ShopCarPage()));

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ShopCarPage()));





          },
          child: Icon(Icons.add),
        ),

      );



  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
class TESTW extends StatelessWidget {


  Widget _buildStack() => Stack(
    alignment: const Alignment(0.0, 0.5),
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('images/iconbg.png'),
        radius: 200,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.black45,
        ),
        child: Text(
          'Mia B',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,

     child:IconButton(icon: Icon(Icons.ac_unit), onPressed: (){

       Navigator.push(context, MaterialPageRoute<void>(
         builder: (BuildContext context) {
           return Scaffold(
//             appBar: AppBar(title: Text('My Page')),
             body: Center(
               child: FlatButton(
                 child: Text('POP'),
                 onPressed: () {
                   Navigator.pop(context);
                 },
               ),
             ),
           );
         },
       ));

     }),
//     _buildStack(),
    );
  }
}
