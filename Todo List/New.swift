///////// Imports //////////
import UIKit

///////// Create Task View Controller - Class /////////
class CreateTaskViewController: UIViewController {

    ///////// Story Board Connections /////////
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBAction func addTapped(_ sender: Any) {
        // Connect to CoreData (Database) //
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Get Field Data for CoreData (Database) //
        let task = Task(context: context)
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        // Save data to CoreData (Database) //
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Return to last View Controller //
        navigationController!.popViewController(animated: true)
    }
    
    ///////// View Load /////////
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
