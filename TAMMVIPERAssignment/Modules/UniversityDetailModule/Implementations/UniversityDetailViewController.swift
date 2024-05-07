//
//  UniversityDetailViewController.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import UIKit

class UniversityDetailViewController: UIViewController, UniversityDetailView {
    
    var presenter: UniversityDetailPresenterImp?
    
    
    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    @IBOutlet weak var universityCountryLabel: UILabel!
    @IBOutlet weak var universityWebPageLabel: UILabel!
    @IBOutlet weak var universityCountryCodeLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func configureUI() {
        
        mainView.layer.masksToBounds = false
        mainView.layer.shadowColor = UIColor.shadow.cgColor
        mainView.layer.shadowOpacity = 0.5
        mainView.layer.shadowOffset = CGSize(width: 0, height: 0)
        mainView.layer.shadowRadius = 1
        mainView.layer.cornerRadius = 20
        
        universityNameLabel.text = self.presenter?.universityData?.name
        universityStateLabel.text = self.presenter?.universityData?.stateprovince
        universityCountryLabel.text = self.presenter?.universityData?.country
        universityWebPageLabel.text = self.presenter?.universityData?.webPages.first
        universityCountryCodeLabel.text = self.presenter?.universityData?.alphaTwoCode
    }

}
