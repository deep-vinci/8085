---

## **🔷 1\. MOV Instruction Group**

Moves data between registers and memory.

### **✅ Patterned**

MOV Dst, Src → 01DDDSSS

* `DDD` \= Destination register

* `SSS` \= Source register

| Register | Code (bin) |
| ----- | ----- |
| B | 000 |
| C | 001 |
| D | 010 |
| E | 011 |
| H | 100 |
| L | 101 |
| M (HL) | 110 |
| A | 111 |

🧠 Example:

* `MOV A, C` → `01 111 001` → `79H`

---

## **🔷 2\. MVI (Move Immediate) Group**

Loads a value directly into a register or memory.

### **✅ Patterned**

MVI R, data → 00rrr110

* `rrr` \= Register code

🧠 Example:

* `MVI B, 2AH` → `06 2A`

---

## **🔷 3\. Arithmetic: ADD, SUB, ANA, ORA, XRA**

Operations between **A** and another register or memory.

### **✅ Patterned**

#### **A. ADD R → `10000rrr`**

#### **B. SUB R → `10010rrr`**

#### **C. ANA R → `10100rrr` (logical AND)**

#### **D. XRA R → `10101rrr` (XOR)**

#### **E. ORA R → `10110rrr` (OR)**

#### **F. CMP R → `10111rrr` (Compare)**

🧠 Example:

* `ADD D` → `10000010` → `82H`

* `SUB M` → `10011110` → `96H`

---

## **🔷 4\. Immediate Arithmetic**

Performs arithmetic with 8-bit immediate data.

### **❌ Fixed opcodes (not patterned):**

| Instruction | Opcode |
| ----- | ----- |
| `ADI data` | C6H |
| `SUI data` | D6H |
| `ANI data` | E6H |
| `ORI data` | F6H |
| `XRI data` | EEH |
| `CPI data` | FEH |

---

## **🔷 5\. INR / DCR (Increment / Decrement)**

Increases or decreases the contents of a register or memory by 1\.

### **✅ Patterned**

#### **INR → `00rrr100`**

#### **DCR → `00rrr101`**

🧠 Example:

* `INR B` → `04H`

* `DCR A` → `3DH`

---

## **🔷 6\. INX / DCX (Increment / Decrement register pairs)**

### **✅ Patterned**

#### **INX → `00RP0001`**

#### **DCX → `00RP1011`**

| RP (Register Pair) | Code |
| ----- | ----- |
| BC | 00 |
| DE | 01 |
| HL | 10 |
| SP | 11 |

🧠 Example:

* `INX H` → `23H`

* `DCX D` → `1BH`

---

## **🔷 7\. LXI (Load register pair with immediate 16-bit)**

### **✅ Patterned**

LXI RP, data → 00RP0001 (followed by 16-bit data)

| RP | Code | Example |
| ----- | ----- | ----- |
| B (BC) | 00 | LXI B,2050H → `01 50 20` |
| D (DE) | 01 | `11H` |
| H (HL) | 10 | `21H` |
| SP | 11 | `31H` |

---

## **🔷 8\. Register Pair Transfer**

| Instruction | Opcode | Notes |
| ----- | ----- | ----- |
| `PCHL` | E9H | Jump to HL content |
| `SPHL` | F9H | Copy HL → SP |
| `XCHG` | EBH | Swap DE and HL |
| `XTHL` | E3H | Swap HL with stack top |

👉 These are ❌ not patterned — just fixed.

---

## **🔷 9\. Stack Operations**

| Instruction | Opcode | Notes |
| ----- | ----- | ----- |
| `PUSH B` | C5H | Push BC pair |
| `PUSH D` | D5H | Push DE pair |
| `PUSH H` | E5H | Push HL pair |
| `PUSH PSW` | F5H | Push A \+ Flags |
| `POP B` | C1H |  |
| `POP D` | D1H |  |
| `POP H` | E1H |  |
| `POP PSW` | F1H |  |

❌ Fixed opcodes — but consistent.

---

## **🔷 10\. Branching Instructions**

| Instruction | Opcode | Notes |
| ----- | ----- | ----- |
| `JMP addr` | C3H | Unconditional |
| `JC addr` | D2H | Jump if Carry |
| `JNC addr` | D3H | Jump if No Carry |
| `JZ addr` | CAH | Jump if Zero |
| `JNZ addr` | C2H | Jump if Not Zero |
| `CALL addr` | CDH | Call subroutine |
| `RET` | C9H | Return |
| `CPI data` | FEH | Compare A with data |

✅ Common and essential — but mostly ❌ fixed opcodes.

---

## **🔷 11\. I/O Instructions**

| Instruction | Opcode |
| ----- | ----- |
| `IN port` | DBH |
| `OUT port` | D3H |

→ 2-byte instructions (opcode \+ port number)

---

## **🔷 12\. NOP & HALT**

| Instruction | Opcode | Notes |
| ----- | ----- | ----- |
| `NOP` | 00H | Do nothing |
| `HLT` | 76H | Halt execution |

---

## **✅ Summary Table**

| Group | Patterned? | Example / Pattern |
| ----- | ----- | ----- |
| `MOV` | ✅ Yes | `01DDDSSS` |
| `MVI` | ✅ Yes | `00rrr110` |
| `ADD/SUB/etc.` | ✅ Yes | `10oooRRR` |
| `ADI/SUI/...` | ❌ No | Fixed like `C6H` |
| `INR/DCR` | ✅ Yes | `00rrr1x0` |
| `INX/DCX` | ✅ Yes | `00RPx001` |
| `LXI` | ✅ Yes | `00RP0001` \+ data |
| `CALL/JMP/RET` | ❌ No | Fixed opcodes |
| `PUSH/POP` | ❌ No | Fixed, consistent |
| `IN/OUT` | ❌ No | Fixed, 2-byte |
| `NOP/HLT` | ❌ No | `00`, `76` |


