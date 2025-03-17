
import 'package:apex_dmit/pages/purchase_add/purchase_add_model.dart';
import 'package:flutter/material.dart';

import '../../core/base_viewmodel.dart';
import '../../core/component/tost.dart';
import '../../core/http/response.dart';
import '../../core/utils.dart';

class PurchaseAddViewmodel extends BaseViewModel<PurchaseAddModel> {
  late PurchaseAddModel _entity;
  @override
  void buildProps() {
    // TODO: implement buildProps
  }

  @override
  void initState() {
    _entity = getEntity();
  }

  TextEditingController get itemController => _entity.itemController;
  TextEditingController get storeController => _entity.storeController;
  TextEditingController get runnerController => _entity.runnerController;
  TextEditingController get amountController => _entity.amountController;
  TextEditingController get cardNoController => _entity.cardNoController;
  TextEditingController get dateController => _entity.dateController;

  void saveBtn() async{
    if(_entity.itemController.text.isNotEmpty
        && _entity.storeController.text.isNotEmpty
        && _entity.runnerController.text.isNotEmpty
        && _entity.amountController.text.isNotEmpty
        && _entity.cardNoController.text.isNotEmpty
        && _entity.dateController.text.isNotEmpty) {

      DResponse data = await _entity.apiClient.post("auth/interview/material-purchase",data: {
        "material_purchase": [
          {
            "line_item_name": _entity.itemController.text,
            "store":  _entity.storeController.text,
            "runners_name": _entity.runnerController.text,
            "amount": _entity.amountController.text,
            "card_number": _entity.cardNoController.text,
            "transaction_date": _entity.dateController.text
          }
        ]
      });

      if(data.status==201){
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showToast(
              context:ref.context,
              duration: 2,
              message: data.data['status_message'],
              backgroundColor: AppColors.informationColor
          );
          Navigator.of(ref.context).pop();

        });
      }else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showToast(
              context:ref.context,
              duration: 4,
              message: data.message,
              backgroundColor: AppColors.actionColor
          );
        });
      }
    }
    else {
      showToast(
          context:ref.context,
          duration: 4,
          message: "All fields are required",
          backgroundColor: AppColors.actionColor
      );
    }
  }
}