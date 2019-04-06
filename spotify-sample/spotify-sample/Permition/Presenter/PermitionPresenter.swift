//
//  PermitionPresenter.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class PermitionPresenter: PermitionPresenterInputProtocol {
    
    

    var view: PermitionViewControllerProtocol?
    var wireFrame: PermitionWireFrameProtocol?
    var worker: PermitionWorkerInputProtocol?
    
    func viewDidLoad() {
        worker?.getPermitionFromSpotify()
    }
    
    func showAlert(from view: UIViewController) {
        wireFrame?.showAlert(from: view)
    }
    
    func showPlaylist() {
        if let value = view {
            wireFrame?.showPlaylist(from: value)
        }
    }
}

extension PermitionPresenter: PermitionWorkerOutputProtocol {
    func onError(error: String) {        
        view?.onError(error: error)
    }
    

}
