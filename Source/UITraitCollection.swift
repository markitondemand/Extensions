//
//  UITraitCollection.swift
//  MDExtensions
//
//  Created by Michael Leber on 5/18/18.
//  Copyright © 2018 Markit. All rights reserved.
//

import Foundation

// TOOD: unit testing
public extension UITraitCollection {
    /// Represents a unique size class form factor device group (i.e. all iPads, all Plus phones, all Regular non plus phones)
    public enum Device {
        case plusPhone
        case regularPhone
        case pad
        
        public init?(collection: UITraitCollection) {
            if Device.isPlusSizedPhone(collection) {
                self = .plusPhone
            }
            else if Device.isRegularSizedPhone(collection) {
                self = .regularPhone
            }
            else if Device.isPad(collection) {
                self = .pad
            }
            return nil
        }
        
        
        private static func isPlusSizedPhone(_ collection: UITraitCollection) -> Bool {
            guard collection.userInterfaceIdiom == .phone else {
                return false
            }
            return (collection.verticalSizeClass == .compact && collection.horizontalSizeClass == .regular) || (collection.verticalSizeClass == .regular && collection.horizontalSizeClass == .compact)
            
        }
        
        private static func isRegularSizedPhone(_ collection: UITraitCollection) -> Bool {
            guard collection.userInterfaceIdiom == .phone else {
                return false
            }
            return (collection.verticalSizeClass == .regular && collection.horizontalSizeClass == .compact) || (collection.verticalSizeClass == .compact && collection.horizontalSizeClass == .compact)
        }
        
        
        private static func isPad(_ collection: UITraitCollection) -> Bool {
            return  collection.userInterfaceIdiom == .pad
        }
        
        
        /// Returns true if the current device matches the traits of a given incoming trait collection
        ///
        /// - Parameter collection: The trait collection to compare with
        /// - Returns: True if the current device matches the given trait collection, otherwise false
        public func isTraitCollectionMatching(_ collection: UITraitCollection) -> Bool {
            switch self {
            case .plusPhone:
                return Device.isPlusSizedPhone(collection)
            case .regularPhone:
                return Device.isRegularSizedPhone(collection)
            case .pad:
                return Device.isPad(collection)
            }
        }
    }
    
    
    /// Attemps to generate a Device from a given UITraitCollection (Enough information must be present for this to work) - Nill will be returned if the values in the trait collection are to ambiguous
    public var deviceForCurrentTraitCollection: Device? {
        return Device(collection: self)
    }
    
    
    /// Checks to see if any of the passed "Device" current UITraitCollection
    ///
    /// - Parameter device: The Device to check
    /// - Returns: True if the current collection matches for a given device type
    public func isCollection(for device: Device) -> Bool {
        return device.isTraitCollectionMatching(self)
    }
}
