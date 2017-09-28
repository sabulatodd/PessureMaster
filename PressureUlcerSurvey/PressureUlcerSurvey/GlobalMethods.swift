//
//  GlobalMethods.swift
//  PressureUlcerSurvey
//
//  Created by Todd Papke on 7/17/17.
//  Copyright © 2017 Todd Papke. All rights reserved.

//--------------------------------GETS----------------------------------------------------
//1. <Route("~/api/units/{YearQuarter:Int}"), HttpGet>
//2. <Route("~/api/Unit_staff/{Unit_Data_User}"), HttpGet>
//
//3.  <Route("~/api/Patient_Summary/{Unit_Data_ID:Int}"), HttpGet>
//4.  <Route("~/api/Patient_Detail/{Survey_ID:Int}"), HttpGet>
//5.  <Route("~/api/Ulcers/delete/{Ulcer_Record_ID:int}"), HttpGet>
//6. <Route("~/api/user_get/{HawkID}"), HttpGet>
//7.  <Route("~/api/user_verify/{HawkID_Password}"), HttpGet>
//
//--------------------------------PUTS----------------------------------------------------
//1. <Route("~/api/Patient/unlock/{Survey_ID:Int}"), HttpPut>
//2. <Route("~/api/Patient/lock/{Survey_ID:Int}"), HttpPut>
//3. <Route("~/api/Ulcers/add"), HttpPost>
//4. <Route("~/api/Patient/update"), HttpPut>
//5. <Route("~/api/Ulcers/update"), HttpPut>
//6. <Route("~/api/Unit_staff/delete/{Unit_Data_User}"), HttpPut>
//
//https://wsint-test.healthcare.uiowa.edu/pusurvey/api/Patient_Summary/3  

///https://wsint-test.healthcare.uiowa.edu/pusurvey/api/Patient_Detail/219
//https://wsint-test.healthcare.uiowa.edu/pusurvey/api/Patient_Summary/5
// https://wsint-test.healthcare.uiowa.edu/pusurvey/api/units/201703

import Foundation
import UIKit
import SwiftyJSON
import Alamofire
//import GlobalData

class GlobalMethods{
    
static let shared = GlobalMethods()
    func GetUnits(){
//        var labels = [String: UILabel]()
//        var petitions = [[String: String]]()
        let myDate = self.GoGetTheDateString()
        //   print("------------<  \(myDate)")
          let TheURL = (GlobalData.shared.uNitsPrefixString + myDate)
        //  let myJSON =  self.getJSONData(urlAddress: GlobalData.shared.uNitsPrefixString + myDate)
        if let url = URL(string: TheURL) {
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data: data)
               // let json = JSON(value)
                //  return JSON(value)
                //  break;
                // print("in Global \(json)")
                //    print("Array? \(json[0])")
                GlobalData.shared.dataReturnedFromURLcall = json
                
                if json != nil{
                    json.forEach {print($1["Unit_Data_ID"],$1["Unit_Name"])
                    }
                    // parse(json:JSON)
                }

            }
        }
    
        
    }
    func parseUnits(aJSON:JSON){
        
        //  let UnitJason = JSON(GlobalData.shared.myJson)
        
        print("in methods \(GlobalData.shared.myJson)")

            }
    
    
    func ARequest(String requestID:String){
        
    }
//    func ARequest(requestID:String,dataRequiredbyRequest: Any){
//        switch requestID{
//           
//            // print (myDate)
//            
//        //  GlobalMethods.shared.getJSONData(urlAddress: GlobalData.shared.uNitsPrefixString + myDate)
//        case "Get_Units":
//            self.GetUnits()
//            break
//            
//            
//        case "GetPatients": break
//        default:break
//        }
//
//        return
//        
//    }

    
//    func getValues(data: Data) {
//        let info = try? JSONSerialization.jsonObject(with: data, options: [])
//        if let listValues = info as? [String: Any] {
//            if let query = listValues["query"] as? [String: Any] {
//                if let results = query["results"] as? [String: Any] {
//                    if let channel = results["channel"] as? [String: Any] {
//                        if let item = channel["item"] as? [String: Any] {
//                            if let condition = item["condition"] as? [String: Any] {
//                                if let temperature = condition["temp"] {
//                                    print("Temperature: \(temperature)")
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//    func JSONData(urlAddress  : String)
//    {
//        //        Alamofire.request(urlAddress).responseJSON { response in
//        //            print(response.result)   // result of response serialization
//        
//        let bubba = URL(string: "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%202487889&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
//
//        let webURL = URL(string: urlAddress)
//        let request = URLRequest(url: webURL!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
//        
//        let session = URLSession.shared
//        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
//            if error == nil && data != nil {
//                if let resp = response as? HTTPURLResponse {
//                    let status = resp.statusCode
//                    if status == 200 {
//                        self.getValues(data: data!)
//                    } else {
//                        print("Error")
//                    }
//                }
//            } else {
//                print("Error")
//            }
//        })
//        task.resume()
//    }
//    

//    func getJSONData(urlAddress  : String) -> JSON
//    {
//        //        Alamofire.request(urlAddress).responseJSON { response in
//        //            print(response.result)   // result of response serialization
//          var functionJSON:JSON? = []
//        
//        Alamofire.request(urlAddress).responseJSON { response in
//            // print(response.result)   // result of response serialization
//            
//            //  if let myJson = response.result.value {
//            // print("JSON: \(myJson)")
//            
//            
//            //  print(response.result)
//            switch response.result {
//            case .success(let value):
//                print("fart")
//                
//            case .failure(let error):
//                print(error)
//            }
//            
//            
//            //  print("Out Of Global")
//            
//        }
//         return functionJSON!
//      
//    }
    


func GoGetTheDateString() -> String{
    
    
    let date = Date()
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month, .day], from: date)
    
    let year =  components.year
    let month = components.month
    //  let day = components.day
    
    //        print(year)
    //        print(month)
    //        print(day)
    var quarter : String
    switch month!{
    case 1,2,3 : quarter = "1"
    case 4,5,6 : quarter = "2"
    case  7,8,9 : quarter = "3"
    case   10,11,12 : quarter = "4"
    default : quarter = "Error"
    }
    let YearQuarterString = String(year!) + quarter
    // print("return of string for URL is \(YearQuarterString)")
    return YearQuarterString
    }
}
