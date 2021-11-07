 

import Foundation

 class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var wireFrame: MainWireFrameProtocol?
    
    var users : [User] = []
    
    func viewDidLoad() {
        interactor!.getUsers()
    }
    
    func getUsers() -> [User]{
        return users
    }
    
    func touchAddButton(){
        wireFrame?.goToAdd()
    }
    
    func touchDeleteButton(id: Int) {
        interactor!.deleteUsers(id: id)
    }
    
    func touchEditButton(){
        
    }
    
}

extension MainPresenter: MainInteractorOutputProtocol {
    func getSuccess(data: [User]){
        users = data
        self.view!.reloadTable() 
    }
    
    func getDelSuccess(){
        interactor!.getUsers()
         
    }
    
    func getError(){
        
    }
}
