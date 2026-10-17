# Verilog_Assignments-Counters_-_Code_Convertors-

## ### # 📑 ASCII Quick Reference   (1. 7Segment)

### 🗺️ Core Ranges
* **Digits ('0'-'9'):** `0x30` - `0x39` (Dec: 48-57)
* **Uppercase ('A'-'Z'):** `0x41` - `0x5A` (Dec: 65-90)
* **Lowercase ('a'-'z'):** `0x61` - `0x7A` (Dec: 97-122)

### 📊 Anchor Values
* **'0'** = `0x30` (48)
* **'A'** = `0x41` (65)
* **'a'** = `0x61` (97)


## 2. 16-bit Odd/Even Counter

**Description:** Designed a 16-bit Odd/Even Counter using Verilog HDL with a mode control bit.

**Working:**
- **Mode = 1:** Counts even numbers (0, 2, 4, 6, 8, ...).
- **Mode = 0:** Counts odd numbers (1, 3, 5, 7, 9, ...).
- **Reset:** Initializes the counter to zero.
- **Clock:** Updates the counter on every rising edge.

**Modeling:** Behavioral Modeling using an `always` block and conditional statements.
