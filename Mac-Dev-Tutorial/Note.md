
# Note  

1. 删除storyboard中的window和viewcontroller， 将显示一个只有菜单栏的程序  
2. 创建 NSWindowController 作为主窗口  
    可以配合一个 xib 文件，可以正常显示，如果没有，controller创建成功，但是 没有 window对象，所以无法显示  
    

3. 显示 window的方式  
    * 通过 xib / storyboard创建对应的 NSWindowController ，然后显示   
        `windowNibName` 方法中返回  nil 名字
    * 通过 `init(window: NSWindow?) `初始化 NSWindowController 显示  
        一般window设置都在windowDidLoad方法进行，此处的生命周期是这样的  
        * loadWindow,
        * is WindowLoaded 
        * windowWillLoad
        * windowDidLoad
        mac 开发强依赖 nib，所以通过 `init(window: NSWindow?) ` 初始化无法调用 loadWindow 等方法。可以进行手动调用  
        


4. 创建 ViewController  
    * xib 创建  
    * 手工创建，重写 loadView 方法， 不能调  super 方法，在此方法中设置 self.view 
