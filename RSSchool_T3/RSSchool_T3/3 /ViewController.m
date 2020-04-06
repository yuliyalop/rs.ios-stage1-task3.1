#import "ViewController.h"

@implementation ViewController 


#pragma mark -buttonProcess

- (void)viewDidLoad {
    [super viewDidLoad];
    // todo
    
    
#pragma mark -buttonProcess
    self.buttonProcess = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 100  / 2, 400.0, 100.0, 100.0)];
    [_buttonProcess setTitle: @"Process" forState:UIControlStateNormal];
    [_buttonProcess setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //чтобы кнопка нажималась
    [_buttonProcess addTarget:self action:@selector(tapHadle) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buttonProcess];
    
#pragma mark - labels
    
    self.labelRed = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 200.0, 80.0, 30.0)];
    _labelRed.textColor = [UIColor blackColor];
    [self.view addSubview:_labelRed];
    _labelRed.text = [NSString stringWithFormat: @"RED"];
    
    
    self.labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 275.0, 80.0, 30.0)];
    _labelGreen.textColor = [UIColor blackColor];
    [self.view addSubview:_labelGreen];
    _labelGreen.text = [NSString stringWithFormat: @"GREEN"];
    
    
    self.labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 350.0, 80.0, 30.0)];
    _labelBlue.textColor = [UIColor blackColor];
    _labelBlue.text = [NSString stringWithFormat: @"BLUE"];
    [self.view addSubview:_labelBlue];
    
    
    self.labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 125.0, 100.0, 30.0)];
    _labelResultColor.textColor = [UIColor blackColor];
    _labelResultColor.text = [NSString stringWithFormat: @"Color"];
    [self.view addSubview:_labelResultColor];
    
    
#pragma mark - textFields
    
    self.textFieldRed = [[UITextField alloc]initWithFrame:CGRectMake(120.0, 200.0, 250.0, 30.0)];
    _textFieldRed.placeholder = @"0..255";
    _textFieldRed.textColor = UIColor.grayColor;
    _textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    
    [_textFieldRed addTarget:self action:@selector(onTap) forControlEvents:UIControlEventTouchDown];
    [_textFieldRed addTarget:self action:@selector(onEnterRed) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.view addSubview:_textFieldRed];
    /////////////////
    
    
    self.textFieldGreen = [[UITextField alloc]initWithFrame:CGRectMake(120.0, 275.0, 250.0, 30.0)];
    _textFieldGreen.placeholder = @"0..255";
    _textFieldGreen.textColor = UIColor.grayColor;
    _textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    
    [_textFieldGreen addTarget:self action:@selector(onTap) forControlEvents:UIControlEventTouchDown];
    [_textFieldGreen addTarget:self action:@selector(onEnterGreen) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.view addSubview:_textFieldGreen];
    
    /////////////////////////
    self.textFieldBlue = [[UITextField alloc]initWithFrame:CGRectMake(120.0, 350.0, 250.0, 30.0)];
    _textFieldBlue.placeholder = @"0..255";
    _textFieldBlue.textColor = UIColor.grayColor;
    _textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    [_textFieldBlue addTarget:self action:@selector(onTap) forControlEvents:UIControlEventTouchDown];
    [_textFieldBlue addTarget:self action:@selector(onEnterBlue) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:_textFieldBlue];
    
    
    
    
#pragma mark - view
    CGRect viewRect = CGRectMake(140.0, 120.0, 230.0, 40.0);
    _viewResultColor = [[UIView alloc]initWithFrame:viewRect];
    _viewResultColor.backgroundColor = UIColor.clearColor;
    [self.view addSubview:_viewResultColor];
    
    
    
    [self tests];
}



-(void)tests {
#pragma mark - tests
    
    self.view.accessibilityIdentifier = @"mainView";
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed"; self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen"; self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    self.labelRed.accessibilityIdentifier = @"labelRed"; self.labelGreen.accessibilityIdentifier = @"labelGreen"; self.labelBlue.accessibilityIdentifier = @"labelBlue"; self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
}


-(void)tapHadle{
    [self.view endEditing:true];
    NSString *red = self.textFieldRed.text;
    NSString * green = self.textFieldGreen.text;
    NSString * blue = self.textFieldBlue.text;
    
    self.textFieldRed.text = @"";
    self.textFieldGreen.text = @"";
    self.textFieldBlue.text = @"";
    
    if ([red length] != 0 && [green length] != 0 && [blue length] != 0) {
        if ([red rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet].invertedSet].location == NSNotFound &&
            [green rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet].invertedSet].location == NSNotFound && [blue rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet].invertedSet].location == NSNotFound) {
            
            int fRed = [red intValue];
            int fGreen = [green intValue];
            int fBlue = [blue intValue];
            if (fRed <= 255 && fRed >= 0 && fGreen<= 255 && fGreen >= 0 && fBlue <= 255 && fBlue >= 0) {
                self.viewResultColor.backgroundColor = [UIColor colorWithRed: (float)fRed/255 green:(float)fGreen/255 blue: (float)fBlue/255 alpha:1];
                NSString *hex = [[NSString alloc]initWithFormat:@"0x%02X%02X%02X", fRed, fGreen, fBlue];
                self.labelResultColor.text = hex;
            } else {
                self.labelResultColor.text = @"Error";
                self.viewResultColor.backgroundColor = [UIColor clearColor];
            }
            
        } else {
            self.labelResultColor.text = @"Error";
            self.viewResultColor.backgroundColor = [UIColor clearColor];
        }
    } else {
        self.labelResultColor.text = @"Error";
        self.viewResultColor.backgroundColor = [UIColor clearColor];
    }
}

- (void)onTap {
    self.labelResultColor.text = @"Color";
}

- (void)onEnterRed {
}
- (void)onEnterGreen {
}
- (void)onEnterBlue {
}


@end
