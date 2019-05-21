//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Abraham Vazquez on 5/21/19.
//  Copyright © 2019 Abraham Vazquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - O U T L E T S
    @IBOutlet weak var txfAccount: UITextField!
    @IBOutlet weak var txfTip:     UITextField!
    @IBOutlet weak var txtTotal:   UITextField!
    @IBOutlet weak var btnTip5:    UIButton!
    @IBOutlet weak var btnTip10:   UIButton!
    @IBOutlet weak var btnTip15:   UIButton!
    @IBOutlet weak var btnTip20:   UIButton!
    
    //MARK: - V A R I A B L E S
    var fAmount:  Float  = 0.0
    var fTip:     Float  = 0.0
    var fTotal:   Float  = 0.0
    var percent:  String = ""
    var strTip:   String = ""
    
    //MARK: - L I F E · C Y C L E
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        let tapRec: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapRec)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - F U N C T I O N S
    func getAmount(strAccount: String) -> Float
    {
        fAmount = Float(strAccount)!
        return fAmount
    }
    
    // Devuelve el Tip para multiplicarlo
    func convertTipToOperate(percent: String) -> Float
    {
        let strPoint: String = "0."
        let strTipConverted: String = strPoint + percent
        let fTipToOperatre: Float = Float(strTipConverted)!
//        txfTip.text = String(fTipToOperatre)
        return fTipToOperatre
    }

    func realizaOperacionDelPorcentaje(fAmount: Float, fTipConvertido: Float) -> Float {
        
        return fAmount * fTipConvertido
        
    }
    
    func sumaDeResultados(fAmount: Float, fTip: Float) -> Float{
        
        return fAmount + fTip
    }
   
    func printTotal()
    {
        txtTotal.text = String(self.sumaDeResultados(fAmount: self.getAmount(strAccount: txfAccount.text!), fTip: self.realizaOperacionDelPorcentaje(fAmount: self.getAmount(strAccount: txfAccount.text!), fTipConvertido: self.convertTipToOperate(percent: percent))))
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    //MARK: - V A L I D A T I O N S
    func bExistTip(srtTip:String) -> Bool {
        if txfTip.text == ""{
            return false
        }else { return true }
    }

    func printOnTipTexField() {
        txfTip.text = String(self.realizaOperacionDelPorcentaje(fAmount: self.getAmount(strAccount: txfAccount.text!), fTipConvertido: self.convertTipToOperate(percent: percent)))
    }
    
    //MARK: - A C T I O N S
    @IBAction func btn5Percent(_ sender: Any) {
        percent = "05"
        self.printOnTipTexField()
        self.printTotal()
    }
    
    @IBAction func btn10Percent(_ sender: Any) {
        percent = "10"
        self.printOnTipTexField()
        self.printTotal()
    }
    
    @IBAction func btn15Percent(_ sender: Any) {
        percent = "15"
        self.printOnTipTexField()
        self.printTotal()
    }
    
    @IBAction func btn20Percent(_ sender: Any) {
        percent = "20"
        self.printOnTipTexField()
        self.printTotal()
        
    }
}
