 

import Foundation

class MainInteractor: NSObject, MainInteractorInputProtocol {
    
    weak var presenter: MainInteractorOutputProtocol?
    
    func getUsers() {
 
        UserAPI.apiUserGet () { User, Error  in
            if let users = User{
                self.presenter?.getSuccess(data: users) 
            }
        }
    }
    
    func deleteUsers(id: Int) {
 
        UserAPI.apiUserByIdDelete(_id: id) {idd, Error in
            self.presenter?.getDelSuccess() 
        }
    }
}
