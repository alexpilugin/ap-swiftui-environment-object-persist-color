//
//  AppData.swift
//  AP Color Sliders and User Defaults
//
//  Created by Alex Pilugins on 01/04/2021.
//
import SwiftUI

//Another Solution: Persist SwiftUI Color: https://developer.apple.com/forums/thread/653639

class AppData: ObservableObject {
    
    @Published var red: Double = UserDefaults.standard.double(forKey: "red") {
        didSet {
            UserDefaults.standard.set(red, forKey: "red")
        }
    }
    @Published var green: Double = UserDefaults.standard.double(forKey: "green") {
        didSet {
            UserDefaults.standard.set(green, forKey: "green")
        }
    }
    @Published var blue: Double = UserDefaults.standard.double(forKey: "blue") {
        didSet {
            UserDefaults.standard.set(blue, forKey: "blue")
        }
    }
    
    var color: Color {
        return Color(red: self.red / 255, green: self.green / 255, blue: self.blue / 255)
    }
}
