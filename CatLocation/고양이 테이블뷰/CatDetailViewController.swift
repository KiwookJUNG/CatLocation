//
//  CatDetailViewController.swift
//  CatLocation
//
//  Created by 정기욱 on 20/03/2019.
//  Copyright © 2019 Kiwook. All rights reserved.
//

import UIKit
import QuartzCore

class CatDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var cvo: CatVO!
    var tnrString = ""
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var terriotry: UILabel!
    
    @IBOutlet weak var info: UILabel!
    
   
    @IBAction func catAdd(_ sender: Any) {
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true
        
        // 델리게이트 지정
        picker.delegate = self
        
        // 이미지 피커 컨트롤러 실행
        self.present(picker, animated: false)
    }
    
    // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false) { () in
            
            // 알림창 호출
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        }
        
        
    }
    
    // 이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false) { () in
            // 선택된 이미지를 UIImage로 타입 캐스팅한 후 img 변수에 담아줌.
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            
            // UIImage 타입의 img를 pngData인 Data타입으로 변환해줌.
            let data = img?.pngData()
            // data를 CVO data 배열에 담아준다.
            self.cvo.images.append(data!)
            
            //let selectedimg = self.cvo.images[0]
            //self.img.image = UIImage(data: selectedimg)
        }
    }
    
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
    
    // 화면이 전환될때 세그웨이를 이용해서 cvo를 DetailLocationViewController에 대입해준다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapSegue" {
            // 사용자가 클릭한 행을 찾아낸다.
            
            
            let detailInfo = segue.destination as? DetailLocationViewController
            detailInfo?.cvo = self.cvo
        }
    }
    
}
