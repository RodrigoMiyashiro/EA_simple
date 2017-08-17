//
//  FindTaxiViewController.swift
//  fTaxi
//
//  Created by Rodrigo A E Miyashiro on 15/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import GoogleMaps

class FindTaxiViewController: UIViewController
{
    // MARK: - Lets and Vars
    internal var taxisPin = TaxiManager()
    internal var locationManager = CLLocationManager()
    internal var customerCoordinate = CLLocation(latitude: 0, longitude: 0)
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapView: GMSMapView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configMaps()
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.denied
        {
            verifyPermittion()
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    func configMaps()
    {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func verifyPermittion()
    {
        if CLLocationManager.locationServicesEnabled()
        {
            switch(CLLocationManager.authorizationStatus())
            {
            case .notDetermined, .restricted, .denied:
                print("No access")
                
                let alert = UIAlertController(title: "Ops ...", message: "Você precisa habilitar sua localização para encontar as lojas proximas há você", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ir para configurações", style: UIAlertActionStyle.cancel, handler: { (alert: UIAlertAction!) in
                    print("")
                    UIApplication.shared.openURL(NSURL(string:UIApplicationOpenSettingsURLString)! as URL)
                }))
                alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction!) in
                    print("")
                }))
                
                self.present(alert, animated: true, completion: nil)
                
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
            }
        } else {
            print("Location services are not enabled")
        }
    }
}


extension FindTaxiViewController: CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        if (status == CLAuthorizationStatus.authorizedWhenInUse || status == CLAuthorizationStatus.authorizedAlways)
        {
            self.mapView.isMyLocationEnabled = true
            self.loadingPin(myLocation: (self.locationManager.location?.coordinate)!)
        }
        else
        {
            verifyPermittion()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let newLocation = locations.last
        self.customerCoordinate = newLocation!
        print("-->> \(self.customerCoordinate.coordinate.latitude) - \(self.customerCoordinate.coordinate.longitude)")
        self.mapView.camera = GMSCameraPosition.camera(withTarget: newLocation!.coordinate, zoom: 17.0)
        self.mapView.settings.myLocationButton = true
        self.mapView.isMyLocationEnabled = true
        
        locationManager.stopUpdatingLocation()
    }
    
    func loadingPin(myLocation: CLLocationCoordinate2D)
    {
        taxisPin.loadTaxiList(coordinate: myLocation) {
            for taxi in self.taxisPin.list.taxis
            {
                self.customTaxiPin(location: CLLocationCoordinate2D(latitude: taxi.lat, longitude: taxi.lng))
            }
        }
    }
    
    private func customTaxiPin(location: CLLocationCoordinate2D)
    {
        let marker = GMSMarker()
        let markerImage = UIImage(named: "carPin")!
        let markerView = UIImageView(image: markerImage)
        
        marker.position = location
        marker.iconView = markerView
        marker.map = mapView
    }
}

extension FindTaxiViewController: GMSMapViewDelegate
{
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition)
    {
        let newLocation = CLLocation(latitude: position.target.latitude,  longitude: position.target.longitude)
        self.loadingPin(myLocation: newLocation.coordinate)
    }
}
