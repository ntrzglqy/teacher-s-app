//
//  ViewController2.swift
//  teacher's app
//
//  Created by tars on 2022/09/27.
//

import UIKit
import AVFoundation
import Foundation


class ViewController2: UIViewController {
    
    override var prefersStatusBarHidden: Bool{
    return true
    }
   
    
    var StrXtap:String = ""
    var StrYtap:String = ""
    var countdown:Int = 0
    var subxTap1:String = ""
    var Strdatalist:String = ""
    var Data1:String = ""
    var Data2:String = ""
    var Data3:String = ""
    var subcount:Int = 0
    var Strsubcount:String = ""
    let filename:String = "test"
   
    
    @IBOutlet weak var Xfield: UILabel!
    @IBOutlet weak var Yfield: UILabel!
    

    @IBOutlet weak var Text1: UITextField!
    @IBOutlet weak var Text2: UITextField!
    @IBOutlet weak var Text3: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Xfield.text = "X="+StrXtap
        Yfield.text = "Y="+StrYtap
        if countdown == 1
        {
            Text1.isHidden = true
            Text2.isHidden = true
            Text3.isHidden = true
    
        }
            else if countdown == 2
        {
            Text1.isHidden = true
            Text2.isHidden = true
            Text3.isHidden = true
        }else
        {
            Text1.isHidden = false
            Text2.isHidden = false
            Text3.isHidden = false
        }
        
        // Do any additional setup after loading the view.
    }
    
    

   
    @IBAction func Save(_ sender: Any) {
    if countdown == 1
        {
            datalist.append(contentsOf:[[ "補正点１", StrXtap , StrYtap ]])
//            Strdatalist = datalist.joined()
        }else if countdown == 2
        {
            datalist.append(contentsOf:[[ "補正点2", StrXtap , StrYtap ]])
//            Strdatalist = datalist.joined()
        }else
        {
            Data1 = Text1.text!
            Data2 = Text2.text!
            Data3 = Text3.text!
            datalist.append(contentsOf:[[ "学習点" , StrXtap , StrYtap,Data1,Data2,Data3]])
//            Strdatalist = datalist.joined()
        }
        
        print(Strdatalist)
        self.dismiss(animated: true  )

    }
    @IBAction func output(_ gesture: UIGestureRecognizer){
        guard gesture.state == .ended else {
            return
        }

        createFile(fileName: filename, fileArrData:datalist )
    }
    
    @IBAction func Filesave(_ sender: Any) {
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
           
        }catch let error as NSError{
            print("Failure to Write File\n\(error)")
        }

    }
    
    

}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
