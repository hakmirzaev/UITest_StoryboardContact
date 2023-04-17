//
//  EditViewController.swift
//  StoryboardContact
//
//  Created by Bekhruz Hakmirzaev on 15/04/23.
//

import UIKit

class EditViewController: BaseViewController {

    var contact: Contact = Contact(name: "", phone: "")
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    func initView() {
        nameLabel.text = contact.name!
        phoneLabel.text = contact.phone!
        
        title = "Edit Contact"
    }

    @IBAction func saveButton(_ sender: Any) {
        if nameLabel.text != nil && phoneLabel.text != nil {
            showProgress()
            AFHttp.put(url: AFHttp.API_CONTACT_UPDATE + (contact.id)!, params: AFHttp.paramsContactCreate(contact: Contact(name: nameLabel.text!, phone: phoneLabel.text!)), handler: { response in
                self.hideProgress()
                switch response.result {
                case .success:
                    print(response.result)
                case let .failure(error):
                    print(error)
                }
            })
        }
        
        dismiss(animated: true, completion: nil)
    }
    

}
