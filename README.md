# <center><h1 align="center"> PowerShe <img src='images/logo.png' width="40" height="40"></h1></center>
### <center><p align="center"><i>A women empowerment app</i></p></center>

<p align="center"><img src='https://user-images.githubusercontent.com/83594113/211775849-acf25f49-168c-4513-9c8f-1a3195d71208.png' width="920" height="450"></p>
<br> 

## About the project


- The purpose of the app is to empower women physically, mentally and financially.

## Video
<a href= "https://youtu.be/2wHEOS_IBFE">Video</a>
    
## Salient Features

- Explore with the tutorials available
- Buy and sell your products, see your orders
- Look for the available opportunities and scholarships
- Safety implemented with alerts and safe locations
- Share feelings and grievances with other women and counsellor using communities
- A chat support feature is provided for asking questions and queries on the application

## Technology Stack

- Flutter and Dart were used as the languages to develop the application.
- Necessary packages were imported from pub.dev.
- The backend has been implemented using Firebase (authentication, store and storage are used).
- Tflite is used for implementing models for Face Recognition.
- Google Maps API are used for fetching location.
- Google DialogFlow is used for chat support.

## Compatibility

The flutter application is compatible to run on android smart phones.
    
    
### How it helped us?

- It made the app development process more efficient and predictable.
- We worked on functionalities looking at them as smaller units of the larger app due to which the process was easy to handle, flexible and allowed more room to adjust new functionalities.
   
   

## Installation

Initialise git on your terminal:
```
git init
```
<br>

Clone this repository:
``` 
git clone https://github.com/FlutterFiesta/PowerShe
```
<br>

Change the directory.
```
cd PowerShe/
```
      
<br>
      
      
Run the ```packages get``` command in your project directory:

```
flutter pub get
```

<br>

Once the build is complete, run the ```run``` command to start the app:

```
flutter run
```

In case you encounter the error ```A problem occurred evaluating project ':tflite'```,

you should change this on ~\tflite-1.1.2\android\build.gradle:

```
dependencies {
    compile 'org.tensorflow:tensorflow-lite:+'
    compile 'org.tensorflow:tensorflow-lite-gpu:+'
}
```
to this:
```
dependencies {
    implementation 'org.tensorflow:tensorflow-lite:+'
    implementation 'org.tensorflow:tensorflow-lite-gpu:+'
} 
```
    
