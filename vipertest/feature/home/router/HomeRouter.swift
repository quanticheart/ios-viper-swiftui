//
//  AmiiboRouter.swift
//  vipertest
//
//  Created by Jonn Alves on 08/02/23.
//

import Foundation

class HomeRouter{
    var presenter: HomePresenter!
    var view : HomeView?
    
    static func createModule() -> HomeView {
        let router = HomeRouter()
        let interector = HomeInterector()
        
        let presenter = HomePresenter(router: router, interector: interector)
        let view = HomeView(presenter: presenter)
        
        router.presenter = presenter
        router.view = view
        
        return view
    }
    
    func goToDetails(tail:String) -> DetailView {
        return DetailsRouter.createModule(tail: tail)
    }
}
