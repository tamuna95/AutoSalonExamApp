//
//  SuccessfulPaymentViewController.swift
//  examApp
//
//  Created by APPLE on 30.12.21.
//

import UIKit

class SuccessfulPaymentViewController: UIViewController {

    @IBOutlet weak var successImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getBackButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BrandsViewController") as! BrandsViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.clearData()
        
    
}
}
