//
//  ChaoXianCardsViewController.m
//  ChaoXianCards
//
//  Created by Kelv on 02/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChaoXianCardsViewController.h"

@interface ChaoXianCardsViewController()

@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) Card *card1;

@end

@implementation ChaoXianCardsViewController

@synthesize answerDisplay = _answerDisplay;
@synthesize display = _display;

@synthesize cards = _cards;
@synthesize card1 = _card1;

-(id)init {
    self = [super init];
    return self;
}

-(void)viewDidLoad {
    
    // Init array of cards
    if ([self.cards count] == 0) {
        self.card1.character = @"超贤";
        self.card1.translation = @"super virtuous";
        self.card1.pinyin = @"chāo xián";
        
        [self.cards addObject:self.card1];
        
    }
    
    // Display charater
    Card *card = [self.cards lastObject];
    self.display.text = card.character;
    NSLog(@"Character %@", [self.display text]);
}

-(Card *) card1 {
    if (!_card1) _card1 = [[Card alloc] init];
    return _card1;
}

-(NSMutableArray *)cards {
    if (! _cards) _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}


- (IBAction)showAnswerPressed:(UIButton *)sender {

    NSLog(@"Current value %@", [self.answerDisplay text]);
    
    Card *card = [self.cards lastObject];
        
    // Concatenate string for answerDisplay from pinyin and translation values
    NSString *cardValues = @" ";
    cardValues = [cardValues stringByAppendingString: card.pinyin];
    cardValues = [cardValues stringByAppendingString: @" - "];
    cardValues = [cardValues stringByAppendingString: card.translation];
    
    
    NSLog(@"%@", cardValues);
    
    // Set label value and show
    self.answerDisplay.text = cardValues;
                               
    self.answerDisplay.hidden = false;
    
}

@end
