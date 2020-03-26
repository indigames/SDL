/*
  Simple DirectMedia Layer
  Copyright (C) 1997-2019 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/
#include "../../SDL_internal.h"

#ifdef SDL_HAPTIC_IOS

#include "SDL_haptic.h"
#include "../SDL_syshaptic.h"
#include "iOSHapticInterface.h"

static int
SDL_SYS_LogicError(void)
{
    return SDL_SetError("Logic error: No haptic devices available.");
}


int
SDL_SYS_HapticInit(void)
{
    InstantiateFeedbackGenerators ();
    return 0;
}

int
SDL_SYS_NumHaptics(void)
{
    return 0;
}

const char *
SDL_SYS_HapticName(int index)
{
    SDL_SYS_LogicError();
    return NULL;
}


int
SDL_SYS_HapticOpen(SDL_Haptic * haptic)
{
    return SDL_SYS_LogicError();
}


int
SDL_SYS_HapticMouse(void)
{
    return -1;
}


int
SDL_SYS_JoystickIsHaptic(SDL_Joystick * joystick)
{
    return 0;
}


int
SDL_SYS_HapticOpenFromJoystick(SDL_Haptic * haptic, SDL_Joystick * joystick)
{
    return SDL_SYS_LogicError();
}


int
SDL_SYS_JoystickSameHaptic(SDL_Haptic * haptic, SDL_Joystick * joystick)
{
    return 0;
}


void
SDL_SYS_HapticClose(SDL_Haptic * haptic)
{
    ReleaseFeedbackGenerators();
    return;
}


void
SDL_SYS_HapticQuit(void)
{
    return;
}


int
SDL_SYS_HapticNewEffect(SDL_Haptic * haptic,
                        struct haptic_effect *effect, SDL_HapticEffect * base)
{
    return SDL_SYS_LogicError();
}


int
SDL_SYS_HapticUpdateEffect(SDL_Haptic * haptic,
                           struct haptic_effect *effect,
                           SDL_HapticEffect * data)
{
    return SDL_SYS_LogicError();
}


int
SDL_SYS_HapticRunEffect(SDL_Haptic * haptic, struct haptic_effect *effect,
                        Uint32 iterations)
{
    return SDL_SYS_LogicError();
}


int
SDL_SYS_HapticStopEffect(SDL_Haptic * haptic, struct haptic_effect *effect)
{
    return SDL_SYS_LogicError();
}


void
SDL_SYS_HapticDestroyEffect(SDL_Haptic * haptic, struct haptic_effect *effect)
{
    SDL_SYS_LogicError();
    return;
}


int
SDL_SYS_HapticGetEffectStatus(SDL_Haptic * haptic,
                              struct haptic_effect *effect)
{
    return SDL_SYS_LogicError();
}


int
SDL_SYS_HapticSetGain(SDL_Haptic * haptic, int gain)
{
    return SDL_SYS_LogicError();
}


int
SDL_SYS_HapticSetAutocenter(SDL_Haptic * haptic, int autocenter)
{
    return SDL_SYS_LogicError();
}

int
SDL_SYS_HapticPause(SDL_Haptic * haptic)
{
    return SDL_SYS_LogicError();
}

int
SDL_SYS_HapticUnpause(SDL_Haptic * haptic)
{
    return SDL_SYS_LogicError();
}

int
SDL_SYS_HapticStopAll(SDL_Haptic * haptic)
{
    return SDL_SYS_LogicError();
}

/*
 * Play the haptic on the mobile device.
 */
int
SDL_HapticPlay_Internal(SDL_Haptic* haptic, HapticTypes type) // [IGE]: rename to avoid issuse
{
	if(HapticSupportedLevel() == 0)   // no haptic/ vibrate supported yet
    {
        
    }
    else if(HapticSupportedLevel() == 1)   // only vibrate supported
    {
        Vibrate();
    }
    else if(HapticSupportedLevel() == 2)   // fully happtic suported
    {
        /* play the haptic */
        switch (type)
        {
            case Selection:
                SelectionHaptic();
                break;

            case Success:
                SuccessHaptic();
                break;

            case Warning:
                WarningHaptic();
                break;

            case Failure:
                FailureHaptic();
                break;

            case LightImpact:
                LightImpactHaptic();
                break;

            case MediumImpact:
                MediumImpactHaptic();
                break;

            case HeavyImpact:
                HeavyImpactHaptic();
                break;
        }
    }
	return 0;
}

/*
 * Play the haptic.
 */
int
SDL_SYS_HapticPlay(SDL_Haptic* haptic, HapticTypes type, long* pattern, int* amplitudes, int size, int repeat)
{
	return SDL_HapticPlay_Internal(haptic, type); // [IGE]: rename to avoid issuse
}

#endif /* SDL_HAPTIC_IOS */

/* vi: set ts=4 sw=4 expandtab: */
