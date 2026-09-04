# 8-bit Mini CPU (Verilog)

An 8-bit single-cycle CPU designed from scratch in Verilog, built as a learning project for VLSI/Digital Design coursework. Currently in progress — starting with the ALU and building up to a full working CPU over 4 weeks.

## Project Goal

Design and simulate a simple 8-bit CPU with:
- ALU (Add, Sub, AND, OR)
- Register File
- Instruction Memory
- Control Unit
- Program Counter

All modules are written in Verilog, simulated using Icarus Verilog via EDA Playground (no FPGA board used — pure simulation-based verification).

## Progress

- [x] ALU design (Add, Sub, AND, OR via case statement)
- [x] ALU testbench (5 test cases: Add, Sub, AND, OR, and one overflow case)
- [ ] Register File
- [ ] Instruction Memory
- [ ] Control Unit
- [ ] Program Counter
- [ ] Full CPU integration
- [ ] GTKWave waveform debugging

## Folder Structure

## ALU Details

The ALU takes two 8-bit operands and a 2-bit select signal, and performs one of 4 operations:

| sel  | Operation |
|------|-----------|
| 00   | Add       |
| 01   | Sub       |
| 10   | AND       |
| 11   | OR        |

Carry-out (`cout`) is generated for Add/Sub using a concatenation trick (`{cout, result} = a + b`), which captures the 9th bit of the 8-bit addition as the carry. For AND/OR, `cout` is fixed to 0 since there's no overflow concept for bitwise operations.

## Tools Used

- **EDA Playground** (Icarus Verilog) — for writing and simulating Verilog code
- **GTKWave** — for waveform-based debugging
- **GitHub** — for version control and documentation

## How to Run

1. Copy `rtl/alu.v` into the design file on EDA Playground
2. Copy `tb/alu_tb.v` into the testbench file
3. Select **Icarus Verilog** as the simulator
4. Click **Run** — expected output will show `result` and `cout` for each test case in the console log

## Author

Built as part of self-directed Verilog learning (HDLBits practice) alongside coursework, with the goal of eventually contributing to VLSI/Digital Design research.
