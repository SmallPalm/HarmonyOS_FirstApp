// ResourceStr: Resource类型与string类型的联合类型, Resource类型在加载本地图片资源时会用到的，而string类型在加载网络图片资源时会用到。

export class  ArticleClass {
  // 用于唯一标识每一张图片资源
  id: string = ''
  // 用于存储图片地址
  imageSrc: string = ''
  // 用于存储Banner图片点击后跳转到的在线网页地址
  webUrl: string = ''
  title: string = ''
  brief: string = ''

  constructor(id: string, imageSrc: string, title: string, brief: string, webUrl:string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.title = title;
    this.brief = brief;
    this.webUrl = webUrl;
  }
}