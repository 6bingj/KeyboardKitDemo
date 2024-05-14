//
//  OperationView.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/14/24.
//

import SwiftUI

struct OperationView: View {
    
    @State private var testText: String = "Hi, I came across your profile on LinkedIn, and I would like to share with you my portfolio:"
    
    var body: some View {
        
        Section{
            
            Button {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            } label: {
                HStack {
                    Label("Step 1: Enable Keyboard in Settings", systemImage: "gear")
//                    Spacer()
//                    Image(systemName: "chevron.forward")
//                        .font(.subheadline)
                }
            }
            
            NavigationLink {
                VStack {
                    Text("Try finish this message with the Networking Keyboard. Tap the tray icon to start inserting snippets.")
                        .font(.headline)
                    TextEditor(text: $testText)
                        .border(Color.gray.opacity(0.5), width: 1)
//                    .padding()
                }
                .padding()
            } label: {
                Label("Step 2: Try Write Something", systemImage: "list.clipboard.fill")
            }

        }
            
        
    }
}

#Preview {
//    NavigationStack {
//        List {
//            OperationView()
//        }
//    }
    ContentView()
}
