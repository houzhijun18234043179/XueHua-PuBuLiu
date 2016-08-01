//
//  WaterViewController.m
//  MyDemo
//
//  Created by  tsou117 on 15-1-27.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "WaterViewController.h"
#import "MyLayout.h"
#import "MyCollectionViewCell.h"

@interface WaterViewController ()

@end

@implementation WaterViewController
{
    MyLayout* layout;
    NSArray* testContentArr;
    CGPoint nowPoint;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        testContentArr = @[@"朋友说：“跪下，掌嘴”这是宫廷戏！ “跪下，张嘴”这戏就变了。。。 汉语真的是博大精深啊！",
                           @"你没衣服穿了？！那衣柜里都是什么？！这是去年买的，这是情人节买的，这是中秋节买的，这是隔壁老王，这是昨天你生日买的……等等，隔壁老王？……",
                           @"听说李娜退役，我在路边叹道：“太可惜！”话音刚落，一辆的士停在我的身边。",
                           @"接一电话，自称是某大学总裁班招生，我说有兴趣，对方问我从事什么行业，我说it和通讯的周边服务，对方问运作方式，我说在人群密集的街道和地下通道提供咨询和直营销售，他说具体点？我说是智能高端数字通讯设备表面高分子化合物线性处理，他坚持：能不能通俗点，我说“手机贴膜”，对方把电话挂了。",
                           @"中学化学老师有一次喝多了，红着脸就来上课了，给我们讲课讲的激情澎湃。。。一同学就悄悄说老师喝多了，不想被老师听到，老师：是，我是喝多了，可我没讲错吧，下面看这道菜。",
                           @"我一哥们失恋了，今天过去看他，他正在电脑上斗地主。我在旁边看，明明是一对三，没想到他居然出了一个三，一边出牌一边恨恨地说到：马的！拆散一对是一对！ ",
                           @"能不能学学人家电视剧里女主角，心情不好就啥也胃口都没，死活就是吃不下饭，没几天嗷的一下瘦的跟竹竿似的。再瞧瞧你，心情不好就吃吃吃，吃完饭吃下午茶吃完下午茶吃零食吃完零食吃宵夜，吃撑了心情就好的差不多了，你说说，你不胖谁胖？",
                           @"如果让文豪们一起复活开围脖，女文青偶像李清照大概第一个火。辛弃疾也很快圈到了大批愤青死忠。李白喝多了半夜刷屏，掉光了粉。杜甫挨条给李白点赞却没人发现，只好骂小秘书撒气，被冻结账号。白居易发了两篇长围脖，费光学生党流量。杜牧柳永忙着私信勾搭外围。苏轼被到处贬来贬去，一直没连上3G。",
                           @"弟：“姐，钱到手时该是人生最快乐的时光之一吧？” 我：“不是的，第一次钱到手时是人生最快乐的时光之一，往后就递减了，渐渐就没感觉了。就跟一直摸同一个姑娘的大腿似的。” 弟：“。。。。。。” 我：“哎我这姐姐当的。。。”",
                           @"今天公司的同事出了个谜语“剩女的恐惧”打一成语，在我们所有人绞尽脑汁的时候，一女同事叹了口气说道：死而无汉！！！",
                           @"公司一妹子问我“你们男人到底哪里比我们女的尊贵啊？为什么昨天我住宾馆的时候，一样的房间我交168,而他们男人却交468？” 朋友们，我该怎么跟她解释这多出来的300块钱……",
                           @"天太热，晚上睡不着在楼下和几个邻居神侃。 楼上不知谁家突然传来啊～啊～的叫床声。 几个人正侧耳倾听。 正巧邻居老王从此经过，叹了一口气说：5楼老李，还不回去看看，一听就是你老婆",
                           @"在网上看到一段蓝翔的招生广告词： 清华毁一生，北大穷三代，你若来蓝翔，必成高富帅，生存技巧强，理论全覆盖，门口小吃街，人均十几块，学姐都女神，学妹超可爱，学长很体贴，学弟天然呆，男女九比一，搞基看心态，校友遍天下，我们等你来！。 突然感觉蓝翔很强大，有木有？？ ",
                           @"昨天晚上和朋友足浴，听到隔壁包厢里的技师和客人在大声争吵。一打听才知道，客人是个残疾人，只有一只脚，只肯付一半的钱。技师不答应，就吵起来了。最后老板来打圆场，把客人的那只脚又洗了一遍，才搞定。",
                           @"永远不要对女朋友像对女儿一样好，没准哪天就给你带个女婿回来，好了，大中秋我继续去隔壁看戏了"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    layout = [[MyLayout alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
