//
//  RickAndMortyUITableViewCell.swift
//  AppInfo
//
//  Created by Sergey Runovich on 9.04.22.
//

import UIKit

class RickAndMortyUITableViewCell: UITableViewCell {

    @IBOutlet private weak var imagePersonImageView: UIImageView!
    @IBOutlet private weak var namePersonLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!

    func configure(item: Info) {
        namePersonLabel.text = item.name
        genderLabel.text = item.gender
        fetchImage(item: item)
    }

    private func fetchImage(item: Info) {
        guard let url = URL(string: item.image ?? "") else { return }

        NetworkManager.shared.fetchImage(from: "\(url)") { result in
            switch result {
            case .success(let data):
                self.imagePersonImageView.image = UIImage(data: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
