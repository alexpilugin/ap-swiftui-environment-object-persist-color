//
//  AP_Color_Sliders_and_User_DefaultsApp.swift
//  AP Color Sliders and User Defaults
//
//  Created by Alex Pilugins on 01/04/2021.
//

import SwiftUI

@main
struct AP_Color_Sliders_and_User_DefaultsApp: App {
    /*
     https://www.hackingwithswift.com/quick-start/swiftui/how-to-fix-fatal-error-no-observableobject-of-type-sometype-found
     https://www.hackingwithswift.com/forums/swiftui/fatal-error-no-observableobject-of-type-order-found/3208
     */
    
    @StateObject private var appData = AppData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appData)
        }
    }
}
