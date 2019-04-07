//
//  PlayerPresenter.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class PlayerPresenter: PlayerPresenterInputProtocol {
    
    var workerPlay: PlayPauseWorkerInputProtocol?
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
    
    func playPause(type: PlayPauseType) {
        workerPlay?.playPauseFetch(type: type)
    }
}

extension PlayerPresenter: PlayingWorkerOutputProtocol {
    func onError(error erro: String) {
        view?.stopLoading()
        view?.onError(error: erro)
    }
    
    func showPlaying(playing: Playing) {
        
        view?.showPlaying(playing: playing)
        view?.stopLoading()
    }
    
    
}

extension PlayerPresenter: PlayPauseWorkerOutputProtocol {
    func onSuccess(type: PlayPauseType) {
        view?.playPauseSuccess(type: type)
    }
}
