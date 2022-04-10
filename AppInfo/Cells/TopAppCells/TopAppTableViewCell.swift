//
//  TopAppTableViewCell.swift
//  AppInfo
//
//  Created by Sergey Runovich on 10.04.22.
//

import UIKit

class TopAppTableViewCell: UITableViewCell {

    @IBOutlet private weak var mainCollectionView:
        UICollectionView! {
        didSet {
            mainCollectionView.register(TopAppCollectionViewCell.self)
            mainCollectionView.delegate = self
            mainCollectionView.dataSource = self
        }
    }
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    let dataFetcherService = DataFetcherService()
    var appResult: [AppResult] = []


    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetcherData()
    }

    private func fetcherData() {
        dataFetcherService.fetchTopApplication { [weak self] app in
            guard let strongSelf = self, let results = app?.feed.results else { return }

            strongSelf.appResult = results

            DispatchQueue.main.async {
                strongSelf.mainCollectionView.reloadData()
                strongSelf.activityIndicator.stopAnimating()
            }
        }
    }
}

extension TopAppTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        appResult.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(TopAppCollectionViewCell.self, for: indexPath)
        cell?.configure(item: appResult[indexPath.row])

        return cell ?? UICollectionViewCell()
    }
}
