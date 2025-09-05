## How it works

This project implements a **1-bit Full Adder** using digital logic gates.  
It takes three inputs:
- **A** (ui[0])  
- **B** (ui[1])  
- **Cin** (ui[2], carry-in)  

and produces two outputs:
- **Sum** (uo[0])  
- **Cout** (uo[1], carry-out)  

The logic equations are:  
- **Sum = A ⊕ B ⊕ Cin**  
- **Cout = (A & B) | (B & Cin) | (A & Cin)**  

This is a fundamental building block for arithmetic circuits like adders, ALUs, and processors.

---

## How to test

1. Provide binary input values on `ui_in[2:0]`:
   - `ui[0]` → A  
   - `ui[1]` → B  
   - `ui[2]` → Cin  

2. Observe the outputs:
   - `uo[0]` → Sum  
   - `uo[1]` → Cout  

3. Verify against the truth table:

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 | 0   |  0  |  0   |
| 0 | 0 | 1   |  1  |  0   |
| 0 | 1 | 0   |  1  |  0   |
| 0 | 1 | 1   |  0  |  1   |
| 1 | 0 | 0   |  1  |  0   |
| 1 | 0 | 1   |  0  |  1   |
| 1 | 1 | 0   |  0  |  1   |
| 1 | 1 | 1   |  1  |  1   |

4. You can simulate this using Cocotb tests provided in the repository, or by running it directly in hardware once fabricated.

---

## External hardware

No external hardware is required.  
The project works entirely within the TinyTapeout environment.  
Optionally, you can connect LEDs to `uo[0]` (Sum) and `uo[1]` (Cout) to visualize results during testing.
