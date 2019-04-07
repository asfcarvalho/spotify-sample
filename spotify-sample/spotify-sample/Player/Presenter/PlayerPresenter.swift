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
    var deviceWorker: DeviceWorkerInputProtocol?
    var wireFrame: PlayerWireFrameProtocol?
    var worker: PlayingWorkerInputProtocol?
    fileprivate var uri: String?
    fileprivate var deviceId: String?
    
    func viewDidLoad(uri: String) {
        view?.showLoading()
        
        self.uri = uri
        
        deviceWorker?.devicesFetch()
    }
    
    func showAlert(from view: UIViewController, message: String, completion: ((UIAlertAction) -> Void)?) {
        wireFrame?.showAlert(from: view, message: message, completion: completion)
    }
    
    func playPause(type: PlayPauseType, positionMS: Int?) {
        workerPlay?.playPauseFetch(type: type, uri: uri, deviceId: deviceId, positionMS: positionMS)
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
        self.worker?.playingFetch()
        
        
        
    }
}

extension PlayerPresenter: DeviceWorkerOutputProtocol {
    func noDevices() {
        view?.stopLoading()
        view?.noDevice(error: "No Devices to play song")
    }
    
    func showDevices(device: Device) {
        self.deviceId = device.id
        workerPlay?.playPauseFetch(type: PlayPauseType.play, uri: uri, deviceId: deviceId, positionMS: 0)
        
        print(device.type)
    }
    
    
}
