//
//  RickAndMortyViewController.swift
//  AppInfo
//
//  Created by Sergey Runovich on 9.04.22.
//

import UIKit

class RickAndMortyViewController: UIViewController {

    @IBOutlet weak var tabeView: UITableView!

    var dataFetcherService = DataFetcherService()
    var personInfo: [Results] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        fetcherData()
    }

    private func registerCell() {
        tabeView.register(RickAndMortyUITableViewCell.self)
    }

    private func fetcherData() {
        dataFetcherService.fetchInfoHeroes {[weak self] heroes in
            guard let strongSelf = self, let results = heroes?.results else { return }

            strongSelf.personInfo = results

            DispatchQueue.main.async {
                strongSelf.tabeView.reloadData()
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
