//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//
//MARK: -  EVENT DETAILS VIEW CONTROLLER
class EventDetailsVC: UIViewController {
//MARK: - OUTLETS
    @IBOutlet weak var evntDtailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerNibs()
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
