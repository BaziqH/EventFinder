//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//


class OptionsCVuCell: UICollectionViewCell {
    //MARK: - OUTLETS
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var buttonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK: - HELPER FUNCTIONS
    func configure(_ label: String, _ image: String){
        buttonImage.image = UIImage(systemName: image)
        buttonLabel.text = label
    }

}
