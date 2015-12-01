//
//  ViewController.m
//  iWeather
//
//  Created by TienDang on 12/1/15.
//  Copyright © 2015 madolche. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblDegree;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeather;
@property (weak, nonatomic) IBOutlet UILabel *lblQoutes;
@property (weak, nonatomic) IBOutlet UIButton *btnDegree;

@end

@implementation ViewController{
    NSArray* arr_quotes;
    NSArray* arr_locations;
    NSArray* arr_imgWeather;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    arr_quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    
    arr_locations = @[@"Hanoi, VN", @"Ho Chi Minh, VN" , @"Sydney, Australia", @"New York, USA"];
    
    arr_imgWeather = @[@"ico_wind_128", @"ico_rain_128", @"ico_thunder_128", @"ico_sunny_128"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnUpdateWeather:(id)sender {
    int index_location = arc4random_uniform(arr_locations.count);
    int index_imgWeather = arc4random_uniform(arr_imgWeather.count);
    int index_quote = arc4random_uniform(arr_quotes.count);
    
    //change location
    self.lblLocation.text = arr_locations[index_location];
    
    //change degree
    NSString* str_degree = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.btnDegree setTitle: str_degree forState:UIControlStateNormal];
    
    //change img weather
    self.imgWeather.image = [UIImage imageNamed: arr_imgWeather[index_imgWeather]];
    
    //change quotes
    self.lblQoutes.text = arr_quotes[index_quote];
}


- (IBAction)btnDegreeChange:(id)sender {
    NSString* str_unit_degree = self.lblDegree.text;
    float f_degree = [[[(UIButton*)sender titleLabel] text] floatValue];
    
    NSString* str_degree = @"";
    if([str_unit_degree isEqualToString:@"F"]){
        self.lblDegree.text = @"C";
        str_degree = [NSString stringWithFormat:@"%2.1f", [self fahrenheitToCelsius:f_degree]];
    }else{
        self.lblDegree.text = @"F";
        str_degree = [NSString stringWithFormat:@"%2.1f", [self celciusToFahrenheit:f_degree]];
    }
    
    [self.btnDegree setTitle:str_degree forState:UIControlStateNormal];
}

- (float) getTemperature {
    return 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
}

- (float) celciusToFahrenheit: (float) degree{
    return degree  * 1.8 + 32.0;
}

- (float) fahrenheitToCelsius: (float) degree{
    return (degree -32)/1.8;
}

@end
