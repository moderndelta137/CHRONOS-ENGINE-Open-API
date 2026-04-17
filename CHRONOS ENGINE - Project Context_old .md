CHRONOS ENGINE - Project Context & Design Document

1. Project Overview

Title: CHRONOS ENGINE (formerly AION Protocol)
Genre: Interactive fiction / Text-based Strategy & Resource Management Game.
Platform: Web browser (Single-file HTML/CSS/JS web application).
Core Concept: The player acts as an "Operator" in the year 2038, using a quantum text-link terminal to guide temporal field agents through the past. The goal is to alter specific historical "Nexus" points to prevent the escalation of the 1962 Cuban Missile Crisis, which turned the world into an irradiated wasteland locked in a permanent World War III.

2. Lore & Worldbuilding

Current Year: 2038. The surface is a radioactive wasteland due to WW3.

The Organization: The AION Directorate. Operating in absolute secrecy deep beneath the Swiss Alps. They are the sole possessors of the "Chronos Engine" (time machine).

The Enemy: "Shadow Factions" or "Agents of Chaos" who are trying to manipulate the timeline to maintain the eternal Cold War or steal chronal tech.

Nexus Points: Critical moments in history (e.g., 1945 Berlin, 1947 Roswell, 1962 Cuba, 1986 Chernobyl). Main quests push the timeline toward a "Target Divergence." Side quests (Anomalies) are optional and highly volatile.

Agents: * KESSLER (Methodical / Forensic Analyst): Ex-BND, leaves no chronal footprint.

VANCE (Brute-Force / Heavy Munitions): Ex-JSOC, aggressive, high adrenaline.

CHEN (Stealth / Covert Infiltrator): Ministry of State Security shadow agent, hyper-focused.

NOVA (Social / CIA Operative): Deep cover embedding, psychological manipulation.

3. Core Gameplay Mechanics

AP (Action Points / Chronal Stability): Depleted by taking actions. Reaching 0 triggers a forced emergency extraction (Mission Failure).

HP (Health Points): Agent's physical health. Reaching 0 triggers Agent K.I.A. and forced extraction (Mission Failure).

Divergence: A float value (e.g., 0.358102). The player's actions shift this number. The goal of Main Quests is to reach the specific Target Divergence for that era (within a 20% margin of error). Side quests accept any positive shift.

FDL (Final Defence Line): The HQ's shield integrity in 2038. Slowly degrades over real-time while playing, with random kinetic "bombing" hits causing screen shake. If FDL reaches 0%, reality collapses (Game Over).

4. UI / UX Design & Aesthetics

Framework: Tailwind CSS via CDN.

Architecture: Strictly a Single-File HTML project. No external CSS/JS files.

Typography: * Main Terminal Text: VT323 (Monospace, retro computer feel).

Titles/Headers: Cormorant Garamond (Elegant, classic newspaper serif).

Themes: Dynamic CSS-variable based theming system. Changes instantly via the [ THEME ] toggle button.

Default: Bronze outlines, White text, Black background.

Classic: Retro Neon Green on Dark Green.

Amber: Retro Amber monochrome.

Cyber: Cyan Cyberpunk.

Blood: Crimson Alert.

Visual Effects:

CRT Scanlines, vignette, and phosphor flicker (crt-overlay, .flicker).

Radar sweep background (.radar-container).

Blueprint Clock: A highly detailed SVG astrolabe/clock background consisting of thin intersecting lines, ticks, and concentric rings. Separated into 3 groups (CW, CCW, Slow-CW) using steps() animation for a ticking, mechanical feel.

5. Application Flow & Screens

Title Screen: Rotating mechanical blueprint clock, "CHRONOS ENGINE" newspaper-font title with a 4-second irregular CSS glitch animation. Language selection (EN, JA, ZH) initializes the game.

Intro Slideshow: Typewriter-effect text revealing the lore.

Timeline Level Select: A 2D Cartesian graph with a scrollable 3000px width.

X-Axis = Year (1940 to 2040). Y-Axis = Target Divergence (0.0 to 1.0).

Nodes are plotted dynamically. Main Quests have solid lines. Side Quests have dashed lines. The Origin and Target nodes are at Year 2038.

A glowing horizontal "Scan Line" and a pulsating "Player Dot" show the current Divergence and Year.

Briefing Screen (Operation Dossier): A 2-page CIA file. Left page shows mission targets, target divergence, and WW3 importance. Right page rolls a random Agent and displays their lore/stats.

Main Terminal (Gameplay): Top panels (Objective, Agent Vitals/Inventory, Location). Middle panel (Terminal log and text input). Bottom panel (FDL Gauge and Divergence Meter). Red ⏏ EJECT button in the header.

Mission Outcome (Result Screen): Triggered by reaching target divergence, dying, or pressing Eject. Shows Divergence Shift vs Target, Agent Status (EXTRACTED or K.I.A.), and Narrative Impact.

6. AI Integration & Prompt Engineering

API: Uses gemini-2.5-flash-preview-09-2025 via generateContent.

Payload: Uses non-streaming JSON structured output (responseMimeType: "application/json").

Pacing Mechanism: The AI is instructed to return narrative_response as an Array of Strings. It defaults to 1 string. If a significant event occurs (damage, inventory change), it splits into 2 strings (Action -> Reaction). The frontend printToTerminal function asynchronously prints string[0], interleaves color-coded local [ SYSTEM_LOG ] messages (evaluating HP/AP/Inventory math), and then prints string[1].

HTML Spans: The AI is strictly instructed to wrap keywords in specific classes (kw-loc, kw-enemy, kw-nexus, kw-ally, kw-obj) with a data-tooltip attribute for touch-friendly tooltips.

7. Strict Rules for Future AI Iterations

DO NOT split the code: All code must remain in a single index.html file.

Maintain Theming: Always use the --tm-* CSS variables (var(--tm-text), var(--tm-highlight)) for new UI elements so they adhere to the theme toggle.

Preserve State Logic: Rely on the missionsData object for level definitions. Main quests use targetDiv, side quests use plotY (to place them on the map without enforcing a strict target).

Do Not Break the Typewriter / JSON Parser: The frontend printToTerminal handles unclosed HTML span tags dynamically while typing. Do not change the AI systemInstruction regarding how tooltips are formatted unless explicitly requested.