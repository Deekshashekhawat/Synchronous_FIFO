# Synchronous FIFO Verification using SystemVerilog

## Overview

This project implements and verifies a **Synchronous FIFO (First-In First-Out)** memory using **Verilog/SystemVerilog**. The design supports synchronous read and write operations and includes a complete verification environment built using SystemVerilog components.

The verification environment follows a modular architecture consisting of a Generator, Driver, Monitor, Scoreboard, Transaction, and Interface.

---

## Project Objectives

* Design a parameterized Synchronous FIFO.
* Verify FIFO functionality using a SystemVerilog testbench.
* Check data integrity during read and write operations.
* Validate FIFO status flags such as Full and Empty.
* Develop a reusable verification environment.

---

## FIFO Features

* Synchronous Read and Write
* FIFO Full Detection
* FIFO Empty Detection
* Configurable Data Width
* Configurable FIFO Depth
* Circular Buffer Implementation

---

## Verification Architecture

```text
Generator
    │
    ▼
 Driver
    │
    ▼
 Interface
    │
    ▼
 FIFO DUT
    │
    ▼
 Monitor
    │
    ▼
 Scoreboard
```

### Components

#### Generator

Generates transactions and sends them to the driver.

#### Driver

Applies generated transactions to the DUT through the interface.

#### Interface

Provides communication between the testbench and the DUT.

#### Monitor

Observes DUT activity and collects transaction information.

#### Scoreboard

Compares expected and actual outputs to verify correctness.

#### Transaction

Defines the structure of data packets used throughout the verification environment.

---

## Directory Structure

```text
Synchronous_FIFO/
│
├── fifo_sync_design.v     # FIFO RTL Design
├── interface.sv          # Interface
├── transaction.sv        # Transaction Class
├── generator.sv          # Stimulus Generator
├── driver.sv             # Driver
├── monitor.sv            # Monitor
├── scoreboard.sv         # Scoreboard
├── environment.sv        # Verification Environment
├── test.sv               # Test Case
├── top.sv                # Top Module
└── README.md
```

---

## Simulation Flow

1. Generate random transactions.
2. Drive transactions to the FIFO.
3. Monitor DUT activity.
4. Compare expected and actual outputs.
5. Report pass/fail results.

---

## Verification Checks

* Write operation verification
* Read operation verification
* FIFO Full condition
* FIFO Empty condition
* Data ordering verification
* Data integrity checking

---

## Tools Used

* Verilog
* SystemVerilog
* ModelSim / QuestaSim
* Intel Quartus Prime

---

## Future Improvements

* Constrained Random Verification
* Functional Coverage
* SystemVerilog Assertions (SVA)
* Asynchronous FIFO Verification
* UVM-Based Verification Environment

---

## Author

**Deekshashekhawat**

Electronics and Communication Engineering Student

Interested in Digital Design, FPGA Design, ASIC Design, and Verification Engineering.
