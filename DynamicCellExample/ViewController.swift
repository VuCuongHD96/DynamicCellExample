//
//  ViewController.swift
//  DynamicCellExample
//
//  Created by Work on 26/12/2022.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
//        collectionView.regis
        let nib = UINib(nibName: "StringCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "StringCell")
        let nib2 = UINib(nibName: "NumberCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "NumberCell")

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "StringCell", for: indexPath) as? StringCell {
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell", for: indexPath) as? NumberCell {
                return cell
            } else {
                return UITableViewCell()
            }
        }
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StringCell", for: indexPath) as? StringCell else {
//            return UITableViewCell() }
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell", for: indexPath) as? NumberCell else {
//            return UITableViewCell() }
//        return cell
        
    }
    
}
 
extension ViewController: UITableViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 300, height: 300)
//    }
}


protocol Dynamic {
    associatedtype Data
    var data: Data { get }
    init(data: Data)
    
}

extension Dynamic {
    func showData() {
        print("---- debug ---- data = ", data)
    }
}

class Green: Dynamic {
    
    typealias Data = String
    var data: String
    
    required init(data: String) {
        self.data = data
    }
}
                
class Yellow: Dynamic {
    typealias Data = Int
    var data: Int

    required init(data: Int) {
        self.data = data
    }
}

let green = Green(data: "Green")

let yellow = Yellow(data: 10)


let array: [any Dynamic] = [green, yellow]

array[0].data

array.forEach {
    $0.showData()
}
