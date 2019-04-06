//
//  PlayerProtocol.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

protocol PlayerPresenterInputProtocol {
    var view: PlayerPresenterOutputProtocol? { get set }
    var worker: PlayingWorkerInputProtocol? { get set }
    var wireFrame: PlayerWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showAlert(from view: UIViewController, message: String)
}

protocol PlayerPresenterOutputProtocol {
    
    var presenter: PlayerPresenterInputProtocol? { get set }
    
    func onError(error: String)
    func showPlaying(playing: Playing)
    func showLoading()
    func stopLoading()
}

protocol PlayerWireFrameProtocol {
    static func createViewController() -> UIViewController
    
    func showAlert(from view: UIViewController, message: String)
}

protocol PlayingWorkerInputProtocol {
    var presenter: PlayingWorkerOutputProtocol? { get set }
    
    func playingFetch()
}

protocol PlayingWorkerOutputProtocol: class {
    func onError(erro: String)
    func showPlaying(playing: Playing)
}
