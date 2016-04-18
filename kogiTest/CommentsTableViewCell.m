//
//  CommentsTableViewCell.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/17/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "CommentsTableViewCell.h"

@implementation CommentsTableViewCell

- (void)configureCellWithContent:(DataModel *)data{

    self.userPhoto.layer.cornerRadius = 35;
    self.userPhoto.clipsToBounds = YES;
    [self.userPhoto sd_setImageWithURL:[NSURL URLWithString:[[data valueForKey:@"from"] valueForKey:@"profile_picture"]]];
    self.username.text = [[data valueForKey:@"from"] valueForKey:@"username"];
    self.userComment.numberOfLines = 0;
    [self.userComment sizeToFit];
    self.userComment.text = [data valueForKey:@"text"];
    self.commentDate.text = [self dateFormatter:[data valueForKey:@"created_time"]];

}

-(NSString *)dateFormatter:(NSString *)dateToFormat{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[dateToFormat doubleValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    dateFormatter.dateFormat = @"EEEE, dd MMM YYYY 'at' HH:mm";
    return [dateFormatter stringFromDate:date];
}


@end
