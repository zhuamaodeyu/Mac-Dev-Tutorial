
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


5. window 大小的问题  
    1. window中的控制器view 大小会影响window的大小， 如果 viewController view 没有设置大小，默认是window将不显示， 如果 view 大于 window大小，将以view为标准显示  
    2. viewController view 的frame 更改，必须在设置 `windowController.contentViewController` 之前更改，之后更改无效


6. 代码初始化  controller 
    * windowController   
     
		```
		 override init(window: NSWindow?) {
        	super.init(window: window)
        	window?.delegate = self
        	windowDidLoad()
    	}
		
		```
		此处采用手动调用 `windowDidLoad`方法，系统将不会自动调用 此系列方法  
	* viewController  
	
		```
		override func loadView() {
        	self.view = NSView.init()
    	}
		```
		在 `loadView` 方法中设置 view， __不能调用 `super`方法__   
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
