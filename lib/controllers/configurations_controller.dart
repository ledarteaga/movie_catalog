import 'package:get/get.dart';

import '../models/configuration/configuration.dart';

class ConfigurationsController extends GetxController {
  var baseConfig = Configuration().obs;
  var isLoaded = false.obs;

  get config {
    return baseConfig;
  }
}
