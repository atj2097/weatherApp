//
//  FavoritesViewController.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
 var favoriteView = FavView()
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteView.backgroundColor = .white
        addViews()
        // Do any additional setup after loading the view.
    }
    func addViews() {
        self.view.addSubview(favoriteView)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
