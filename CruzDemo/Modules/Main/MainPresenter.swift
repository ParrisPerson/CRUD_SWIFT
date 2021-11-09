 

import Foundation

 class MainPresenter: MainPresenterProtocol {
 

    weak var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var wireFrame: MainWireFrameProtocol?
    
    var users : [User] = []
    
    func viewDidLoad() {
        self.view?.showProgress()
        interactor!.getUsers()
    }
    
    func getUsers() -> [User]{
        return users
    }
    
    func touchAddButton(){
        wireFrame?.goToAdd()
    }
    
    func touchDeleteButton(id: Int) {
        self.view?.showProgress()
        interactor!.deleteUsers(id: id)
    }
    
    func touchEditButton(user: UserPost){
        wireFrame?.goToAddEdit(user: user) 
    }
    
}

extension MainPresenter: MainInteractorOutputProtocol {
    func getSuccess(data: [User]){
        users = data
        self.view?.hideProgress()
        self.view!.reloadTable() 
    }
    
    func getDelSuccess(){
        self.view?.hideProgress()
        interactor!.getUsers()
         
    }
    
    func getError(){
        
    }
}
