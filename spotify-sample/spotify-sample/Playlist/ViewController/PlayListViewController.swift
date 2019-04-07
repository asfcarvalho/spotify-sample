//
//  PlayListViewController.swift
//  spotify-sample
//
//  Created by Anderson Carvalho on 05/04/19.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

enum ListType {
    case artist,
    track,
    search
}

class PlayListViewController: UIViewController {
    
    var presenter: PlaylistPresenterInputProtocol?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    fileprivate var playlist: Playlist?
    fileprivate var search: Search?
    fileprivate var searchPlaylist: SearchPlaylist?
    fileprivate let CELL = "cell"
    fileprivate var type: ListType = ListType.track

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()

        tableView.register(PlaylistTableViewCell.self, forCellReuseIdentifier: CELL)
        tableView.dataSource = self
        tableView.delegate = self
        
        searchBar.delegate = self
        
        DevicesWork().devicesFetch()
    }
}

extension PlayListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        self.presenter?.searchArtist(text: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
}

extension PlayListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if type == ListType.artist {
            let artistId = search?.artists.items[indexPath.row].id ?? ""
            self.presenter?.searchPlaylist(artistId: artistId)
        }else if type == ListType.search {
            let play = PlayerWireFrame.createViewController()
            self.present(play, animated: true, completion: nil)
        }else {
            let play = PlayerWireFrame.createViewController()
            self.present(play, animated: true, completion: nil)
        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if type == ListType.artist {
            return search?.artists.items.count ?? 0
        }
        if type == ListType.search {
            return searchPlaylist?.tracks?.count ?? 0
        }
        return playlist?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CELL) as? PlaylistTableViewCell else {
            return UITableViewCell()
        }
        
        var image: String?
        var albumName: String?
        var artistName: String?
        var musicName: String?
        var duration: Int?
        
        if type == ListType.artist {
            let artist = search?.artists.items[indexPath.row]
            image = artist?.images?.last?.url
        }else if type == ListType.search {
            let search = searchPlaylist?.tracks?[indexPath.row]
            image = search?.album?.images?.last?.url
            albumName = search?.album?.name
            artistName = search?.artists?.first?.name
            musicName = search?.name
            duration = search?.durationMS
        }else {
            let playlist = self.playlist?.items[indexPath.row]
            image = playlist?.images?.last?.url
            albumName = playlist?.album?.name
            musicName = playlist?.name
            duration = playlist?.durationMS
        }
//        cell.awakeFromNib()
        cell.setupCell(image: image, albumName: albumName, artistName: artistName, musicName: musicName, duration: duration)
        
        return cell
    }
    
    
}

extension PlayListViewController: PlaylistViewControllerProtocol {
    func showSearchArtist(search: Search) {
        self.type = ListType.artist
        self.search = search
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func onError(error: String) {
        self.presenter?.showAlert(message: error)
    }
    
    func showPlaylist(playlist: Playlist) {
        self.type = ListType.track
        self.playlist = playlist
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func showSearchPlaylist(playlist: SearchPlaylist) {
        self.type = ListType.search
        self.searchPlaylist = playlist
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showLoading() {
        Loading.showLoading(self.view)
    }
    
    func stopLoading() {
        Loading.stopLoading()
    }
    
    
}
