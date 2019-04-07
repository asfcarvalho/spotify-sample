//
//  PlaylistWireframe.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class PlaylistWireframe: PlaylistWireframeProtocol {

    static func createViewController() -> UIViewController {
        
        var presenter: PlaylistPresenterInputProtocol & PlaylistWorkerOutputProtocol & SearchPlaylistWorkOutputProtocol & SearchPopularityWorkOutputProtocol = PlaylistPresenter()
        var worker: PlaylistWorkerInputProtocol = PlaylistWork()
        let wireFrame: PlaylistWireframeProtocol = PlaylistWireframe()
        var workerSearch: SearchPlaylistWorkInputProtocol = SearchPlaylistWork()
        var workPopularity: SearchPopularityWorkInputProtocol = SearchPopularityWork()
        
        let vc = PlayListViewController()
        vc.presenter = presenter
        presenter.view = vc
        presenter.wireFrame = wireFrame
        presenter.worker = worker
        worker.presenter = presenter
        presenter.workerSearch = workerSearch
        workerSearch.presenter = presenter
        presenter.workPopularity = workPopularity
        workPopularity.presenter = presenter
        
        return vc
        
    }
    
    func showPlayer(from view: UIViewController?, uri: String?) {
        let play = PlayerWireFrame.createViewController(uri: uri)
        view?.present(play, animated: true, completion: nil)
    }
    
    func showAlert(from view: UIViewController?, message: String) {
        Alert.showAlert(from: view, message: message, completion: nil)
    }
}
