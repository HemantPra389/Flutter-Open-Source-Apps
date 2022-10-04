import 'package:flutter/material.dart';
import 'package:vishal_mega_mart_app/screens/bloc/productbloc.dart';
import 'package:vishal_mega_mart_app/screens/model/product.dart';


class SearchProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchallproduct();
    return Scaffold(
      
      body: StreamBuilder(
        stream: bloc.allproduct,
        builder: (context, AsyncSnapshot<ProductModel> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 40,
              itemBuilder: (BuildContext context, int index) {
                index++;
                return Card(
                  //color: Colors.lightBlueAccent,
                  child: Column(
                    children:const [
                    //   Expanded(
                    // //     child:snapshot.data!.hits![index].cVmmSizeChart!.path.toString().isNotEmpty
                    // // ? Image.asset(
                    // //       snapshot.data!.hits![index].cVmmSizeChart!.path.toString(),
                    // //       //fit: BoxFit.fill,
                    // //     ): assets/t.jpg
                    // child: NetworkImage(imglink),
                    //   ),
                       Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "some",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                       Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                         "someeeeeee",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "\$ 229.00",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// class MovieListss extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     bloc.fetchallproduct();
//     return Scaffold(
      
//       body: StreamBuilder(
//         stream: bloc.allproduct,
//         builder: (context, AsyncSnapshot<ProductModel> snapshot) {
//           if (snapshot.hasData) {
//             return GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: 10,
//               itemBuilder: (BuildContext context, int index) {
//                 return Card(
//                   //color: Colors.lightBlueAccent,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Image.asset(
//                           snapshot.data!.hits[index].cVmmSizeChart!.path.toString(),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Brink",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Solid Polo Shirt",
//                           style: TextStyle(fontSize: 20, color: Colors.grey),
//                         ),
//                       ),
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "\$ 229.00",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },);
//           } else if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }

//   Widget buildList(AsyncSnapshot<ProductModel> snapshot) {
//     return  
//   }
// }