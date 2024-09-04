import { ArticleClass } from "../model/ArticleClass"
import { bufferToString } from '../utils/bufferUtil';

@Preview
@Component
export struct TutorialView {
  @State tutorialList: ArticleClass[] = []

  aboutToAppear(): void {
    this.getTutorialDataFormatJSON()
  }

  getTutorialDataFormatJSON() {
    getContext(this).resourceManager.getRawFileContent('TutorialData.json')
      .then(res => {
        this.tutorialList = JSON.parse(bufferToString(res.buffer)) as ArticleClass[]
      })
  }

  build() {
    Column() {
      Text('入门教程')
        .fontColor($r('sys.color.font_primary'))
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })

      List({ space: 12 }) {
        ForEach(this.tutorialList, (item: ArticleClass) => {
          ListItem() {
            TutorialItem({ tutorialItem: item })
          }
        }, (item: ArticleClass) => item.id)
      }
      .scrollBar(BarState.Off)
      .padding({ left: 16, right: 16 })
    }
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
struct TutorialItem {
  @Prop tutorialItem: ArticleClass

  build() {
    Row() {
      Column() {
        Text(this.tutorialItem.title)
          .width('100%')
          .height(19)
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontWeight(700)
          .margin({ top: 4 })
        Text(this.tutorialItem.brief)
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


      Image($r(this.tutorialItem.imageSrc))
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