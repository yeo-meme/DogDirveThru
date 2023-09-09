//
//  ViewController.swift
//  DogDriveThru
//
//  Created by yeomim kim on 2023/09/09.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var locationManager: CLLocationManager! // location1
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager() // location2
        // 델리게이트를 설정하고,
          locationManager.delegate = self
          // 거리 정확도
          locationManager.desiredAccuracy = kCLLocationAccuracyBest
          
        
        // 위치 사용 허용 알림
          locationManager.requestWhenInUseAuthorization()
          // 위치 사용을 허용하면 현재 위치 정보를 가져옴
          if CLLocationManager.locationServicesEnabled() {
             locationManager.startUpdatingLocation()
          }
          else {
              print("위치 서비스 허용 off")
          }
    }


}

extension ViewController: CLLocationManagerDelegate {
    
    func getLocationUsagePermission() {
        //location4
        self.locationManager.requestWhenInUseAuthorization()

    }
    
    // func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //     if let location = locations.first {
    //         print("위치 업데이트!")
    //         print("위도 : \(location.coordinate.latitude)")
    //         print("경도 : \(location.coordinate.longitude)")
    //     }
    // }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //location5
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
        case .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
            getLocationUsagePermission()
        case .denied:
            print("GPS 권한 요청 거부됨")
            getLocationUsagePermission()
        default:
            print("GPS: Default")
        }
    }
}

