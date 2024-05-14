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
//    @ObservedObject private var settings = SettingStore.shared

    var body: some View {
        VStack{
            
            headerView
            
            Spacer()
                    
            List {
                snippetButton(SnippetType.portfolio)
                snippetButton(SnippetType.email)
                snippetButton(SnippetType.linkedin)
                snippetButton(SnippetType.message)

            }
            .buttonStyle(.borderless)
            .listStyle(.plain)
            
        }
        .tint(.secondary)
        
    }
    
    @ViewBuilder var headerView: some View {
        HStack(alignment:.top){
            
            Link(destination: URL(string: "keyboarddemo://launch")!) {
                Label("Edit", systemImage: "gearshape.fill")
                    .labelStyle(.iconOnly)
            }
            
            Spacer()
            
            Text("Select a snippet to insert to your text")
                .font(.footnote)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Label("dismiss", systemImage: "chevron.down")
                    .labelStyle(.iconOnly)
                    .padding(10)
                    .background(Circle().fill(Color.gray))
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
    

    func snippetButton(_ snippet: SnippetType) -> some View {
        Button {
            textInserter.insertText(snippet.content)
            UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
        } label: {
            HStack(alignment:.top) {
                HStack{
                    Image(systemName:snippet.systemImage)
                        .foregroundStyle(.primary)
                    Text(snippet.title)
                        .foregroundStyle(.primary)
                        .font(.subheadline)
                    Spacer()
                }
                .frame(width: 150)
                
                
                Text(snippet.content)
                    .font(.footnote)
                    .lineLimit(4)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.leading)
                Spacer()
                
            }
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

