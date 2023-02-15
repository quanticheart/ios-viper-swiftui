//
//  DetailsRouter.swift
//  vipertest
//
//  Created by Jonn Alves on 08/02/23.
//

import Foundation
import SwiftUI

class DetailsRouter{
    var presenter: DetailsPresenter?
    var view : DetailView?
    
    static func createModule(tail:String) -> DetailView {
        
        let router = DetailsRouter()
        let interector = DetailsInterector()
        let presenter = DetailsPresenter(view: nil, router: router, interector: interector)

        var view = DetailView(presenter: presenter, tail: tail)
      
        view.presenter = presenter
        router.presenter = presenter
        router.view = view
       
        return view
    }
}
