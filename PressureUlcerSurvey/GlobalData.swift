//
//  GlobalData.swift
//  PressureUlcerSurvey
//
//  Created by Todd Papke on 7/10/17.
//  Copyright © 2017 Todd Papke. All rights reserved.
////
//ZX
/// new commit did it go?
//https://wsint-test.healthcare.uiowa.edu/pusurvey/api//Patient_Summary/3
import UIKit
import SwiftyJSON
import Alamofire


final class GlobalData {
    
    
    //AxzAZ
    static var shared = GlobalData()

        private init() { }
    var isInternet:Bool = true
    var myUnitindexPathRow: Int! = 0
    var ISThereAPriorSetIndexRow : Bool = false
    var myUnitindexPathSection: Int? = 1
    
    var uRlPrefixString = "https://wsint-test.healthcare.uiowa.edu/pusurvey/apiz/"
    /////////////////////////////////////////////////////////////////////
    var uNitsPrefixString = "https://wsint-test.healthcare.uiowa.edu/pusurvey/api/unitsz/"
    
    var currentJason : [String]?
    var emptyStringArray : [String:AnyObject]?
    
    var unitflags:[Bool] = [false]
    var jsonDictionary =  ["JSonKey" : "jaonvalue"]
    var items = ["2JPE", "3JPW", "3RCE", "4JPE", "4JPW", "7RCS", "8JC", "CVICU", "MICU", "NICU", "2JCP", "PICU", "SNIC1", "SNIC2", "SNIC3", "SNIC4", "NIC2-5", "NIC1", "2BTEP", "3RCWA", "3JCP", "7JCP", "2RCW2", "3BT2", "5 SOUTH", "SICU", "4RCE", "4RCW", "6JCE", "6JCW"]
    var loadStatus = ["loggedin":false, "patientsloaded":false, "unitselected":false, "surveydone":false]
    var dataReturnedFromURLcall : JSON = []
    
    //var URLCallReturn : Data = ()
    
    //var myJson : [Any] = []
    var myJson : [Any] = []
    var myRawDictionary: [String : Any] = [:]
    
    var theUnitInPlay : String! = String()
     var thePatientInPlay : String! = "Hit"
    var unitListTuples : [String:String] = [:]
    // var currentUnitID : Int?
    var currentUnitID : String! = String()
    var myUnitList : [String] = []
    var patientsForUnit: [String] = []

    
//    fileprivate var rawArray: [Any] = []
//    fileprivate var rawDictionary: [String : Any] = [:]
//    fileprivate var rawString: String = ""
//    fileprivate var rawNumber: NSNumber = 0
//    fileprivate var rawNull: NSNull = NSNull()
//    fileprivate var _type: Type = .null
//    fileprivate var _error: NSError? = nil
    
       

    
    
    //    var jsonteststring : [Dictionary] = ["[{"Unit_Data_ID":3,"Unit_Name":"1JPE"},{"Unit_Data_ID":4,"Unit_Name":"1JPW"},{"Unit_Data_ID":5,"Unit_Name":"2JPE"},{"Unit_Data_ID":6,"Unit_Name":"2JPW"},{"Unit_Data_ID":7,"Unit_Name":"3RCE"},{"Unit_Data_ID":8,"Unit_Name":"3RCW"},{"Unit_Data_ID":9,"Unit_Name":"4JPE"},{"Unit_Data_ID":10,"Unit_Name":"4JPW"},{"Unit_Data_ID":11,"Unit_Name":"4RCE1"},{"Unit_Data_ID":12,"Unit_Name":"4RCW"},{"Unit_Data_ID":13,"Unit_Name":"6JCE"},{"Unit_Data_ID":14,"Unit_Name":"6JCW"},{"Unit_Data_ID":15,"Unit_Name":"6RCE"},{"Unit_Data_ID":16,"Unit_Name":"6RCW"},{"Unit_Data_ID":17,"Unit_Name":"7RCS"},{"Unit_Data_ID":18,"Unit_Name":"8JC"},{"Unit_Data_ID":19,"Unit_Name":"CVICU"},{"Unit_Data_ID":20,"Unit_Name":"MICU"},{"Unit_Data_ID":21,"Unit_Name":"SIC1"},{"Unit_Data_ID":22,"Unit_Name":"SIC2"},{"Unit_Data_ID":23,"Unit_Name":"SIC3"},{"Unit_Data_ID":24,"Unit_Name":"NIC1"},{"Unit_Data_ID":25,"Unit_Name":"2BTEP"},{"Unit_Data_ID":26,"Unit_Name":"7JCP"},{"Unit_Data_ID":27,"Unit_Name":"2RCW2"},{"Unit_Data_ID":28,"Unit_Name":"3BT2"},{"Unit_Data_ID":29,"Unit_Name":"5 South"},{"Unit_Data_ID":30,"Unit_Name":"RADIRPROC"},{"Unit_Data_ID":31,"Unit_Name":"SFCH PICU"},{"Unit_Data_ID":32,"Unit_Name":"SFCH NIC2"},{"Unit_Data_ID":33,"Unit_Name":"SFCH09"},{"Unit_Data_ID":34,"Unit_Name":"SFCH10"},{"Unit_Data_ID":35,"Unit_Name":"SFCH11"}]
    
    
    
}
