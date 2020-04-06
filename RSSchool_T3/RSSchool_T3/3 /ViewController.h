#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong) UIButton *buttonProcess;
@property (nonatomic, strong) UIView *viewResultColor;
@property (nonatomic, strong) UILabel *labelRed;
@property (nonatomic, strong) UILabel *labelGreen;
@property (nonatomic, strong) UILabel *labelBlue;
@property (nonatomic, strong) UILabel *labelResultColor;
@property (weak) IBOutlet  UITextField *textFieldRed;
@property (weak) IBOutlet  UITextField *textFieldGreen;
@property (weak) IBOutlet  UITextField *textFieldBlue;

- (BOOL)textFieldShouldBeginEditing:(UITextField*)textField;

@end

