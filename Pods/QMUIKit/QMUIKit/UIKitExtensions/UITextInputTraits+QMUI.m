/**
 * Tencent is pleased to support the open source community by making QMUI_iOS available.
 * Copyright (C) 2016-2021 THL A29 Limited, a Tencent company. All rights reserved.
 * Licensed under the MIT License (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 * http://opensource.org/licenses/MIT
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */
//
//  UITextInputTraits+QMUI.m
//  QMUIKit
//
//  Created by MoLice on 2019/O/16.
//

#import "UITextInputTraits+QMUI.h"
#import "QMUICore.h"

@interface NSObject ()

@property(nonatomic, assign) BOOL qti_didInitialize;
@property(nonatomic, assign) BOOL qti_setKeyboardAppearanceByQMUITheme;
@end

@implementation NSObject (QMUITextInput)

QMUISynthesizeBOOLProperty(qti_didInitialize, setQti_didInitialize)
QMUISynthesizeBOOLProperty(qti_setKeyboardAppearanceByQMUITheme, setQti_setKeyboardAppearanceByQMUITheme)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        static NSArray<Class> *inputClasses = nil;
        if (!inputClasses) inputClasses = @[UITextField.class, UITextView.class, UISearchBar.class];
        [inputClasses enumerateObjectsUsingBlock:^(Class  _Nonnull inputClass, NSUInteger idx, BOOL * _Nonnull stop) {
            
            OverrideImplementation(inputClass, @selector(initWithFrame:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
                return ^UIView<UITextInputTraits> *(UIView<UITextInputTraits> *selfObject, CGRect firstArgv) {
                    
                    // call super
                    UIView<UITextInputTraits> * (*originSelectorIMP)(id, SEL, CGRect);
                    originSelectorIMP = (UIView<UITextInputTraits> * (*)(id, SEL, CGRect))originalIMPProvider();
                    UIView<UITextInputTraits> * result = originSelectorIMP(selfObject, originCMD, firstArgv);
                    
                    if ([selfObject isKindOfClass:NSClassFromString(@"TUIEmojiSearchTextField")]) {
                        // https://github.com/Tencent/QMUI_iOS/issues/1042 iOS 14 ?????????????????? emoji ?????????????????????????????? TUIEmojiSearchTextField??????????????????????????? init ??????????????? keyboardAppearance ????????????????????????????????????????????????????????????
                        // ??????????????? emoji ??????????????? TextFied?????? keyboardAppearance ?????????????????? UITextField???UITextView ??????????????? QMUI ????????????????????????
                        return result;
                    }
                    if (QMUICMIActivated) selfObject.keyboardAppearance = KeyboardAppearance;
                    selfObject.qti_didInitialize = YES;
                    return result;
                };
            });
            
            OverrideImplementation([inputClasses class], @selector(initWithCoder:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
                return ^UIView<UITextInputTraits> *(UIView<UITextInputTraits> *selfObject, NSCoder *firstArgv) {
                    
                    // call super
                    UIView<UITextInputTraits> * (*originSelectorIMP)(id, SEL, NSCoder *);
                    originSelectorIMP = (UIView<UITextInputTraits> * (*)(id, SEL, NSCoder *))originalIMPProvider();
                    UIView<UITextInputTraits> * result = originSelectorIMP(selfObject, originCMD, firstArgv);
                    result.qti_didInitialize = YES;
                    return result;
                };
            });
            
            // ???????????????????????????????????????????????????keyboardAppearance ?????????????????????????????????????????????
            OverrideImplementation(inputClass, @selector(setKeyboardAppearance:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
                return ^(UIView<UITextInputTraits> *selfObject, UIKeyboardAppearance keyboardAppearance) {

                    BOOL valueChanged = selfObject.keyboardAppearance != keyboardAppearance;
                    
                    // call super
                    void (*originSelectorIMP)(id, SEL, UIKeyboardAppearance);
                    originSelectorIMP = (void (*)(id, SEL, UIKeyboardAppearance))originalIMPProvider();
                    originSelectorIMP(selfObject, originCMD, keyboardAppearance);
                    
                    if (selfObject.qti_didInitialize && valueChanged) {
                        // ?????????????????????????????????????????????????????????????????? QMUITheme ???????????????????????????????????????
                        if (QMUICMIActivated && !selfObject.qti_setKeyboardAppearanceByQMUITheme) selfObject.qmui_hasCustomizedKeyboardAppearance = YES;
                        
                        // ??????????????????????????????????????????????????????????????? isFristResponder ???????????? reloadInputViews ?????????????????????
                        [selfObject reloadInputViews];
                    }
                };
            });
        }];
    });
}

@end

@implementation NSObject (QMUITextInput_Private)

QMUISynthesizeBOOLProperty(qmui_hasCustomizedKeyboardAppearance, setQmui_hasCustomizedKeyboardAppearance)

static char kAssociatedObjectKey_keyboardAppearance;
- (void)setQmui_keyboardAppearance:(UIKeyboardAppearance)qmui_keyboardAppearance {
    objc_setAssociatedObject(self, &kAssociatedObjectKey_keyboardAppearance, @(qmui_keyboardAppearance), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.qti_setKeyboardAppearanceByQMUITheme = YES;
    ((UIView<UITextInputTraits> *)self).keyboardAppearance = qmui_keyboardAppearance;
    self.qti_setKeyboardAppearanceByQMUITheme = NO;
}

- (UIKeyboardAppearance)qmui_keyboardAppearance {
    return [((NSNumber *)objc_getAssociatedObject(self, &kAssociatedObjectKey_keyboardAppearance)) integerValue];
}

@end
