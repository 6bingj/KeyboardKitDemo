//
//  ContentView.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("displayOnboarding") var displayOnboarding: Bool = true

    var body: some View {
        NavigationView {
            Form {

                HeroView()
                
                Section{
                    OperationView()
                }
                
                Section(header:Text("Edit Snippets")){
                    SnippetEditorView()
                }
                
                Toggle(isOn: $displayOnboarding) {
                    Text("Show Onboarding")
                }
                
            }
            .navigationTitle("Networking Keyboard")
            .navigationBarTitleDisplayMode(.inline)

        }
        .popover(isPresented: $displayOnboarding) {
            OnboardingView()
                .presentationCompactAdaptation(.fullScreenCover)
        }
        
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
