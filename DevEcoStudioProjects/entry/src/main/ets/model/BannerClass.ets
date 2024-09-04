// ResourceStr: Resource类型与string类型的联合类型, Resource类型在加载本地图片资源时会用到的，而string类型在加载网络图片资源时会用到。

export class  BannerClass {
  // 用于唯一标识每一张图片资源
  id: string = ''
  // 用于存储图片地址
  imageSrc: string = ''
  // 用于存储Banner图片点击后跳转到的在线网页地址
  url: string = ''

  constructor(id: string, imageSrc: string, url: string) {
    // 使用传入的id、imageSrc与url作为实例化对象的对应属性值
    this.id = id
    this.imageSrc = imageSrc
    this.url = url
  }
}