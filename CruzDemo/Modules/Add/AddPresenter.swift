 

import Foundation

 class AddPresenter: AddPresenterProtocol {
 
    weak var view: AddViewProtocol?
    var interactor: AddInteractorInputProtocol?
    var wireFrame: AddWireFrameProtocol?
    
    
    func viewDidLoad() {
        
    }
    
    func touchAddButton(user: UserPost) {
        self.view?.showProgress()
        interactor!.touchAddButton(user: user)
        
    }
    
}

extension AddPresenter: AddInteractorOutputProtocol {
    func postSuccess() {
        self.view?.hideProgress()
        self.view?.dismiss()
    }
}
