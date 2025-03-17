
import 'package:apex_dmit/core/component/native_text_field.dart';
import 'package:apex_dmit/core/px_to_dp.dart';
import 'package:apex_dmit/core/utils.dart';
import 'package:apex_dmit/pages/purchase_add/purchase_add_model.dart';
import 'package:apex_dmit/pages/purchase_add/purchase_add_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/base_screen.dart';

class PurchaseAddScreen extends BaseScreen<PurchaseAddModel, PurchaseAddViewmodel> {
  const PurchaseAddScreen({super.key});

  @override
  Widget buildBody(BuildContext context, PurchaseAddViewmodel viewModel) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.dp),
      ),
      child: SizedBox(
        width: 246.dp,
        height: 351.dp,
        child: Column(
          children: [
            Container(
              height: 37.dp,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.informationColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5.dp),topRight: Radius.circular(5.dp))
              ),
              child: Text("Material Purchase",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppColors.white),),
            ),
            _buildTextField('Items',controller: viewModel.itemController),
            _buildTextField('Store',controller: viewModel.storeController),
            _buildTextField("Runner's Name",controller: viewModel.runnerController),
            _buildTextField('Amount', keyboardType: TextInputType.number,controller: viewModel.amountController),
            _buildTextField('Card No',controller: viewModel.cardNoController),
            _buildDateField(context,viewModel.dateController),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 10.dp),
              child: ElevatedButton(
                onPressed: () {
                  viewModel.saveBtn();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:AppColors.floatingButtonColor,
                  minimumSize: Size(67.dp, 28.dp),
                ),
                child: Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTextField(String label, {TextInputType keyboardType = TextInputType.text,required TextEditingController controller}) {
    return Padding(
      padding:  EdgeInsets.only(top: 10.0.dp,left: 12.dp,right: 12.dp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$label*",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 9.sp,color: AppColors.primaryTextColor),),
          nativeTextField(
            height: 35,
           width: 113,
           hintText: "",
            controller: controller,
            onChanged: (String? value) {  },
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(BuildContext context,TextEditingController controller) {
    return Padding(
      padding:  EdgeInsets.only(top: 10.0.dp,left: 12.dp,right: 12.dp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Date *",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 9.sp,color: AppColors.primaryTextColor),),
          nativeTextField(
            height: 35,
            width: 113,
            hintText: "",
            controller: controller,
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context,controller),
            ),
            onChanged: (String? value) {  },
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context,TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = DateFormat('MM-dd-yyyy').format(picked);

    }
  }
}