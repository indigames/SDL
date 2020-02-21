// This iOS haptic interface is a pretty straightforward implementation of UIKit's framework :
// You can learn more about these methods at https://developer.apple.com/documentation/uikit/animation_and_haptics
// DO NOT remove this from your project, or iOS vibrations won't work anymore!
// INIT METHOD ---------------------------------------------------------------------------

void InstantiateFeedbackGenerators();

// RELEASE METHOD ---------------------------------------------------------------------------

void ReleaseFeedbackGenerators ();

// PREPARATION METHODS ----------------------------------------------------------------------

void PrepareSelectionFeedbackGenerator();
void PrepareNotificationFeedbackGenerator();
void PrepareLightImpactFeedbackGenerator();
void PrepareMediumImpactFeedbackGenerator();
void PrepareHeavyImpactFeedbackGenerator();

// FEEDBACK TRIGGER METHODS -------------------------------------------------------------------------

void SelectionHaptic();
void SuccessHaptic();
void WarningHaptic();
void FailureHaptic();
void LightImpactHaptic();
void MediumImpactHaptic();
void HeavyImpactHaptic();
void WeakHaptic();
void StrongHaptic();
void NopeHaptic();
void Vibrate();

// UTILS METHODS -------------------------------------------------------------------------

int HapticSupportedLevel();