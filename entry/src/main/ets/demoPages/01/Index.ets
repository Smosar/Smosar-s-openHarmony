@Styles function btnStyle() {
  .width(200)
  .height(60)
  .backgroundColor(Color.Pink)
  .borderRadius(20)
}

@Extend(Button) function btnStyle2() {
  .width(200)
  .height(60)
  .backgroundColor(Color.Orange)
  .borderRadius(20)
  .fontWeight(FontWeight.Bold)
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('定义函数styles')
          .btnStyle()
          .margin({ bottom: 20 })
        Button('继承属性Extend')
          .btnStyle2()
      }
      .width('100%')
    }
    .height('100%')
  }
}

