# MIPS CPU Design

This repository contains the Verilog HDL implementation and supporting materials for the **VeriRISC CPU Design**, a very-reduced-instruction-set processor. The project is designed to help users understand and build a simplified processor architecture, now including a testbench for simulation.

## Overview
- **Instruction Set:** Three-bit operation code and five-bit operand, supporting eight instructions.
- **Address Space:** 32 locations.
- **Cycle Phases:** Fetch-and-execute cycle implemented in eight phases for visualization and debug (reducible to two or one with dual-port memory).
- **Inputs:** Clock (`clk`) and reset (`rst`).
- **Output:** Halt signal.
- **Test Criteria:** Pass/fail determined by the number of clock cycles consumed.

## Project Structure
- Exploring the VeriRISC CPU Design (understanding the architecture).
- Development and verification of individual components (Address Multiplexor, Counter, Controller, Register, ALU, Memory) and final verification of the complete design.

## Components
- `register_ac.v`: The accumulator register, a key storage element for arithmetic and logic operations within the processor.
- `register_ir.v`: The instruction register, responsible for holding the current instruction being executed.
- `alu.v`: The Arithmetic Logic Unit, which performs the computational tasks of the processor.
- `counter.v`: The program counter, used to keep track of the memory address of the next instruction to be fetched.
- `mux.v`: The address multiplexor, which selects between different address sources for memory access.
- `controller.v`: The controller, managing the overall operation and coordination of the processor's components.
- `counter.v`: The phase generator, providing the timing phases for the fetch-and-execute cycle.
- `memory.v`: The memory unit, storing both instructions and data for the processor.
- `driver.v`: The driver, facilitating the interaction and control of the processor's operations.
- `risc.v` : The top module file for this project.
- `risc_test.v`: The testbench file, designed to simulate and validate the VeriRISC CPU design.
