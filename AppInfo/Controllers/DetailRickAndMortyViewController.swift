//
//  DetailRickAndMortyViewController.swift
//  AppInfo
//
//  Created by Sergey Runovich on 10.04.22.
//

import UIKit

class DetailRickAndMortyViewController: UIViewController {

    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var locationNameLabel: UILabel!
    @IBOutlet private weak var imagePersonImageView: UIImageView!

    var personInfo: Info?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchImage()
    }

    private func configure() {
        idLabel.text = "id: \(personInfo?.id ?? 0)"
        locationNameLabel.text = personInfo?.location?.name
    }

    private func fetchImage() {
        guard let url = URL(string: personInfo?.image ?? "" ) else { return }

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
