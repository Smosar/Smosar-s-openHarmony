// 商品类型
class GoodsItem {
  goods_name: string
  goods_price: number
  goods_img: string
  goods_count: number
  id: number
  likes?: number
  likeFlag?: boolean
}

@Entry
@Component
struct StackDemo {
  // 两种定义类型的方式
  // @State list:GoodsItem[] = []
  // @State list: Array<GoodsItem> = []
  // TS 方法，Partial 后面跟泛型，表示所有属性都不是必传的
  // @State li:Partial<GoodsItem> = {}
  @State list: Array<GoodsItem> = [
    {
      "id": 1,
      "goods_name": "班俏BANQIAO超火ins潮卫衣女士2020秋季新款韩版宽松慵懒风薄款外套带帽上衣",
      "goods_img": "assets/1.webp",
      "goods_price": 108,
      "goods_count": 1,
    },
    {
      "id": 2,
      "goods_name": "嘉叶希连帽卫衣女春秋薄款2020新款宽松bf韩版字母印花中长款外套ins潮",
      "goods_img": "assets/2.webp",
      "goods_price": 129,
      "goods_count": 1,
      "likes": 100
    },
    {
      "id": 3,
      "goods_name": "思蜜怡2020休闲运动套装女春秋季新款时尚大码宽松长袖卫衣两件套",
      "goods_img": "assets/3.webp",
      "goods_price": 198,
      "goods_count": 1,
      "likes": 32
    },
    {
      "id": 4,
      "goods_name": "思蜜怡卫衣女加绒加厚2020秋冬装新款韩版宽松上衣连帽中长款外套",
      "goods_img": "assets/4.webp",
      "goods_price": 99,
      "goods_count": 1,
      "likes": 539
    },
    {
      "id": 5,
      "goods_name": "幂凝早秋季卫衣女春秋装韩版宽松中长款假两件上衣薄款ins盐系外套潮",
      "goods_img": "assets/5.webp",
      "goods_price": 156,
      "goods_count": 1,
      "likes": 862
    },
    {
      "id": 6,
      "goods_name": "ME&CITY女装冬季新款针织抽绳休闲连帽卫衣女",
      "goods_img": "assets/6.webp",
      "goods_price": 142.8,
      "goods_count": 1,
      "likes": 21
    },
    {
      "id": 7,
      "goods_name": "幂凝假两件女士卫衣秋冬女装2020年新款韩版宽松春秋季薄款ins潮外套",
      "goods_img": "assets/7.webp",
      "goods_price": 219,
      "goods_count": 2,
    },
    {
      "id": 8,
      "goods_name": "依魅人2020休闲运动衣套装女秋季新款秋季韩版宽松卫衣 时尚两件套",
      "goods_img": "assets/8.webp",
      "goods_price": 178,
      "goods_count": 1,
      "likes": 1102
    },
    {
      "id": 9,
      "goods_name": "芷臻(zhizhen)加厚卫衣2020春秋季女长袖韩版宽松短款加绒春秋装连帽开衫外套冬",
      "goods_img": "assets/9.webp",
      "goods_price": 128,
      "goods_count": 1,
    },
    {
      "id": 10,
      "goods_name": "Semir森马卫衣女冬装2019新款可爱甜美大撞色小清新连帽薄绒女士套头衫",
      "goods_img": "assets/10.webp",
      "goods_price": 153,
      "goods_count": 1,
      "likes": 77
    }
  ]

  changeLike(goods: GoodsItem) {
    if (goods.likeFlag) {
      goods.likeFlag = false
      goods.likes -= 1
    } else {
      goods.likeFlag = true
      goods.likes += 1
    }
    //  State 数据只能监听到第一层的变化
    //  怎么让数据具备驱动视图变化
    const index = this.list.findIndex(item => item.id === goods.id)
    // this.list[index] = {...goods} // 解构赋值的方式NEXT版本不行，仅4.0可以
    this.list.splice( index , 1 ,goods)
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Scroll() {
        // scroll 只能放置一个子组件
        List() {
          // 自带滚动条， 自伤乡下排列
          // ForEach( 数据源， 回调函数 => ArtUI , 生成key的函数)
          ForEach(this.list, (goods: GoodsItem) => {
            ListItem() {
              Flex() {
                Image(goods.goods_img)
                  .width(100)
                  .height(160)
                  .borderRadius(10)
                Column() {
                  Text(goods.goods_name)
                    .fontSize(14)
                    .fontColor('#333')
                  // Text(goods.goods_price + "")
                  Row() {
                    Text() {
                      Span('￥')
                      Span(goods.goods_price + "")
                    }.fontColor(Color.Red)

                    // 点赞部分
                    LikeCom({ goods, changeLike: (goods: GoodsItem) => this.changeLike(goods) })
                  }
                  .width('100%')
                  .justifyContent(FlexAlign.SpaceBetween)
                }
                .layoutWeight(1)
                .margin({ left: 10 })
                .height(160)
                .justifyContent(FlexAlign.SpaceBetween)
                .alignItems(HorizontalAlign.Start)
              }
            }.padding(10)
          })
        }
      }
      .width('100%')
      .backgroundColor(Color.White)
    }

  }
}

@Component
struct LikeCom {
  goods: Partial<GoodsItem> = {}
  changeLike: (params: GoodsItem) => void = () => {
  }

  build() {
    Text(this.goods.likes ? `点赞：${this.goods.likes}` : '')
      .fontColor(this.goods.likeFlag ? Color.Red : '#ddd')
        // 给goods断言成GoodsItem，否则会报错
      .onClick(() => this.changeLike(this.goods as GoodsItem))
  }
}
