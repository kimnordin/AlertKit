//
//  AlertManager.swift
//  AlertKit
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

public class AlertManager: ObservableObject {
    @Published var alerts = [CustomAlert]()
    
    public func displayAlert(_ alert: CustomAlert) {
        DispatchQueue.main.async {
            self.alerts.append(alert)
        }
    }
    
    public func dismissAlert(_ alert: CustomAlert) {
        if let index = self.alerts.firstIndex(where: { $0.id == alert.id }) {
            DispatchQueue.main.async {
                self.alerts.remove(at: index)
            }
        }
    }
}
