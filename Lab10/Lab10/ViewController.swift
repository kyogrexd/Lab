//
//  ViewController.swift
//  Lab10
//
//  Created by mmslab-mini on 2021/5/3.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    
    
    
    @IBOutlet var mapView: MKMapView!
    var annotationArr = [MKPointAnnotation]()
    var addAnnotationCount = 0
    var showIndex = 0
    
    @IBAction func addAnnotation(_ sender: Any) {
        let annotation = MKPointAnnotation()
        let latLng = CLLocationCoordinate2DMake(25.042331,121.535486);
        annotation.coordinate = latLng
        annotation.title = "臺北科技大學"
        annotation.subtitle = "台北市忠孝東路三段１號"
        mapView.addAnnotation(annotation)
        
    }
    
    func addPolyLine(){
        var pointArr = [[25.043775,121.560642],[25.047945,121.516941]]
        var linePoints = [CLLocationCoordinate2D]()
        
        for point in pointArr{
            linePoints.append(CLLocationCoordinate2DMake(point[0], point[1]))
        }
        let line = MKPolyline(coordinates: linePoints, count: pointArr.count)
        mapView.addOverlay(line)
    }
    

}
extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if(overlay.isKind(of: MKPolyline.self)){
            let lineView = MKPolylineRenderer(polyline: overlay as! MKPolyline)
            lineView.strokeColor = UIColor.red
            lineView.lineWidth = 10
            return lineView as MKOverlayRenderer
        }
        return MKOverlayRenderer()
    }
}
