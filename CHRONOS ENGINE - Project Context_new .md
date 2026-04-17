CHRONOS ENGINE - Master Terminal

Design & Architecture Document
Current State: v3.0 (Pre-Audio Implementation phase)

1. Premise & Lore

Setting: Year 2038. The Earth is an irradiated wasteland following a nuclear WWIII sparked by the escalation of the 1962 Cuban Missile Crisis.

The Player: An "Operator" stationed in the subterranean AION Directorate bunker beneath the Swiss Alps.

The Goal: Prevent WWIII by sending field agents back in time via a "quantum text-link" to alter critical historical events (Nexus points) and guide the timeline to a safe "Target Divergence" (1.000000).

2. Core Gameplay Mechanics

Divergence: The primary win-condition metric. Every timeline insertion has a targetDivergence. Player actions shift the current divergence. To succeed in main missions, the final divergence must be within ±20% of the target.

FDL Integrity (Final Defence Line): The 2038 bunker is under active bombardment. FDL starts at 100% and continuously degrades in real-time (fdl_degrade_rate). Random bombing events cause sudden drops. If FDL reaches 0%, the game is over (Player KIA).

Agent Vitals:

HP (Health Points): Starts at 100. Depletes from combat/hazards. Reaching 0 results in Agent KIA and forced extraction.

AP (Action Points): Starts at 100. Depletes via "Chronal Exertion" (taking actions, changing history). Reaching 0 results in forced extraction.

Input System: * Players choose from 3 dynamically AI-generated options (with estimated AP costs) OR use "Manual Override" to type free-text commands.

Progression: Completing a main Nexus point unlocks subsequent chronological nodes on the Timeline Graph.

3. Mission Architecture (The Timeline)

Represented on a 2D Cartesian graph (X-axis = Year, Y-axis = Divergence).

Main Quests (Solid Lines): Must hit specific Target Divergences.

1945: Berlin (Fall of Berlin)

1962: Cuba (Cuban Missile Crisis)

1983: Moscow (Petrov Incident)

1991: Berlin (End of Era / Stasi)

1999: Geneva (Y2K Protocol)

2015: CERN (LHC Incident)

2029: Silicon Valley (AI Singularity)

Side Quests / Anomalies (Dashed Lines): Optional nodes. Success is based on achieving any positive divergence shift.

1947: Roswell, 1969: Houston, 1986: Pripyat, 1995: Tokyo, 2008: Reykjavik, 2024: Orbit.

4. Agent Roster (Randomly Drafted per Mission)

KESSLER (Methodical): Forensic Analyst. High precision, zero chronal footprints.

VANCE (Brute-Force): Heavy Munitions. JSOC veteran, utilizes explosive action.

CHEN (Stealth): Covert Infiltrator. High mobility, silent asset extraction.

NOVA (Social): CIA Operative. Psychological warfare, persuasion, disguise.

5. UI & Visual Aesthetics

Theme: Retro CRT terminal, heavy industrial aesthetic.

Visual Effects: * crt-overlay and scanline-move for CRT curvature and scanning.

Screen shake on FDL damage (shake-screen). Red flashes for heavy hits.

Hardware flicker (hardware-flicker): Random, localized opacity/brightness glitching targeting title letters and Divergence Nixie digits.

Nixie Tube rolling animations (nixie-rolling) when divergence shifts.

Channel switch transition (channel-roll-up / down) between UI screens.

Color Themes: Default (Bronze), Classic (Neon Green), Amber, Cyber (Cyan), Blood (Crimson).

Localization: English, Japanese, Chinese.

6. AI Prompt Architecture (Gemini 2.5 Flash API)

The LLM acts as the field agent reporting back to the operator, strictly outputting JSON.
Strict Rules Enforced:

Write in 1st-person perspective, terse military-style logs.

Reject magic/future tech (Chronal Paradox rejection).

Apply massive divergence shifts (+/- 0.1 to 0.4) only when interacting with designated <span class='kw-nexus'> targets.

Output specific JSON schema containing: narrative_response, AP_cost, HP_damage, divergence_shift, inventory_update, next_options, etc.

7. Save System

Local Storage: Tracks chronos_unlocked, chronos_completed, and chronos_run_count.

Cloud Save: Integrates with Firebase Firestore (/artifacts/{appId}/users/{userId}/saveData/progress).

Triggers: Automatically saves on Mission Success, Mission Failure, Manual Extraction, and System Menu abort.

8. Current Development Status & Planned Features

Current Status: The code is completely stable. The System Menu overlay works properly, save state logic is watertight, and visual transitions are polished.

Immediate Next Step (Audio Implementation): An audio plan has been approved but not yet implemented in the code. The next step is to integrate a ChronosAudioEngine using the browser's native AudioContext to generate procedural, base64-free retro sounds (hover ticks, mechanical keyboard clacks, Nixie tube rolling, FDL bass impacts, and UI error chirps).