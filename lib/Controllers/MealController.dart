import 'package:get/get.dart';

import '../DataAccesslayer/Models/component.dart';
import '../DataAccesslayer/Models/meal.dart';
import '../DataAccesslayer/Repository/component_repo.dart';

class MealController extends GetxController {
  ComponentRepo componentRepo = ComponentRepo();

  List<Component> components = [];

  final Meal meal = Get.arguments;

  @override
  onInit() async {
    fetchData();
    super.onInit();
  }

  fetchData() async {
   
  //  components = await componentRepo.getComponents(meal.id);
    //print(components);
    update();
  }
}
