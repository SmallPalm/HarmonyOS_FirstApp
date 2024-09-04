// ResourceStr: Resource类型与string类型的联合类型, Resource类型在加载本地图片资源时会用到的，而string类型在加载网络图片资源时会用到。


class  BannerClass {
  // 用于唯一标识每一张图片资源
  id: string = ''
  // 用于存储图片地址
  imageStr: ResourceStr = ''
  // 用于存储Banner图片点击后跳转到的在线网页地址
  url: string = ''

  constructor(id: string, imageStr: Resource, url: string) {
    // 使用传入的id、imageSrc与url作为实例化对象的对应属性值
    this.id = id
    this.imageStr = imageStr
    this.url = url
  }
}

// 这个装饰器用于声明程序的入口组件，是应用启动时首先加载的页面
@Entry
// 用于定义一个组件。组件是 UI 的基本构建块，可以包含布局、视图、逻辑和样式
@Component

//定义了一个名为 Index 的组件, 类似于 JavaScript 中的类（class）,但在 ArkUI 中采用 struct 的形式。
struct Index {
  // 用于声明组件的状态变量，当状态改变时，组件会自动重新渲染
  @State message: string = '快速入门';
  @State count: number = 10;

  //build() 方法是组件的核心部分，用于定义 UI 的结构和样式。
  build() {
    // Column: 使组件内的元素沿垂直方法布局
    Column() {
      Text(this.message)
        .fontSize(22)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({left: 16})
        .fontFamily("HarmonyHeiTi-Bold")
        .lineHeight(33)
      Banner()
      EnablementItem()
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3f5')
  }
}

@Preview
@Component
struct Banner {
  @State bannerList: Array<BannerClass> = [
    // 创建BannerClass实例
    new BannerClass('pic0', $r('app.media.banner_pic0'),'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
    new BannerClass('pic1', $r('app.media.banner_pic1'),'https://developer.huawei.com/consumer/cn/'),
    new BannerClass('pic2', $r('app.media.banner_pic2'),'https://developer.huawei.com/consumer/cn/deveco-studio/'),
    new BannerClass('pic3', $r('app.media.banner_pic3'),'https://developer.huawei.com/consumer/cn/arkts/'),
    new BannerClass('pic4', $r('app.media.banner_pic4'),'https://developer.huawei.com/consumer/cn/arkui/'),
    new BannerClass('pic5', $r('app.media.banner_pic5'),'https://developer.huawei.com/consumer/cn/sdk')
  ]


  build() {
    // Swiper组件作为外层容器
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass, index: number) => {
        // 引入图片地址
        Image(item.imageStr)
          // 设置图片的缩放模式为 Contain（保持图片的长宽比，使图片包含在容器中）。
          .objectFit(ImageFit.Contain)
          .width('100%')
          .padding({top: 11, left: 16, right: 16})
          .borderRadius(16)
      }, (item:BannerClass, index: number) => item.id)
    }
    // autoPlay控制是否自动轮播子组件
    .autoPlay(true)
    // loop属性控制是否循环播放
    .loop(true)
    // indicator属性自定义导航点的位置和样式。
    .indicator(
      new DotIndicator()
        // 导航点
        .color('#F00')
        // 选中导航点
        .selectedColor('#0f0')
    )
  }
}

@Preview
@Component
struct  EnablementItem {

  build() {
    Row() {
      Column() {
        Text($r("app.string.title"))
          .width('100%')
          .height(19)
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontWeight(700)
          .margin({ top: 4 })
        Text($r("app.string.brief"))
          .width('100%')
          .height(32)
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor('rgba(0, 0, 0, 0.6)')
          .margin({ top: 6 })
      }
      .height('100%')
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ right: 12 })


      Image($r("app.media.enablement_pic1"))
        .objectFit(ImageFit.Cover)
        .width(108)
        .height(64)
        .borderRadius(16)
    }
    .width('100%')
    .height(88)
    .borderRadius(16)
    .padding(12)
    .alignItems(VerticalAlign.Top)
  }
}

/**
 * ForEach循环渲染的第一个参数是一个任意类型的数组arr
 * ForEach循环渲染的第二个参数回调函数, 按序取获取到数组中的每一个项
 * ForEach的第三个参数是keyGenerator，这个部分本质上也是一个函数
 * 这个函数关键的作用就在于通过标识每一个实际的组件
 * 当数组元素变化触发页面更新时，能通过对比标识来判断组件是否存在
 * 是否需要创建新的对应的组件，达成增量渲染，而非全量的重新渲染，以提高渲染效率
 * */

 /**

       Column() {
        Image(item.imageStr)
          .objectFit(ImageFit.Cover)
          .width('100%')
          .height(96)
          .borderRadius({
            topLeft: 16,
            topRight: 16
          })
        Text(item.title)
          .width('100%')
          .height(19)
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontWeight(400)
          .padding({ left: 12, right: 12 })
          .margin({ top: 8 })
        Text(item.brief)
          .width('100%')
          .height(32)
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor('rgba(0, 0, 0, 0.6)')
          .padding({ left: 12, right: 12 })
          .margin({ top: 2 })
      }
      .width(160)
      .height(169)
      .borderRadius(16)
      .backgroundColor(Color.White)
 */