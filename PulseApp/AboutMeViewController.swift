import UIKit

class AboutMeViewController: UIViewController {
    private var titleLabel: UILabel!
    private var buttonStackView: UIStackView!
    private var cmKgButton: UIButton!
    private var inLbsButton: UIButton!
    private var saveButton: UIButton!
    private var imageStackView: UIStackView!
    private var maleButton: UIButton!
    private var maleLabel: UILabel!
    private var femaleButton: UIButton!
    private var femaleLabel:UILabel!
    
    private var plusAboutButton1:UIButton!
    private var plusAboutButton2:UIButton!
    private var plusAboutButton3:UIButton!
    
    private var validationLabel: UILabel!
    private var label1:UILabel!
    private var label2:UILabel!
    private var label3:UILabel!
    
    private var genderLabel:UILabel!
    private var heightLabel :UILabel!
    private var weightLabel:UILabel!
    private var ageLabel:UILabel!
    
    private var heightLabelTopConstraint: NSLayoutConstraint!
    
    // Добавляем переменную для отслеживания выбранной строки
    private var selectedRow: Int?
    
    private var heightTextField :UITextField!
    private var weightTextField :UITextField!
    private var ageTextField :UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageAbout = "imageAbout"
        
        // Установка фонового изображения
        let backgroundImage = UIImageView(image: UIImage(named: "bg"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.frame = UIScreen.main.bounds
        self.view.insertSubview(backgroundImage, at: 0)
        self.view.backgroundColor = .white
        
        // Настройка Label "About me"
        titleLabel = UILabel()
        titleLabel.text = "About me"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Настройка кнопок "Cm, Kg" и "In, Lbs"
        cmKgButton = createButton(title: "Cm, Kg")
        inLbsButton = createButton(title: "In, Lbs")
        
        // Настройка горизонтального стека для кнопок
        buttonStackView = UIStackView(arrangedSubviews: [cmKgButton, inLbsButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)
        
        // Настройка вертикального стека для изображений
        imageStackView = UIStackView()
        imageStackView.axis = .vertical
        imageStackView.spacing = 9
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        imageStackView.isUserInteractionEnabled = true
        view.addSubview(imageStackView)
        
        
        // Добавление изображений в вертикальный стек
        for _ in 0..<4 {
            let imageView = createImageView(imageAbout: imageAbout)
            imageStackView.addArrangedSubview(imageView)
        }
        
        // Настройка кнопки "Save"
        saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        saveButton.layer.cornerRadius = 30
        saveButton.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4, blue: 0.9764705882, alpha: 1)
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)
        
        
        maleButton = UIButton(type: .system)
        maleButton.setImage(UIImage(named: "desableCircleSex"), for: .normal)
        maleButton.setImage(UIImage(named: "enableCircleSex"), for: .selected)
        maleButton.isSelected = false
        maleButton.translatesAutoresizingMaskIntoConstraints = false
        maleButton.addTarget(self, action: #selector(maleButtonTapped), for: .touchUpInside)
        view.addSubview(maleButton)
        // Создание UILabel для отображения "Male"
        maleLabel = UILabel()
        maleLabel.text = "Male"
        maleLabel.font = UIFont.systemFont(ofSize: 14)
        maleLabel.textColor = .black
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(maleLabel)
        
        femaleButton = UIButton(type: .system)
        femaleButton.setImage(UIImage(named: "desableCircleSex"), for: .normal)
        femaleButton.setImage(UIImage(named: "enableCircleSex"), for: .selected)
        femaleButton.isSelected = false
        femaleButton.translatesAutoresizingMaskIntoConstraints = false
        femaleButton.addTarget(self, action: #selector(femaleButtonTapped), for: .touchUpInside)
        view.addSubview(femaleButton)
        // Создание UILabel для отображения "Male"
        femaleLabel = UILabel()
        femaleLabel.text = "Female"
        femaleLabel.font = UIFont.systemFont(ofSize: 14)
        femaleLabel.textColor = .black
        femaleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(femaleLabel)
        
        plusAboutButton1 = createButtonWithImage(image: UIImage(named: "plusAbout")!, action: #selector(plusAboutButtonTapped))
        plusAboutButton1.tag = 0
        plusAboutButton1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusAboutButton1)
        plusAboutButton2 = createButtonWithImage(image: UIImage(named: "plusAbout")!, action: #selector(plusAboutButtonTapped))
        plusAboutButton2.tag = 1
        plusAboutButton2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusAboutButton2)
        plusAboutButton3 = createButtonWithImage(image: UIImage(named: "plusAbout")!, action: #selector(plusAboutButtonTapped))
        plusAboutButton3.tag = 2
        plusAboutButton3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusAboutButton3)
        
        label1 = createLabelValid(text: "Pleace enter a valid value for: Height")
        view.addSubview(label1)
        label2 = createLabelValid(text: "Pleace enter a valid value for: Weight")
        view.addSubview(label2)
        label3 = createLabelValid(text: "Pleace enter a valid value for: Age")
        view.addSubview(label3)
        
        
        
        
        
        genderLabel = createLabel(title: "Gender")
        view.addSubview(genderLabel)
        
        heightLabel = createLabel(title: "Height")
        view.addSubview(heightLabel)
        
        weightLabel = createLabel(title: "Weight")
        view.addSubview(weightLabel)
        
        ageLabel = createLabel(title: "Age")
        view.addSubview(ageLabel)
        
        
        heightTextField = createTextField(placeholder: "")
        imageStackView.arrangedSubviews[1].addSubview(heightTextField)
        
        weightTextField = createTextField(placeholder: "")
        imageStackView.arrangedSubviews[2].addSubview(weightTextField)
        
        ageTextField = createTextField(placeholder: "")
        imageStackView.arrangedSubviews[3].addSubview(ageTextField)
        // Устанавливаем делегаты для textfield
        heightTextField.delegate = self
        weightTextField.delegate = self
        ageTextField.delegate = self
        
        
//        let heightTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped))
//        imageStackView.arrangedSubviews[1].addGestureRecognizer(heightTapGestureRecognizer)
//
//        let weightTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped))
//        imageStackView.arrangedSubviews[2].addGestureRecognizer(weightTapGestureRecognizer)
//
//        let ageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped))
//        imageStackView.arrangedSubviews[3].addGestureRecognizer(ageTapGestureRecognizer)

        
        
        // Устанавливаем верхний констрейнт для heightLabel
        heightLabelTopConstraint = heightLabel.topAnchor.constraint(equalTo: imageStackView.arrangedSubviews[1].topAnchor)
        heightLabelTopConstraint.isActive = true
        
        // Расстановка элементов на экране
        setupConstraints()
    }
    
    func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Устанавливаем закругление в половину высоты кнопок
        button.layer.cornerRadius = button.frame.height / 2 // Половина высоты кнопок
        button.clipsToBounds = true
        return button
    }
    
    func createImageView(imageAbout: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageAbout)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }
    
    @objc func buttonTapped(sender: UIButton) {
        // Обработка нажатия кнопок "Cm, Kg" и "In, Lbs"
        if sender == cmKgButton {
            cmKgButton.backgroundColor = UIColor(red: 102/255, green: 118/255, blue: 250/255, alpha: 1.0)
            inLbsButton.backgroundColor = .clear
        } else if sender == inLbsButton {
            cmKgButton.backgroundColor = .clear
            inLbsButton.backgroundColor = UIColor(red: 102/255, green: 118/255, blue: 250/255, alpha: 1.0)
        }
    }
    
    @objc func saveButtonTapped() {
        dismiss(animated: true)
        print("Save button tapped")
    }
    
    
    @objc func maleButtonTapped() {
        print("Male button tapped")
        maleButton.isSelected = true
        femaleButton.isSelected = false
        
    }
    @objc func femaleButtonTapped() {
        print("Female button tapped")
        femaleButton.isSelected = true
        maleButton.isSelected = false
    }
    
    @objc func plusAboutButtonTapped(_ sender: UIButton) {
        // Получаем индекс строки, для которой была нажата кнопка
        let index = sender.tag
        
        // Теперь вы можете изменять текст только для выбранной строки
        if index == 0 {
            print("Plus 1  About button tapped")
            // Перемещение heightLabel на 7 поинтов вверх c ограничением
            //ограничение не воркает починит ((((((
            var heightLabelFrame = heightLabel.frame
            heightLabelFrame.origin.y -= 7
            heightLabelFrame.origin.y = max(heightLabelFrame.origin.y, 0)
            
            label1.isHidden = false
            UIView.animate(withDuration: 0.2) {
                self.heightLabel.frame = heightLabelFrame
                self.label1.alpha = 1.0
            }
        } else if index == 1 {
            print("Plus 2  About button tapped")
            // Перемещение weightLabel на 5 поинтов вверх
            var weightLabelFrame = weightLabel.frame
            weightLabelFrame.origin.y -= 7
            weightLabelFrame.origin.y = max(weightLabelFrame.origin.y, 0)
            
            label2.isHidden = false
            UIView.animate(withDuration: 0.2) {
                self.weightLabel.frame = weightLabelFrame
                self.label2.alpha = 1.0
            }
        } else if index == 2 {
            print("Plus 3  About button tapped")
            // Перемещение heightLabel на 5 поинтов вверх
            var ageLabelFrame = ageLabel.frame
            ageLabelFrame.origin.y -= 7
            ageLabelFrame.origin.y = max(ageLabelFrame.origin.y, 0)
            
            label3.isHidden = false
            UIView.animate(withDuration: 0.2) {
                self.ageLabel.frame = ageLabelFrame
                self.label3.alpha = 1.0
            }
        }
    }
//    @objc func textFieldTapped(_ sender: UITapGestureRecognizer) {
//        // Извлекаем , на которое было нажатие
//        if let tappedView = sender.view,
//        
//           // Ищем  текстовое поле внутри представления
//           let textField = tappedView.subviews.compactMap({ $0 as? UITextField }).first {
//               
//            // Показываем клаву
//            textField.becomeFirstResponder()
//        }
//        print("open keyboard UITapGestureRecognizer")
//    }
}

extension AboutMeViewController{
    func createButtonWithImage(image: UIImage, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    func createLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func createLabelValid(text: String) -> UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.alpha = 0.0
        
        return label
    }
    func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = .boldSystemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor(hex: "7166F9")
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .clear  // Устанавливаем прозрачный фон
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
}
//MARK:-  Constarints
extension AboutMeViewController{
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            
            buttonStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Эта строка устанавливает верхний констрейнт
            imageStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 20),
            //Эта строка устанавливает левый констрейнт
            imageStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            //Эта строка устанавливает правый констрейнт
            imageStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            
            // Устанавливаем вертикальный констрейнт для genderLabel
            genderLabel.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[0].centerYAnchor),
            genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            heightLabel.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[1].centerYAnchor),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            weightLabel.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[2].centerYAnchor),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            ageLabel.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[3].centerYAnchor),
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            
            maleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            maleButton.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews.first!.centerYAnchor),
            maleButton.widthAnchor.constraint(equalToConstant: 20),
            maleButton.heightAnchor.constraint(equalToConstant: 20),
            // Установка констрейнтов для maleLabel
            maleLabel.leadingAnchor.constraint(equalTo: maleButton.trailingAnchor, constant: 4),
            maleLabel.centerYAnchor.constraint(equalTo: maleButton.centerYAnchor),
            
            femaleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130),
            femaleButton.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews.first!.centerYAnchor),
            femaleButton.widthAnchor.constraint(equalToConstant: 20),
            femaleButton.heightAnchor.constraint(equalToConstant: 20),
            // Установка констрейнтов для "Female" метки
            femaleLabel.leadingAnchor.constraint(equalTo: femaleButton.trailingAnchor, constant: 4),
            femaleLabel.centerYAnchor.constraint(equalTo: femaleButton.centerYAnchor),
            
            plusAboutButton1.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[1].centerYAnchor),
            plusAboutButton1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            plusAboutButton1.widthAnchor.constraint(equalToConstant: 14),
            plusAboutButton1.heightAnchor.constraint(equalToConstant: 14),
            heightTextField.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[1].centerYAnchor),
            heightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            plusAboutButton2.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[2].centerYAnchor),
            plusAboutButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            plusAboutButton2.widthAnchor.constraint(equalToConstant: 14),
            plusAboutButton2.heightAnchor.constraint(equalToConstant: 14),
            weightTextField.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[2].centerYAnchor),
            weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            plusAboutButton3.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[3].centerYAnchor),
            plusAboutButton3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            plusAboutButton3.widthAnchor.constraint(equalToConstant: 14),
            plusAboutButton3.heightAnchor.constraint(equalToConstant: 14),
            ageTextField.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[3].centerYAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            
            label1.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[1].centerYAnchor,constant: 8),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            
            label2.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[2].centerYAnchor,constant: 8),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            
            label3.centerYAnchor.constraint(equalTo: imageStackView.arrangedSubviews[3].centerYAnchor,constant: 8),
            label3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            saveButton.widthAnchor.constraint(equalToConstant: 300),
            saveButton.heightAnchor.constraint(equalToConstant: 68)
        ])
    }
    
}

//MARK:-  Ext color
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

//MARK:-  Delegate method
extension AboutMeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Вызываем клавиатуру, когда начинается редактирование текстового поля
        textField.becomeFirstResponder()
         
    }
}
