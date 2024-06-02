@Entry
@Component
struct Index3 {

  @State isShowImg:boolean = false
  @State currentSelected:number = -1

  build() {
    Flex() {
      Column() {
        Toggle({
          type:ToggleType.Checkbox,
        })
        Toggle({
          type:ToggleType.Switch,
        })
          .onChange((isOn) => {
            this.isShowImg = isOn
            // AlertDialog.show({message: isOn + ""})
          })
        Image($r('app.media.application'))
          .width(this.isShowImg ? 150 : 0)
          .height(150)
      }
      .width(200)
      .margin({bottom:20})


      Column(){
        Text('选择').fontSize(20)
        Select([
          {value:'小白' , icon: $r('app.media.icon')},
          {value:'小红' , icon: $r('app.media.icon')},
          {value:'小李' , icon: $r('app.media.icon')}
        ]).onSelect((i , item) => {
          this.currentSelected = i
        })
        Text(this.currentSelected === 0 ? '小白' : '小红和小李')
      }
    }
    .height('100%')
  }
}