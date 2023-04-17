//
//  CreateViewController.swift
//  StoryboardContact
//
//  Created by Bekhruz Hakmirzaev on 15/04/23.
//

import UIKit

class CreateViewController: BaseViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

    func initView() {
        title = "Create Contact"
    }
    
    @IBAction func createButton(_ sender: Any) {
        if nameLabel.text != nil && phoneLabel.text != nil {
            showProgress()
            AFHttp.post(url: AFHttp.API_CONTACT_CREATE, params: AFHttp.paramsContactCreate(contact: Contact(name: nameLabel.text!, phone: phoneLabel.text!)), handler: { response in
                self.hideProgress()
                switch response.result {
                case .success:
                    print(response.result)
                    self.navigationController?.popViewController(animated: true)
                case let .failure(error):
                    print(error)
                }
            })
        }
    }
    

}
