//
//  ViewController.swift
//  HMS ML Kit - Translation
//
//  Created by Ali Mert Özhayta on 4.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var translationView: UIView!
    
    let translationSegueName = "translationSegue"
    var translationViewController : TranslationViewController?
    private var translationViewY: CGFloat = 0
    
    override func viewDidAppear(_ animated: Bool) {
        translationViewY = self.translationView.frame.origin.y
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addShadow(to: translationView)
        obtainAllLanguages()
        
        // observe keyboard hide/show, so that translationView can move up or move down
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func obtainAllLanguages()  {
        HmsTranslation.sharedInstance().getCloudAllLanguages({ allLangs in
            // Languages supported by on-cloud translation are successfully obtained.
            let languagesArray = allLangs as? [String] ?? ["something went wrong.."]
            self.translationViewController?.languagesArray = languagesArray
        }, {
            exception in
               // Obtain the failure processing logic of the languages supported by the on-cloud translation.
            self.translationViewController?.targetTextView.text = "exception on getCloudAllLanguages: \(exception)"
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == translationSegueName {
            translationViewController = segue.destination as? TranslationViewController
        }
    }
    
    func addShadow(to view: UIView)  {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 0.35
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 4
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.translationView.frame.origin.y == translationViewY {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    self.translationView.frame.origin.y -= keyboardSize.height / 2
                    if self.translationView.frame.origin.y < 60 {
                        self.translationView.frame.origin.y = 60
                    }
                })
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.translationView.frame.origin.y != translationViewY {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.translationView.frame.origin.y = self.translationViewY
            })
        }
    }
    
    

}

