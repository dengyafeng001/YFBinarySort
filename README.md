# YFBinarySort
本工程是利用苹果提供的clang静态插桩技术，获取从启动到主动调用结束方法为止app中所有调用过的方法的符号信息，方便大家进行二进制重排优化。整个order文件的生成只可在DEBUG环境下进行，发布环境没有任何文件生成。
> 建议大家尽量在上线发版前生成，防止最后一刻还有代码改动~

## 使用

首页，在你的app第一个页面显示完毕后调用如下方法：
```
[YFMakeOrderFile getOrderFile];

控制台输出如下：
文件生成路径：/Users/dyf/Library/Developer/CoreSimulator/Devices/C562AD07-5B85-473A-B683-067E20A548CA/data/Containers/Data/Application/30A433FE-20E5-4EC3-BFB8-E7B6B67DC576/tmp/ret.order
```
然后把`ret.order`文件放到你app的工程根目录下，并且在`Build Settings`的`Order File`编译选项中指定路径为`${SRCROOT}/ret.order`

## 安装

通过 [CocoaPods](https://cocoapods.org).安装即可:

```ruby
pod 'YFBinarySort'
```

## 作者

会跑的鱼, deng_web@163.com

## License

YFBinarySort is available under the MIT license. See the LICENSE file for more info.
