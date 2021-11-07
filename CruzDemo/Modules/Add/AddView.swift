import UIKit
 
class AddView: BaseView {
    
    var presenter: AddPresenterProtocol?
 
    let nameTextField: UnderlineTextField = {
        return UnderLineTextFieldBuilder(frame: .zero,
                                         validateExpressions: ["error":
                                                UnderlineTextField.CommonExpressions.generic])
            .placeholder("name")
            .tintColor(UIColor.black)
            .accessibilityIdentifier("nameTextField")
            .build()
    }()
    
    let birthTextField: UnderlineTextField = {
        return UnderLineTextFieldBuilder(frame: .zero,
                                         validateExpressions: ["error":
                                                UnderlineTextField.CommonExpressions.generic])
            .placeholder("birthdate")
            .tintColor(UIColor.black)
            .accessibilityIdentifier("nameTextField")
            .build()
    }()
    
    let add: UIButton = {
       let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle("ADD USER", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        view.addSubviews( add, nameTextField, birthTextField)
        self.navigationController?.navigationBar.isHidden = false
        showTitle()
        title = "ADD"
        
        
        setupConstraints()
         
        self.presenter?.viewDidLoad()
        
        
        add.addTarget(self, action: #selector(touchAddButton), for: .touchUpInside)
         
    }
    
    @objc func touchAddButton() {
        if nameTextField.text != "" && birthTextField.text != "" {
            let user = UserPost()
            user.name = nameTextField.text ?? ""
            
            user.id = 0
            let dateFormatter = DateFormatter()
           
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            if let date = dateFormatter.date(from: "2021-11-07T20:00:04.625Z") {
                user.birthdate = dateFormatter.string(from: Date())
            } else {
                user.birthdate = ""
            }
            
            
            print(user)
           
            
           
            presenter?.touchAddButton(user: user)
        }
        
    }
 
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            
            nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            birthTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            
            birthTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            birthTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
 
        
        NSLayoutConstraint.activate([
            add.heightAnchor.constraint(equalToConstant: 100),
            add.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            add.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            add.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
    }
    
    
}

  
extension AddView: AddViewProtocol { 

    func dismiss(){
        self.navigationController?.popViewController(animated: true)
    }
}
