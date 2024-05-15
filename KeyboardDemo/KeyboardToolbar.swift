//
//  KeyboardToolbar.swift
//  KeyboardDemo
//
//  Created by Bingjian Liu on 5/13/24.
//

import SwiftUI


struct KeyboardToolbar: View {
    @State private var expandToolbar = false
    @State private var showSnippetSheet = false
    @State private var showAISheet = false
    
    @EnvironmentObject var textInserter: TextInserter
    
    var body: some View {
        if expandToolbar {
            aiToolbar
        } else {
            regularToolbar
        }
    }
    
    @ViewBuilder var regularToolbar: some View {
        HStack {
            Text("Start Networking!")
                .font(.subheadline)
                .bold()
                .opacity(0.5)
                .padding()
                .minimumScaleFactor(0.5)
            

            Spacer()
            
            toolbarButton("Snippet Keyboard", systemImage: "tray", {
                showSnippetSheet.toggle()
            })
            .labelStyle(.iconOnly)
            .sheet(isPresented: $showSnippetSheet) {
                SnippetSelectionView()
                    .environmentObject(textInserter)
                
            }
            
            toolbarButton("AI improvement", systemImage: "sparkles", {
                expandToolbar.toggle()
            })
            .padding(.horizontal)
            
        }
    }
    
    @ViewBuilder var aiToolbar: some View {
        HStack{

            toolbarButtonWithText("AI Rewrite", systemImage: "sparkles", {
                showAISheet.toggle()
            })
            .sheet(isPresented: $showAISheet) {
                AIImprovementDemo()
            }
            
            toolbarButtonWithText("Translate", systemImage: "bubble.left.and.text.bubble.right.fill.rtl") {
                
            }
            
            Spacer()
            
            toolbarButton("Back", systemImage: "xmark") {
                expandToolbar = false
            }
            
        }
        .padding(.horizontal)
//        .buttonStyle(.borderless)
    }
    
    func toolbarButton(
        _ title: String,
        systemImage: String,
        _ action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .labelStyle(.iconOnly)
                .padding(10)
                .background(Circle().fill(Color.gray))
                .foregroundColor(.white)
        }
    }
    
    func toolbarButtonWithText(
        _ title: String,
        systemImage: String,
        _ action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .padding(10)
                .foregroundStyle(Color.gray)
                .bold()
//                .background(Circle().fill(Color.gray))
//                .foregroundColor(.white)
        }
    }
}

