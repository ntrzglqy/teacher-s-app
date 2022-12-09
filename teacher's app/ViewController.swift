//
//  ViewController.swift
//  teacher's app
//
//  Created by tars on 2022/09/09.
//

import UIKit
import AVFoundation
import Foundation
import PhotosUI

var Strdatalist:String = " "
var datalist:[[String]] = [[]]



        

        


class ViewController: UIViewController  {
    override var prefersStatusBarHidden: Bool{
    return true
    }
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var DataResult: UILabel!
    


  
    var tapLocation: CGPoint = CGPoint()
    
   
 
    
    var Datail: [[String]] = [[]]
    var StrXtap:String = ""
    var StrYtap:String = ""
    var xTap:Double = 0.0
    var yTap:Double = 0.0
    var xTap1:Double = 0.0
    var subxTap1:String = ""
    var yTap1:Double = 0.0
    var subyTap1:String = ""
    var xTap2:Double = 0.0
    var subxTap2:String = ""
    var yTap2:Double = 0.0
    var subyTap2:String = ""
    var countdown:Int = 0
    let filename:String = "test"
    var Timer:Timer!
    var timecount:Int = 0
    
    

 
   
    
    
    override func viewDidLoad() {
        DataResult.isHidden = true
        let sample = UIImage(named: "test.png")
        image.image = sample
        let out_recognizer = UITapGestureRecognizer(target: self, action: #selector(output(_:)))
               out_recognizer.numberOfTouchesRequired = 3
               out_recognizer.numberOfTapsRequired = 2
               view.addGestureRecognizer(out_recognizer)
    }
    
   

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // タッチイベントを取得する
        let touch = touches.first
        // タップした座標を取得
        tapLocation = touch!.location(in: self.view)
        countdown = countdown+1
        if countdown == 1
        {
            xTap1 = tapLocation.x
            yTap1 = tapLocation.y
            StrXtap = String(xTap1)
            StrYtap = String(yTap1)
        }else if countdown == 2
        {
            xTap2 = tapLocation.x
            yTap2 = tapLocation.y
            StrXtap = String(xTap2)
            StrYtap = String(xTap2)
        }else
            {
            xTap = tapLocation.x
            yTap = tapLocation.y
            StrXtap = String(xTap)
            StrYtap = String(yTap)
            
        
         }
    }
    
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toController2" {
            let nextview = segue.destination as! ViewController2
            nextview.StrXtap = StrXtap
            nextview.StrYtap = StrYtap
            nextview.countdown = countdown
            nextview.subxTap1 = subxTap1
        }
    }
    
    @IBAction func output(_ gesture: UIGestureRecognizer){
        guard gesture.state == .ended else {
            return
        }

        createFile(fileName: filename, fileArrData:datalist )
    }
    
    
    func createFile(fileName : String, fileArrData : [[String]]){
        let filePath = NSHomeDirectory() + "/Documents/" + fileName + ".csv"
        print(filePath)
        var fileStrData:String = ""
        
        //StringのCSV用データを準備
        for singleArray in fileArrData{
            for singleString in singleArray{
                fileStrData += "\"" + singleString + "\""
                if singleString != singleArray[singleArray.count-1]{
                    fileStrData += ","
                }
            }
            fileStrData += "\n"
        }
        print(fileStrData)
        
        do{
            try fileStrData.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
            print("Success to Wite the File")
            DataResult.isHidden = false
        }catch let error as NSError{
            print("Failure to Write File\n\(error)")
        }
        
    }
//    private lazy var picker: PHPickerViewController = {
//    var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
//    configuration.filter = .images
//    configuration.selectionLimit = 1
//    let picker = PHPickerViewController(configuration: configuration)
//    picker.delegate = self
//    return picker
//    }()
//
//
//
//        present(picker, animated: true, completion: nil)
//    }
//
//    extension ViewController: PHPickerViewControllerDelegate {
//    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//    results.forEach { result in
//        result.itemProvider.loadObject(ofClass: UIImage.self){ [weak self] item, error in
//            if let error = error {
//                debugPrint(error.localizedDescription)
//            }else if let image = item as? UIImage {
//                DispatchQueue.main.async {
//                    self?.View.image = image
//                }
//            }
//        }
//    }
//    }
    }

     
    

