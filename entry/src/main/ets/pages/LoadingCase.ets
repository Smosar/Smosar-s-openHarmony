@Entry
@Component
struct LoadingCase {
  @State message: string = 'Hello World'
  @State showLoading: boolean = false
  timer = null

  aboutToAppear() {
    this.showLoading = true
    this.timer = setTimeout(() => {
      this.showLoading = false
      clearTimeout(this.timer)
    }, 3000)
  }

  build() {
    Row() {
      Column() {
        if (this.showLoading) {
          // 系统自带的loading
          // LoadingProgress().width(50).height(50)
          MyLoading()
        } else {
          Text(this.message)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct MyLoading {
  @State count: number = 0

  aboutToAppear() {
    setInterval(() => {
      if (this.count === 100) {
        this.count = 0
      }
      this.count += 1
    }, 30)
  }

  build() {
    Progress({
      value: this.count,
      total: 100,
      // type: ProgressType.Eclipse, // 像月食一样
      type: ProgressType.ScaleRing, // 粗一点转圈
      // type: ProgressType.Ring, // 细一点的转圈
      // type: ProgressType.Linear, // 横线加载
    }).style({
      strokeWidth:20, // 线条的长度
      scaleCount:20, // 多少根线条
      scaleWidth:5 // 线条的宽度
    })
  }
}