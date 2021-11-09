//
//  ViewController.swift
//  CruzDemo
//
//  Created by Parris Person on 7/11/21.
//


import UIKit

 class tableCell: UITableViewCell {
 
     let title: UILabel = {
         let label = UILabel(frame: .zero)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textAlignment = .left
         label.textColor = .black
         return label
     }()
  
     let delete: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
         button.backgroundColor = .red
        button.setTitle("DELETE", for: .normal)
        button.setTitleColor(.black, for: .normal)

         return button
     }()
    
    let edit: UIButton = {
       let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitle("EDIT", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
     
     
  
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.contentView.backgroundColor = .clear
   
          
         self.addSubviews(title, delete, edit)
  
         setupConstraints()
  
     }

     required init(coder aDecoder: NSCoder) {
         
         fatalError("init(coder:) has not been implemented")
     }
     
     func setupConstraints() {
         
         NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0)
         ])
         
         NSLayoutConstraint.activate([
            delete.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            delete.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            delete.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
            delete.widthAnchor.constraint(equalToConstant: 80)
         ])
         
         NSLayoutConstraint.activate([
            edit.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            edit.rightAnchor.constraint(equalTo: delete.leftAnchor, constant: -10),
            edit.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
            edit.widthAnchor.constraint(equalToConstant: 50)

         ])
  
     }

     override func layoutSubviews() {
         super.layoutSubviews()
     }
  
 }
 
class MainView: BaseView{
    
    var presenter: MainPresenterProtocol?
    
    let usersTableView: UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.register(tableCell.self, forCellReuseIdentifier: "tableCell")
        v.tableFooterView = UIView(frame: .zero)
        v.separatorStyle = .singleLine;
        v.bounces = false
        return v
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
        view.backgroundColor = .mainWhite
        view.addSubviews(usersTableView, add)
        self.navigationController?.navigationBar.isHidden = false
        showTitle()
        title = "CRUD"
        
        
        setupConstraints()
        usersTableView.delegate = self
        usersTableView.dataSource = self
        if presenter != nil{
            self.presenter?.viewDidLoad()
        }
        
        
        
        add.addTarget(self, action: #selector(touchAddButton), for: .touchUpInside)
         
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.viewDidLoad()
    }
    
    @objc func touchAddButton() {
        presenter?.touchAddButton()
    }
 
    
    @objc func deleteButtonPressed(sender: UIButton) {
        presenter?.touchDeleteButton(id: sender.tag)

    }
    
    @objc func editButtonPressed(sender: UIButton) {
        let user = presenter?.getUsers()[sender.tag]
        let userPost : UserPost = UserPost()
        userPost.id = user?.id
        userPost.name = user?.name
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        userPost.birthdate = formatter.string(from: user!.birthdate)
        
         
        presenter?.touchEditButton(user: userPost)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            usersTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            usersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            usersTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            usersTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            add.topAnchor.constraint(equalTo: usersTableView.bottomAnchor, constant: 0),
            add.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            add.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            add.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
    }
    
    
}

 
 extension MainView: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if presenter != nil{
            return presenter!.getUsers().count
        } else {
            return 0
        }
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! tableCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let user = presenter!.getUsers()[indexPath.row]
        cell.title.text = user.name
        cell.delete.tag = user.id!
        cell.edit.tag = indexPath.row
        cell.delete.addTarget(self, action: #selector(deleteButtonPressed(sender:)), for: .touchUpInside)
        cell.edit.addTarget(self, action: #selector(editButtonPressed(sender:)), for: .touchUpInside)
        return cell
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = 50
        return CGFloat(height)
     }
 }

 extension MainView: UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
     }
 }

extension MainView: MainViewProtocol {

    func reloadTable() {
        usersTableView.reloadData()
    }
}
