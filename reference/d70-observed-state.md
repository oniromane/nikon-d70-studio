# Nikon D70 — observed over PTP, 19 Aug 2026

Read from the actual body with gphoto2 2.5.32 on macOS 26.6.1 (arm64).
Full key list: `d70-config-keys.txt` — 210 entries, of which 107 are named
and 103 are raw PTP property codes under `/main/other/`.

## Identity and state at time of reading

| Key | Value |
|---|---|
| `/main/status/cameramodel` | D70 |
| `/main/status/deviceversion` | **V1.02** |
| `/main/status/batterylevel` | 25% |
| `/main/status/acpower` | Off |
| `/main/status/lensname` | Unknown |
| `/main/status/minfocallength` | 0 mm |
| `/main/status/maxfocallength` | 0 mm |
| `/main/capturesettings/focallength` | 0 |
| `/main/capturesettings/f-number` | f/0 |
| `/main/status/lightmeter` | 0,0 |
| `/main/status/externalflash` | Off |
| `/main/status/flashopen` | Off |
| `/main/capturesettings/expprogram` | M |
| `/main/capturesettings/shutterspeed` | 0,0062s  (1/160) |
| `/main/imgsettings/iso` | 800 |
| `/main/imgsettings/whitebalance` | Automatic |
| `/main/capturesettings/imagequality` | NEF (Raw) |
| `/main/imgsettings/imagesize` | 3008x2000 |
| `/main/capturesettings/exposuremetermode` | Multi Spot |
| `/main/capturesettings/focusmode` | Manual |
| `/main/capturesettings/capturemode` | Single Shot |

**Reading of that state:** `lensname Unknown`, focal length `0`, and `f/0`
together mean **no CPU lens was mounted** — the same condition the control panel
shows as `F--`. Mount the 18–55 or the 70–300 and those four fields populate.

## Enumerated choices confirmed

* **ISO** — 200 · 250 · 320 · 400 · 500 · 640 · 800 · 1000 · 1250 · 1600
  (exactly the manual's range, ⅓ stops)
* **Optimize Image** — Normal · Vivid · Sharper · Softer · Direct Print ·
  Portrait · Landscape · Custom (the manual's eight)
* **Bulb Mode** — `TOGGLE`, `Readonly: 0`

## Output format notes for anyone parsing this

`gphoto2 --get-config A --get-config B …` emits one block per key, each
terminated by a bare `END`, and **does not echo the key path**. Blocks pair with
requests positionally. Every block carries `Label:`, `Readonly:`, `Type:`,
`Current:`, and zero or more `Choice: N value` lines — so read/write permission
comes from the camera rather than being guessed.
