//
//  PieChartView.swift
//  NeatCode
//
//  Created by Ayush Rajpal on 22/05/25.
//

import UIKit

class PieChartView: UIView {
    var data: [CGFloat] = [] { didSet { setNeedsDisplay() } }
    var colors: [UIColor] = [.systemGreen, UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1), .systemRed]

    override func draw(_ rect: CGRect) {
        guard data.count == colors.count, let ctx = UIGraphicsGetCurrentContext() else { return }
        let total = data.reduce(0, +)
        var startAngle = -CGFloat.pi / 2
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2
        for (i, value) in data.enumerated() {
            ctx.setFillColor(colors[i].cgColor)
            let endAngle = startAngle + 2 * .pi * (value / total)
            ctx.move(to: center)
            ctx.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            ctx.fillPath()
            startAngle = endAngle
        }
    }
}
