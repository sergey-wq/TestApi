//
//  TopAppCollectionViewCell.swift
//  AppInfo
//
//  Created by Sergey Runovich on 10.04.22.
//

import UIKit


class TopAppCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topAppImageView: UIImageView!
    @IBOutlet weak var topAppName: UILabel!

    func configure(item: AppResult) {
        topAppName.text = item.name
        fetchImage(item: item)
    }

    private func fetchImage(item: AppResult) {
        guard let url = URL(string: item.artworkUrl100 ?? "") else { return }

        NetworkManager.shared.fetchImage(from: "\(url)") { result in
            switch result {
            case .success(let data):
                self.topAppImageView.image = UIImage(data: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
