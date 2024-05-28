import UIKit

class SemiCircularProgressView: UIView {

    var progress: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var lineWidth: CGFloat = 10.0
    var progressColor: UIColor = .blue
    var trackColor: UIColor = .lightGray

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height)
        let radius = min(bounds.width, bounds.height) / 2 - lineWidth / 2
        
        let startAngle = CGFloat.pi
        let endAngle = CGFloat.pi * 2
        
        let trackPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        trackPath.lineWidth = lineWidth
        trackColor.setStroke()
        trackPath.stroke()
        
        let progressEndAngle = startAngle + (endAngle - startAngle) * progress
        let progressPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: progressEndAngle, clockwise: true)
        progressPath.lineWidth = lineWidth
        progressColor.setStroke()
        progressPath.stroke()
    }
}
