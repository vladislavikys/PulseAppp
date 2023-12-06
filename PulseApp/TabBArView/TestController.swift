//
//  TestController.swift
//  PulseApp
//
//  Created by Влад on 29.11.23.
//

import UIKit

class TestController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Создаем UIImageView
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)

        // Устанавливаем изображение
        backgroundImage.image = UIImage(named: "test") // Замените "yourImageName" на имя вашего изображения

        // Растягиваем изображение на весь экран
        backgroundImage.contentMode = .scaleAspectFit

        // Добавляем изображение на задний план (позади других элементов)
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
   
}
