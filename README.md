# Chat and Payment application

Cross platform  Chat app with integrated razorpay payment method created using flutter as a sample project for  flutter intern position.



## Features

- [x] Works for both ios and android
- [x] Real-time text messaging
- [x] Login / signup using firebase auth
- [x] Supports Card Payment , net banking payment and more 
- [x] uses firebase and razor pay 



<br/>



## Prerequisites to Setup

- If your target platform is iOS, your development environment must meet the following requirements:
  - Flutter 2.0 or later
  - Dart 2.12.0 or later
  - macOS
  - Xcode (Latest version recommended)
- If your target platform is Android, your development environment must meet the following requirements:
  - Flutter 2.0 or later
  - Dart 2.12.0 or later
  - macOS or Windows
  - Android Studio (Latest version recommended)
- If your target platform is iOS, you need a real iOS device.
- If your target platform is Android, you need an Android simulator or a real Android device.
- firebase project setup, here is a quick tutorial- 
- razorpay test api key, get here - 

<br/>

## Run the Sample App

### 1. Clone the sample project

Clone the repository to your local environment.

```js
$ git clone https://github.com/c-o-d-e-y-o-d-a/eastern_travel_internship
```





### 2. go into the proj folder


```js
cd proj
```


### 3. put the razor_pay_test_key in this page - proj\lib\pages\payment_page.dart


```
var options = {
                  'key': 'rzp_test_h9vHK8TeO1jqib',// put your test api key here
                  'amount': amountInPaise,
                  'name': authService.currentUser?.email ?? '',
                  'description': 'Fine T-Shirt',
                  'prefill': {
                    'contact': '8888888888', // Example contact
                    'email': authService.currentUser?.email ?? '',
                  }
                };
```


### 4. Install the dependecies

Install all the dependecies to run the project.

```js
flutter pub get
```

### 5. Run the sample app

Bingo, it's time to push the launch button.

```js
flutter run
```

# Screenshots


<img src="proj\assets\s8.jpeg" r width="200" height="380">
<img src="proj\assets\s7.jpeg" r width="200" height="380">
<img src="proj\assets\s6.jpeg" r width="200" height="380">
<img src="proj\assets\s5.jpeg" r width="200" height="380">
<img src="proj\assets\s4.jpeg" r width="200" height="380">
<img src="proj\assets\s3.jpeg" r width="200" height="380">
<img src="proj\assets\s2.jpeg" r width="200" height="380">
<img src="proj\assets\s1.jpeg" r width="200" height="380">
