//
//  TranslationViewController.swift
//  HMS ML Kit - Translation
//
//  Created by Ali Mert Özhayta on 24.05.2021.
//

import UIKit

class TranslationViewController: UIViewController {
    
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var sourceTextView: UITextView!
    @IBOutlet weak var targetTextView: UITextView!
    @IBOutlet weak var sourceLanguageButton: CustomButton!
    @IBOutlet weak var targetLanguageButton: CustomButton!
    
    var languagesArray: [String] = []
    var sourceLanguagePickerView = UIPickerView()
    var targetLanguagePickerView = UIPickerView()
    let sourceLanguageTag = 0
    let targetLanguageTag = 1
    let placeholderText = "write to translate..."
    var selectedSourceLanguage = ""
    var selectedTargetLanguage = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        sourceTextView.delegate = self
        sourceTextView.text = placeholderText
        // add 'Done' button to keyboard to dismiss sourceTextView
        self.sourceTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        
        sourceLanguageButton.inputView = sourceLanguagePickerView
        targetLanguageButton.inputView = targetLanguagePickerView

        sourceLanguagePickerView.delegate = self
        sourceLanguagePickerView.dataSource = self
        sourceLanguagePickerView.tag = 0
        
        targetLanguagePickerView.delegate = self
        targetLanguagePickerView.dataSource = self
        targetLanguagePickerView.tag = 1
    
        // add 'Done' button to pickerView to dismiss it
        self.sourceLanguageButton.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        self.targetLanguageButton.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
    }
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func languageButton_pressed(_ sender: UIButton) {
        if sender.tag == sourceLanguageTag {
            sourceLanguageButton.becomeFirstResponder()
        } else if sender.tag == targetLanguageTag {
            targetLanguageButton.becomeFirstResponder()
        }
    }
    
    @IBAction func reverseLanguagesButton_pressed(_ sender: Any) {
        var temp = selectedSourceLanguage
        selectedSourceLanguage = selectedTargetLanguage
        selectedTargetLanguage = temp
        
        temp = sourceLanguageButton.titleLabel?.text ?? ""
        sourceLanguageButton.setText(targetLanguageButton.titleLabel?.text ?? "")
        targetLanguageButton.setText(temp)
        
        sourceTextView.text = placeholderText
        targetTextView.text = ""
        
        if selectedSourceLanguage == "" {
            sourceLanguageButton.setText("Source Language")
        }
        if selectedTargetLanguage == "" {
            targetLanguageButton.setText("Target Language")
        }
    }
    
    func translate(text: String) {
        if selectedSourceLanguage == "" || selectedTargetLanguage == "" {
            return
        }
        if sourceTextView.text == placeholderText {
            targetTextView.text = ""
            return
        }
        
        HmsTranslation.sharedInstance()
            .asyncTranslate(text, sourceLangCode: selectedSourceLanguage,  targetLangCode: selectedTargetLanguage) { translatedText in
            // Processing logic for translation success.
            self.targetTextView.text = translatedText
        }
        failureClosure: {exception in
            // Processing logic for translation failure.
            self.targetTextView.text = "exception onasyncTranslate: \(exception.code) - \(exception.message)"
        }
    }
    
    override func viewWillLayoutSubviews() {
        view.window?.overrideUserInterfaceStyle = .dark
        // round corners
        upperView.layer.cornerRadius = 10
        upperView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        lowerView.layer.cornerRadius = 10
        lowerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        translateButton.layer.cornerRadius = 0.5 * translateButton.bounds.size.width
        translateButton.clipsToBounds = true
    }
}


