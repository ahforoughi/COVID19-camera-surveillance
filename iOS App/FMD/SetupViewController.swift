//
//  SetupViewController.swift
//  FMD
//
//  Created by ali on 11/1/20.
//

import UIKit

class SetupViewController: UIViewController {
    
    @IBOutlet weak var portTextField: UITextField!
    @IBOutlet weak var ipTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    
    
    @IBAction func startButtonDidTap(_ sender: Any) {
        
        guard let port = portTextField.text, port != "" else {
            return
        }
        
        guard let server = ipTextField.text, server != "" else {
            return
        }
        
        performSegue(withIdentifier: "StartSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StartSegue" {
            if let vc = segue.destination as? WebviewViewController {
                vc.IP = ipTextField.text ?? ""
                vc.port = portTextField.text ?? ""
            }
        }
    }
    
}
