//
//  ViewController.m
//  iWeather
//
//  Created by Linh Nguyễn vũ on 12/4/16.
//  Copyright © 2016 Linh Nguyễn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
    NSArray* temperatures;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Trên con đường dẫn đến thành công không có dấu chân của kẻ lười biếng",@"Một con ngựa đau cả tàu bỏ cỏ",@"Có công mài sắt có ngày nên kim",@"Chớ thấy sóng mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc",@"Đi một ngày đàng học một sàng khôn"];
    locations = @[@"ĐaNang, Việtnam",@"London, England", @"Paris, France",@"Dublin, Ireland"];
    photoFiles = @[@"rain",@"sunny",@"thunder",@"windy"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateWeather:(id)sender {
    // quoteIndex
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%d",quoteIndex);
    self.quote.text = quotes[quoteIndex];
    // Location
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    // Photo
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    // temperature index
    NSString* string = [NSString stringWithFormat:@"%2.1f",[self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
}

// Có dấu trừ ở trước là instant method
// Có dấu cộng trước khi khai báo là class method
-(float) getTemperature {
    return 14.0 + arc4random_uniform(18) + (float)arc4random()/(float)INT32_MAX;
}

@end
