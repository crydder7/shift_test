import UIKit
import Kingfisher

class ItemViewController: UIViewController {
    var item: Product!
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let categoryLabel = UILabel()
    let descriptionLabel = UILabel()
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayTitle()
        displayPrice()
        displayCategory()
        displayDescription()
        displayImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .done,
            target: self,
            action: #selector(dismissScreen)
        )
        view.backgroundColor = .black
    }
    
    func displayTitle() {
        titleLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        titleLabel.text = "Title: \(item.title)"
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
//        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func displayPrice() {
        priceLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        priceLabel.text = "Price: \(item.price)"
        priceLabel.textColor = .white
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textAlignment = .center
        view.addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func displayCategory(){
        categoryLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        categoryLabel.text = "Category: \(item.category)"
        categoryLabel.textColor = .white
        categoryLabel.adjustsFontSizeToFitWidth = true
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.textAlignment = .center
        view.addSubview(categoryLabel)
        categoryLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func displayDescription(){
        descriptionLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        descriptionLabel.text = "Description: \(item.description)"
        descriptionLabel.textColor = .white
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 30).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func displayImage(){
        let url = URL(string: item.image)
        imageView.kf.setImage(with: url)
        imageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }

    @objc func dismissScreen(){
        dismiss(animated: true)
    }
}
