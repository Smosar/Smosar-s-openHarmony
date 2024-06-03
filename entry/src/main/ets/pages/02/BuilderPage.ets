class Person {
  attr:string = ''
  value:string = ''
}

@Builder function PersonInfo(person:Person) {
  Flex({justifyContent:FlexAlign.SpaceBetween , alignItems:ItemAlign.Center}){
    Text(person.attr)
    Text(person.value)
  }
  .height(40)
  .padding({left:20,right:20})
  .backgroundColor(Color.White)
  .borderRadius(5)
}

@Entry
@Component
struct BuilderPage {

  @State isShow:boolean = false
  timer = null

  aboutToAppear(){
    this.isShow = true
    this.timer = setTimeout(() => {
      this.isShow = false
      clearTimeout(this.timer)
    } , 2000)
  }

@State info:Array<Person> = [
  {attr:'姓名', value:'Smosar'},
  {attr:'年龄', value:'18'},
  {attr:'性别', value:'男女'},
  {attr:'地址', value:'上海'},
]

  build() {
    Row() {
      if(this.isShow){
        Spinning()
      }else{
        Column() {
          List({space:10}){
            ForEach(this.info , (item:Person) => {
             ListItem(){
               PersonInfo(item)
             }
            })
          }
        }
        .width('100%')
      }
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .padding({left:10 , right:10})
    .backgroundColor('#ddd')
    .height('100%')
  }
}

@Component
struct  Spinning {
  @State count:number = 0

  aboutToAppear(){
    setInterval(() => {
      if(this.count === 100){
        this.count = 0
      }
      this.count += 2
    } , 50)
  }
  build(){
    Progress({
      value:this.count,
      total:100,
      type:ProgressType.Eclipse,
    })
  }
}