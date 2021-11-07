 

import Foundation

class AddInteractor: NSObject, AddInteractorInputProtocol {
    
    weak var presenter: AddInteractorOutputProtocol?
    
    func touchAddButton(user: UserPost) {
        UserAPI.apiUserPost(payload: user) {_ in
            self.presenter!.postSuccess()
        }
    
    }
}
