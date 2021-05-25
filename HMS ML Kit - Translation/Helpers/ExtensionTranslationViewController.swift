//
//  ExtensionTranslationViewController.swift
//  HMS ML Kit - Translation
//
//  Created by Ali Mert Özhayta on 25.05.2021.
//

import UIKit

extension TranslationViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languagesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languagesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch pickerView.tag {
        case sourceLanguageTag:
            sourceLanguageButton.setText(languagesArray[row])
            selectedSourceLanguage = languagesArray[row]
            break
        
        case targetLanguageTag:
            targetLanguageButton.setText(languagesArray[row])
            selectedTargetLanguage = languagesArray[row]
            break
        
        default:
            break
        }
        translate(text: self.sourceTextView.text)
    }
}

extension TranslationViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText { textView.text = "" }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" { textView.text = placeholderText }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        translate(text: self.sourceTextView.text)

    }
}
