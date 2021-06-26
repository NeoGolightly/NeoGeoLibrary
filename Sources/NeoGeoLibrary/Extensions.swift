//
//  File.swift
//  
//
//  Created by Michael Helmbrecht on 23.06.21.
//

import Foundation
import CoreLocation
import MapKit

extension CLLocationCoordinate2D {
  public func bearingTo(_ toLocation: CLLocationCoordinate2D) -> Double {
    let fromLatitude = self.latitude.toRadians
    let fromLongitude = self.longitude.toRadians

    let toLatitude = toLocation.latitude.toRadians
    let toLongitude = toLocation.longitude.toRadians
    
    let dLongitude = toLongitude - fromLongitude
    
    let y = sin(dLongitude) * cos(toLatitude)
    let x = cos(fromLatitude) * sin(toLatitude) - sin(fromLatitude) * cos(toLatitude) * cos(dLongitude)
    let radiansBearing = atan2(y, x)

    return radiansBearing.toDegrees
  }
  
  public func toCLLocation() -> CLLocation {
    CLLocation(latitude: self.latitude, longitude: self.longitude)
  }
}


//MARK: Hashable
extension MKCoordinateRegion: Hashable
{
  public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool
  {
    return lhs.center == rhs.center && lhs.span == rhs.span
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(center)
    hasher.combine(span)
  }
}

extension CLLocationCoordinate2D: Hashable {
  public static func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(latitude)
    hasher.combine(longitude)
  }
}

extension MKCoordinateSpan: Hashable {
  public static func == (lhs: MKCoordinateSpan, rhs: MKCoordinateSpan) -> Bool {
    return lhs.latitudeDelta != rhs.latitudeDelta || lhs.longitudeDelta != rhs.longitudeDelta
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(latitudeDelta)
    hasher.combine(longitudeDelta)
  }
}


extension Double {
  public var toRadians : Double {
    return Measurement(value: self, unit: UnitAngle.degrees)
      .converted(to: .radians)
      .value
  }
  public var toDegrees : Double {
    return Measurement(value: self, unit: UnitAngle.radians).converted(to: .degrees).value
  }
}
