//import UIKit
//
//class ViewController: UIViewController {
//    private var backgroundImageView: UIImageView!
//    private var pulseAndStackView: UIStackView!
//    private var pulseLabel: UILabel!
//    private var heartAndBpmStackView: UIStackView!
//    private var heartImageView: UIImageView!
//    private var bpmLabel: UILabel!
//    private var circleContainerView: UIView!
//    private var circleImageView: UIImageView!
//    private var startButton: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        
//        // Настройка изображения-фона
//        backgroundImageView = UIImageView(image: UIImage(named: "vcCircle"))
//        backgroundImageView.contentMode = .scaleAspectFill
//        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(backgroundImageView)
//
//        // Создаем UIView для круглого изображения
//        circleContainerView = UIView()
//        circleContainerView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(circleContainerView)
//
//        // Настройка горизонтального стека для pulseLabel и heartAndBpmStackView
//        pulseAndStackView = UIStackView()
//        pulseAndStackView.axis = .horizontal
//        pulseAndStackView.spacing = 10
//        pulseAndStackView.alignment = .center
//        pulseAndStackView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(pulseAndStackView)
//
//        // Настройка метки для отображения частоты пульса
//        pulseLabel = UILabel()
//        pulseLabel.text = "N/A"
//        pulseLabel.font = UIFont.systemFont(ofSize: 50)
//        pulseLabel.textAlignment = .center
//        pulseLabel.layer.cornerRadius = pulseLabel.bounds.width / 2.0
//        pulseLabel.layer.masksToBounds = true
//        pulseAndStackView.addArrangedSubview(pulseLabel)
//
//        // Создаем вертикальный стек для изображения сердца и метки "bpm"
//        heartAndBpmStackView = UIStackView()
//        heartAndBpmStackView.axis = .vertical
//        heartAndBpmStackView.spacing = 2
//        heartAndBpmStackView.alignment = .center
//        pulseAndStackView.addArrangedSubview(heartAndBpmStackView)
//
//        // Настройка изображения сердца
//        heartImageView = UIImageView(image: UIImage(named: "heart"))
//        heartImageView.contentMode = .scaleAspectFit
//        heartAndBpmStackView.addArrangedSubview(heartImageView)
//
//        // Настройка метки для отображения текста "bpm"
//        bpmLabel = UILabel()
//        bpmLabel.text = "bpm"
//        bpmLabel.textColor = .black
//        bpmLabel.font = UIFont.systemFont(ofSize: 16)
//        bpmLabel.textAlignment = .center
//        heartAndBpmStackView.addArrangedSubview(bpmLabel)
//
//        // Настройка кнопки "Start" с закругленными краями
//        startButton = UIButton(type: .system)
//        startButton.setTitle("Start", for: .normal)
//        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
//        startButton.layer.cornerRadius = 35
//        //startButton.backgroundColor = #colorLiteral(red: 0.44, green: 0.4, blue: 0.98, alpha: 1)
//        startButton.tintColor = .black
//        startButton.setTitleColor(UIColor.white, for: .normal)
//        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
//        view.addSubview(startButton)
//
//        // Настройка изображения круга
//        circleImageView = UIImageView(image: UIImage(named: "yourCircleImage")) // Замените "yourCircleImage" на название вашего изображения
//        circleImageView.contentMode = .scaleAspectFit
//        circleImageView.translatesAutoresizingMaskIntoConstraints = false
//        circleContainerView.addSubview(circleImageView)
//
//        // Расстановка элементов на экране
//        setupConstraints()
//    }
//
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            // Установка размеров изображения-фона
//            backgroundImageView.widthAnchor.constraint(equalToConstant: 215),
//            backgroundImageView.heightAnchor.constraint(equalToConstant: 215),
//            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            backgroundImageView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 2.25),
//
//            // Установка положения горизонтального стека (pulseLabel и heartAndBpmStackView) по центру экрана
//            pulseAndStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            pulseAndStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
//
//            // Установка положения UIView для круглого изображения по центру pulseAndStackView
//            circleContainerView.centerXAnchor.constraint(equalTo: pulseAndStackView.centerXAnchor),
//            circleContainerView.centerYAnchor.constraint(equalTo: pulseAndStackView.centerYAnchor),
//            // Установка размеров UIView для круглого изображения
//            circleContainerView.widthAnchor.constraint(equalToConstant: 50),
//            circleContainerView.heightAnchor.constraint(equalToConstant: 50),
//
//            // Установка размеров изображения круга внутри UIView
//            circleImageView.leadingAnchor.constraint(equalTo: circleContainerView.leadingAnchor),
//            circleImageView.trailingAnchor.constraint(equalTo: circleContainerView.trailingAnchor),
//            circleImageView.topAnchor.constraint(equalTo: circleContainerView.topAnchor),
//            circleImageView.bottomAnchor.constraint(equalTo: circleContainerView.bottomAnchor),
//
//            // Установка положения кнопки "Start" по центру экрана и внизу от верхнего края
//            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
//            startButton.widthAnchor.constraint(equalToConstant: 300),
//            startButton.heightAnchor.constraint(equalToConstant: 70),
//        ])
//    }
//
//    @objc func startButtonTapped() {
//        let pulseRate = Int.random(in: 1...149)
//        pulseLabel.text = "\(pulseRate)"
//    }
//}
