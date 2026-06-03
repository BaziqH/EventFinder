//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class EventsTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var contentTapped: UIView!
    
    //MARK: - VARIABLES
    var eventDetails: (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        addTap()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func addTap(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goToDetails))
        contentTapped.addGestureRecognizer(gesture)
    }
    @objc func goToDetails(){
        eventDetails?()
    }
}
