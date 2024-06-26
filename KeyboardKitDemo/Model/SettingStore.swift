//
//  SettingStore.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/13/24.
//
// @AppStorage property wrapper automatically synthesizes a call to objectWillChange.send() whenever the value changes

import SwiftUI

class SettingStore: ObservableObject {
    
    static let shared: SettingStore = SettingStore()

//    private let userDefaults: UserDefaults
    
//    init() {
//        if let defaults = UserDefaults(suiteName: "group.page.bingjian.KeyboardKitDemo") {
//            self.userDefaults = defaults
//        } else {
//            self.userDefaults = .standard
//        }
//    }

    @AppStorage("email", store: UserDefaults(suiteName: "group.page.bingjian.KeyboardDemo")) var email: String = "calmer-04.flipper@icloud.com"
    @AppStorage("portfolio", store: UserDefaults(suiteName: "group.page.bingjian.KeyboardDemo")) var portfolio: String = "https://bingjian.page/"
    @AppStorage("linkedin", store: UserDefaults(suiteName: "group.page.bingjian.KeyboardDemo")) var linkedIn: String = "https://www.linkedin.com/in/bingjian-liu"
    @AppStorage("message", store: UserDefaults(suiteName: "group.page.bingjian.KeyboardDemo")) var message: String = "Hi, I came across your profile on LinkedIn and found your background very interesting.  I'm always looking to connect with professionals in various fields to expand my network and learn new things. Would you be open to connecting and potentially having a brief conversation sometime?"
    
}
