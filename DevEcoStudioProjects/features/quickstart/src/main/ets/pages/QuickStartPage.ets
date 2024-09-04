import { Banner } from "../view/Banner"
import { EnablementView } from "../view/EnablementView"
import { TutorialView } from "../view/TutorialView"

const a = '快速入门'
// 这个装饰器用于声明程序的入口组件，是应用启动时首先加载的页面

// 用于定义一个组件。组件是 UI 的基本构建块，可以包含布局、视图、逻辑和样式
@Component
//定义了一个名为 Index 的组件, 类似于 JavaScript 中的类（class）,但在 ArkUI 中采用 struct 的形式。
export struct QuickStartPage  {
  // 用于声明组件的状态变量，当状态改变时，组件会自动重新渲染
  @State message: string = a;
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
      Scroll() {
        Column() {
          Banner()
          EnablementView()
          TutorialView()
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3f5')
  }
}




