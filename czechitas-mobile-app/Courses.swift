//
//  Courses.swift
//  czechitas-mobile-app
//
//  Created by Svetlana Margetová on 06.06.16.
//  Copyright © 2016 Svetlana Margetová. All rights reserved.
//

import Foundation


class Course : NSObject {
    var id : Int
    var title : String
    var courseStartDate : String
    var courseEndDate : String
    var courseStartTime : String?
    var courseDescription : String
    var coursePrice : String?
    var courseNotes : String?
    var courseLink : String?
    var courseVenueTitle : String = ""
    var courseStreetName : String = ""
    var courseStreetNumber : String = ""
    var courseCouchEmail : String?
    var courseCity : String
    var courseCategoryTitle : String?
    var courseCategoryColorCode : String?
    
    
    
    
    init?(id : Int, title : String, courseStartDate : String, courseEndDate : String,courseDescription : String, courseCity : String) {
        
        
        self.id = id
        self.title = title
        self.courseStartDate = String(courseStartDate)
        self.courseEndDate = courseEndDate
        self.courseCity = courseCity
        self.courseDescription = courseDescription
        
        if courseStartDate.isEmpty || courseEndDate.isEmpty {
            self.courseStartDate = String(NSDate())
            self.courseEndDate = String(NSDate())
        }
        
        
        
        super.init()
        
        
    }
    
    func convertDate() -> (String, String, String) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        var startDate = formatter.dateFromString(courseStartDate)
        var time = formatter.dateFromString(courseStartDate)
        var endDate = formatter.dateFromString(courseEndDate)
        formatter.dateFormat = "dd. MM. yyyy"
        var startDate1 = formatter.stringFromDate(startDate!)
        var endDate1 = formatter.stringFromDate(endDate!)
        formatter.dateFormat = "HH:mm"
        courseStartTime = formatter.stringFromDate(time!)
        return (startDate1, endDate1, courseStartTime!)
    }
    
    
    
    
    
    
    
    func addCategory(courseCategoryTitle : String, courseCategoryColorCode : String) {
        self.courseCategoryTitle = courseCategoryTitle
        self.courseCategoryColorCode = courseCategoryColorCode
    }
    
    func addDetailInfo(coursePrice : String, courseNotes : String, courseLink : String, courseVenueTitle : String, courseStreetName : String, courseStreetNumber : String, courseCouchEmail : String) {
        self.coursePrice = coursePrice
        self.courseNotes = courseNotes
        self.courseLink = courseLink
        self.courseVenueTitle = courseVenueTitle
        self.courseStreetName = courseStreetName
        self.courseStreetNumber = courseStreetNumber
        self.courseCouchEmail = courseCouchEmail
        
        if courseNotes == "" {
            self.courseNotes = "Ziadne dodatocne informacie"
        }
        
    }
    
    func createFullAddress() -> String {
        var fullAddress = "\(self.courseVenueTitle), \(self.courseStreetName) \(self.courseStreetNumber), \(self.courseCity)"
        
        
        return fullAddress
    }
}






class Category : NSObject {
    var id : Int
    var title : String
    var colorCode : String
    
    init(id : Int, title : String, colorCode : String) {
        self.id = id
        self.title = title
        self.colorCode = colorCode        
    }
    
    
}


