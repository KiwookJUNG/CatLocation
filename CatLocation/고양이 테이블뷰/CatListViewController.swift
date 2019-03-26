//
//  CatListViewController.swift
//  CatLocation
//
//  Created by 정기욱 on 19/03/2019.
//  Copyright © 2019 Kiwook. All rights reserved.
//

import UIKit

class CatListViewController : UITableViewController {
    
    //튜플 아이템으로 구성된 데이터 세트
    var catset = [
      ("누누", "검은고양이", true, "Nunu.jpeg", "집고양이", 37.339483, 127.271739),
      ("루이", "고등어태비고양이", true, "Lui.jpeg", "집고양이", 37.339483, 127.271739),
      ("아이노시마", "흰색고양이", false, "White.jpeg", "길고양이", 37.339483, 127.271739),
      ("로묘", "턱시도고양이", true, "Romyo.jpeg", "길고양이", 37.339483, 127.271739),
      ("요르", "턱시도고양이", false, "Yor.jpeg", "길고양이", 37.339483, 127.271739),
      ("요디", "삼색고양이", false, "Yodi.jpeg", "길고양이", 37.339483, 127.271739),
      ("묘니", "점박이고양이", false, "Myoni.jpeg", "길고양이", 37.339483, 127.271739),
      ("리르", "치즈고양이", false, "Rir.jpeg", "길고양이", 37.339483, 127.271739),
      ("프링", "치즈고양이", false, "Pring.jpeg", "길고양이", 37.339483, 127.271739)
    ]
    
    lazy var list: [CatVO] = {
        var catlist = [CatVO]()
        for (name, description, tnr, img, territory, lati, longi) in self.catset {
            let cvo = CatVO()
            cvo.catName = name
            cvo.catDescription = description
            cvo.tnrIs = tnr
            cvo.catImg = img
            cvo.territory = territory
            cvo.latitude = lati
            cvo.longitude = longi
            
            catlist.append(cvo)
        }
        return catlist
    }()
    
    
    override func viewDidLoad() {
   
        // 네비게이션 타이틀의 색을 바꿔줌
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        // 네비게이션 바의 배경을 바꿔줌.
        self.navigationController?.navigationBar.barTintColor = UIColor(red:1.00, green:0.54, blue:0.00, alpha:1.0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatListCell") as! CatCell
        
        cell.catImg.image = UIImage(named: row.catImg!)
        cell.catName?.text = "이름: \(row.catName!)"
        cell.catDescription?.text = "종류: \(row.catDescription!)"
        cell.tnrIs?.text = row.tnrIs == true ? "TNR : O" : "TNR : X"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            // 사용자가 클릭한 행을 찾아낸다.
            let path = self.tableView.indexPath(for: sender as! CatCell)
            
            let detailInfo = segue.destination as? CatDetailViewController
            detailInfo?.cvo = self.list[path!.row]
        }
    }
    
    
}
