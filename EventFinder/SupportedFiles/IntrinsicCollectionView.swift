//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//
    
class SelfSizingCollectionView: UICollectionView {
    override var contentSize: CGSize {
        didSet {
            print("CONTENT SIZE CHANGED:", contentSize)
            invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        print("INTRINSIC ASKED:", contentSize)
        return contentSize
    }
}
