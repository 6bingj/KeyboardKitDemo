//
//  ContentView.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/13/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                SnippetEditorView()
                    .navigationTitle("Networking Keys")
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
