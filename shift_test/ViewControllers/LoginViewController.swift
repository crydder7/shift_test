import UIKit


class LoginViewController: UIViewController {
    let firstNameField = UITextField()
    let lastNameField = UITextField()
    let passwordField = UITextField()
    let checkPasswordField = UITextField()
    let continueButton = UIButton()
    let label = UILabel()
    let datePicker = UIDatePicker()
    let pickerLabel = UILabel()
    let pickerView = UIView()
    let storage = UserDefaults.standard
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .black
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { nc in
            let offset: CGFloat = 150
            self.view.frame.origin.y = -offset
            
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = 0.0
        }
        
        displayLabel()
        displayFirstNameField()
        displayLastNameField()
        displayPickerView()
        displayPasswordField()
        displayCheckPasswordField()
        displayButton()
        
        
    }
    
    func displayPickerView(){
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width * 0.75, height: view.bounds.height * 0.05)
        pickerView.backgroundColor = .white
        pickerView.layer.cornerRadius = 5
        displayPickerLabel()
        displayDatePicker()
        view.addSubview(pickerView)
        pickerView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.75).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.05).isActive = true
        pickerView.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 30).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func displayLabel(){
        label.text = "Register"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 45)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
    }

    func displayFirstNameField() {
        firstNameField.delegate = self
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        firstNameField.text = ""
        firstNameField.placeholder = "Enter your name"
        firstNameField.borderStyle = .roundedRect
        firstNameField.autocapitalizationType = .sentences
        firstNameField.autocorrectionType = .no
        super.view.addSubview(firstNameField)
        firstNameField.addTarget(self, action: #selector(fieldDidChanged), for: .allEditingEvents)
        firstNameField.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.75).isActive = true
        firstNameField.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.05).isActive = true
        firstNameField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
        firstNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    func displayLastNameField() {
        lastNameField.delegate = self
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        lastNameField.text = ""
        lastNameField.addTarget(self, action: #selector(fieldDidChanged), for: .allEditingEvents)
        lastNameField.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        lastNameField.placeholder = "Enter your last name"
        lastNameField.borderStyle = .roundedRect
        lastNameField.autocapitalizationType = .sentences
        lastNameField.autocorrectionType = .no
        super.view.addSubview(lastNameField)
        lastNameField.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.75).isActive = true
        lastNameField.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.05).isActive = true
        lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 30).isActive = true
        lastNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func displayPickerLabel(){
        pickerLabel.text = "Pick birthday"
        pickerLabel.translatesAutoresizingMaskIntoConstraints = false
        pickerLabel.textColor = .black
        pickerLabel.textAlignment = .left
        pickerView.addSubview(pickerLabel)
        
        pickerLabel.centerYAnchor.constraint(equalTo: pickerView.centerYAnchor).isActive = true
        pickerLabel.leadingAnchor.constraint(equalTo: pickerView.leadingAnchor, constant: 5).isActive = true
        pickerLabel.widthAnchor.constraint(equalToConstant: pickerView.bounds.width * 0.5).isActive = true
        pickerLabel.heightAnchor.constraint(equalToConstant: pickerView.bounds.height).isActive = true
    }
    
    func displayPasswordField() {
        passwordField.delegate = self
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.text = ""
        passwordField.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        passwordField.placeholder = "Enter password"
        passwordField.addTarget(self, action: #selector(fieldDidChanged), for: .allEditingEvents)
        passwordField.borderStyle = .roundedRect
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        super.view.addSubview(passwordField)
        passwordField.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.75).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.05).isActive = true
        passwordField.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func displayCheckPasswordField() {
        checkPasswordField.delegate = self
        checkPasswordField.translatesAutoresizingMaskIntoConstraints = false
        checkPasswordField.text = ""
        checkPasswordField.addTarget(self, action: #selector(fieldDidChanged), for: .allEditingEvents)
        checkPasswordField.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        checkPasswordField.placeholder = "Re-enter password"
        checkPasswordField.borderStyle = .roundedRect
        checkPasswordField.autocapitalizationType = .none
        checkPasswordField.autocorrectionType = .no
        checkPasswordField.isSecureTextEntry = true
        super.view.addSubview(checkPasswordField)
        checkPasswordField.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.75).isActive = true
        checkPasswordField.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.05).isActive = true
        checkPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30).isActive = true
        checkPasswordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func displayButton() {
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("Register", for: .normal)
        continueButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.titleLabel?.textAlignment = .center
        continueButton.layer.cornerRadius = 15
        continueButton.layer.borderColor = UIColor.gray.cgColor
        continueButton.layer.borderWidth = 2
        continueButton.backgroundColor = .black
        continueButton.setTitleColor(.red, for: .disabled)
        continueButton.setTitle("Fill all fields", for: .disabled)
        continueButton.isEnabled = false
        super.view.addSubview(continueButton)
        continueButton.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.66).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.07).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.topAnchor.constraint(equalTo: checkPasswordField.bottomAnchor, constant: 50).isActive = true
    }
    
    func displayDatePicker(){
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.maximumDate = Date()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.layer.cornerRadius = 10
        
        datePicker.tintColor = .white
        datePicker.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        pickerView.addSubview(datePicker)
        datePicker.centerYAnchor.constraint(equalTo: pickerView.centerYAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: pickerView.trailingAnchor).isActive = true
        datePicker.widthAnchor.constraint(equalToConstant: pickerView.bounds.width * 0.5).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: pickerView.bounds.height).isActive = true
    }
    
    @objc func loginButtonTapped() {
        var errors = [String]()
        if let name = firstNameField.text{
            if name.count < 2{
                errors.append( "Name must be at least 2 characters long")
                firstNameField.layer.borderColor = UIColor.red.cgColor
                firstNameField.layer.borderWidth = 2
            } else{
                firstNameField.layer.borderWidth = 0
            }
        }
        
        if let surname = lastNameField.text{
            if surname.count < 2{
                errors.append( "Surname must be at least 2 characters long")
                lastNameField.layer.borderColor = UIColor.red.cgColor
                lastNameField.layer.borderWidth = 2
            } else{
                lastNameField.layer.borderWidth = 0
            }
        }
        
        let rules = ["!","@","#","$","%","^","&","*","|","/","<",">","?",":",";"]
        var isError = false
        if let passwd = passwordField.text{
            if let passwdChecked = checkPasswordField.text{
                if passwd != passwdChecked{
                    errors.append( "Passwords do not match")
                    passwordField.layer.borderColor = UIColor.red.cgColor
                    passwordField.layer.borderWidth = 2
                    checkPasswordField.layer.borderColor = UIColor.red.cgColor
                }else if passwd.count < 8{
                    errors.append( "Passwords must be at least 8 characters long")
                    passwordField.layer.borderColor = UIColor.red.cgColor
                    passwordField.layer.borderWidth = 2
                    checkPasswordField.layer.borderColor = UIColor.red.cgColor
                } else if passwd == passwdChecked{
                    let small = "abcefghijklmnopqrstuvwxyz"
                    let capital = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    let numbers = "0123456789"
                    var areSmall = false
                    var areCapital = false
                    var areNumbers = false
                    for char in passwd{
                        if numbers.contains(char){
                            areNumbers = true
                        }
                        if small.contains(char){
                            areSmall = true
                        }
                        if capital.contains(char){
                            areCapital = true
                        }
                    }
                    
                    if !(areSmall && areCapital && areNumbers){
                        isError = true
                        errors.append("Password must have at least one small letter, one capital letter and one number")
                        passwordField.layer.borderColor = UIColor.red.cgColor
                        passwordField.layer.borderWidth = 2
                        checkPasswordField.layer.borderColor = UIColor.red.cgColor
                        checkPasswordField.layer.borderWidth = 2
                    }
                    for i in rules{
                        if passwd.contains(i){
                            isError = true
                            errors.append( "Passwords can't contains special characters")
                            passwordField.layer.borderColor = UIColor.red.cgColor
                            passwordField.layer.borderWidth = 2
                            checkPasswordField.layer.borderColor = UIColor.red.cgColor
                            checkPasswordField.layer.borderWidth = 2
                            break
                        }
                    }
                    if !isError{
                        passwordField.layer.borderWidth = 0
                        checkPasswordField.layer.borderWidth = 0
                    }
                }
            }
        }
        let alert = UIAlertController()
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        alert.title = "Errors"
        if !errors.isEmpty{
            alert.message = errors.joined(separator: "\n")
            present(alert, animated: true)
        } else{
            storage.setValue(passwordField.text, forKey: "password")
            storage.setValue(firstNameField.text, forKey: "firstname")
            storage.setValue(lastNameField.text, forKey: "lastname")
            storage.setValue(datePicker.date, forKey: "birthday")
            storage.setValue(true, forKey: "isLoggedIn")
            navigationController?.viewControllers[0] = MainViewController()
        }
    }
    
    func updateFields(){
        let isNameField = firstNameField.text?.isEmpty ?? true
        let isSurnameField = lastNameField.text?.isEmpty ?? true
        let isPasswordField = passwordField.text?.isEmpty ?? true
        let iscCheckPasswordField = checkPasswordField.text?.isEmpty ?? true
        continueButton.isEnabled = !isNameField && !isSurnameField && !isPasswordField && !iscCheckPasswordField
    }
    
    @objc func fieldDidChanged(){
        updateFields()
    }
}

