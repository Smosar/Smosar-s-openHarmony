class publishObj {
  num:number
  name:string
}

@Component
export default struct ReplayInput {


  pubNumChange: () => void = () => {
  }
  // Partial 将所有属性改为不是必传
  @State publishObj:Partial<publishObj> = {
    num:0
  }

  build() {
    Row() {
      TextInput({
        placeholder: '回复~'
      })
        .layoutWeight(1)
        .backgroundColor('#f4f5f6')
      Flex({justifyContent:FlexAlign.SpaceAround}) {
        Text('发布')
          .textAlign(TextAlign.Center)
          .fontColor('#6ecff0')
          .margin({ left: 10 })
      }.width(70)
    }
    .height(60)
    .border({ width: { top: 1 }, color: '#f4f5f6' })
    .padding(10)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}