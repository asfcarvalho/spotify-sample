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
    var workerPlay: PlayPauseWorkerInputProtocol? { get set }
    var deviceWorker: DeviceWorkerInputProtocol? { get set }
    
    func viewDidLoad(uri: String)    
    func showAlert(from view: UIViewController, message: String, completion: ((UIAlertAction) -> Void)?)
    func playPause(type: PlayPauseType, positionMS: Int?)
}

protocol PlayerPresenterOutputProtocol {
    
    var presenter: PlayerPresenterInputProtocol? { get set }
    
    func onError(error: String)
    func showPlaying(playing: Playing)
    func playPauseSuccess(type: PlayPauseType)
    func showLoading()
    func stopLoading()
    func noDevice(error: String)
//    func showDevice(device: )
}

protocol PlayerWireFrameProtocol {
    static func createViewController(uri: String?) -> UIViewController
    
    func showAlert(from view: UIViewController, message: String, completion: ((UIAlertAction) -> Void)?)
}

protocol PlayingWorkerInputProtocol {
    var presenter: PlayingWorkerOutputProtocol? { get set }
    
    func playingFetch()
}

protocol PlayingWorkerOutputProtocol: class {
    func onError(error: String)
    func showPlaying(playing: Playing)
}

protocol PlayPauseWorkerInputProtocol {
    var presenter: PlayPauseWorkerOutputProtocol? { get set }
    
    func playPauseFetch(type: PlayPauseType, uri: String?, deviceId: String?, positionMS: Int?)
}

protocol PlayPauseWorkerOutputProtocol: class {
    func onError(error: String)
    func onSuccess(type: PlayPauseType)
}

protocol DeviceWorkerInputProtocol {
    var presenter: DeviceWorkerOutputProtocol? { get set }
    
    func devicesFetch()
}

protocol DeviceWorkerOutputProtocol {
    func noDevices()
    func onError(error: String)
    func showDevices(device: Device)
}
