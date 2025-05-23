// ViewControllers/UserInputViewController.swift
import UIKit

class UserInputViewController: UIViewController {
    private let textField = UITextField()
    private let fetchButton = UIButton(type: .system)
    private let spinner = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#121212")
        title = "LeetCode Stats"
        setupViews()
    }

    private func setupViews() {
        textField.placeholder = "Enter LeetCode username"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false

        fetchButton.setTitle("Fetch Data", for: .normal)
        fetchButton.tintColor = UIColor(hex: "#FFC107")
        fetchButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        fetchButton.addTarget(self, action: #selector(fetchTapped), for: .touchUpInside)

        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false

        [textField, fetchButton, spinner].forEach { view.addSubview($0) }
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fetchButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),

            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.topAnchor.constraint(equalTo: fetchButton.bottomAnchor, constant: 20)
        ])
    }

    @objc private func fetchTapped() {
        guard let username = textField.text, !username.isEmpty else { return }
        fetchButton.isEnabled = false
        spinner.startAnimating()

        LeetCodeService.shared.fetchProfile(username: username) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.spinner.stopAnimating()
                self.fetchButton.isEnabled = true
                switch result {
                case .success(let profile):
                    let vm = ProfileViewModel(profile: profile)
                    let vc = ProfileViewController(viewModel: vm)
                    self.navigationController?.pushViewController(vc, animated: true)
                case .failure:
                    let alert = UIAlertController(title: "Error", message: "Invalid username or network issue.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
    }
}