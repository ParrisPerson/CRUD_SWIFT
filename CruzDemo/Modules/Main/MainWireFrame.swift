//
//  SplashWireFrame.swift
//  Lendu
//
//   
//

import UIKit

class MainWireFrame: BaseWireFrame {
    
    class func createModule() -> BaseView {
        let view = MainView()
        let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
        let interactor: MainInteractorInputProtocol = MainInteractor()
        let wireFrame: MainWireFrameProtocol = MainWireFrame(viewController: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}

extension MainWireFrame: MainWireFrameProtocol {
 
    
    func goToAdd(){
        let addScreen = AddWireFrame.createModule(user: nil)
        navigationController?.pushViewController(addScreen, animated: true)
    }
    
    func goToAddEdit(user: UserPost){
        let addScreen = AddWireFrame.createModule(user: user)
        navigationController?.pushViewController(addScreen, animated: true)
    }
}

