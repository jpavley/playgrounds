import UIKit

var str = "Hello, playground"

import PlaygroundSupport
import UIKit

class WWDCMasterViewController: UITableViewController {
    
    var reasons = [
        "labs are great",
        "sessions teach new things",
        "developers rock",
        "I must clap hard"
    ]
    
    override func viewDidLoad() {
        title = "Reasons I should attend the WWDC"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell.accessoryType = .disclosureIndicator
        }
        
        let reason = reasons[indexPath.row]
        cell.detailTextLabel?.text = "I want to attend because \(reason)"
        cell.textLabel?.text = "Reason #\(indexPath.row + 1)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let text = tableView.cellForRow(at: indexPath)?.detailTextLabel?.text else {
            return
        }
        let detail = WWDCDetailViewController()
        detail.message = text
        
        navigationController?.pushViewController(detail, animated: true)
    }
}

class WWDCDetailViewController: UIViewController {
    var message = ""
    var animator: UIDynamicAnimator?
    
    override func loadView() {
        title = "Please let me go!"
        view = UIView()
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLayoutSubviews() {
        guard animator == nil else {
            return
        }
        
        let words = message.components(separatedBy: " ")
        var labels = [UILabel]()
        
        for (index, word) in words.enumerated() {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .title1)
            
            label.center = CGPoint(x: view.frame.midX, y: 50 + CGFloat(30 * index))
            label.text = word
            label.backgroundColor = UIColor.blue
            label.textColor = UIColor.white
            label.sizeToFit()
            view.addSubview(label)
            labels.append(label)
        }
        
        let gravity = UIGravityBehavior(items: labels)
        animator = UIDynamicAnimator(referenceView: view)
        animator?.addBehavior(gravity)
        
        let collisions = UICollisionBehavior(items: labels)
        collisions.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collisions)
    }
}

let master = WWDCMasterViewController()
let nav = UINavigationController(rootViewController: master)

PlaygroundPage.current.liveView = nav


