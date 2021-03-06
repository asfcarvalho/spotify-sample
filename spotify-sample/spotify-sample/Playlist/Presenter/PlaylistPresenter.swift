//
//  PlaylistPresenter.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class PlaylistPresenter: PlaylistPresenterInputProtocol {
    var wireFrame: PlaylistWireframeProtocol?
    var worker: PlaylistWorkerInputProtocol?
    var view: PlaylistViewControllerProtocol?
    var workerSearch: SearchPlaylistWorkInputProtocol?
    var workPopularity: SearchPopularityWorkInputProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        worker?.spotifyPlaylistFetch()
    }
    
    func showAlert(message: String) {
        wireFrame?.showAlert(from: (view as? UIViewController), message: message)
    }
    
    func searchArtist(text: String) {
        view?.showLoading()
        workerSearch?.searchPlaylistFetch(text: text)
    }
    
    func searchPlaylist(artistId: String) {
        view?.showLoading()
        workPopularity?.searchPopularityFetch(artist: artistId)
    }
    
    func showPlayer(uri: String) {
        wireFrame?.showPlayer(from: view as? UIViewController, uri: uri)
    }
}

extension  PlaylistPresenter: PlaylistWorkerOutputProtocol {
    func onError(error: String) {
        view?.stopLoading()
        view?.onError(error: error)
    }
    
    func showPlaylist(playlist: Playlist) {
        
        view?.showPlaylist(playlist: playlist)
        view?.stopLoading()
    }
}

extension  PlaylistPresenter: SearchPlaylistWorkOutputProtocol {
    func showSearchPlaylist(search: Search) {
        
        view?.showSearchArtist(search: search)
        view?.stopLoading()
    }
}

extension PlaylistPresenter: SearchPopularityWorkOutputProtocol {
    func showSearchPopularity(playlist: SearchPlaylist) {
        var playlistResult = playlist
        let playlistOrder = playlist.tracks?.sorted(by: { (item, item1) -> Bool in
            return item.popularity ?? 0 < item1.popularity ?? 0
        })
        if let array = playlistOrder?.prefix(10) {
            playlistResult.tracks = Array(array)
            view?.showSearchPlaylist(playlist: playlistResult)
        }
        view?.stopLoading()
            
    }
}

