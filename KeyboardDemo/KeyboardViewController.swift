//
//  KeyboardViewController.swift
//  KeyboardDemo
//
//  Created by Bingjian Liu on 5/13/24.
//

import UIKit
import KeyboardKit
import SwiftUI


class KeyboardViewController: UIInputViewController {

    var contentView: some View {
        SwiftUIKeyboardView()
        .environmentObject(TextInserter(proxy: self.textDocumentProxy))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = UIHostingController(rootView: contentView)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        NSLayoutConstraint.activate([
            controller.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            controller.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

struct SwiftUIKeyboardView: View {
    @State private var customKeyboard = true
    @EnvironmentObject var textInserter: TextInserter

    var body: some View {
        
        if customKeyboard{
            PhraseKeyboardView {
                customKeyboard.toggle()
            }
            .environmentObject(textInserter)
            
        } else {
            Button("Switch"){
                customKeyboard.toggle()
            }
        }
    }
}


struct PhraseKeyboardView: View {
    
    @EnvironmentObject var textInserter: TextInserter
    
    let phrases: [String] = Array(repeating: "test", count: 10)
    var toggleKeyboard: () -> Void

    var body: some View {
        List {
            VStack {
                // Link("Learn SwiftUI", destination: URL(string: "https://www.hackingwithswift.com/quick-start/swiftui")!)
                Button("Switch") {
                    toggleKeyboard()
                }
                
                ForEach(phrases, id: \.self) { phrase in
                    Button(phrase) {
                        textInserter.insertText(phrase)
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(5)
                }
            }
            .buttonStyle(.borderless)
        }
        .listStyle(.plain)
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
