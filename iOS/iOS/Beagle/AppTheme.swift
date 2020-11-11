//
//  AppTheme.swift
//  iOS
//
//  Created by Lucas Cesar on 25/08/20.
//  Copyright © 2020 Lucas Cesar. All rights reserved.
//

import UIKit
import Beagle
import BeagleSchema

struct AppTheme {
    static var blue = #colorLiteral(red: 0.3333333333, green: 0.7450980392, blue: 0.9764705882, alpha: 1)
    static let theme = Beagle.AppTheme(styles: [
        "Style.Text.Bold.16": styleTextBold16,
        "Style.Button.White.Bold.16": styleButtonWhiteSemibold,
        "Style.TextInput": designTextInput,
        
        "Style.Text.Bold.System": styleTextBoldSystemFont,
        "Style.Button.White.Bold.System": styleButtonWhiteSystemSemibold,
        "Style.TextInput.System": designSystemTextInput,
    ])
    
    static func styleTextBold16() -> (UITextView?) -> Void {
        return {
            $0?.font = .boldSystemFont(ofSize: 16)
        }
    }
    
    static func styleButtonWhiteSemibold() -> (UIButton?) -> Void {
        return BeagleStyle.button(withTitleColor: .white)
            <> {
                $0?.titleLabel |> BeagleStyle.label(withFont: .systemFont(ofSize: 16, weight: .bold))
        }
    }

    static func designTextInput() -> (UITextField?) -> Void {
        return {
            $0?.borderStyle = .roundedRect
            $0?.font = .systemFont(ofSize: 20.0)
            let color = blue
            $0?.layer.borderColor = color.cgColor
            $0?.layer.borderWidth = 1
            $0?.textColor = UIColor.lightGray
            $0?.layer.cornerRadius = 8
        }
    }
    
    //Acessibles
    static func styleTextBoldSystemFont() -> (UITextView?) -> Void {
        return {
            $0?.font = .boldSystemFont(ofSize: UIFont.systemFontSize)
        }
    }
    
    static func styleButtonWhiteSystemSemibold() -> (UIButton?) -> Void {
        return BeagleStyle.button(withTitleColor: .white)
            <> {
                $0?.titleLabel |> BeagleStyle.label(withFont: .systemFont(ofSize: UIFont.systemFontSize, weight: .bold))
        }
    }

    static func designSystemTextInput() -> (UITextField?) -> Void {
        return {
            $0?.borderStyle = .roundedRect
            $0?.font = .systemFont(ofSize: UIFont.systemFontSize)
            $0?.layer.borderColor = blue.cgColor
            $0?.layer.borderWidth = 1
            $0?.textColor = UIColor.lightGray
            $0?.layer.cornerRadius = 8
        }
    }
    
}
