#import "ViewController.h"

@implementation ViewController


#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    int widthScreen = self.view.frame.size.width;
    self.labelResultColor = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 40)];
    self.labelRed = [[UILabel alloc]initWithFrame:CGRectMake(10, 150, 100, 40)];
    self.labelGreen = [[UILabel alloc]initWithFrame:CGRectMake(10, 190, 100, 40)];
    self.labelBlue = [[UILabel alloc]initWithFrame:CGRectMake(10, 230, 100, 40)];
    self.viewResultColor = [[UIView alloc]initWithFrame:CGRectMake(110, 100, 60, 40)];
    self.textFieldRed = [[UITextField alloc]initWithFrame:CGRectMake(100, 150, 70, 40)];
    self.textFieldGreen = [[UITextField alloc]initWithFrame:CGRectMake(100, 190, 70, 40)];
    self.textFieldBlue = [[UITextField alloc]initWithFrame:CGRectMake(100, 230, 70, 40)];
    self.buttonProcess = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, 350, widthScreen, 20)];
    [self.buttonProcess setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
    
    self.view.accessibilityIdentifier = @"mainView";
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    self.labelRed.accessibilityIdentifier = @"labelRed";
    self.labelGreen.accessibilityIdentifier = @"labelGreen";
    self.labelBlue.accessibilityIdentifier = @"labelBlue";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    
    [self.view addSubview:_viewResultColor];
    [self.view addSubview:_labelResultColor];
    [self.view addSubview:_labelRed];
    [self.view addSubview:_labelGreen];
    [self.view addSubview:_labelBlue];
    [self.view addSubview:_textFieldRed];
    [self.view addSubview:_textFieldGreen];
    [self.view addSubview:_textFieldBlue];
    [self.view addSubview:_buttonProcess];
    [self.view addSubview:_labelRed];
    
    self.labelRed.text = @"RED";
    self.labelGreen.text = @"GREEN";
    self.labelBlue.text = @"BLUE";
    self.labelResultColor.text = @"Color";
    self.textFieldRed.placeholder = @"0..255";
    self.textFieldBlue.placeholder = @"0..255";
    self.textFieldGreen.placeholder = @"0..255";
    self.buttonProcess.titleLabel.text = @"Process";
    
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess addTarget: self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.textFieldRed.delegate = self;
    self.textFieldGreen.delegate = self;
    self.textFieldBlue.delegate = self;
}

- (void)buttonPressed:(UIButton *)button {
    
    int red = [self.textFieldRed.text intValue];
    int green = [self.textFieldGreen.text intValue];
    int blue = [self.textFieldBlue.text intValue];
    
    if ([self.textFieldRed.text isEqualToString:@""] || [self checkLettersInString:self.textFieldRed.text]) {
        red = -1;
    }
    if ([self.textFieldGreen.text isEqualToString:@""] || [self checkLettersInString:self.textFieldGreen.text]) {
        green = -1;
    }
    if ([self.textFieldBlue.text isEqualToString:@""] || [self checkLettersInString:self.textFieldBlue.text]) {
        blue = -1;
    }
    self.viewResultColor.backgroundColor = [self rgbToColorConverter:red :green :blue];
    
    if (red > 255 || green > 255 || blue > 255 || red < 0 || green < 0 || blue < 0) {
        self.labelResultColor.text = @"Error";
        self.textFieldGreen.text = @"";
        self.textFieldRed.text = @"";
        self.textFieldBlue.text = @"";
    } else {
        self.labelResultColor.text = [self hexStringForColor:[self rgbToColorConverter:red :green :blue]];
        self.textFieldGreen.text = @"";
        self.textFieldRed.text = @"";
        self.textFieldBlue.text = @"";
    }
    [self.textFieldRed resignFirstResponder];
    [self.textFieldGreen resignFirstResponder];
    [self.textFieldBlue resignFirstResponder];
}

-(UIColor *) rgbToColorConverter:(int)red :(int)green :(int)blue {
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
    return color;
}

- (NSString *)hexStringForColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"0x%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
    return hexString;
}

-(BOOL)checkLettersInString:(NSString *)str {
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_,.//\\]!@#$%^&*()±§"];
    NSRange range = [str rangeOfCharacterFromSet:charSet];
    if (range.location != NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    self.labelResultColor.text = @"Color";
    return YES;
}

@end
