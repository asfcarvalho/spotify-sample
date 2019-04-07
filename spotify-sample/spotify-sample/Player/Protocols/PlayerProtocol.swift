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
    
    func viewDidLoad()
    func showAlert(from view: UIViewController, message: String)
    func playPause(type: PlayPauseType)
}

protocol PlayerPresenterOutputProtocol {
    
    var presenter: PlayerPresenterInputProtocol? { get set }
    
    func onError(error: String)
    func showPlaying(playing: Playing)
    func playPauseSuccess(type: PlayPauseType)
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
    func onError(error: String)
    func showPlaying(playing: Playing)
}

protocol PlayPauseWorkerInputProtocol {
    var presenter: PlayPauseWorkerOutputProtocol? { get set }
    
    func playPauseFetch(type: PlayPauseType)
}

protocol PlayPauseWorkerOutputProtocol: class {
    func onError(error: String)
    func onSuccess(type: PlayPauseType)
}
