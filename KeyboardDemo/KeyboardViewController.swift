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
        SwiftUIKeyboardView(uiInputViewController: self)
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



class KeyboardInputViewControllerAdapter: KeyboardInputViewController {
    private let uiInputViewController: UIInputViewController
    
    init(uiInputViewController: UIInputViewController) {
        self.uiInputViewController = uiInputViewController
        super.init(nibName: nil, bundle: nil)
        self.state.setup(for: self)
        self.services.setup(for: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var textDocumentProxy: UITextDocumentProxy {
        return uiInputViewController.textDocumentProxy
    }
    
    // Override necessary methods to handle text input actions
    override func insertText(_ text: String) {
        uiInputViewController.textDocumentProxy.insertText(text)
    }
    
    override func deleteBackward() {
        uiInputViewController.textDocumentProxy.deleteBackward()
    }
    
    override func adjustTextPosition(by offset: Int) {
        uiInputViewController.textDocumentProxy.adjustTextPosition(byCharacterOffset: offset)
    }
}

struct SwiftUIKeyboardView: View {
    @State private var customKeyboard = true
    @EnvironmentObject var textInserter: TextInserter
    var uiInputViewController: UIInputViewController

    var body: some View {
        if customKeyboard {
            PhraseKeyboardView {
                customKeyboard.toggle()
            }
            .environmentObject(textInserter)
        } else {
            let adapter = KeyboardInputViewControllerAdapter(uiInputViewController: uiInputViewController)
            SystemKeyboard(
                state: adapter.state,
                services: adapter.services,
                renderBackground: true,
                buttonContent: { $0.view },
                buttonView: { $0.view },
                emojiKeyboard: { $0.view },
                toolbar: { _ in
                    Button("Switch") {
                        customKeyboard.toggle()
                    }
                }
            )
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
