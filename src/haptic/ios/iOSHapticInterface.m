// This iOS haptic interface is a pretty straightforward implementation of UIKit's framework :
// You can learn more about these methods at https://developer.apple.com/documentation/uikit/animation_and_haptics
// DO NOT remove this from your project, or iOS vibrations won't work anymore!

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>

#import <UIKit/UISelectionFeedbackGenerator.h>
#import <UIKit/UINotificationFeedbackGenerator.h>
#import <UIKit/UIImpactFeedbackGenerator.h>

#import <UIKit/UIKit.h>

UISelectionFeedbackGenerator* SelectionFeedbackGenerator;
UINotificationFeedbackGenerator* NotificationFeedbackGenerator;
UIImpactFeedbackGenerator* LightImpactFeedbackGenerator;
UIImpactFeedbackGenerator* MediumImpactFeedbackGenerator;
UIImpactFeedbackGenerator* HeavyImpactFeedbackGenerator;

// UTILS METHOD ---------------------------------------------------------------------------

int HapticSupportedLevel()
{
    return [[[UIDevice currentDevice] valueForKey:@"_feedbackSupportLevel"] intValue];
}

// PREPARATION METHODS ----------------------------------------------------------------------

void PrepareSelectionFeedbackGenerator()
{
    [SelectionFeedbackGenerator prepare];
}

void PrepareNotificationFeedbackGenerator()
{
    [NotificationFeedbackGenerator prepare];
}

void PrepareLightImpactFeedbackGenerator()
{
    [LightImpactFeedbackGenerator prepare];
}

void PrepareMediumImpactFeedbackGenerator()
{
    [MediumImpactFeedbackGenerator prepare];
}

void PrepareHeavyImpactFeedbackGenerator()
{
    [HeavyImpactFeedbackGenerator prepare];
}

// INIT METHOD ---------------------------------------------------------------------------

void InstantiateFeedbackGenerators()
{
    SelectionFeedbackGenerator = [[UISelectionFeedbackGenerator alloc] init];
    NotificationFeedbackGenerator = [[UINotificationFeedbackGenerator alloc] init];
    LightImpactFeedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
    MediumImpactFeedbackGenerator =  [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    HeavyImpactFeedbackGenerator =  [[UIImpactFeedbackGenerator alloc] initWithStyle:
                                     UIImpactFeedbackStyleHeavy];
    
    // preparing the generato to reduce the latency
    PrepareSelectionFeedbackGenerator();
    PrepareNotificationFeedbackGenerator();
    PrepareLightImpactFeedbackGenerator();
    PrepareMediumImpactFeedbackGenerator();
    PrepareHeavyImpactFeedbackGenerator();
}

// RELEASE METHOD ---------------------------------------------------------------------------

void ReleaseFeedbackGenerators ()
{
    SelectionFeedbackGenerator = nil;
    NotificationFeedbackGenerator = nil;
    LightImpactFeedbackGenerator = nil;
    MediumImpactFeedbackGenerator = nil;
    HeavyImpactFeedbackGenerator = nil;
}



// FEEDBACK TRIGGER METHODS -------------------------------------------------------------------------

void SelectionHaptic()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [SelectionFeedbackGenerator selectionChanged];
    });
}

void SuccessHaptic()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [NotificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeSuccess];
    });
}

void WarningHaptic()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [NotificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeWarning];
    });
}

void FailureHaptic()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [NotificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeError];
    });
}

void LightImpactHaptic()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [LightImpactFeedbackGenerator impactOccurred];
    });
}

void MediumImpactHaptic()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MediumImpactFeedbackGenerator impactOccurred];
    });
}

void HeavyImpactHaptic()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [HeavyImpactFeedbackGenerator impactOccurred];
    });
}

void WeakHaptic()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        AudioServicesPlaySystemSound(1519);
    });
}

void StrongHaptic()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        AudioServicesPlaySystemSound(1520);
    });
}

void NopeHaptic()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        AudioServicesPlaySystemSound(1521);
    });
}

void Vibrate()
{
    dispatch_async(dispatch_get_main_queue(), ^{
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    });
}
