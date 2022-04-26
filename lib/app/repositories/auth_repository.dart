import 'package:brac_arna/app/api_providers/api_manager.dart';
import 'package:brac_arna/app/api_providers/api_url.dart';
import 'package:brac_arna/app/models/AllProdResponse.dart';
import 'package:brac_arna/app/models/LoginResponse.dart';
import 'package:brac_arna/app/models/user_model.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:get/get.dart';

class AuthRepository {
  ///User Login api call
  Future userLogin(UserModel userData) async {
    Map user = {
      //'email': userData.userName,
      'email': "admin@gmail.com",
      //'password': userData.password,
      'password': "123",
    };
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.postAPICall(ApiClient.login, user);
      print('response: ${response}');

      if (response != null) {
        Get.find<AuthService>().setUser(LoginResponse.fromJson(response));
        return LoginResponse.fromJson(response);
      } else {
        return 'Unauthorised';
      }
    } catch (e) {
      print('error:$e');
      return 'Unauthorised';
    }
  }

  Future allProd() async {
    print('allProdapi: allProdapi');
    Map data = {
      'display_type': "list",
      'page': "1",
    };
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.postAPICall(ApiClient.allproducts_v3, data);
      print('responseAllProd: ${response}');

      if (response != null) {
        AllProdResponse res =  AllProdResponse.fromJson(response);
        var pordname = res.data![0].items_in_category!.data![0].name;
        print('pordname: ${pordname}');

        return AllProdResponse.fromJson(response);
      } else {
        return 'Unauthorised';
      }
    } catch (e) {
      print('error:$e');
      return 'Unauthorised';
    }
  }

}