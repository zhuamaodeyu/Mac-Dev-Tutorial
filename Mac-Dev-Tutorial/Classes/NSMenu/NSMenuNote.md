


mac 中涉及到菜单的地方比较多  

* 菜单栏    

    ```
    # 获取主menu 
    let mainMenu = NSApp.mainMenu
    
    # 创建 item  
    
    
    # 创建menu  
    
    # item 添加 menu  
    [oneItem setSubmenu:subMenu];
    
    //更新
    [NSApp setMainMenu:mainMenu];
    ```
    
   
* dock   
	
	```
	# appDelegate 中添加属性 dockMenu  
	private var dockMenu: NSMenu!  
	
	self.dockMenu = [[NSMenu alloc] initWithTitle:@"DockMenu"];
	[self.dockMenu setAutoenablesItems:NO];
	
	[self.dockMenu addItem:oneItem];
	
	
	# 代理返回 
	- (NSMenu *)applicationDockMenu:(NSApplication *)sender
	{
	    return self.dockMenu;
	}
	```


* statusitem    
	
	```
	let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
	
	statusItem.menu = subMenu;
	
	
	```


* view  

