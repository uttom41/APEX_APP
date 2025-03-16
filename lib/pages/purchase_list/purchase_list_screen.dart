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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text("Material Purchase"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
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
                  color: AppColors.white,
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
                          cells: [
                            DataCell(Text(index.toString())),
                            DataCell(Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].lineItemName)),
                            DataCell(Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].store)),
                            DataCell(Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].runnersName)),
                            DataCell(Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].amount.toString())),
                            DataCell(Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].cardNumber.toString())),
                            DataCell(Text(viewModel.purchaseResponse!.materialPurchaseList.data[index].transactionDate.toString())),


                          ]
                      ),
                ),
              ),
            ):Text("Data not found"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

}
