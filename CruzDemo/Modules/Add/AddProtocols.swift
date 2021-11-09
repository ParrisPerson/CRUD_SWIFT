 

import UIKit

protocol AddViewProtocol: BaseViewProtocol {
    var presenter: AddPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func dismiss()
}

protocol AddWireFrameProtocol: BaseWireFrameProtocol {
    static func createModule(user: UserPost?) -> BaseView
    
    // PRESENTER -> WIREFRAME
}

protocol AddPresenterProtocol: BasePresenterProtocol {
    var view: AddViewProtocol? { get set }
    var interactor: AddInteractorInputProtocol? { get set }
    var wireFrame: AddWireFrameProtocol? { get set }
    
    var user: UserPost? { get set }

    // VIEW -> PRESENTER
    func touchAddButton(user: UserPost)
    func touchEditButton(user: UserPost)

}

protocol AddInteractorOutputProtocol: AnyObject {
    
    // INTERACTOR -> PRESENTER
   func postSuccess()
}

protocol AddInteractorInputProtocol: AnyObject {
    var presenter: AddInteractorOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func touchAddButton(user: UserPost)
    func touchEditButton(user: UserPost)

}
