//
//  CheckOutViewController.swift
//  examApp
//
//  Created by APPLE on 28.12.21.
//

import UIKit

class CheckOutViewController: UIViewController {
    
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var comissionLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    
    var brandsArray : [Brand]!
    var carSet = Set<String>()
    var sumOfPrice : Int = 0
    @IBOutlet weak var checkOutTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
         brandsArray = brandsArray.filter { $0.amount > 0 }
        for i in brandsArray {
            carSet.insert(i.make)
            sumOfPrice = sumOfPrice + (i.amount * i.price)
            
        }
        totalPrice.text = "\(sumOfPrice)" + "$"
        serviceLabel.text = "\(sumOfPrice / 100)" + "$"
    }
    
    @IBAction func paymentButtonDidTap(_ sender: Any) {
        if sumOfPrice > 200000 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "SuccessfulPaymentViewController") as! SuccessfulPaymentViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "FailPaymentViewController") as! FailPaymentViewController
            self.present(vc, animated: true, completion: nil)
        }
        
    }
}


extension CheckOutViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var car : Int = 0
        
        for i in 0..<brandsArray.count {
                if brandsArray[i].make == Array(carSet)[section] {
                    car += 1
                }
        }
        return car
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckOutCell", for: indexPath) as! CheckOutCell
        let b = brandsArray.filter { $0.make == Array(carSet)[indexPath.section]}
        let currentCar = b[indexPath.row]

                    cell.priceLabel.text = "\(currentCar.price!)" + "$"
        cell.carName.text = "\(currentCar.make!)" + "\(currentCar.model!)"
                    cell.horsePower.text = "\(currentCar.horsepower!)"
                    cell.carAmount.text = "\(currentCar.amount)" + "x"
                    cell.totalPriceLabel.text = "სულ" + " " + "\(currentCar.price * currentCar.amount)" + "$"
        cell.carImageview.image = UIImage.init(named: currentCar.img_url)
        
        

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        carSet.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

