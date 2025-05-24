//
//  ProfileViewController.swift
//  NeatCode
//
//  Created by Ayush Rajpal on 24/05/25.
//

import UIKit

class ProfileViewController: UIViewController {
    private let viewModel: ProfileViewModel
    private let cardView = ProfileCardView()
    private let totalLabel = UILabel()
    private let chartView = PieChartView()

    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#121212")
        title = "Profile"
        setupLayout()
        cardView.configure(with: viewModel)
        totalLabel.text = viewModel.totalSolvedText
        chartView.data = viewModel.breakdownValues
    }

    private func setupLayout() {
        [cardView, totalLabel, chartView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        totalLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        totalLabel.textColor = .white

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardView.heightAnchor.constraint(equalToConstant: 120),

            totalLabel.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 24),
            totalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            chartView.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 16),
            chartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chartView.widthAnchor.constraint(equalToConstant: 200),
            chartView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
