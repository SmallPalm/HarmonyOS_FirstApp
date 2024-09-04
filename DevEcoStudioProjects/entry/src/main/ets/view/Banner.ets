import { BannerClass } from "../model/BannerClass"
import { bufferToString } from "../utils/bufferUtil"

@Preview
@Component
export struct Banner {
  @State bannerList: BannerClass[] = []

  //aboutToAppear函数: 在创建自定义组件的新实例后，在执行其build()函数之前执行。
  aboutToAppear(): void {
    //表示在该时间调用方法进行json文件的读取，并存入bannerList 。
    this.getBannerDataFromJSON()
  }

  //读取json文件内容
  getBannerDataFromJSON() {
    /**
     * ResourceManager获取到的是ArrayBufferLike类型的内容
     * 所以需要将对应的内容转换为字符串，并将字符串解析为对应的数据结构
     * */
    getContext(this).resourceManager.getRawFileContent('BannerData.json').then(value => {
      // 获取buffer内容, 转换为字符串, 解析为JSON数据结构
      this.bannerList = JSON.parse(bufferToString(value.buffer)) as BannerClass[];
    })
  }


  build() {
    // Swiper组件作为外层容器
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass) => {
        // 引入图片地址
        Image($r(item.imageSrc))
          // 设置图片的缩放模式为 Contain（保持图片的长宽比，使图片包含在容器中）。
          .objectFit(ImageFit.Contain)
          .width('100%')
          .padding({top: 11, left: 16, right: 16})
          .borderRadius(16)
      }, (item:BannerClass) => item.id)
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