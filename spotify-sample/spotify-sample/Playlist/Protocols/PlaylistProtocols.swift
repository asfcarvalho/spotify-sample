//
//  SpotifySampleProtocols.swift
//  spotify-sample
//
//  Created by Anderson Carvalho on 05/04/19.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

//view->presenter
//presenter->worker
//worker-presenter
//presetner->view

protocol PlaylistPresenterInputProtocol {
    var worker: PlaylistWorkerInputProtocol? { get set }
    var view: PlaylistViewControllerProtocol? { get set }
    var wireFrame: PlaylistWireframeProtocol? { get set }
    var workerSearch: SearchPlaylistWorkInputProtocol? { get set }
    var workPopularity: SearchPopularityWorkInputProtocol? { get set }
    
    //view->presenter
    func viewDidLoad()
    func showAlert(message: String)
    func searchArtist(text: String)
    func searchPlaylist(artistId: String)
}

protocol SearchPlaylistWorkInputProtocol {
    var presenter: SearchPlaylistWorkOutputProtocol? { get set}
    
    //presenter -> work
    func searchPlaylistFetch(text: String)
}

protocol SearchPlaylistWorkOutputProtocol: class {
    
    //work->presenter
    func onError(error: String)
    func showSearchPlaylist(search: Search)
}

protocol SearchPopularityWorkInputProtocol {
    var presenter: SearchPopularityWorkOutputProtocol? { get set }
    
    //presenter-> work
    func searchPopularityFetch(artist: String)
}

protocol SearchPopularityWorkOutputProtocol: class {
    //work->presenter
    func showSearchPopularity(playlist: SearchPlaylist)
    func onError(error: String)
}

protocol PlaylistWireframeProtocol {
    static func createViewController() -> UIViewController
    func showPlayer()
    func showAlert(from view: UIViewController?, message: String)
}

protocol PlaylistWorkerInputProtocol {
    var presenter: PlaylistWorkerOutputProtocol? { get set }
    
    //presenter->worker
    func spotifyPlaylistFetch()
}

protocol PlaylistWorkerOutputProtocol: class {
    //worker-presenter
    func onError(error: String)
    func showPlaylist(playlist: Playlist)
}

protocol PlaylistViewControllerProtocol {
    
    var presenter: PlaylistPresenterInputProtocol? { get set }
    
    //presenter -> view
    func onError(error: String)
    func showPlaylist(playlist: Playlist)
    func showSearchPlaylist(playlist: SearchPlaylist)
    func showSearchArtist(search: Search)
    func showLoading()
    func stopLoading()
}
