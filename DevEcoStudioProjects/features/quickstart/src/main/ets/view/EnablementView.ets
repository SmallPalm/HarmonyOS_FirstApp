import { ArticleClass } from "../model/ArticleClass"
import { bufferToString } from '../utils/bufferUtil';

@Preview
@Component
export struct  EnablementView {
  @State enablementList: ArticleClass[] = []

  aboutToAppear(): void {
    this.getEnablementDataFormatJSON()
  }


  getEnablementDataFormatJSON() {
    getContext(this).resourceManager.getRawFileContent("EnablementData.json")
      .then(res => {
        this.enablementList = JSON.parse(bufferToString(res.buffer)) as ArticleClass[]
      })
  }


  build() {
    Column(){
      Text('赋能套件')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })

      Grid() {
        ForEach(this.enablementList, (item: ArticleClass) => {
          GridItem() {
            EnablementItem({ enablementItem: item })
          }
        }, (item: ArticleClass) => item.id)
      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(169)
      .padding({ top: 2, left: 16, right: 16 })
    }
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
  }
}


@Component
export struct EnablementItem {
  @Prop enablementItem: ArticleClass


  build() {
    Column() {
      Image($r(this.enablementItem.imageSrc))
        .objectFit(ImageFit.Cover)
        .width('100%')
        .height(96)
        .borderRadius({
          topLeft: 16,
          topRight: 16
        })
      Text(this.enablementItem.title)
        .width('100%')
        .height(19)
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontWeight(400)
        .padding({ left: 12, right: 12 })
        .margin({ top: 8 })
      Text(this.enablementItem.brief)
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
  }
}