//
//  ContentView.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                
                HeroView()
                
                OperationView()
                
                SnippetEditorView()
                    .navigationTitle("Networking Keyboard")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
