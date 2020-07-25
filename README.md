# XcodeProjects
Switch between projects in 2 clicks. Don't write "pod install", "pod update" and "cd <your project>" in the terminal anymore!
  
# When do you need this tool
- you want to open quickly specific Xcode project
- you need to change directory to point to your project in the terminal 
- you type "pod install" and "pod update" in the terminal too often. Do it in 2 clicks
- you want quickly open your project in SourceTree
- you have a lot of projects or modules/frameworks and you need to switch between them quickly
  
# How to install
Go to release section in this repo and download the binary. Drag & drop XcodeProjects.app to your Application folder. Enjoy! 

# Design 
When you open the app for the first time you would see empty screen

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/Images/example_empty_list.png?raw=true)

click "+" button to add folder of you project within system dialog (Hint: choose multiple projects)

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/Images/example_list_of_projects_dark.png?raw=true)
![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/Images/example_list_of_projects_light.png?raw=true)

**Click "arrows" button to open your Xcode workspace/project**

**Click "..." button to see the options** 

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/Images/example_context_menu_dark.png?raw=true)
![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/Images/example_context_menu_light.png?raw=true)

**Open in Terminal** - opens the path to the project in terminal. Handy to quickly switch to the folder of the project

**Show in Finder** - opens the folder of the project in Finder

**Open in Sourcetree** - opens the folder of the project in Sourcetree (if you have Sourcetree)

**Pod install** - runs "pod install" command in terminal for the project

**Pod update** - runs "pod update" command in terminal for the project

**Remove from the list** - removes project from the list

Also it is possible to drag projects around.

![alt text](https://github.com/DKalachniuk/XcodeProjects/Images/example_drag_and_drop_dark.png?raw=true)


**Clear Xcode derived data** - removes Xcode derived data from default location ~/Library/Developer/Xcode/DerivedData

# Support
Just simple star ⭐️ will make my life happier :) 

If you want to support this project, feel free to send some coffee money to this [link](paypal.me/dkalachniuk)
If you don't want to spend money, you can still support me if you will share this tool with your colleagues.

# Ideas
- add command to support carthage update
- add sorting to the list of projects
- add favorites projects
- configure the actions when you press on the project. so you will be able to see only those that you need

# TODO
- ~~update commands logic so some commands like: open workspace, open in finder will not use terminal to open the files~~
- ~~put action "open in Xcode" in the main view~~
- ability to rename project name
- add Sparkle framework to check for updates automatically

# Special Thanks
Special thanks to 
- [Solokub](https://github.com/Solokub) - for providing awesome design for the app. 🥳
- [Gui Rambo](https://gumroad.com/insidegui) - for his awesome project "StatusBuddy". [Gui Rambo's github](https://github.com/insidegui)

# Badges
[![HitCount](http://hits.dwyl.com/DKalachniuk/XcodeProjects.svg)](http://hits.dwyl.com/DKalachniuk/XcodeProjects)
