// WRImageCell.m
//
// Copyright (c) 2016 zakhej.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "WRImageCell.h"
#import "UIImageView+WebCache.h"
#import <libextobjc/extobjc.h>

@interface WRImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation WRImageCell

- (void)setSource:(WRImageCellSource *)source {
    [self.imageView sd_cancelCurrentImageLoad];
    self.imageView.image = nil;
    @weakify(self);
    [self.imageView sd_setImageWithURL:source.imageURL
                      placeholderImage:nil
                               options:(SDWebImageRetryFailed | SDWebImageLowPriority)
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                 @strongify(self);
                                 if (cacheType == SDImageCacheTypeNone) {
                                     [UIView transitionWithView:self.imageView
                                                       duration:0.333
                                                        options:UIViewAnimationOptionTransitionCrossDissolve
                                                     animations:^{
                                                         self.imageView.image = image;
                                                     }
                                                     completion:nil];
                                 } else {
                                     self.imageView.image = image;
                                 }
                             }];
}

@end
