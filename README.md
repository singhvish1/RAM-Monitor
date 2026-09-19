# Device Metrics App

## Overview
The Device Metrics App is a SwiftUI application designed to monitor and display real-time system metrics, including RAM, CPU, and SSD usage. It provides users with insights into their device's performance and specifications through a user-friendly interface and interactive widgets.

## Features
- Real-time monitoring of CPU, RAM, and SSD usage.
- Detailed device specifications including device name, model, and OS version.
- Interactive dashboard displaying key metrics at a glance.
- Widgets for quick access to system metrics.
- Historical data and trends for resource usage.

## Project Structure
```
DeviceMetricsApp
├── DeviceMetricsApp
│   ├── App.swift
│   ├── ContentView.swift
│   ├── Models
│   │   ├── DeviceInfo.swift
│   │   ├── SystemMetrics.swift
│   │   └── UsageSnapshot.swift
│   ├── ViewModels
│   │   └── SystemMonitorViewModel.swift
│   ├── Views
│   │   ├── DashboardView.swift
│   │   ├── MetricsView.swift
│   │   ├── Widgets
│   │   │   ├── CPUWidget.swift
│   │   │   ├── RAMWidget.swift
│   │   │   ├── SSDWidget.swift
│   │   │   └── DeviceSpecsWidget.swift
│   │   └── DetailRow.swift
│   ├── Services
│   │   ├── DeviceInfoService.swift
│   │   ├── SystemMetricsService.swift
│   │   └── UsageMonitor.swift
│   ├── Resources
│   │   └── Assets.xcassets
│   ├── Preview Content
│   │   └── Preview Assets.xcassets
│   └── Info.plist
├── DeviceMetricsWidget
│   ├── DeviceMetricsWidgetBundle.swift
│   ├── DeviceMetricsWidget.swift
│   ├── DeviceMetricsWidgetEntryView.swift
│   └── Info.plist
├── DeviceMetricsApp.xcodeproj
├── README.md
├── .gitignore
└── Package.swift
```

## Installation
1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Open the project in Xcode.
3. Build and run the app on a physical device or simulator.

## Usage
- Launch the app to view the dashboard with real-time metrics.
- Access detailed metrics by navigating to the MetricsView.
- Add widgets to your home screen for quick access to system metrics.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.