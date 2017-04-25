///////// Imports //////////
import UIKit

///////// Complete Task View Controller - Class /////////
class CompleteTaskViewController: UIViewController {
    
    ///////// Variables /////////
    var task = Task()

    ///////// Story Board Connections /////////
    @IBOutlet weak var labelTask: UILabel!
    
    @IBAction func completeTapped(_ sender: Any) {
        // Connect to CoreData (Database) //
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Delete data from CoreData (Database) //
        context.delete(task)
        
        // Save data to CoreData (Database) //
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Return to last View Controller //
        navigationController!.popViewController(animated: true)
    }
    
    ///////// View Load /////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.important {
            labelTask.text = "! " + task.name!
        } else {
            labelTask.text = task.name
        }
    }
    
}
