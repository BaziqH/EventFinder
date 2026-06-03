//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class TransactionInfoTVuCell: UITableViewCell {
//MARK: - OUTLETS
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var transactionTimeLabel: UILabel!
    @IBOutlet weak var transactionAmount: UILabel!
    @IBOutlet weak var transactionType: UILabel!
    @IBOutlet weak var personImage: DesignableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        personImage.layer.cornerRadius = personImage.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ image: String, _ name: String, _ time: Date, _ amount: Int64, _ type: TransactionType){
        print(image)
        profileImage.image = UIImage(named: image)
        nameLabel.text = name
        transactionTimeLabel.text = formatDate(time)
        transactionAmount.text = String(amount)
        transactionType.text = type.rawValue
    }
}
