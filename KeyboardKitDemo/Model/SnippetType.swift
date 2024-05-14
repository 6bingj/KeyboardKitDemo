//
//  SnippetType.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/13/24.
//

import Foundation

enum SnippetType {
    case portfolio
    case email
    case linkedin
    case message
    
    var content: String {
        switch self {
        case .portfolio:
            SettingStore.shared.portfolio
        case .email:
            SettingStore.shared.email
        case .linkedin:
            SettingStore.shared.linkedIn
        case .message:
            SettingStore.shared.message
        }
    }
    
    var title: String {
        switch self {
        case .portfolio:
            "Potfolio"
        case .email:
            "Email"
        case .linkedin:
            "LinkedIn"
        case .message:
            "Greetings"
        }
    }
    
    var systemImage: String {
        switch self {
        case .portfolio:
            "book.pages.fill"
        case .email:
            "envelope.fill"
        case .linkedin:
            "network"
        case .message:
            "message.fill"
        }
    }
}
