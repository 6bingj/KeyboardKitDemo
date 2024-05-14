//
//  SnippetEditorView.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/13/24.
//

import SwiftUI

struct SnippetEditorView: View {
    
    var body: some View {
        Section(header: Text("Edit Snippets")) {
            SnippetEditField(snippetType: .portfolio)
            SnippetEditField(snippetType: .email)
            SnippetEditField(snippetType: .linkedin)
            SnippetEditField(snippetType: .message)
            
        }
    }
}

struct SnippetEditField: View {
    @ObservedObject var settings = SettingStore.shared
    let snippetType: SnippetType

    var body: some View {
        VStack(alignment: .leading) {
            Label(snippetType.title, systemImage: snippetType.systemImage)
            .font(.headline)
            .foregroundStyle(.primary)
            TextField(snippetType.title, text: binding(for: snippetType),axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
        }
    }

    private func binding(for snippetType: SnippetType) -> Binding<String> {
        switch snippetType {
        case .portfolio:
            return $settings.portfolio
        case .email:
            return $settings.email
        case .linkedin:
            return $settings.linkedIn
        case .message:
            return $settings.message
        }
    }
}


//struct SnippetEditorView_Previews: PreviewProvider {
//    static var previews: some View {
//        SnippetEditorView()
//    }
//}


#Preview {
    Form {
        SnippetEditorView()
    }
}
