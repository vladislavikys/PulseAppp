//
//  HeartController.swift
//  PulseApp
//
//  Created by Влад on 29.11.23.
//

import UIKit

class HeartController: UIViewController {
    
    private var backgroundImageView: UIImageView!
    private var heartRitmImageView: UIImageView!
    private var pulseAndStackView: UIStackView!
    private var fingerLabel: UILabel!
    private var pulseLabel: UILabel!
    private var heartAndBpmStackView: UIStackView!
    private var heartImageView: UIImageView!
    private var bpmLabel: UILabel!
    private var circleImageView: UIImageView!
    private var startButton : UIButton!
    private var headerStackView: UIStackView!
    private var headerLabel: UILabel!
    private var infoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton = UIButton(type: .system)
        startButton.setTitle("Continue", for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        startButton.backgroundColor = .black
        startButton.layer.cornerRadius = 30
        startButton.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4, blue: 0.9764705882, alpha: 1)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
        
        // Настройка изображения-фона
        backgroundImageView = UIImageView(image: UIImage(named: "vcCircle"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        
        // Создаем изображение для отображения между circleImageView и startButton
        heartRitmImageView = UIImageView(image: UIImage(named: "bgHeartRitm"))
        heartRitmImageView.contentMode = .scaleAspectFill
        heartRitmImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heartRitmImageView)

        
        // Новые элементы
        headerStackView = UIStackView()
        headerStackView.axis = .horizontal
        headerStackView.spacing = 10
        headerStackView.alignment = .center
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerStackView)
        
        headerLabel = UILabel()
        headerLabel.text = "Heart rate"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 28)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.addArrangedSubview(headerLabel)
        
        infoButton = UIButton(type: .system)
        infoButton.setImage(UIImage(named: "infoIcon"), for: .normal)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        headerStackView.addArrangedSubview(infoButton)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        
        
        // Настройка горизонтального стека для pulseLabel и heartAndBpmStackView
        pulseAndStackView = UIStackView()
        pulseAndStackView.axis = .horizontal
        pulseAndStackView.spacing = 10
        pulseAndStackView.alignment = .center
        pulseAndStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pulseAndStackView)
        
        fingerLabel = UILabel()
        fingerLabel.text = "No finger"
        fingerLabel.font = UIFont.systemFont(ofSize: 16)
        fingerLabel.textAlignment = .center
        fingerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fingerLabel)
        
        // Настройка метки для отображения частоты пульса
        pulseLabel = UILabel()
        pulseLabel.text = "00"
        pulseLabel.font = UIFont.boldSystemFont(ofSize: 50)
        pulseLabel.textAlignment = .center
        pulseLabel.layer.cornerRadius = pulseLabel.bounds.width / 2.0
        pulseLabel.layer.masksToBounds = true
        pulseAndStackView.addArrangedSubview(pulseLabel)
        
        // Создаем вертикальный стек для изображения сердца и метки "bpm"
        heartAndBpmStackView = UIStackView()
        heartAndBpmStackView.axis = .vertical
        heartAndBpmStackView.spacing = 2
        heartAndBpmStackView.alignment = .center
        pulseAndStackView.addArrangedSubview(heartAndBpmStackView)
        
        // Настройка изображения сердца
        heartImageView = UIImageView(image: UIImage(named: "heart"))
        heartImageView.contentMode = .scaleAspectFit
        heartAndBpmStackView.addArrangedSubview(heartImageView)
        
        // Настройка метки для отображения текста "bpm"
        bpmLabel = UILabel()
        bpmLabel.text = "bpm"
        bpmLabel.textColor = .black
        bpmLabel.font = UIFont.systemFont(ofSize: 16)
        bpmLabel.textAlignment = .center
        heartAndBpmStackView.addArrangedSubview(bpmLabel)
        
        // Расстановка элементов на экране
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Установка размеров изображения-фона
            backgroundImageView.widthAnchor.constraint(equalToConstant: 215),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 215),
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 2.25),
            
            heartRitmImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            heartRitmImageView.topAnchor.constraint(equalTo: pulseAndStackView.bottomAnchor, constant: 100),
            heartRitmImageView.widthAnchor.constraint(equalToConstant: view.frame.width),
            heartRitmImageView.heightAnchor.constraint(equalToConstant: 96),
            
            // Установка положения горизонтального стека вверху экрана
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            
            fingerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fingerLabel.bottomAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: -25),
            
            // Установка положения горизонтального стека (pulseLabel и heartAndBpmStackView) по центру экрана
            pulseAndStackView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            pulseAndStackView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            startButton.widthAnchor.constraint(equalToConstant: 300),
            startButton.heightAnchor.constraint(equalToConstant: 68)
            
        ])
    }
    
    @objc func startButtonTapped() {
        let aboutMeVC = AboutMeViewController()
        aboutMeVC.hidesBottomBarWhenPushed = true // Скрываем таббар
        aboutMeVC.modalPresentationStyle = .fullScreen
        present(aboutMeVC, animated: true, completion: nil)
    }
    
    @objc func infoButtonTapped() {
        print("Info button tapped")
    }
    
}



