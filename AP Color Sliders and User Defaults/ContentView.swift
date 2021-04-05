//
//  ContentView.swift
//  AP Color Sliders and User Defaults
//
//  Created by Alex Pilugins on 01/04/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            
            Rectangle()
                .fill(self.appData.color)
                .frame(height: 100)
                .frame(maxWidth: .infinity)
            
            Text("Red: \(self.appData.red, specifier: "%.0f")").font(.title)
            Text("Green: \(self.appData.green, specifier: "%.0f")").font(.title)
            Text("Blue: \(self.appData.blue, specifier: "%.0f")").font(.title)
            Text("HEX: \(self.appData.hex)").font(.title)
            
            Slider(value: self.$appData.red, in: 0...255, step: 1).accentColor(Color.red)
            Slider(value: self.$appData.green, in: 0...255, step: 1).accentColor(Color.green)
            Slider(value: self.$appData.blue, in: 0...255, step: 1).accentColor(Color.blue)
            
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppData())
    }
}
