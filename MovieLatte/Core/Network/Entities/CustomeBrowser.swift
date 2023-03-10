//
//  CustomeBrowser.swift
//  MovieLatte
//
//  Created by YILDIRIM on 5.01.2023.
//

import Foundation
import SafariServices

class CustomeBroweser: NSObject, SFSafariViewControllerDelegate {
    var controller: UIViewController?
    init(controller: UIViewController? = nil) {
        self.controller = controller
    }
    func open(openURL url: URL) {
        let controller = SFSafariViewController(url: url)
        UIWindow.key?.rootViewController?.present(controller, animated: true, completion: nil)
        controller.delegate = self
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.controller?.dismiss(animated: true)
    }
}
