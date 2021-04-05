//
//  AppData.swift
//  AP Color Sliders and User Defaults
//
//  Created by Alex Pilugins on 01/04/2021.
//
import SwiftUI

//Another Solution: Persist SwiftUI Color: https://developer.apple.com/forums/thread/653639

/*
extension BinaryInteger {
    var binary: String { .init(self, radix: 2) }
    var hexa: String { .init(self, radix: 16) } //
}


extension Double {
    func toUInt8() -> UInt8? {
        if self >= Double(UInt8.min) && self < Double(UInt8.max) {
            return UInt8(self)
        } else {
            return nil
        }
    }
}
*/

extension UInt8 {
    var hexa: String {
        let value = String(self, radix: 16, uppercase: true)
        return (self < 16 ? "0": "") + value
    }
}
 
extension UIColor {
    var rgb: (red: CGFloat, green: CGFloat, blue: CGFloat)? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0
        guard getRed(&r, green: &g, blue: &b, alpha: nil) else { return nil }
        return (r,g,b)
    }
    var hexa: String? {
        guard let (r,g,b) = rgb else { return nil }
        return "#" + UInt8(r*255).hexa + UInt8(g*255).hexa + UInt8(b*255).hexa
    }
}

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
    
    var hex: String {
        return UIColor(self.color).hexa ?? ""
    }
    
}
