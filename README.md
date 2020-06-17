# XcodeProjects
Don't write "pod install", "pod update" and "cd <your project>" anymore
  
# How to install this
Go to release section in this repo and download the binary. Drag & drop XcodeProjects.app to your Application folder. Enjoy

# How to use it
After first run of the app 

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/blob/master/Images/example_empty_list.png?raw=true)

you need to press + button and add folders with you projects within dialog.

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/blob/master/Images/example_list_of_projects.png?raw=true)

Now you can press on the project you want and you will see options that you can interact with 

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/blob/master/Images/example_context_menu.png?raw=true)

**Open in Terminal** - opens the path of the project in terminal. Handy to quicly switch to the folder of the project
**Show in Finder** - opens the folder of the project in Finder
**Open in Sourcetree** - opens the folder of the project in Sourcetree(if you have Sourcetree)
**Open Workspace** - opens the workspace/project in Xcode(known issue -> workspace should have the same name as folder)

**Pod install** - runs "pod install" command in terminal for the project
**Pod update** - runs "pod update" command in terminal for the project

**Remove from the list** - removes project from the list

Also it is possible to drag projects around. Simple perform drag from the empty space of the project

![alt text](https://github.com/DKalachniuk/XcodeProjects/blob/master/blob/master/Images/example_drag_and_drop.png?raw=true)

# Known issues

- workspace/project file should have the same name as folder. Otherwise it won't be opened

# Support
Just simple star ⭐️ will make my life happier :) 

If you want to support this project, feel free to send some coffee money to this [link](paypal.me/dkalachniuk)
If you don't want to spend money, you can still support me if you will share this tool with your colleagues and tell them how nice it is and how it improved your workflow.

# TODO
- add carthage support
- add sorting to the list of projects
- configure the actions when you press on the project. so you will be able to see only those that you need

