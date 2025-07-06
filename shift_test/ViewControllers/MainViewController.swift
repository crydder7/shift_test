import UIKit

class MainViewController: UIViewController {
    
    var tableView = UITableView()
    let greetingButton = UIButton()
    let cellIdentifire = "cell"
    var data:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayButton()
        displayTableView()
        fetchData {fetchedData in
            guard let data = fetchedData else { return }
            DispatchQueue.main.async {
                self.data = data
                self.tableView.reloadData()
            }
        }
    }
    

    func displayButton(){
        greetingButton.setTitle("Greetings!", for: .normal)
        greetingButton.setTitleColor(.white, for: .normal)
        greetingButton.layer.cornerRadius = 15
        greetingButton.backgroundColor = .black
        greetingButton.layer.borderColor = UIColor.gray.cgColor
        greetingButton.layer.borderWidth = 1
        greetingButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        greetingButton.translatesAutoresizingMaskIntoConstraints = false
        greetingButton.addTarget(self, action: #selector(greet), for: .touchUpInside)
        view.addSubview(greetingButton)
        greetingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greetingButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.75).isActive = true
        greetingButton.heightAnchor.constraint(equalToConstant: view.frame.width * 0.1).isActive = true
        greetingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
    }
    
    func displayTableView(){
        self.tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifire)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.backgroundColor = .black
        tableView.topAnchor.constraint(equalTo: greetingButton.bottomAnchor, constant: 30).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func greet(){
        let greetVC = GreetViewController()
        let newNavCon = UINavigationController(rootViewController: greetVC)
        present(newNavCon, animated: true)
    }
}
