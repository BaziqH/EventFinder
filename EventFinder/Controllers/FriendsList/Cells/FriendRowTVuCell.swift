//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class FriendRowTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var allFriendsLabel: UILabel!
    @IBOutlet weak var mainLabelView: UIView!
    @IBOutlet weak var topSpaceFirstCell: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(indexPath: IndexPath){
        if indexPath.row != 0 {
            allFriendsLabel.isHidden = true
            mainLabelView.isHidden = true
            topSpaceFirstCell.constant = 10
        } else {
            allFriendsLabel.isHidden = false
            mainLabelView.isHidden = false
            topSpaceFirstCell.constant = 0
        }
    }
}
