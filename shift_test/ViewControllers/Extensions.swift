import Foundation
import UIKit

extension MainViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView:UITableView)->Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.isEmpty ? 1 : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
        
        if data.isEmpty {
            cell.textLabel?.text = "Loading data..."
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .black
        } else {
            let title = data[indexPath.row].title
            var titleCutted = ""
            var _ = title.map { char in
                if titleCutted.count < 27 {
                    titleCutted.append(char)
                }
                return char
            }
            titleCutted.append("...")
            cell.textLabel?.text = "\(titleCutted) - \(data[indexPath.row].price)"
            cell.selectionStyle = .default
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .black
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemVC = ItemViewController()
        itemVC.item = data[indexPath.row]
        let navCon = UINavigationController(rootViewController: itemVC)
        present(navCon, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch textField {
            case firstNameField:
                lastNameField.becomeFirstResponder()
            case lastNameField:
                passwordField.becomeFirstResponder()
            case passwordField:
                checkPasswordField.becomeFirstResponder()
            
            default:
                textField.resignFirstResponder()
            }
            return true
    }
}


extension UIViewController{
    @objc func dismissScreen(){
        dismiss(animated: true)
    }
}
