import UIKit
class MainTabBarController: UITabBarController {
    var backgroundView: UIView?
    var alertView: UIView?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showWelcomeAlertIfNeeded()
        //показываем алерт при первом запуске
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        showWelcomeAlertIfNeeded()
        print("viewDidLoad load alert")
    }
    
    //MARK: - Tab setup
    
    private func setupTabs() {
        // Установка фонового изображения
        let backgroundImage = UIImageView(image: UIImage(named: "bg"))
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.frame = UIScreen.main.bounds
        backgroundImage.backgroundColor = .white
        self.view.insertSubview(backgroundImage, at: 0)
        
        // Создаем экземпляры контроллеров для каждой вкладки
        let heartVC = HeartController()
        let historyVC = HistoryController()
        let dietVC = DietController()
        let testVC = TestController()
        let profileVC = ProfileController()
        
        // Настраиваем изображения для вкладок
        heartVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "HeartTabBar"), tag: 0)
        historyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "HistoryTabBar"), tag: 1)
        dietVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "DietTabBar"), tag: 2)
        testVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "ProfileTabBar"), tag: 3)
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "TestTabBar"), tag: 4)
        
        // Устанавливаем контроллеры во вкладки
        viewControllers = [heartVC, historyVC, dietVC, testVC, profileVC]
        
        // Настраиваем внешний вид Tab Bar
        self.tabBar.barTintColor = .blue
        self.tabBar.tintColor = .orange
        self.tabBar.unselectedItemTintColor = .gray
        
        // Настраиваем закругление Tab Bar
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.clipsToBounds = true
        
    }
}

extension MainTabBarController {
    @objc private func okButtonTapped() {
        // Анимация скрытия алерта
        UIView.animate(withDuration: 0.5, animations: {
            self.alertView?.frame.origin.y += 300
            self.backgroundView?.alpha = 0 // Скрываем подложку
        }) { (_) in
            // После анимации скрытия удаляем алерт и подложку
            self.alertView?.removeFromSuperview()
            self.alertView = nil
            self.backgroundView?.removeFromSuperview()
            self.backgroundView = nil
            
            // Восстанавливаем таббар
            if let tabBarController = self.tabBarController {
                tabBarController.hidesBottomBarWhenPushed = false
            }
        }
    }
    
    private func showWelcomeAlertIfNeeded() {
        // Проверяем, нужно ли показать алерт
        if shouldShowWelcomeAlert() {
            // Добавляем подложку
            backgroundView = UIView(frame: view.bounds)
            backgroundView?.backgroundColor = UIColor(white: 0, alpha: 0.5) // Темный полупрозрачный цвет
            view.addSubview(backgroundView!)
            
            // Создаем контейнер алерта
            alertView = UIView(frame: CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: 300))
            alertView?.backgroundColor = .white
            alertView?.layer.cornerRadius = 30
            
            // Добавляем "Welcome to Pulse" 
            let titleLabel = UILabel()
            titleLabel.text = "Welcome to Pulse"
            titleLabel.textColor = .black
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
            titleLabel.textAlignment = .center
            titleLabel.frame = CGRect(x: 20, y: 20, width: alertView!.bounds.width - 40, height: 30)
            alertView?.addSubview(titleLabel)
            
            // Добавляем  текст
            let additionalTextLabel = UILabel()
            additionalTextLabel.text = "By clicking \"Accept and Continue\", you confirm that you have read and accept our Privacy Policy Terms of Service"
            additionalTextLabel.textColor = .black
            additionalTextLabel.font = UIFont.systemFont(ofSize: 16)
            additionalTextLabel.textAlignment = .center
            additionalTextLabel.numberOfLines = 0 // Позволяет тексту переноситься на новую строку, если не умещается
            additionalTextLabel.frame = CGRect(x: 20, y: 70, width: alertView!.bounds.width - 70, height: 60)
            alertView?.addSubview(additionalTextLabel)
            
            // Создаем "OK"
            let okButton = UIButton(type: .system)
            okButton.setTitle("Accept and Continue", for: .normal)
            okButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            okButton.backgroundColor = .black
            okButton.layer.cornerRadius = 30
            okButton.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4, blue: 0.9764705882, alpha: 1)
            okButton.setTitleColor(UIColor.white, for: .normal)
            okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
            
            // Устанавливаем размер и координаты кнопки внутри алерта
            okButton.frame = CGRect(x: 40, y: 200, width: alertView!.bounds.width - 80, height: 68)
            
            // Добавляем кнопку к алерту
            alertView?.addSubview(okButton)
            
            // Добавляем алерт к view
            if let alertView = alertView {
                view.addSubview(alertView)
                
                // Анимация алерта
                UIView.animate(withDuration: 0.5, animations: {
                    self.alertView?.frame.origin.y -= 300
                })
                // Помечаем, что алерт был показан
                UserDefaults.standard.set(true, forKey: "WelcomeAlertShown")
            }
        }
    }
    
    
    
    private func shouldShowWelcomeAlert() -> Bool {
        // Проверка, был ли алерт уже показан
        return !UserDefaults.standard.bool(forKey: "WelcomeAlertShown")
    }
}
