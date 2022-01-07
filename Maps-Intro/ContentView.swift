//
//  ContentView.swift
//  Maps-Intro
//
//  Created by David Svensson on 2022-01-07.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let locationManager = LocationManager()
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33233141, longitude: -122.0312186), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    @State var places = [
        Place(name: "nice place", latitude: 37.33233141, longitude: -122.032),
        Place(name: "Food", latitude: 37.33233141, longitude: -122.030),
        Place(name: "Nice Food", latitude: 37.33233141, longitude: -122.029)
    ]
    
   // @State var showUserLocation = false
    
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region,
                interactionModes: [.all],
                showsUserLocation: true,
                userTrackingMode: .constant(.follow),
                annotationItems: places) { place in
                //MapPin(coordinate: place.coordinate)
                //MapMarker(coordinate: place.coordinate)
                MapAnnotation(coordinate: place.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5) ) {
                    VStack {
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(place.name)
                    }
                }
            }
            Button(action: {
               addPin()
              //  showUserLocation.toggle()
            }, label: {
                Text("Add pin")
            })
            Button(action: {
                locationManager.askForPermission()
            }, label: {
                Text("permission")
            })
        }
    }
    
    func addPin() {
        //let newPlace = Place(name: "New Place", latitude: 37.33233141, longitude: -122.027 )
        
        if let location = locationManager.location {
            let newPlace = Place(name: "Here", latitude: location.latitude, longitude: location.longitude)
            
            places.append(newPlace)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
