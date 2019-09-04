# iOS UI组件隐藏可设置不占位置

## 背景
iOS开发过程中有这样的需求： 当label 中text 为空时要将label 隐藏并后面的UI组件要顶上来。在安卓中可以设置相应的属性即可，但是在iOS中没有默认的功能实现。为了能够在iOS中也实现这个功能，我们需要知道一些NSLayoutConstraint的知识。
## NSLayoutConstraint
首先我们看一下其实例方法：
```
+(instancetype)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c;
```

根据其实例方法我们可以知道，每一个constraint都有两个item,firstItem: 
要添加约束的对象  secondItem: 被参照对象。当然设置宽高约束时，secondItem 设置为nil.

## 解决方案
为了使控件在隐藏的时候后续的控件可以占用其位置，我们需要将要隐藏的控件和其他控件之间的约束值设为0，同时将该控件的宽高约束（如果有的话设为0），有一点需要注意的是我们不能讲该空间和父视图的约束去掉，因为要保留在父视图的位置,这样我们就可以使得下一个控件能够占用现在要隐藏的控件的位置，条件就是要和隐藏控件有约束关系。
还有一点需要注意的是：必须是使用NSLayoutConstraint进行的约束才可以。
# Demo
[ViewHiddenAndDidNotDisplaySpace](https://github.com/iMinger/ViewHiddenAndDidNotDisplaySpace)

