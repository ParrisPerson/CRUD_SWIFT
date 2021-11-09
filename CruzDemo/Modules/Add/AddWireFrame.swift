//
//  SplashWireFrame.swift
//  Lendu
//
//   
//

import UIKit

class AddWireFrame: BaseWireFrame {
    
    class func createModule(user: UserPost?) -> BaseView {
        let view = AddView()
        let presenter: AddPresenterProtocol & AddInteractorOutputProtocol = AddPresenter()
        let interactor: AddInteractorInputProtocol = AddInteractor()
        let wireFrame: AddWireFrameProtocol = AddWireFrame(viewController: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.user = user 
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}

extension AddWireFrame: AddWireFrameProtocol {
       
    
}

