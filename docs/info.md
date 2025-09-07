# 1-bit Full Adder

## How it works
A **full adder** is a combinational circuit that adds three single-bit binary inputs: **A**, **B**, and **Cin** (carry-in), and produces two outputs: the **Sum** and the **Cout** (carry-out).  
- **Sum** = A ⊕ B ⊕ Cin (1 if an odd number of inputs are 1)  
- **Cout** = (A & B) | (B & Cin) | (A & Cin) (1 if at least two inputs are 1)  

This allows the full adder to account for carry-in from a previous stage, making it suitable for multi-bit addition.

---

## How to test

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 | 0   | 0   | 0    |
| 0 | 0 | 1   | 1   | 0    |
| 0 | 1 | 0   | 1   | 0    |
| 0 | 1 | 1   | 0   | 1    |
| 1 | 0 | 0   | 1   | 0    |
| 1 | 0 | 1   | 0   | 1    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

Provide binary inputs on `ui[0..2]` (A, B, Cin) and observe the outputs on `uo[0..1]` (Sum, Cout).

---

## External hardware
No external hardware is required.  
The project works entirely within the TinyTapeout environment.
