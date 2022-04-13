//
//  RickAndMortyViewController.swift
//  AppInfo
//
//  Created by Sergey Runovich on 9.04.22.
//

import UIKit

class RickAndMortyViewController: UIViewController {

    @IBOutlet weak var tabeView: UITableView!

    var personInfo: [Info] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        alamofireFetcherData()
    }

    private func registerCell() {
        tabeView.register(RickAndMortyUITableViewCell.self)
    }

    func alamofireFetcherData() {
        NetworkManager.shared.fetchDataWithAlamofire(Link.rickAndMortyURL.rawValue) { result in
            switch result {
            case .success(let hero):
                self.personInfo = hero
                self.tabeView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RickAndMortyViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(RickAndMortyUITableViewCell.self, for: indexPath)
        cell?.configure(item: personInfo[indexPath.row])

        return cell ?? UITableViewCell()
    }
}

extension RickAndMortyViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as! DetailRickAndMortyViewController
        detailVC.personInfo = personInfo[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
