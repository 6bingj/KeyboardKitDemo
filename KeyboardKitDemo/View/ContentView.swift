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
                
                HeroView()
                
                Section{
                    Button {
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    } label: {
                        Label("Enable Keyboard in Settings", systemImage: "gear")
                            .bold()
                    }
                }
                
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
