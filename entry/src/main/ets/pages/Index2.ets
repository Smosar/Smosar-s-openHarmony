@Styles function myStyles() {
  .width(500)
  .height(300)

}

@Entry
@Component
struct Index2 {
  @Styles inputStyle() {
    .width(220)
    .height(60)
    .backgroundColor(Color.Pink)
    .borderRadius(20)
  }

  @Styles focusedSty(){
    .border({ width: 1, color: Color.Green })
  }

  @Styles disabledSty(){
    .backgroundColor(Color.Yellow)
  }

  @Styles pressedSty(){
    .backgroundColor(Color.Gray)
    .width(230)
  }

  @State isEnabled: boolean = true
  @State isFocus: boolean = false

  build() {
    Row() {
      Column({ space: 10 }) {

        Button('按压态')
          .btnStyle3()
          .stateStyles({
            pressed: this.pressedSty
          })
        // 采用事件的方式控制 聚焦和失焦 样式
        TextInput({ placeholder: '请输入' })
          .onFocus(() => this.isFocus = true)
          .onBlur(() => this.isFocus = false)
          .inputStyle()
          .border({
            width: this.isFocus ? 1 : 0,
            color: Color.Green
          })
        // 采用样式的方式控制
        // 注意的是，控制 聚焦 样式时，还需要设置一个
        // 失焦 的样式，否则，失焦后样式不恢复
        TextInput({ placeholder: '请输入' })
          .inputStyle()
          .inputStyle()
          .stateStyles({
            focused: this.focusedSty,
            normal: {
              .border({ width: 0 })
            }
          })
        /*
        * focused : 获取态
        * normal：正常态
        * pressed: 按压态
        * disabled: 不可用态
        */
        Button('获取态')
          .btnStyle3()
          .stateStyles({
            focused: this.pressedSty
          })
          .onClick(() => this.isEnabled = !this.isEnabled)

        Button('不可用态')
          .btnStyle3()
          .stateStyles({
            pressed: this.pressedSty,
            disabled: this.disabledSty
          })
          .enabled(this.isEnabled)
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Button) function btnStyle3() {
  .width(200)
  .height(60)
  .fontColor(Color.Black)
  .fontSize(20)
  .backgroundColor(Color.Orange)
  .borderRadius(20)
}