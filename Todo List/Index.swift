///////// Imports //////////
import UIKit

///////// Tasks View Controller - Class /////////
class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    ///////// Variables /////////
    var tasks : [Task] = []
    
    ///////// Story Board Connections /////////
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    ///////// View Load /////////
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    ///////// Pass Data Segue /////////
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
        }
    }
    
    ///////// Table View - Total Results to Display /////////
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    ///////// Table View - Display Results Data /////////
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important { cell.textLabel?.text = "! " + task.name! }
        else { cell.textLabel?.text = task.name }
        return cell
    }
    
    ///////// Table View - On Row Select Perform Segue /////////
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    ///////// Table View - Slide to Delete /////////
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        tableView.reloadData()
    }
    
    ///////// Get Task Function /////////
    func getTasks(){
        // Connect to CoreData (Database) //
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            // Get data from CoreData (Database) //
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            // Error getting data from CoreData (Database) //
            print("We may have a error")
        }
    }
    
}
