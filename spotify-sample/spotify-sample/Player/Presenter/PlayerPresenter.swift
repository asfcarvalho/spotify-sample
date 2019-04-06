//
//  PlayerPresenter.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class PlayerPresenter: PlayerPresenterInputProtocol {
    
    
    var view: PlayerPresenterOutputProtocol?
    var wireFrame: PlayerWireFrameProtocol?
    var worker: PlayingWorkerInputProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        worker?.playingFetch()
    }
    
    func showAlert(from view: UIViewController, message: String) {
        wireFrame?.showAlert(from: view, message: message)
    }
}

extension PlayerPresenter: PlayingWorkerOutputProtocol {
    func onError(erro: String) {
        view?.stopLoading()
        view?.onError(error: erro)
    }
    
    func showPlaying(playing: Playing) {
        view?.stopLoading()
        view?.showPlaying(playing: playing)
    }
    
    
}
