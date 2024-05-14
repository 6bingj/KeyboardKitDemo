//
//  OperationView.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/14/24.
//

import SwiftUI

struct OperationView: View {
    
    @State private var testText: String = "Hi Andy, I came across your profile on LinkedIn, and I would like to share with you my portfolio:"
    
    var body: some View {
        
        Section{
            
            Button {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            } label: {
                Label("Enable Keyboard in Settings", systemImage: "gear")
            }
            
            NavigationLink {
                VStack {
                    Text("Try finish this:")
                    TextEditor(text: $testText)
                        .border(Color.gray, width: 1)
                    .padding()
                }
            } label: {
                Label("Try type something", systemImage: "list.clipboard.fill")
            }

        }
            
        
    }
}

#Preview {
    NavigationStack {
        List {
            OperationView()
        }
    }
}
