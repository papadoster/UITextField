//
//  ViewController.swift
//  UITextField
//
//  Created by Marina Karpova on 04.01.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var myTextField = UITextField()
    
    var baseArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        
        self.myTextField.delegate = self
        
        //self.myTextField.becomeFirstResponder()
        
        //NotificationCenter.default.addObserver(self, selector: #selector(textDidChangeNotification), name: UITextField.textDidChangeNotification, object: nil)
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification , object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -200
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification , object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
    }
    
    
    fileprivate func createTextField() {
        let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.borderStyle = .roundedRect
        myTextField.contentVerticalAlignment = .center
        myTextField.textAlignment = .center
        myTextField.placeholder = "enter your name"
        myTextField.center = view.center
        view.addSubview(myTextField)
    }
    
    //MARK: - Delegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing - это я решаю можно ли редактировать")
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing = внимание началось редактирование")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldDidBeginEditing = внимание закончилось редактирование" )
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print ("shouldChangeCharactersIn = вы ввели = \(string) ")
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print ("textFieldDidChangeSelection = ты Что то поменял")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print ("textFieldShouldClear = ты Что то очистил")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == myTextField {
            self.myTextField.resignFirstResponder()
            print("Вы ввели: \(textField.text ?? "nil")")
            self.baseArray.append(textField.text ?? "nil")
            self.myTextField.text = ""
        }
        print("Вы ввели: \(textField.text ?? "nil")")
        print(baseArray)
        return true
    }
    
    //MARK: - textDidChangeNotification
    
    //@objc func textDidChangeNotification(ncParam: NSNotification) {
    //         print("textDidChangeNotification = \(ncParam)")
    //    }
    
}

