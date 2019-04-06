//
//  PermitionProtocol.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 05/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

//view->presenter
//presenter->worker
//worker-presenter
//presetner->view

protocol PermitionPresenterInputProtocol {
    
    var view: PermitionViewControllerProtocol? { get set }
    var worker: PermitionWorkerInputProtocol? { get set }
    var wireFrame: PermitionWireFrameProtocol? { get set }
    
    
    //view->presenter
    func viewDidLoad()
    func showAlert(from view: UIViewController)
    func showPlaylist()
    func onError(error: String)
    
}

protocol PermitionWireFrameProtocol {
    static func createViewController() -> UIViewController
    
    func showPlaylist(from view: PermitionViewControllerProtocol)
    func showAlert(from view: UIViewController)
}

protocol PermitionWorkerInputProtocol {
    var presenter: PermitionWorkerOutputProtocol? { get set }
    
    //presenter->worker
    func getPermitionFromSpotify()
}

protocol PermitionWorkerOutputProtocol: class {
    //worker-presenter
    func onError(error: String)
}

protocol PermitionViewControllerProtocol {
    
    var presenter: PermitionPresenterInputProtocol? { get set }
    
    //presenter -> view
    func onError(error: String)    
}


