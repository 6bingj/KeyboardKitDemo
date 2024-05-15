//
//  OpenURLHelper.swift
//  KeyboardDemo
//
//  Created by Bingjian Liu on 5/14/24.
//

import UIKit

class OpenURLHelper {
    static func open(url: URL) {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = scene.windows.first?.rootViewController else {
            return
        }
        
        let alert = UIAlertController(title: "Open App", message: "Do you want to open the Translate app?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Open", style: .default) { _ in
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        rootViewController.present(alert, animated: true, completion: nil)
    }
}
