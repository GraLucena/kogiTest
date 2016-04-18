//
//  CommentsTableViewCell.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/17/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "Images.h"
#import "ImageDetail.h"
#import "Comments.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CommentsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userPhoto;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *userComment;
@property (weak, nonatomic) IBOutlet UILabel *commentDate;

- (void)configureCellWithContent:(DataModel *)data;

@end
