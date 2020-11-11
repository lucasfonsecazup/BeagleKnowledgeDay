//
//  CustomComponents.swift
//  iOS
//
//  Created by Lucas Cesar on 27/08/20.
//  Copyright © 2020 Lucas Cesar. All rights reserved.
//

import Foundation
import Beagle
import BeagleSchema

enum KeyboardType: String, Decodable {
    case email = "EMAIL"
    case password = "PASSWORD"
    
    func setupType() -> UIKeyboardType {
        switch self {
        case .email:
            return .emailAddress
        default:
            return .default
        }
    }
    
    var isSecurityEntry: Bool {
        return self == .password
    }
}

struct AccessibleTextInput: RawWidget {
    let hint: String
    let placeHolder: String
    let textFieldType: KeyboardType?
    let normalBorderColor: String
    let selectedBorderColor: String
    var widgetProperties: WidgetProperties
    
    public init(
         hint: String,
         placeHolder: String,
         textFieldType: KeyboardType?,
         normalBorderColor: String,
         selectedBorderColor: String,
         widgetProperties:WidgetProperties
    ){
        self.hint = hint
        self.placeHolder = placeHolder
        self.textFieldType = textFieldType
        self.normalBorderColor = normalBorderColor
        self.selectedBorderColor = selectedBorderColor
        self.widgetProperties = widgetProperties
    }
}

extension AccessibleTextInput: Widget {
    func toView(renderer: BeagleRenderer) -> UIView {
        let view = AccessibleTextInputUiComponent(hint: hint, placeHolder: placeHolder, textFieldType: textFieldType?.setupType(), normalBorderColor: UIColor(named: normalBorderColor) ?? .blue, selectedBorderColor: UIColor(named: selectedBorderColor) ?? .green)
        
        return view
    }
}

class AccessibleTextInputUiComponent: UIView, UITextFieldDelegate {
    var hint: String
    var placeHolder: String
    var textFieldType: UIKeyboardType?
    var normalBorderColor: UIColor
    var selectedBorderColor: UIColor
    private var selectedBorderWidth = 4
    private var defauleBorderWidth = 2
    
    init(
        hint: String,
        placeHolder: String,
        textFieldType: UIKeyboardType?,
        normalBorderColor: UIColor,
        selectedBorderColor: UIColor
    ) {
        self.hint = hint
        self.placeHolder = placeHolder
        self.textFieldType = textFieldType
        self.normalBorderColor = normalBorderColor
        self.selectedBorderColor = selectedBorderColor
        super.init(frame: .zero)
        
        addSubview(textField)
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        textField.anchor(
            top: topAnchor, left: leftAnchor, right: rightAnchor
        )
        addSubview(labelTitle)
        labelTitle.anchor(
            left: leftAnchor, bottom: topAnchor, right: rightAnchor
        )
        
        textField.layer.borderWidth = CGFloat(defauleBorderWidth)
        textField.layer.borderColor = normalBorderColor.cgColor
        textField.becomeFirstResponder()
//
        
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.anchor(
//            top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor
//        )
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var textField: UITextField = {
        var textField = UITextField()
        textField.placeholder = placeHolder
        textField.keyboardType = textFieldType ?? .default
        textField.delegate = self
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: UIFont.systemFontSize)
        textField.layer.borderColor = AppTheme.blue.cgColor
        textField.layer.borderWidth = 1
        textField.textColor = UIColor.lightGray
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private lazy var labelTitle: UILabel = {
        var labelTitle = UILabel()
        labelTitle.text = hint
        return labelTitle
    }()
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = CGFloat(selectedBorderWidth)
        textField.layer.borderColor = selectedBorderColor.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = CGFloat(defauleBorderWidth)
        textField.layer.borderColor = normalBorderColor.cgColor
    }
}
