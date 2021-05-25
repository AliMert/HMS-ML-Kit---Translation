//
//  HmsTranslation.swift
//  HMS ML Kit - Translation
//
//  Created by Ali Mert Özhayta on 5.03.2021.
//

import Foundation
import AGConnectCore
import MLTranslate

class HmsTranslation {
    private static let shared = HmsTranslation()
        
    init(){
        guard let apiKey = AGCInstance.shared().config.apiKey else {
            print("apiKey is nil !! Cant access 'agconnect-services.plist'")
            return
        }
        MLTranslateApplication.sharedInstance().setApiKey(apiKey)
    }
    
    static func sharedInstance() -> HmsTranslation { return HmsTranslation.shared }

    func setLanguage(sourceLangCode: String, targetLangCode: String) {
        // Create a text translator using custom parameter settings.
        // LangCodes:  en, es, et, de, fr, it, ru, sk, tr,zh ...
        // You can check the supported languages from:
        //  https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides-V5/ml-resource-0000001050038188-V5
        let settings = MLRemoteTranslateSetting(sourceLangCode: sourceLangCode, targetLangCode: targetLangCode)
        MLRemoteTranslator.sharedInstance().setRemoteTranslator(settings)
    }
    
    func getCloudAllLanguages(_ successClosure: @escaping (_:[Any]?) -> Void, _ failureClosure: @escaping (_:MLTranslateException)->Void) {
        MLTranslateLanguage.getCloudAllLanguages({ allLangs in
            successClosure(allLangs)
        }, addOnFailureListener: { exception in
            failureClosure(exception)
        })
    }
    
    func asyncTranslate(_ translateText: String, _ successClosure: @escaping (String) -> Void,
                        failureClosure:((MLTranslateException) -> Void)?=nil) {
        MLRemoteTranslator.sharedInstance().asyncTranslate(translateText, addOnSuccessListener: { translatedText in
            successClosure(translatedText)
        }, addOnFailureListener: { exception in
            failureClosure?(exception)
        })
    }
    
    func asyncTranslate(_ translateText: String, sourceLangCode: String, targetLangCode: String, _ successClosure: @escaping (String) -> Void,
                        failureClosure: ((MLTranslateException) -> Void)?=nil) {
        
        HmsTranslation.shared.setLanguage(sourceLangCode: sourceLangCode, targetLangCode: targetLangCode)
        HmsTranslation.shared.asyncTranslate(translateText) { translatedText in
            successClosure(translatedText)
        } failureClosure: { exception in
            failureClosure?(exception)
        }
    }
}

