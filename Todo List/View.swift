///////// Imports //////////
import UIKit

///////// Complete Task View Controller - Class /////////
class CompleteTaskViewController: UIViewController {
    
    ///////// Variables /////////
    var task = Task()

    ///////// Story Board Connections /////////
    @IBOutlet weak var fieldTask: UITextField!
    @IBOutlet weak var fieldSwitch: UISwitch!
    
    @IBAction func updateTapped(_ sender: Any) {
        // Fields to update //
        task.name = fieldTask.text
        if fieldSwitch.isOn { task.important = true }
        else { task.important = false }
        
        // Save data to CoreData (Database) //
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Return to last View Controller //
        navigationController!.popViewController(animated: true)
    }
    
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
        
        // Set field value data //
        fieldTask.text = task.name
        if task.important == true { fieldSwitch.setOn(true, animated: true) }
        else { fieldSwitch.setOn(false, animated: true) }
    }
    
}
