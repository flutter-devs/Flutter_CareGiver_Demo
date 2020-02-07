import 'package:flutter/material.dart';
import 'package:home_care_app/model/dailyactivity_model.dart';
import 'package:home_care_app/model/plancare.dart';
import 'package:home_care_app/model/recomond_caregivers.dart';
import 'package:home_care_app/model/splash_model.dart';


class Constants{

  static final String SPLASH_SCREEN='SPLASH_SCREEN';
  static final String SPLASH_SCREEN_CAREGIVER='SPLASH_SCREEN_CAREGIVER';
  static final String HOME_SCREEN='HOME_SCREEN';

  static List<DailyActivity>getDailyActivity(){
    return[
      DailyActivity(Color.fromRGBO(114, 57, 241, 1),Color.fromRGBO(112, 55, 240, 1),'assets/images/heartrate.png','Heart Rate','90','bpm'),
      DailyActivity(Color.fromRGBO(240, 139, 107, 1),Color.fromRGBO(238, 106, 135,1),'assets/images/blood_1.png','Blood Presure ','80/140','mmhg'),
      DailyActivity(Color.fromRGBO(65, 217, 99, 1),Color.fromRGBO(57, 206, 150, 1),'assets/images/temprature.png','Temprature','98','F'),
      DailyActivity(Color.fromRGBO(240, 139, 107, 1),Color.fromRGBO(238, 106, 135,1),'assets/images/temprature.png','Heart Rate','90','bpm'),
    ];
  }

  static List<PlanCare>getPlanCareList(){
    return[
      PlanCare(Color.fromRGBO(237, 218, 250, 1),Color.fromRGBO(132, 7, 217, 1),'assets/images/runing.png','Exercise'),
      PlanCare(Color.fromRGBO(255, 232, 234, 1),Color.fromRGBO(254, 89, 116, 1),'assets/images/meditaion.png','Medication'),
      PlanCare(Color.fromRGBO(255,222,230, 1),Color.fromRGBO(254, 149, 69, 1),'assets/images/meditaion.png','Check-Up'),
      PlanCare(Color.fromRGBO(255, 232, 234, 1),Color.fromRGBO(132, 7, 217, 1),'assets/images/meditaion.png','Check-Up'),
    ];
  }
  
  static List<RecomondCaregivers>getRecomondCaregivers(){
    return[
      RecomondCaregivers('assets/images/Michael_img.jpg','Micheal Conner'),
      RecomondCaregivers('assets/images/lynda.jpg','Lynda'),
      RecomondCaregivers('assets/images/michael.jpg','Sam Jon'),
    ];
  }

  static List<SplashModel>getSplashScreen(){
    return[
      SplashModel('assets/images/care1.png'),
      SplashModel('assets/images/care-2.png'),
      SplashModel('assets/images/care-3.png'),
    ];
  }
}