# YFBinarySort
本工程是利用苹果提供的clang静态插桩技术，获取启动启动过程中所有调用过的方法的符号信息，可覆盖OC、swift、以及block的调用。order文件的生成只可在DEBUG环境下进行，发布环境无法生效。
> 建议大家尽量在上线发版前生成，防止最后一刻还有代码改动~

## 使用
三步完成启动优化之-二进制重排
1.首页，在你的app第一个页面显示完毕后调用如下方法：`[YFMakeOrderFile getOrderFile];`
2.然后把`ret.order`文件放到你app的工程根目录下
3.在`Build Settings`的`Order File`编译选项中指定路径为`${SRCROOT}/ret.order`

## 安装

通过 [CocoaPods](https://cocoapods.org).安装即可:

```ruby
pod 'YFBinarySort'
```

## 作者

会跑的鱼, deng_web@163.com

## License

YFBinarySort is available under the MIT license. See the LICENSE file for more info.
