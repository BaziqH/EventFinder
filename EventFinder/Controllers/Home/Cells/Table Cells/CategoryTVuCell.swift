//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//
    
class CategoryTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var collectionCellHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }
}
//MARK: - COLLECTION VIEW
extension CategoryTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadCategoryCVuCell(indexPath)
    }
}
extension CategoryTVuCell: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/3.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

//MARK: - LOAD CELLS
extension CategoryTVuCell{
    func loadCategoryCVuCell(_ indexPath: IndexPath)->UICollectionViewCell{
        guard let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCVuCell", for: indexPath) as? CategoryCVuCell else {
            return CategoryCVuCell()
        }
        cell.layoutIfNeeded()
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension CategoryTVuCell{
    func setupCollectionView(){
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    func registerNibs(){
        let categoryNib = UINib(nibName: "CategoryCVuCell", bundle: nil)
        categoryCollectionView.register(categoryNib, forCellWithReuseIdentifier: "CategoryCVuCell")
    }
}

