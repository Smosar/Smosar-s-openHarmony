@Entry
@Component
struct SlotDemo {
  @Builder getCardItem() {
    InfoItem({ leftValue: "员工姓名", rightValue: '张三' })
    InfoItem({ leftValue: "员工编号", rightValue: '001' })
    InfoItem({ leftValue: "员工性别", rightValue: '女' })
    InfoItem({ leftValue: "员工权限", rightValue: '高级', isEnd: true })
  }

  build() {
    Row() {
      Column() {
        // 方式一
        // MyCard() {
        //   this.getCardItem()
        // }
        // 方式二
        MyCard({ getContent: this.getCardItem })
      }
      .width('100%')
    }
    .padding({ left: 10, right: 10 })
    .height('100%')
    .backgroundColor('#f2f2f2')
  }
}

@Component
struct MyCard {
  @BuilderParam
  getContent: () => void = () => {
  }

  build() {
    Column() {
      this.getContent()
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(10)
    .margin({ top: 10 })
    .padding({ left: 15, right: 15 })
  }
}

@Component
struct InfoItem {
  leftValue: string = ''
  rightValue: string = ''
  isEnd: boolean = false

  build() {
    Row() {
      Text(this.leftValue)
      Text(this.rightValue)
        .fontColor('#ccc')
    }
    .width('100%')
    .height(60)
    .backgroundColor(Color.White)
    // .borderRadius(8)
    .border({ width: { bottom: this.isEnd ? 0 : 1 }, color: '#f4f5f6' })
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 10, right: 10 })
  }
}