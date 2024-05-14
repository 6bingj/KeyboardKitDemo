//
//  SnippetSelectionView.swift
//  KeyboardDemo
//
//  Created by Bingjian Liu on 5/13/24.
//

import SwiftUI

struct SnippetSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var textInserter: TextInserter
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Label("dismiss", systemImage: "chevron.down.square.fill")
                }
            }
            .padding()
            
            Spacer()
                        
            let email = "bingjianliu11@gmail.com"
            let linkedIn = "https://www.linkedin.com/in/bingjian-liu"
            
            
            List {
                VStack {
                    Link("Learn SwiftUI", destination: URL(string: "https://www.hackingwithswift.com/quick-start/swiftui")!)
                    
                    snippetButton(title: "linkedIn", content: linkedIn)
                    snippetButton(title: "email", content: email)

                }
                .buttonStyle(.borderless)
            }
            .listStyle(.plain)
            
        }
    }
    
    func snippetButton (
        title: String,
        content: String
    ) -> some View {
        Button {
            textInserter.insertText(content)
        } label: {
            Text(title+": "+content)
        }

    }
    
}

class TextInserter: ObservableObject {
    weak var textDocumentProxy: UITextDocumentProxy?
    
    init(proxy: UITextDocumentProxy?) {
        self.textDocumentProxy = proxy
    }
    
    func insertText(_ text: String) {
        textDocumentProxy?.insertText(text)
    }
}
