//
//  HelperFunctions.swift
//  workoutApp (iOS)
//
//  Created by Abdullah Ridwan on 6/2/21.
//


import Foundation

class HelperFunctions: NSObject {
    func getTodayWeekDay()-> String{
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEEE"
           let weekDay = dateFormatter.string(from: Date())
           return weekDay
     }
}
