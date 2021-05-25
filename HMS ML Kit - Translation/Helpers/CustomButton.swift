//
//  CustomButton.swift
//  HMS ML Kit - Translation
//
//  Created by Ali Mert Özhayta on 25.05.2021.
//

import UIKit

class CustomButton: UIButton {
    var myView: UIView? = UIView()
    var toolBarView: UIView? = UIView()
    
    override var inputView: UIView? {
        get { myView }
        set { myView = newValue }
    }

    override var inputAccessoryView: UIView? {
        get { toolBarView }
        set { toolBarView = newValue }
    }
    
    override var canBecomeFirstResponder: Bool {
       true
    }

    func addDoneButton(title: String, target: Any, selector: Selector) {

        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0,width: UIScreen.main.bounds.size.width, height: 40.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        toolBar.setItems([flexible, barButton], animated: false)
        
        self.inputAccessoryView = toolBar
        self.inputAccessoryView?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func setText(_ text: String) {
        self.setTitle(text, for: .normal)
        self.setTitle(text, for: .highlighted)
    }
}

