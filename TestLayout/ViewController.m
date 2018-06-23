//
//  ViewController.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/11.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "ViewController.h"
#import "ZSUIView.h"
#import "ZSXibView.h"
#import "UIImage+Resize.h"
#import "Masonry.h"
#import "ZSTableViewCell.h"
#import "StaticCellTableViewController.h"
#import "Person.h"
#import "TestViewController.h"
#import "LockViewController.h"
#import "Person+Test.h"
#import "TestCollectionViewCell.h"
#import "Son.h"
#import "SubViewController.h"

@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
{
    ZSUIView * view;
    
    UIView * _mview;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *puperviewheight;
@property (weak, nonatomic) IBOutlet UIView *puperview;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *grayviewheight;
@property (weak, nonatomic) IBOutlet UIView *grayview;

@property (weak, nonatomic) IBOutlet UIView *middleView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (weak, nonatomic) IBOutlet ZSXibView *xibview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"self.testview.frame:%@",NSStringFromCGRect(self.testview.frame));
//    NSLog(@"self.testview.center:%@",NSStringFromCGPoint(self.testview.center));
//    NSLog(@"self.testview.layer.position:%@",NSStringFromCGPoint(self.testview.layer.position));
//    NSLog(@"self.testview.layer.anchorPoint:%@",NSStringFromCGPoint(self.testview.layer.anchorPoint));
    

    [self.testview setUserInteractionEnabled:YES];
    
    UIPanGestureRecognizer * pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView:)];
    [self.testview addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinch=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchView:)];
    [self.testview addGestureRecognizer:pinch];
    
    CGRect iFrame=self.testBtn.imageView.frame;
    CGRect tFrame=self.testBtn.titleLabel.frame;
    iFrame.origin.x=CGRectGetMaxX(tFrame);
    self.testBtn.imageView.frame=iFrame;
    self.testBtn.titleLabel.frame=tFrame;
    
    Son * son=[Son shareSon];
    
    /*

    //Person * person=[Person sharePerson];
//    Person * person2=[Person sharePerson];
//    NSLog(@"%p,%p",person,person2);
    //Person * person3=[[Person alloc]init];
    
    //view = [[ZSUIView alloc]initWithData:NSStringFromClass(self.class)];
    view=[[ZSUIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view=[[ZSUIView alloc]init];
    view.frame=CGRectMake(100, 100, 100, 100);
    view.backgroundColor=[UIColor grayColor];
    [self.view addSubview:view];
    
    UIButton * chatBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    chatBtn.frame=CGRectMake(100,300, 200, 200);
    UIImage *newImage = [[UIImage imageNamed:@"chatpao"] resizeImage];
    [chatBtn setBackgroundImage:newImage forState:UIControlStateNormal];
    //[self.view addSubview:chatBtn];
    
    UIView * sview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    sview.backgroundColor=[UIColor orangeColor];
    self.scrollview.contentSize=CGSizeMake(self.scrollview.bounds.size.width*3, self.scrollview.bounds.size.height);
    self.scrollview.delegate=self;
    self.scrollview.contentInset=UIEdgeInsetsMake(0, 20, 0, 0);
    self.scrollview.maximumZoomScale=2;
    self.scrollview.minimumZoomScale=0.5;
    [self.scrollview addSubview:sview];
    
    
    //self.tableview.estimatedRowHeight=50;
    
    
    UIView * mview=[[UIView alloc]init];
    mview.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:mview];
    _mview=mview;
    
    UIView * mview2=[[UIView alloc]init];
    mview2.backgroundColor=[UIColor blueColor];
    [self.view addSubview:mview2];
    
    [mview mas_makeConstraints:^(MASConstraintMaker *make) {
//         make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        //make.left.equalTo(self.view.mas_left).offset(20);
//        make.right.equalTo(self.view.mas_right).offset(-20);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        //make.right.bottom.offset(-20);
        //make.height.mas_equalTo(100);
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(100);
    }];
    
    [mview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(self.view).offset(-20);
        make.left.equalTo(mview.mas_right).offset(20);
        make.width.mas_equalTo(mview.mas_width);
        make.height.mas_equalTo(mview.mas_height);
    }];
    
    [self.tableview registerNib:[UINib nibWithNibName:@"ZSTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;

    */
}

-(void)testCollectionView
{
    UICollectionViewFlowLayout * layout=[[UICollectionViewFlowLayout alloc]init];
    /*
      中间间隔
      如果UICollectionViewScrollDirectionVertical：
      定义最小间隔的原因是因为CollectionView横向布局放不下会自动换行，所以此时间隔就不是定义的间隔了
    */
    layout.minimumInteritemSpacing=1;
    /*
      行间距
      如果UICollectionViewScrollDirectionHorizontal：
      定义最小行间距的原因是因为CollectionView纵向布局放不下会自动换行，所以此时间隔就不是定义的间隔了
    */
    layout.minimumLineSpacing=1;
    //itemSize
    layout.itemSize=CGSizeMake(100, 100);
    /*
     滑动方向UICollectionViewScrollDirectionVertical
     02468
     13579
     滑动方向UICollectionViewScrollDirectionHorizontal
     01
     23
     45
     67
     89
     */
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    UICollectionView * collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, 300, 300) collectionViewLayout:layout];
    [collectionView registerNib:[UINib nibWithNibName:@"TestCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"testCollectionViewCell"];
    collectionView.delegate=self;
    collectionView.dataSource=self;
    [self.view addSubview:collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     
     */
    TestCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"testCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor grayColor];
    cell.textLab.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}


-(void)panView:(UIPanGestureRecognizer*)panGes
{
    //获得平移偏移量(相对于手势起始位置)
    CGPoint panPoint=[panGes translationInView:self.testview];
    //进行偏移累计
    self.testview.transform=CGAffineTransformTranslate(self.testview.transform, panPoint.x, panPoint.y);
    //重置偏移量(因为平移偏移是相对于起始位置，如果不重置该值，累计值就会叠加递增)
    [panGes setTranslation:CGPointZero inView:self.testview];
}

-(void)pinchView:(UIPinchGestureRecognizer*)pinchGes
{
    //进行缩放累计
    self.testview.transform=CGAffineTransformScale(self.testview.transform, pinchGes.scale, pinchGes.scale);
    //重置缩放范围
    [pinchGes setScale:1.0];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
 
    SubViewController *sub=[[SubViewController alloc]init];
    [self presentViewController:sub animated:YES completion:nil];

    
    //self.testImg.layer.contentsRect=CGRectMake(0, 0, 0.5, 0.5);
    //self.testview.layer.anchorPoint=CGPointMake(0,0);
    //self.testview.transform=CGAffineTransformMakeTranslation(0, 100);
    
//    NSLog(@"self.testview.frame:%@",NSStringFromCGRect(self.testview.frame));
//    NSLog(@"self.testview.center:%@",NSStringFromCGPoint(self.testview.center));
//    NSLog(@"self.testview.layer.position:%@",NSStringFromCGPoint(self.testview.layer.position));
//    NSLog(@"self.testview.layer.anchorPoint:%@",NSStringFromCGPoint(self.testview.layer.anchorPoint));
    
    //LockViewController * vc=[[LockViewController alloc]init];
    //TestViewController * vc=[[TestViewController alloc]init];
    //[self presentViewController:vc animated:YES completion:nil];
   
    
//    [_mview mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(200);
//    }];
//
//    [UIView animateWithDuration:1.0 animations:^{
//        [self.view layoutIfNeeded];
//    }];
    
    
    //[self.middleView removeFromSuperview];
    
//    CGRect grayFrame=self.grayview.frame;
//    grayFrame.size.width=100;
//    [UIView animateWithDuration:2.0 animations:^{
//        self.grayview.frame=grayFrame;
//    }];
    
//    self.grayviewheight.constant=100;
//    self.puperviewheight.constant=30;
//    [UIView animateWithDuration:2.0 animations:^{
//        [self.view layoutIfNeeded];
//    }];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //1->
    //NSLog(@"scrollViewWillBeginDragging");
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //2->
    //NSLog(@"scrollViewWillEndDragging");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //3->decelerate为YES 4才会被调用
    //NSLog(@"scrollViewDidEndDragging:%d-%f",decelerate,scrollView.contentOffset.x);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //4.
    //NSLog(@"scrollViewDidEndDecelerating:%f",scrollView.contentOffset.x);
}


-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //指定scrollview哪个控件进行缩放,同时指定缩放比例就可以完成缩放功能
    //self.scrollview.maximumZoomScale=2;
    //self.scrollview.minimumZoomScale=0.5;
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"heightForRowAtIndexPath %ld",indexPath.row);
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath");
    ZSTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.name=@"";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"tv" bundle:nil];
    StaticCellTableViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"staticCellTableViewController"];
    vc.view.backgroundColor=[UIColor redColor];
    NSLog(@"红色");
    [self presentViewController:vc animated:YES completion:nil];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"删除改行");
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction * row1=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"编辑");
    }];
    
    UITableViewRowAction * row2=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
    }];
    
    row2.backgroundColor=[UIColor blueColor];
    return @[row1,row2];
}



-(void)testsanbox
{
    NSString * homePath=NSHomeDirectory();
    NSLog(@"homePath:%@",homePath);
    
    NSString * docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(@"docPath:%@",docPath);
    
    NSString * libPath=[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(@"libPath:%@",libPath);
    
    NSString * cachePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(@"cachePath:%@",cachePath);
    
    
    [[NSUserDefaults standardUserDefaults]setObject:@"a" forKey:@"a"];
    [[NSUserDefaults standardUserDefaults]valueForKey:@"a"];
    
    NSString * tempPath=NSTemporaryDirectory();
    NSLog(@"tempPath:%@",tempPath);
    
    
}






@end
