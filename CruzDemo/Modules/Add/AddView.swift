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
    
    let datePicker = UIDatePicker()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        view.addSubviews( add, nameTextField, birthTextField)
        self.navigationController?.navigationBar.isHidden = false
        showTitle()
        if presenter?.user != nil {
            title = "EDIT"
            add.setTitle("EDIT", for: .normal)
            add.addTarget(self, action: #selector(touchEditButton), for: .touchUpInside)
            birthTextField.text = presenter?.user?.birthdate
            nameTextField.text = presenter?.user?.name
            
        }else{
            title = "ADD"
            add.addTarget(self, action: #selector(touchAddButton), for: .touchUpInside)
            add.setTitle("ADD", for: .normal)
        }
        
        
        setupConstraints()
         
        self.presenter?.viewDidLoad()
 
        showDatePicker()
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date

       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

     toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        birthTextField.inputAccessoryView = toolbar
        birthTextField.inputView = datePicker

     }

      @objc func donedatePicker(){

       let formatter = DateFormatter()
       formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        birthTextField.text = formatter.string(from: datePicker.date)
       self.view.endEditing(true)
     }

     @objc func cancelDatePicker(){
        self.view.endEditing(true)
      }
    
    @objc func touchAddButton() {
        if nameTextField.text != "" && birthTextField.text != "" {
            let user = UserPost()
            user.name = nameTextField.text ?? ""
            user.id = 0
            user.birthdate = birthTextField.text!

            presenter?.touchAddButton(user: user)
        }
        
    }
    
    @objc func touchEditButton() {
        if nameTextField.text != "" && birthTextField.text != "" {
            let user = UserPost()
            user.name = nameTextField.text ?? ""
            user.id = presenter?.user?.id
            user.birthdate = birthTextField.text!

            presenter?.touchEditButton(user: user)
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
