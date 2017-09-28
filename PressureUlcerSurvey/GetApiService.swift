//
//  ApiService.swift
//  PopularTVShows
//
//  Created by Patrick Haralabidis on 27/09/2015.
//  Copyright © 2015 Patrick Haralabidis. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
var  callUrl = ""

/*
 
 --------------------------------GETS----------------------------------------------------
1. <Route("~/api/units/{YearQuarter:Int}"), HttpGet>
 2. <Route("~/api/Unit_staff/{Unit_Data_User}"), HttpGet>

3.  <Route("~/api/Patient_Summary/{Unit_Data_ID:Int}"), HttpGet>
4.  <Route("~/api/Patient_Detail/{Survey_ID:Int}"), HttpGet>
5.  <Route("~/api/Ulcers/delete/{Ulcer_Record_ID:int}"), HttpGet>
6. <Route("~/api/user_get/{HawkID}"), HttpGet>
7.  <Route("~/api/user_verify/{HawkID_Password}"), HttpGet>
 
  --------------------------------PUTS----------------------------------------------------
1. <Route("~/api/Patient/unlock/{Survey_ID:Int}"), HttpPut>
2. <Route("~/api/Patient/lock/{Survey_ID:Int}"), HttpPut>
3. <Route("~/api/Ulcers/add"), HttpPost>
4. <Route("~/api/Patient/update"), HttpPut>
5. <Route("~/api/Ulcers/update"), HttpPut>
6. <Route("~/api/Unit_staff/delete/{Unit_Data_User}"), HttpPut>

*/
class GetApiService {
    
    static let sharedInstance = ApiService()
    
    func setUpGetCall(Command:String,UrlSuffix:String){
        switch Command{
        //1
        case "YearQuarter" : callUrl = GlobalData.shared.serverSuffix + "/" + UrlSuffix
        //2
        case "Unit_Data_User" : callUrl = GlobalData.shared.serverSuffix + "/" + UrlSuffix
        //3
        case "Unit_Data_ID" : callUrl = GlobalData.shared.serverSuffix + "/" + UrlSuffix
        //4
        case "Survey_ID": callUrl = GlobalData.shared.serverSuffix + "/" + UrlSuffix
        //5
        case "Ulcer_Record_ID" : callUrl = GlobalData.shared.serverSuffix + "/" + UrlSuffix
        //6
        case "user_get" : callUrl = GlobalData.shared.serverSuffix + "/" + UrlSuffix
        //7
        case "user_verify": callUrl = GlobalData.shared.serverSuffix + "/" + UrlSuffix
        
            print ("call URL /(callUrl)")
            self.DoAGet

        }
        return
    
    }
    
    //GetApiService.sharedInstance.setUpGetCall(whatIwant : String)
    
    func apiGetRequest(_ path: String, onCompletion: @escaping (JSON, NSError?) -> Void) {
        let request = NSMutableURLRequest(url: URL(string: path)!)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
            let json:JSON = JSON(data: data!)
            onCompletion(json, error)
        })
        task.resume()
    }
    
    
    func DoAGet(_ onCompletion: @escaping (JSON, NSError?) -> Void) {
        apiGetRequest(callUrl, onCompletion: { json, err in
            onCompletion(json as JSON, err as NSError?)
        })
    }

}
