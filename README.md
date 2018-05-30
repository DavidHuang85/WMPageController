## 为何要fork一份
因为wmPage用起来还是不错的，但有时需要自定义一些场景，所以fork一份，修修代码，然后自己项目中pod时填写此repo地址，就可以下载修改后的代码。如：
> pod 'WMPageController', :git => "https://github.com/V5zhou/WMPageController.git"

## 修改的地方及场景
#### 1. 添加代理方法 
``` Objective-c
/**
 *  左右滑动
 */
- (void)pageController:(WMPageController *)pageController didScroll:(UIScrollView *)scrollView;
```
  场景：我们在做左右滑动时，要通过滑动偏移量来修改自己界面上的一个view位置，所以通过此代理供偏移量外部读取。
#### 2. 添加代理方法
``` Objective-c
/**
 *  Is allow user goto the index?
 */
- (BOOL)pageController:(WMPageController *)pageController shouldEnterIndex:(NSInteger)index;
```
  场景：我们在左右滑动界面时，前三个界面不判定登录状态，第四个界面要求登录才能查看，否则弹出登录页面。于是就通过此代理return NO阻断滚动.

# WMPageController <a href="https://github.com/wangmchn/WMPageController/blob/master/README_zh-CN.md">中文介绍</a>
[![Platform](http://img.shields.io/badge/platform-iOS-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)
![CocoaPods Version](https://img.shields.io/badge/pod-v0.36.4-brightgreen.svg)

An easy solution to page controllers like `NetEase News`
## Overview
<img height="400" src="https://github.com/wangmchn/WMPageController/blob/master/WMPageControllerDemo/Code/WMPageController/ScreenShot/ScreenShot.gif" />
<br>

## Swift Version
Click here: https://github.com/wangmchn/WMPageController-Swift

## Basic use
1. Drag files in red frame to your project.<br>
<img height="300" src="https://github.com/wangmchn/WMPageController/blob/master/WMPageControllerDemo/Code/WMPageController/ScreenShot/guide.png" />

2. Create an controller extends from `WMPageController`.There are two ways to init the `WMPageController`:

#### Init with Classes
Use the following constructor to init the controller:
```objective-c
- (instancetype)initWithViewControllerClasses:(NSArray *)classes 
                               andTheirTitles:(NSArray *)titles;
```
Here are two important porperties:

    classes :contains the classes of child view controllers, just like [UITableViewController class];
    titles  :Each View controller's title to show in the menu view at the top of the view;

#### Use datasource
The usage is very familiar to `UITableView`, these are the methods need to implement:
```objective-c 
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController;

- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index;

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index;
```
Just implement these three datasource methods in YOUR WMPageController after initialize it.

## More
To have a custom page controller,please set the properties in `WMPageController` ,They are: `titleSize`, `titleColor`, `menuHeight`, `pageAnimatable`, `menuBGColor`, `menuItemWidth`,and also `itemsWidths`.<br>

## ViewFrame 
It's easy for you to customize your controller as following, just set `viewFrame` and done.<br>
See <a href="https://github.com/wangmchn/WMPageController/tree/master/WMPageControllerDemo/ViewFrameDemo">ViewFrameDemo</a> for more information.

<img height="300" src="https://github.com/wangmchn/WMPageController/blob/master/WMPageControllerDemo/Code/WMPageController/ScreenShot/ViewFrameDemo.gif" />

## Use Storyboard / xib
1.If you init the `WMPageController` with child controller's class,override the `-init` method in `WMPageController's childViewController`, For example:
```objective-c
- (instancetype)init {
    return [self initWithNibName:@"xxxViewController" bundle:nil];
}
```
2.If you are using datasource, Just implement `-pageController:viewControllerAtIndex:` as following:
```objective-c
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"WMViewController"];
    return vc;
}
```

## Styles
There are 4 styles to choose,  They are `WMMenuViewStyleDefault`, `WMMenuViewStyleLine`, `WMMenuViewStyleFoold`, `WMMenuViewStyleFooldHollow`;<br>

You can easily change style by setting `xxxPageController.style = WMMenuViewStyleLine`.<br>
If you want `menuView` to show on the navigation bar, set `.showOnNavigationBar = YES`;

## Using CocoaPods
    pod 'WMPageController'

## Note
You can put every controller in `WMPageController`,But if you want have a `UICollectionViewController` in, please have an attention to `UICollectionViewController's` init method.<br>
You should override the `- init` to give `UICollectionViewController` a `UICollectionViewLayout`.
Here is an example:
```objective-c
- (instancetype)init {
    // init layout here...
    self = [self initWithCollectionViewLayout:layout];
    if (self) {
        // insert code here...
    }
    return self;
}
```

## License
This project is under MIT License. See LICENSE file for more information.
