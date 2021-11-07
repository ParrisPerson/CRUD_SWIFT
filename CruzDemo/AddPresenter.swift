 

import Foundation

 class AddPresenter: AddPresenterProtocol {
 
    weak var view: AddViewProtocol?
    var interactor: AddInteractorInputProtocol?
    var wireFrame: AddWireFrameProtocol?
    
    
    func viewDidLoad() {
        
    }
    
    func touchAddButton(user: UserPost) {
        UserAPI.apiUserPost(payload: user) {_ in
            self.view!.dismiss()
        }
    }
    
}

extension AddPresenter: AddInteractorOutputProtocol {
    
}
