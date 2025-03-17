
import 'package:apex_dmit/pages/purchase_list/index.dart';

import '../../main.dart';
import '../../pages/login/login_viewmodel.dart';
import '../../pages/purchase_add/purchase_add_viewmodel.dart';

void setupVMLocator() {
  getIt.registerFactory(() => LogInViewModel());
  getIt.registerFactory(() => PurchaseListViewmodel());
  getIt.registerFactory(() => PurchaseAddViewmodel());

}