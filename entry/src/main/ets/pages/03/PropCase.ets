@Entry
@Component
struct PropCase {
  @State num: number = 0

  build() {
    Row() {
      Column() {
        Text(this.num + '')
          .fontSize(50)
          .fontColor('red')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.num ++
          })
        Divider().strokeWidth(6)
        Child1({ num: this.num })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Child1 {
  // Prop 4.0版本只能传 string number boolean enum ，NEXT版本都支持
  @Prop num: number // NEXT版本就不会有报错了，可以给初始值

  build() {
    Text(this.num + '').fontSize(50)
      .onClick(() => {
        this.num ++
      })
  }
}