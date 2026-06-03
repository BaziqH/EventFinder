//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class EventsListVC: UIViewController {
//MARK: - OUTLETS
    @IBOutlet weak var eventsTableView: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    //MARK: - VARIABLES
    var navBarTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = navBarTitle
        setupTableView()
        registerNibs()
    }
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
