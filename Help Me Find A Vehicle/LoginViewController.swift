//
//  LoginViewController.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 12/30/16.
//  Copyright © 2016 HelpMeFindAVehicle.com. All rights reserved.
//

import UIKit

struct UserLoginData {
    let login: String
    let password: String
}

class LoginViewController: UIViewController {
    
    struct Colors {
        static let activeColor = UIColor.darkGray
        static let passiveColor = UIColor.lightGray
    }
    
    //MARK: - properties
    //MARK: -
    @IBOutlet weak var autoLoginSwitch: UISwitch!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var keyboardIsHidden = true;
    var userLoginData: UserLoginData! {
        didSet{
            self.signInButton.isEnabled = (userLoginData != nil)
        }
    }
    //MARK:  - methods
    // MARK:-  Lifecycle
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.viewDidTapped(gesture:)))
        view.addGestureRecognizer(tapRecognizer)
        setupUI()
    }
    
    var secureButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = #imageLiteral(resourceName: "Invisible Filled").withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.tintColor = Colors.passiveColor
        let insets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.imageEdgeInsets = insets
        return button
    } ()
    
    func setupUI() {
        navigationController?.navigationBar.barTintColor = UIColor.appColor
        navigationController?.navigationBar.titleTextAttributes =
        [NSForegroundColorAttributeName : UIColor.white]
        signInButton.backgroundColor = UIColor.appColor
        autoLoginSwitch.tintColor = UIColor.appColor
        autoLoginSwitch.onTintColor = UIColor.appColor
        setNeedsStatusBarAppearanceUpdate()
        secureButton.addTarget(self, action: #selector(self.clearButtonTapped(button:)), for: .touchUpInside)
        passwordTextField.rightViewMode = .whileEditing;
        passwordTextField.rightView = secureButton
    }
    
    func clearButtonTapped(button: UIButton) {
        let isTextShow = !passwordTextField.isSecureTextEntry
        let secureButtonNewImage:UIImage = (
            isTextShow ? #imageLiteral(resourceName: "Invisible Filled") : #imageLiteral(resourceName: "Visible Filled")).withRenderingMode(.alwaysTemplate)
        button.setImage(secureButtonNewImage, for: .normal)
        button.tintColor = isTextShow ? Colors.passiveColor : Colors.activeColor
        passwordTextField.isSecureTextEntry = isTextShow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(self.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let notificationCenter = NotificationCenter.default
       notificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
       notificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(self.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    // MARK:  Notifications
    
    func keyboardWillShow(notification: NSNotification) {
        updateBottomLayoutConstraintWithNotification(notification: notification)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        updateBottomLayoutConstraintWithNotification(notification: notification)
    }
    
    func rotated() {
        bottomConstraint.constant = bottomConstraint.constant
        if UIDevice.current.orientation.isLandscape {
        } else {
        }
    }
    
    // MARK:  Private
    
    func updateBottomLayoutConstraintWithNotification(notification: NSNotification) {
        let userInfo = notification.userInfo!
        let animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let keyboardEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let rawAnimationCurve = (notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).uint32Value << 16
        let animationCurve = UIViewAnimationCurve(rawValue: Int(rawAnimationCurve))!
        switch notification.name {
        case Notification.Name.UIKeyboardWillShow:
            if keyboardIsHidden {
                UIView.animate(withDuration: animationDuration, delay: 0.0, options: [.beginFromCurrentState, animationCurve.optionsValue], animations: {
                    self.view.frame.origin.y -= keyboardEndFrame.height / 2
                }, completion: { finished in
                    self.keyboardIsHidden = false
                })
            }
        case Notification.Name.UIKeyboardWillHide:
            if self.view.frame.origin.y != 0{
                UIView.animate(withDuration: animationDuration, delay: 0.0, options: [.beginFromCurrentState, animationCurve.optionsValue], animations: {
                    self.view.frame.origin.y += keyboardEndFrame.height / 2
                }, completion: { finished in
                    self.keyboardIsHidden = true
                }
            )
            }
        default: ()
        }
    }
    //MARK: Gestures
    func viewDidTapped(gesture: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    //MARK: Buttons actions
    @IBAction func autoLoginValueChanged(_ sender: UISwitch) {
    }
    @IBAction func loginTapped(_ sender: UIButton) {
    }
}
//MARK: - Text fieeld delegate
//MARK: -
extension LoginViewController: UITextFieldDelegate {
    //MARK: delegate methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        validateUserLogin()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === nameTextField {
            passwordTextField.becomeFirstResponder()
           return false
        }
        textField.resignFirstResponder()
        return true
    }
    //MARK: Login validation
    func validateUserLogin(){
       if let name =  nameTextField.text, !name.isEmpty,
            let password =  passwordTextField.text, !password.isEmpty {
            userLoginData = UserLoginData(login: name, password: password)
            return
        }
        userLoginData = nil
    }
}
