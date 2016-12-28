# Change Log

## v0.1.11:

- Add `CUAlertView` for the alert view show.
- Add Initialization method and show method in CUAlertView.h
- Add the implementation of methods in CUAlertView.h or self-use methods in CUAlertView.

The Main Methods Added:
```
/**
 	Initialize a CUAlertView instance with title, message, leftButtonText, rightButtonTexts and two blocks. Remember to invoke this method to initialize CUAlertView only.
 */
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message leftButtonText:(NSString *)leftBtnText leftClicked:(void(^)(void))leftClickedBlock rightButtonText:(NSString *)rightBtnText rightClicked:(void(^)(void))rightClickedBlock;

/**
 Show up the alert view
 */
-(void)show;
```

## v0.1.10:

- Add new features for NSString+CUString.h&m;

## v0.1.9:

- Add commonly used API in Java to NSString+CUString.h&m;


