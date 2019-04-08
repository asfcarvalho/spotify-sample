//
//  PlayerWireFrame.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class PlayerWireFrame: PlayerWireFrameProtocol {
    class func createViewController(uri: String?) -> UIViewController {
        
        var presenter: PlayerPresenterInputProtocol & PlayingWorkerOutputProtocol & PlayPauseWorkerOutputProtocol & DeviceWorkerOutputProtocol = PlayerPresenter()
        let wireFrame: PlayerWireFrameProtocol = PlayerWireFrame()
        var worker: PlayingWorkerInputProtocol = PlayingWork()
        var workerPlay: PlayPauseWorkerInputProtocol = PlayPauseWorker()
        var deviceWorker: DeviceWorkerInputProtocol = DevicesWork()
        
        let vc = PlayerViewController()
        vc.presenter = presenter
        presenter.worker = worker
        worker.presenter = presenter
        presenter.wireFrame = wireFrame
        presenter.view = vc
        presenter.workerPlay = workerPlay
        workerPlay.presenter = presenter
        presenter.deviceWorker = deviceWorker
        deviceWorker.presenter = presenter
        
        vc.uri = uri
        
        return vc
    }
    
    func showAlert(from view: UIViewController, message: String, completion: ((UIAlertAction) -> Void)?) {
        Alert.showAlert(from: view, message: message, completion: completion)
    }
    
    
}
