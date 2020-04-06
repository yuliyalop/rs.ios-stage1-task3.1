#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
//@property(nonatomic, copy) NSString *placeholder;
//@property(nonatomic, strong) UIColor *textColor;
//@property(nonatomic) UITextBorderStyle borderStyle;

@property(strong, nonatomic) UITextField *textFieldRed;
@property(strong, nonatomic) UITextField *textFieldGreen;
@property(strong, nonatomic) UITextField *textFieldBlue;
@property(strong, nonatomic) UIView *viewResultColor;
@property(strong,nonatomic)UIButton *buttonProcess;
@property(strong)UILabel *labelRed;
@property(strong)UILabel *labelGreen;
@property(strong)UILabel *labelBlue;
@property(strong)UILabel *labelResultColor;
@end

