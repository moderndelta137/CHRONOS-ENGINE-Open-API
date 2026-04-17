CHRONOS ENGINE: Audio Design & Implementation Plan

1. Core Acoustic Aesthetic

The soundscape must feel heavy, analog, and claustrophobic. The player is operating a massive, aging machine in a subterranean bunker under active siege. The sounds should lack modern digital "cleanness"—favoring mechanical clacks, electrical hums, static interference, and low-frequency resonance.

2. Terminal & Typing Sounds (The Teletype Experience)

Operator Input (Player typing): Heavy, tactile mechanical switch sounds, similar to an IBM Model M or a heavy industrial terminal.

AI Transmission (log-ai): A rapid, muffled, rhythmic clatter resembling a 1970s teletype machine or dot-matrix printer.

System/Warning Logs (log-system, log-error): A slightly harsher, higher-pitched electronic "chirp" for standard logs. Error logs are preceded by a sharp, analog square-wave warning beep.

UI Hover/Click: * Hover: A very faint, dry static "tick" (like a Geiger counter needle moving once).

Click: A solid, satisfying mechanical relay snapping into place.

3. Hardware & Screen Transitions (The CRT Experience)

Channel Flip (Screen Change): A violent, heavy rotary dial "thud" accompanied by the physical sound of a high-voltage degaussing coil discharging (CHUNK-bzzt).

Static Burst: A split-second burst of harsh, unfiltered white noise perfectly synced with the visual CSS static overlay.

Hardware Glitch (Random Letter/Digit Flicker): A very quiet, localized electrical "zap" or spark sound, simulating a failing vacuum tube or frayed wire.

4. Gameplay & Environmental Events

Divergence Meter (Nixie Tubes):

Rolling: A rapid, cascading series of clicks (similar to a fast-spinning analog odometer or Geiger counter).

Locking (Target Reached): A harmonious, resonant bell-like chime (using sine waves).

Locking (Target Missed): A dull, metallic clunk.

FDL Bunker Damage:

Ambient Hit (Small): A low-pass filtered, distant bass thud. Muffled, as if happening through 100 feet of concrete.

Critical Hit (Huge): A violent, distorted bass impact that causes a brief drop in the ambient room hum, accompanied by the sound of crumbling concrete.

Mission Eject/Abort: The loud hiss of pneumatic pressure releasing, followed by a heavy mechanical bolt slamming shut.

Game Over (Breach): A deafening, distorted explosion that abruptly cuts off into pure white noise, followed by a steady, analog flatline tone (sine wave).

5. Ambience (Optional / Subtle)

Bunker Hum: A constant, extremely low-volume 50Hz/60Hz AC electrical hum to subconsciously establish the claustrophobic environment.

Radar Sweep: A very subtle, slow low-pass filter sweep (wub... wub...) matching the 6-second visual radar background.

6. Implementation Strategy

We will build a ChronosAudioEngine class using JavaScript's AudioContext.

White Noise Buffers: Used for static bursts and explosion tails.

Oscillators (Square/Sawtooth): Used for UI blips, errors, and Nixie tube clicks.

Oscillators (Sine/Triangle): Used for heavy bass impacts (FDL damage) and the ambient hum.