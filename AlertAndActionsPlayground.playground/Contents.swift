import PlaygroundSupport
import UIKit

class MainViewController: UIViewController {
    
    @objc func buttonTapped() {
        let alert = UIAlertController(title: "Hello... World...", message: "This is hardly my first app!", preferredStyle: .alert)
        
        let doAction = UIAlertAction(title: "Do", style: .default) { action in
            print("action \(action.title!) chosen and alert dimissed")
        }
        
        let dontAction = UIAlertAction(title: "Don't", style: .cancel) { action in
            print("action \(action.title!) chosen and alert dimissed")
        }
        
        let redAlertAction = UIAlertAction(title: "Red Alert", style: .destructive) { action in
            print("action \(action.title!) chosen and alert dimissed")
        }
        
        let maybeAction = UIAlertAction(title: "Maybe", style: .default) { action in
            print("action \(action.title!) chosen and alert dimissed")
        }
        
        alert.addAction(redAlertAction)
        alert.addAction(doAction)
        alert.addAction(maybeAction)
        alert.addAction(dontAction)
        
        present(alert, animated: true) {
            print("alert was presented and is currently hanging out on the screen!")
        }
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.frame.size = CGSize(width: 600, height: 600)
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 250, y: 275, width: 100, height: 50)
        button.backgroundColor = UIColor.yellow
        button.setTitle("Hit Me One More Time!", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        self.view = view
    }
    
}

let main = MainViewController()
main.preferredContentSize = CGSize(width: 600, height: 600)

PlaygroundPage.current.liveView = main

