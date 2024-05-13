//
//  KeyboardViewController.swift
//  KeyboardDemo
//
//  Created by Bingjian Liu on 5/13/24.
//

import UIKit
import KeyboardKit
import SwiftUI

class KeyboardViewController: KeyboardInputViewController {
    override func viewWillSetupKeyboard() {
        super.viewWillSetupKeyboard()

        /// Make the demo use a standard ``SystemKeyboard``.
        setup { controller in
            SystemKeyboard(
                state: controller.state,
                services: controller.services,
                buttonContent: { $0.view },
                buttonView: { $0.view },
                emojiKeyboard: { $0.view },
                toolbar: { _ in
                    KeyboardToolbar()
                }
            )
        }
    }
}

struct KeyboardToolbar: View {
    @State private var testSheet = false
    
    var body: some View {
        Button("test"){
            testSheet.toggle()
        }
        .sheet(isPresented: $testSheet) {
            Text("test")
        }
    }
}
