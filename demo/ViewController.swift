//
//  ViewController.swift
//  demo
//
//  Created by Mizanur Remon on 3/10/20.
//

import UIKit
import Alamofire


final class ViewController: UIViewController {

    private let url = "https://jsonplaceholder.typicode.com"

    @IBOutlet private weak var tableview: UITableView!

    var photos: [Photo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.rowHeight = UITableView.automaticDimension
        self.tableview.estimatedRowHeight = 44

        self.tableview.register(UINib(nibName: "PhotoTableViewCell", bundle: Bundle(for: PhotoTableViewCell.self)), forCellReuseIdentifier: "PhotoTableViewCell")

        self.fetchData()
    }

    func fetchData() {
        DispatchQueue.main.async {
            AF.request(self.url + "/photos", method: .get).responseDecodable(of: [Photo].self) { (response) in

                switch response.result {
                case .success(let value):
                    
                    self.photos = value
                    self.tableview.reloadData()

                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }


}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as? PhotoTableViewCell {

            cell.photo = self.photos[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

