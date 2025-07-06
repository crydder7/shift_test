import UIKit

class GreetViewController: UIViewController {
    let storage = UserDefaults.standard
    let greetLabel = UILabel()
    let backButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        displayGreetings()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .done,
            target: self,
            action: #selector(dismissScreen)
        )
    }
    
    func displayGreetings(){
        
        if let name = storage.string(forKey: "firstname"){
            greetLabel.text = "Hello, \(name.capitalized)!"
        } else{
            greetLabel.text = "There are no name stored!"
        }
        greetLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/10)
        greetLabel.textColor = .white
        greetLabel.textAlignment = .center
        greetLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        greetLabel.center = view.center
        greetLabel.numberOfLines = 0
        view.addSubview(greetLabel)
    }
    
    @objc func dismissScreen(){
        dismiss(animated: true)
    }
}
