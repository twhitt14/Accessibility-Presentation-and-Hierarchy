//
//  ViewController.swift
//  Presentation + View Hierarchy
//
//  Created by Trevor Whittingham on 8/14/18.
//  Copyright © 2018 Turbolaser LLC. All rights reserved.
//

import UIKit

var presentCount = 0

class ViewController: UIViewController {
    
    enum Style: Int {
        case fullScreen = 0
        case pageSheet
        case formSheet
        case currentContext
        case custom
        case overFullScreen
        case overCurrentContext
        case popover
        case blurOverFullScreen
        case none = -1
        
        var title: String {
            switch self {
            case .fullScreen:
                return "fullScreen"
            case .pageSheet:
                return "pageSheet"
            case .formSheet:
                return "formSheet"
            case .currentContext:
                return "currentContext"
            case .custom:
                return "custom"
            case .overFullScreen:
                return "overFullScreen"
            case .overCurrentContext:
                return "overCurrentContext"
            case .popover:
                return "popover"
            case .blurOverFullScreen:
                return "blurOverFullScreen"
            case .none:
                return "none"
            }
        }
    }

    @IBOutlet weak var presentationStyleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this fixes the problem of modal "over..." transitions that allow content behind to be accessible
        accessibilityActivate()
    }
    
    @IBAction func push(_ sender: Any) {
        show(makeVC(), sender: nil)
    }
    
    @IBAction func showDetail(_ sender: Any) {
        showDetailViewController(makeVC(), sender: nil)
    }
    
    @IBAction func presentModallyDefault(_ sender: Any) {
        presentAnotherViewWithStyle(.fullScreen) // this is the default
    }
    
    @IBAction func presentModallyFullScreen(_ sender: Any) {
        presentAnotherViewWithStyle(.fullScreen)
    }
    
    @IBAction func presentModallyCurrentContext(_ sender: Any) {
        presentAnotherViewWithStyle(.currentContext)
    }
    
    @IBAction func presentModallyPageSheet(_ sender: Any) {
        presentAnotherViewWithStyle(.pageSheet)
    }
    
    @IBAction func presentModallyFormSheet(_ sender: Any) {
        presentAnotherViewWithStyle(.formSheet)
    }
    
    @IBAction func presentModallyOverFullScreen(_ sender: Any) {
        presentAnotherViewWithStyle(.overFullScreen)
    }
    
    @IBAction func presentModallyOverCurrentContext(_ sender: Any) {
        presentAnotherViewWithStyle(.overCurrentContext)
    }
    
    @IBAction func presentAsPopover(_ sender: Any) {
        
    }
    
    func presentAnotherViewWithStyle(_ style: UIModalPresentationStyle) {
        presentationStyleLabel.text = Style(rawValue: style.rawValue)?.title
        let vc = makeVC()
        vc.modalPresentationStyle = style
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true, completion: nil)
    }
    
    func makeVC() -> UIViewController {
        let storyboard = self.storyboard!
        return storyboard.instantiateInitialViewController()!
    }
}

