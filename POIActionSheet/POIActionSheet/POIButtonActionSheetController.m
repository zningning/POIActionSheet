//
//  POIButtonActionSheetController.m
//  POIActionSheet
//
//  Created by yaoning on 15/11/15.
//  Copyright © 2015年 yaoning. All rights reserved.
//

#import "POIButtonActionSheet.h"
#import "POIButtonActionSheetController.h"

@interface POIButtonActionSheetController()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) NSMutableArray *mutableArray;

@end

@implementation POIButtonActionSheetController


- (void)awakeFromNib{
    self.mutableArray = [[NSMutableArray alloc]initWithArray:@[@"title1", @"title2"]];
    
}


- (IBAction)clickShow:(UIButton *)sender {
    
    [self.nameTextField resignFirstResponder];
    
    NSString *textFiledString = self.nameTextField.text;
    if (textFiledString.length > 0) {
        self.mutableArray = [[NSMutableArray alloc]initWithArray:[textFiledString componentsSeparatedByString:@","]];
    }
    
    POIButtonActionSheet *sheet = [[POIButtonActionSheet alloc]initWithCancleButtonTitle:@"cancle"
                                                                       otherButtonTitles:self.mutableArray
                                                                                complete:^(NSInteger index) {
                                                                                    NSLog(@"click button :%@", @(index));
                                                                                    
        
    }];
    [sheet show];
    
}

@end
