![Header of Tamamushi](https://github.com/makomori/Tamamushi/blob/master/tamamushi_header.png)
# Tamamushi
Tamamushi is an easy to use gradient UINavigationBar written in Swift 3. You can use already defined gradient color sets like Facebook Messenger, YouTube, SoundCloud or other cool gradient color sets.

And "Tamamushi" is the Japanese name of the insect which has beautiful gradient color wings.

## Requirements
- Swift 3
- Xcode 8

## Installation
### Cocoapods
```
pod 'Tamamushi'
```

### Carthage
Will be available soon.

## Usage
```import Tamamushi``` in the class you set gradient UINavigationBar
 
### In AppDelegate
``` Swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    TMGradientNavigationBar().setInitialBarGradientColor(direction: .vertical, typeName: "SoundCloud")
    return true
}
```

### In UIViewController(with NavigationBar)

``` Swift
override func viewDidLoad() {
    super.viewDidLoad()  
    TMGradientNavigationBar().setGradientColorOnNavigationBar(bar: (self.navigationController?.navigationBar)!, direction: .vertical, typeName: "Facebook Messenger")
}
```

## Customization
### Using defined colors
You can use gradient color sets defined in gradients.json.

``` Swift
TMGradientNavigationBar().setInitialBarGradientColor(direction: .vertical, typeName: "SoundCloud")
```
Please look at the ist of gradient colors available.

### Using original colors
Of course you can use original gradient colors.

``` Swift
TMGradientNavigationBar().setInitialBarGradientColor(direction: .horizontal, startColor: .red, endColor: .blue)
```

### Direction
you can choose the direction of gradation. (Default is vertical)

```.horizontal```, or ```.vertical```

## License
This library is released with MIT license. And as a source of colors, JSON file from uiGradients by ghosh is used.
