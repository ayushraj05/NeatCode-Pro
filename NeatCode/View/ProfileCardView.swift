//
//  ProfileCardView.swift
//  NeatCode
//
//  Created by Ayush Rajpal on 23/05/25.
//


import UIKit

class ProfileCardView: UIView {
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let rankingLabel = UILabel()
    private let contributionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(.black)
        layer.cornerRadius = 12
        setupSubviews()
    }
    required init?(coder: NSCoder) { fatalError() }

    private func setupSubviews() {
        [imageView, nameLabel, rankingLabel, contributionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .white
        rankingLabel.font = .systemFont(ofSize: 14)
        rankingLabel.textColor = .lightGray
        contributionLabel.font = .systemFont(ofSize: 14)
        contributionLabel.textColor = .lightGray

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),

            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            rankingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            rankingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            rankingLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            contributionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contributionLabel.topAnchor.constraint(equalTo: rankingLabel.bottomAnchor, constant: 4),
            contributionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            contributionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    
    func configure(with viewModel: ProfileViewModel) {
        nameLabel.text = viewModel.usernameText
        rankingLabel.text = viewModel.rankingText
        contributionLabel.text = viewModel.contributionText
        if let url = viewModel.avatarURL {
            // Simple async image load
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else { return }
                DispatchQueue.main.async { self.imageView.image = UIImage(data: data) }
            }.resume()
        }
    }
}
