import 'dart:ui';

import 'package:apex_dmit/core/px_to_dp.dart';
import 'package:apex_dmit/core/utils.dart';
import 'package:apex_dmit/pages/purchase_list/index.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import '../../core/index.dart';

class PurchaseListScreen extends BaseScreen<PurchaseListModel, PurchaseListViewmodel> {
  const PurchaseListScreen({super.key});

  @override
  Widget buildBody(BuildContext context, PurchaseListViewmodel viewModel) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            title: Text("Material Purchase"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                viewModel.setIsLoading(!viewModel.isMenuOpen);
              },
            ),
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == "logout") {
                   viewModel.logOutBtn();
                  }
                 viewModel.setIsMenuOpen(!viewModel.isMenuOpen);
                },
                onCanceled: () {
                  viewModel.setIsMenuOpen(!viewModel.isMenuOpen);
                },
                onOpened: () {
                  viewModel.setIsMenuOpen(!viewModel.isMenuOpen);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: "logout",
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.red),
                          SizedBox(width: 10),
                          Text("Logout"),
                        ],
                      ),
                    ),
                  ];
                },
                icon: Icon(Icons.more_vert), // More options icon
              ),
            ],
          ),
          body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  //controller: _searchController,
                 // onChanged: _filterData,
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                viewModel.isLoading?SizedBox(height:40.dp,width:40.dp,child: CircularProgressIndicator()):
                viewModel.purchaseResponse!= null?Expanded(
                  child:  DataTable2(
                    dataRowHeight: 30.dp,
                    headingRowHeight: 35.dp,
                    columnSpacing: 0,
                    minWidth: 700.dp,
                    scrollController: viewModel.productGridScrollController,
                    horizontalMargin: 0,
                    headingRowColor: WidgetStatePropertyAll(AppColors.informationColor),
                    dataRowColor: WidgetStatePropertyAll(AppColors.primaryTextColorLight),
                    dividerThickness: 1.dp,
                    headingRowDecoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                    ),
                    border: TableBorder.all(
                      color: AppColors.primaryTextColorLight,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                    ),
                    columns: [
                      DataColumn2(label: Container(alignment: Alignment.center, width: double.infinity, child: Text("SL",style: TextStyle(fontSize: 11.5.dp,fontWeight: FontWeight.w700,color: AppColors.white),)), fixedWidth: 25.dp),
                      DataColumn2(label: Container(alignment: Alignment.center, width: double.infinity, child: Text("Line Item Name",style: TextStyle(fontSize: 11.5.dp,fontWeight: FontWeight.w700,color: AppColors.white),)), fixedWidth: 100.dp),
                      DataColumn2(label: Container(alignment: Alignment.center, width: double.infinity, child: Text("Store",style: TextStyle(fontSize: 11.5.dp,fontWeight: FontWeight.w700,color: AppColors.white),)), fixedWidth: 100.dp),
                      DataColumn2(label: Container(alignment: Alignment.center, width: double.infinity, child: Text("Runners Name",style: TextStyle(fontSize: 11.5.dp,fontWeight: FontWeight.w700,color: AppColors.white),)), fixedWidth: 100.dp),
                      DataColumn2(label: Container(alignment: Alignment.center, width: double.infinity, child: Text("Amount",style: TextStyle(fontSize: 11.5.dp,fontWeight: FontWeight.w700,color: AppColors.white),)), fixedWidth: 100.dp),
                      DataColumn2(label: Container(alignment: Alignment.center, width: double.infinity, child: Text("Card Number",style: TextStyle(fontSize: 11.5.dp,fontWeight: FontWeight.w700,color: AppColors.white),)), fixedWidth: 100.dp),
                      DataColumn2(label: Container(alignment: Alignment.center, width: double.infinity, child: Text("Transaction Date",style: TextStyle(fontSize: 11.5.dp,fontWeight: FontWeight.w700,color: AppColors.white),)), fixedWidth: 100.dp),

                    ],
                    rows: List<DataRow>.generate(
                      viewModel.purchaseResponse!.materialPurchaseList.data.length,
                          (index) => DataRow2(
                            color: WidgetStatePropertyAll(index%2==0?AppColors.white:AppColors.tableRowColor2),
                              cells: [
                                DataCell(Padding(padding:EdgeInsets.only(left: 5.dp,right: 5.dp) ,child: Text(index.toString(),style: TextStyle(fontSize: 10.5.dp,fontWeight: FontWeight.w400,color: AppColors.primaryTextColor),))),
                                DataCell(Padding(padding:EdgeInsets.only(left: 5.dp,right: 5.dp) ,child:Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].lineItemName,style: TextStyle(fontSize: 10.5.dp,fontWeight: FontWeight.w400,color: AppColors.primaryTextColor)))),
                                DataCell(Padding(padding:EdgeInsets.only(left: 5.dp,right: 5.dp) ,child:Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].store,style: TextStyle(fontSize: 10.5.dp,fontWeight: FontWeight.w400,color: AppColors.primaryTextColor)))),
                                DataCell(Padding(padding:EdgeInsets.only(left: 5.dp,right: 5.dp) ,child:Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].runnersName,style: TextStyle(fontSize: 10.5.dp,fontWeight: FontWeight.w400,color: AppColors.primaryTextColor)))),
                                DataCell(Padding(padding:EdgeInsets.only(left: 5.dp,right: 5.dp) ,child:Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].amount.toString(),style: TextStyle(fontSize: 10.5.dp,fontWeight: FontWeight.w400,color: AppColors.primaryTextColor)))),
                                DataCell(Padding(padding:EdgeInsets.only(left: 5.dp,right: 5.dp) ,child:Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].cardNumber.toString(),style: TextStyle(fontSize: 10.5.dp,fontWeight: FontWeight.w400,color: AppColors.primaryTextColor)))),
                                DataCell(Padding(padding:EdgeInsets.only(left: 5.dp,right: 5.dp) ,child:Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].transactionDate.toString(),style: TextStyle(fontSize: 10.5.dp,fontWeight: FontWeight.w400,color: AppColors.primaryTextColor)))),

                              ]
                          ),
                    ),
                  ),
                ):Text("Data not found"),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.floatingButtonColor,
            shape: CircleBorder(),
            onPressed: () {},
            child: Container(
              width: 15.dp,
              height: 15.dp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
                child: Icon(
                    Icons.add,
                    color: AppColors.floatingButtonColor,
                  size: 25, )
            ),
          ),
        ),
        if (viewModel.isMenuOpen)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur intensity
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity
            ),
          ),
      ],
    );
  }

}
