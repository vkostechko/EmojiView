//
//  ViewController.m
//  EmojiView
//
//  Created by Viachaslau Kastsechka on 8/16/17.
//  Copyright © 2017 Viachaslau Kastsechka. All rights reserved.
//

#import "ViewController.h"
#import "ISEmojiView.h"

@interface ViewController () <ISEmojiViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *emojiContainerView;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addEmojiView];
}

#pragma mark - ISEmojiViewDelegate

- (void)emojiView:(nonnull ISEmojiView *)emojiView didSelectEmoji:(nonnull NSString *)emoji {
    [self.textView insertText:emoji];
}

- (void)emojiView:(nonnull ISEmojiView *)emojiView didPressDeleteButton:(nonnull UIButton *)deleteButton {
    [self.textView deleteBackward];
}

#pragma mark - Private

- (void)addEmojiView {
    ISEmojiView *emojiView = [[ISEmojiView alloc] initWithFrame:self.emojiContainerView.bounds];
    emojiView.delegate = self;
    [self.emojiContainerView addSubview:emojiView];
}

@end
