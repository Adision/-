//
//  ViewController.m
//  语音生成
//
//  Created by Apple on 2017/4/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property(nonatomic,strong)AVSpeechSynthesizer*synthesizer;
@property(nonatomic,strong)AVSpeechUtterance*utterance;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton*voiceButton=[UIButton buttonWithType:UIButtonTypeCustom];
    voiceButton.frame=CGRectMake(100, 100, 100, 44);
    voiceButton.backgroundColor=[UIColor orangeColor];
    [voiceButton setTitle:@"开始" forState:UIControlStateNormal];
    [self.view addSubview:voiceButton];
    [voiceButton addTarget:self action:@selector(voiceAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton*stopButton=[UIButton buttonWithType:UIButtonTypeCustom];
    stopButton.frame=CGRectMake(100, 200, 100, 44);
    stopButton.backgroundColor=[UIColor orangeColor];
    [stopButton setTitle:@"暂停" forState:UIControlStateNormal];
    [self.view addSubview:stopButton];
    [voiceButton addTarget:self action:@selector(stopButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //语音合成器
    _synthesizer=[[AVSpeechSynthesizer alloc] init];
    
}
-(void)voiceAction
{
    NSString*str=@"你好!";
    //舌头
    _utterance=[[AVSpeechUtterance alloc] initWithString:str];
    //如果识别中文，需设置voice参数
    NSArray*voices=@[[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"],[AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"],[AVSpeechSynthesisVoice voiceWithLanguage:@"ja-JP"]];
    _utterance.voice=voices[0];
    //语速
    _utterance.rate=0.5;
    //音量
    _utterance.volume=0.8;
    //音调
    _utterance.pitchMultiplier=1;
    
    //通过嘴巴用舌头说话
    [_synthesizer speakUtterance:_utterance];
}
-(void)stopButtonAction
{
  
}
@end
