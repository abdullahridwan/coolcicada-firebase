//
//  BasePlan.swift
//  workoutApp (iOS)
//
//  Created by Abdullah Ridwan on 6/2/21.
//

import Foundation

var mon: [Workout] = [
    Workout(id: UUID().uuidString, name: "Bench Press", reps: 3, sets: 5, date: Date()),
    Workout(id: UUID().uuidString, name: "Overhead Press", reps: 3, sets: 5, date: Date())
]
var tues: [Workout] = [
    Workout(id: UUID().uuidString, name: "Barbell Row", reps: 3, sets: 5, date: Date()),
    Workout(id: UUID().uuidString, name: "Pull Ups", reps: 3, sets: 5, date: Date())
]
var wed: [Workout] = [
    Workout(id: UUID().uuidString, name: "Squats", reps: 3, sets: 5, date: Date()),
    Workout(id: UUID().uuidString, name: "Romanian DL", reps: 3, sets: 5, date: Date())
]
var thurs: [Workout] = [
    Workout(id: UUID().uuidString, name: "Inclince Bench", reps: 3, sets: 5, date: Date()),
    Workout(id: UUID().uuidString, name: "Rotator", reps: 3, sets: 5, date: Date())
]

var allWorkouts: [String: [Workout]] = [
    "Monday": mon,
    "Tuesday": tues,
    "Wednesday": wed,
    "Thursday": thurs
]
