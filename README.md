# App Evolve UI Test

This repository was created to assess the creation of a **mobile** and **web** view in Flutter based off a Figma Design.

## How to Run

1. Clone the repo.
2. run ```flutter channel stable```
2. run ```flutter pub get```
3. run ```flutter run```

This repo is using **flutter channel stable**
## Points to Note

1. There is partial functionality for the mobile view such as **sort**, **filter**, and **search**, however there is none for the web and that is just pure design.

2. The phone design was from a iPhone 11 Pro. I dont have that device but I managed to test to ensure the **SafeArea** and the **AppBar** were in accordance to specifcations.

3. The Display resolution for the web design was a 1440 resolution. My Display resolution is 1920 x 1080 which scales up closely however minor discrepancies might occur however I **Flexed** as much as possible to allow for smaller/larger devices to be used. In a full project, the use of UI Testing will overcome this shortcoming as it is.

4. Figma has been found to not convert fully pixel for pixel in the the flutter frame work. I have come accross some plugins that should help with this in future projects (if I am hired that is :D).

