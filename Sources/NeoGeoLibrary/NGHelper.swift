//
//  File.swift
//  
//
//  Created by Michael Helmbrecht on 23.06.21.
//

import Foundation
import CoreLocation
import MapKit

final public class NGHelper {
  public static func calculateDegreeAngle(startCoordinate: CLLocationCoordinate2D,
                                   centerCoordinate: CLLocationCoordinate2D,
                                   destinationCoordinate: CLLocationCoordinate2D) -> Double {
    
    return startCoordinate.bearingTo(centerCoordinate) - centerCoordinate.bearingTo(destinationCoordinate)
  }
}
