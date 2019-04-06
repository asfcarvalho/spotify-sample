//
//  PlayerWireFrame.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class PlayerWireFrame: PlayerWireFrameProtocol {
    class func createViewController() -> UIViewController {
        
        var presenter: PlayerPresenterInputProtocol & PlayingWorkerOutputProtocol = PlayerPresenter()
        let wireFrame: PlayerWireFrameProtocol = PlayerWireFrame()
        var worker: PlayingWorkerInputProtocol = PlayingWork()
        
        let vc = PlayerViewController()
        vc.presenter = presenter
        presenter.worker = worker
        worker.presenter = presenter
        presenter.wireFrame = wireFrame
        presenter.view = vc
        
        return vc
    }
    
    func showAlert(from view: UIViewController, message: String) {
        Alert.showAlert(from: view, message: message)
    }
    
    
}
