
import 'package:apex_dmit/pages/purchase_list/index.dart';

import '../../main.dart';
import '../../pages/login/login_viewmodel.dart';

void setupVMLocator() {
  getIt.registerFactory(() => LogInViewModel());
  getIt.registerFactory(() => PurchaseListViewmodel());

}