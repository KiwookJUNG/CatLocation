//
//  CatDetailViewController.swift
//  CatLocation
//
//  Created by 정기욱 on 20/03/2019.
//  Copyright © 2019 Kiwook. All rights reserved.
//

import UIKit
import QuartzCore

class CatDetailViewController: UIViewController {
    
    var cvo: CatVO!
    var tnrString = ""
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var terriotry: UILabel!
    
    @IBOutlet weak var info: UILabel!
    
   
    
    override func viewDidLoad() {
        self.navigationItem.title = cvo.catName
        self.img.image = UIImage(named: String(cvo.catImg!))
        self.terriotry.text = cvo.territory!
        self.terriotry.layer.masksToBounds = true
        self.terriotry.layer.cornerRadius = 5
        
        if cvo.tnrIs == true {
            tnrString = "O"
        } else {
            tnrString = "X"
        }
        
        self.info.text = "이름: \(cvo.catName!)/ 종류: \(cvo.catDescription!)/ 중성화여부 : \(self.tnrString) "
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapSegue" {
            // 사용자가 클릭한 행을 찾아낸다.
            
            
            let detailInfo = segue.destination as? DetailLocationViewController
            detailInfo?.cvo = self.cvo
        }
    }
    
}
