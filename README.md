# Order Tracker App

This is a simple mobile app built using Flutter for the OoNt Take-Home Assignment. It displays a list of sample orders and allows the user to cancel pending ones.

## Features

### Display Orders

- The app displays a list of 5 sample orders on first launch.
- Each order shows the product name, amount, status, and an image.
- The orders are listed in a scrollable `ListView`.

### Cancel an Order

- Only orders with a "pending" status can be cancelled.
- Tapping "Cancel Order" opens a confirmation dialog.
- Once confirmed, the order status changes to "cancelled" and the cancel option is removed.

### Filter by Status

- Users can filter orders using a tab bar.
- Available filters: All, Pending, Completed, Cancelled.

### Local Persistence

- The app uses `shared_preferences` to store and persist order data locally.
- Changes to orders are retained even after the app is restarted.

## How to Run the App

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio or Visual Studio Code with Flutter and Dart plugins
- A connected device or emulator

### Steps

1. Clone the repository:

```bash
git clone https://github.com/ArbabShujaat/Mini-Order-Tracker-App.git
cd Mini-Order-Tracker-App
```

### Demo Video

https://github.com/user-attachments/assets/4a26ff7d-5485-48d7-8607-e464b44bd44f
