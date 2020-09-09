//
//  ViewController.swift
//  LGPDBannerSample
//
//  Created by Tulio Bazan on 27/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

struct ViewControllerConstants {
    static let cellIdentifier = "cellIdentifier"
}

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .background
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = .zero
        tableView.estimatedSectionFooterHeight = .zero
        tableView.separatorColor = .lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        return tableView
    }()

    let items: [String] = (1...100).map { "\($0)" }

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .background
        self.view = view
        setupView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setNeedsStatusBarAppearanceUpdate()
    }

    private func setupView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ViewControllerConstants.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewControllerConstants.cellIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ViewController()
        controller.title = items[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
