//
//  Patient_summary.swift
//  PatientSummary
//
//  Created by Todd Papke on 10/10/17.
//
//  -- auto-generated by JSON2Swift --
//

import Foundation


struct Patient_summary: PatientSummary {
    var Pat_Name: String
    var Age_Sex: String
    var MRN: String
    var Survey_ID: Int
    var IsBeingEdited: Bool
    var Survey_Status: String
    var Room_Bed: String


    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        Pat_Name = json["Pat_Name"] as? String ?? ""
        Age_Sex = json["Age_Sex"] as? String ?? ""
        MRN = json["MRN"] as? String ?? ""
        Survey_ID = json["Survey_ID"] as? Int ?? 0
        IsBeingEdited = json["IsBeingEdited"] as? Bool ?? false
        Survey_Status = json["Survey_Status"] as? String ?? ""
        Room_Bed = json["Room_Bed"] as? String ?? ""     }



    init() {
        self.init(json: [:])!
    }



    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }



    init(Pat_Name: String, Age_Sex: String, MRN: String, Survey_ID: Int, IsBeingEdited: Bool, Survey_Status: String, Room_Bed: String) {
        self.Pat_Name = Pat_Name
        self.Age_Sex = Age_Sex
        self.MRN = MRN
        self.Survey_ID = Survey_ID
        self.IsBeingEdited = IsBeingEdited
        self.Survey_Status = Survey_Status
        self.Room_Bed = Room_Bed
    }



    func jsonDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["Pat_Name"] = Pat_Name
        dict["Age_Sex"] = Age_Sex
        dict["MRN"] = MRN
        dict["Survey_ID"] = Survey_ID
        dict["IsBeingEdited"] = IsBeingEdited
        dict["Survey_Status"] = Survey_Status
        dict["Room_Bed"] = Room_Bed
        return dict
    }



}



