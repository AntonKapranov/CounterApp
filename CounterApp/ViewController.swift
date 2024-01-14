//
//  ViewController.swift
//  CounterApp
//
//  Created by Антон Капранов on 14.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //переменные и функции
    private var counterValue:Int = 0
    private var logValue:String = "История изменений:\n"
    
    //получение местного времени
    private func getData()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let formattedDate = dateFormatter.string(from: Date())
        return "[\(formattedDate)]:"
    }
    
    //функция увеличения
    private func counterAdd(){
        counterValue += 1
        valueDisplay.text = "\(counterValue)"
        logsDisplay.text += getData()
        logsDisplay.text += " значение изменено на +1\n"
    }
    //функция уменьшения с проверкой на ноль
    private func counterReduce(){
        if counterValue != 0{
            counterValue -= 1
            valueDisplay.text = "\(counterValue)"
            logsDisplay.text += getData()
            logsDisplay.text += " значение изменено на -1\n"
        } else{
            logsDisplay.text += getData()
            logsDisplay.text += " попытка уменьшить значение счётчика ниже 0\n"
        }
    }
    
    //функция сброса
    private func counterReset(){
        counterValue = 0
        valueDisplay.text = "\(counterValue)"
        logsDisplay.text += getData()
        logsDisplay.text += " значение сброшено\n"
    }
    //Components
    //Значение счётчика
    @IBOutlet weak var valueDisplay: UILabel!
    //кнопка сброса
    @IBOutlet weak var buttonReset: UIButton!
    //кнопка уменьшения
    @IBOutlet weak var buttonReduce: UIButton!
    //кнопка увеличения
    @IBOutlet weak var buttonAdd: UIButton!
    //история действий
    @IBOutlet weak var logsDisplay: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueDisplay.text = "\(counterValue)"
       logsDisplay.text = logValue
    }
    
    //действие – сброс
    @IBAction func buttonResetAction(_ sender: Any) {
        counterReset()
    }
    
    //действие – увеличение
    @IBAction func buttonAddAction(_ sender: Any) {
        counterAdd()
    }
    
    //действие – уменьшение
    @IBAction func buttonReduceAction(_ sender: Any) {
        counterReduce()
    }
}

