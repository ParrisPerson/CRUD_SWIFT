 

import UIKit

protocol MainViewProtocol: BaseViewProtocol {
    var presenter: MainPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func reloadTable()
}

protocol MainWireFrameProtocol: BaseWireFrameProtocol {
    static func createModule() -> BaseView
    
    // PRESENTER -> WIREFRAME
    func goToAdd()
    func goToAddEdit(user: UserPost) 
}

protocol MainPresenterProtocol: BasePresenterProtocol {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var wireFrame: MainWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func getUsers() -> [User]
    func touchAddButton()
    func touchDeleteButton(id: Int)
    func touchEditButton(user: UserPost)
}

protocol MainInteractorOutputProtocol: AnyObject {
    
    // INTERACTOR -> PRESENTER
    func getSuccess(data: [User])
    func getDelSuccess()
    func getError() 
}

protocol MainInteractorInputProtocol: AnyObject {
    var presenter: MainInteractorOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func getUsers()
    func deleteUsers(id: Int)
}
