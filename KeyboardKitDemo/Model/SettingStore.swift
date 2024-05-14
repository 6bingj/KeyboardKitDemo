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

    @AppStorage("email") var email = "Bingjianliu11@gmail.com"
    @AppStorage("portfolio") var portfolio = "https://bingjian.page/"
    @AppStorage("linkedin") var linkedIn = "https://www.linkedin.com/in/bingjian-liu"
    @AppStorage("message") var message = "Hi, I came across your profile on LinkedIn and found your background very interesting.  I'm always looking to connect with professionals in various fields to expand my network and learn new things. Would you be open to connecting and potentially having a brief conversation sometime?"

}
