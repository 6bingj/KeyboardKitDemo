//
//  OperationView.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/14/24.
//

import SwiftUI

struct OperationView: View {
    
//    @State private var testText: String = ""
    
    var body: some View {
        
        Button {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        } label: {
            HStack {
                Label("Enable Keyboard in Settings", systemImage: "gear")
            }
        }
        
        Link(destination: URL(string: "https://bingjian.page/networkingkeyboardtest")!) {
            Label("Try Out the Keyboard", systemImage: "globe")
        }
        
        /*
         //            NavigationLink {
         //                VStack {
         //                    Text("Try finish this message with the Networking Keyboard. Tap the tray icon to start inserting snippets.")
         //                        .font(.headline)
         //                    TextEditor(text: $testText)
         //                        .border(Color.gray.opacity(0.5), width: 1)
         ////                    .padding()
         //                }
         //                .padding()
         //            } label: {
         //                Label("Step 2: Try Write Something", systemImage: "list.clipboard.fill")
         //            }
         */
        
        
        
    }
}

#Preview {
    ContentView()
}
