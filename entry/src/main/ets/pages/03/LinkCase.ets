@Entry
@Component
struct LinkCase {
  @State num: number = 0

  build() {
    Row() {
      Column() {
        Text(this.num + '')
          .fontSize(50)
          .fontColor('red')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.num++
          })
        Divider().strokeWidth(6)
        Child({ num: $num }) // 这里注意传值用$$$$$$$$$$$$
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Child {
  @Link num: number

  build() {
    Text(this.num + '').fontSize(50)
      .onClick(() => {
        this.num++
      })
  }
}