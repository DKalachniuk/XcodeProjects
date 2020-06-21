# XcodeProjects
Switch between projects in 2 clicks. Don't write "pod install", "pod update" and "cd <your project>" anymore
  
# When do you need this tool
- when you need to change directory of your project in the terminal 
- when you type <pod install> and <pod update> in the terminal
- when you want quickly open your project in "SourceTree"
- when you have a lot of projects or modules/frameworks and you need to switch between them quickly
  
# How to install this
Go to release section in this repo and download the binary. Drag & drop XcodeProjects.app to your Application folder. Enjoy

# How to use it
After first run of the app 

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/blob/master/Images/example_empty_list.png?raw=true)

click "+" button and add folder(s) of you project(s) within dialog.

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/blob/master/Images/example_list_of_projects.png?raw=true)

**Click "arrows" button to open your xcode workspace/project**

**Click "..." button to see the options** 

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/blob/master/Images/example_context_menu.png?raw=true)

**Open in Terminal** - opens the path of the project in terminal. Handy to quicly switch to the folder of the project

**Show in Finder** - opens the folder of the project in Finder

**Open in Sourcetree** - opens the folder of the project in Sourcetree(if you have Sourcetree)


**Pod install** - runs "pod install" command in terminal for the project

**Pod update** - runs "pod update" command in terminal for the project


**Remove from the list** - removes project from the list

Also it is possible to drag projects around.

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/blob/master/Images/example_drag_and_drop.png?raw=true)

# Support
Just simple star ⭐️ will make my life happier :) 

If you want to support this project, feel free to send some coffee money to this [link](paypal.me/dkalachniuk)
If you don't want to spend money, you can still support me if you will share this tool with your colleagues and tell them how nice it is and how it improved your workflow.

# Ideas
- add command to support carthage update
- add sorting to the list of projects
- add favorites projects
- configure the actions when you press on the project. so you will be able to see only those that you need

# TODO
- ~~update commands logic so some commands like: open workspace, open in finder will not use terminal to open the files~~
- ~~put action "open in Xcode" in the main view~~
- add Sparkle framework to check for updates automatically

# Special Thanks
Special thanks to 
- [Solokub](https://github.com/Solokub) - for providing awesome logo. 🥳
- [Gui Rambo](https://gumroad.com/insidegui) - for his awesome project "StatusBuddy". [Gui Rambo's github](https://github.com/insidegui)
