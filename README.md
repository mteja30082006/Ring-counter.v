4-Bit Ring Counter Using Verilog HDL

Overview

This project implements a 4-bit Ring Counter using Verilog HDL.

A ring counter is a type of shift register in which the output of the last flip-flop is connected back to the input of the first flip-flop.

In this project, a single "1" circulates through four flip-flops.

Features

- 4-bit ring counter
- Shift-register based design
- Synchronous clock
- Active-high reset
- One-hot output sequence
- Verilog RTL implementation
- Complete testbench
- Simulation output
- Waveform generation

Ring Counter Sequence

After reset, the counter starts with:

1000

On every rising edge of the clock:

1000
0100
0010
0001
1000
0100
0010
0001
...

The "1" continuously rotates through the four bit positions.

Block Diagram

       +-----+     +-----+     +-----+     +-----+
       | FF3 | --> | FF2 | --> | FF1 | --> | FF0 |
       +-----+     +-----+     +-----+     +-----+
          ^                                      |
          |______________________________________|

Inputs and Outputs

Signal| Width| Description
"clk"| 1 bit| Clock signal
"reset"| 1 bit| Active-high reset
"q"| 4 bits| Ring counter output

Working Principle

The counter uses four flip-flop stages.

The output of the last stage is fed back to the first stage.

The counter starts with:

q = 1000

After each positive clock edge:

1000 → 0100 → 0010 → 0001 → 1000

Therefore, only one bit is HIGH at a time.

Truth Table / State Sequence

Clock| Q3| Q2| Q1| Q0
Reset| 1| 0| 0| 0
1| 0| 1| 0| 0
2| 0| 0| 1| 0
3| 0| 0| 0| 1
4| 1| 0| 0| 0
5| 0| 1| 0| 0

Applications

Ring counters are commonly used in:

- Sequence generators
- Digital control circuits
- Timing circuits
- Frequency division
- LED sequencing
- Counter circuits
- Control signal generation
- Digital systems

Project Files

RTL Code

src/ring_counter.v

Contains the 4-bit ring counter design.

Testbench

tb/ring_counter_tb.v

Tests the counter sequence and reset operation.

Simulation Output

simulation/simulation_output.txt

Contains the expected simulation results.

Simulation Using Icarus Verilog

Compile the design:

iverilog -o ring_sim src/ring_counter.v tb/ring_counter_tb.v

Run the simulation:

vvp ring_sim

The testbench generates:

ring_counter.vcd

Open the waveform using GTKWave:

gtkwave ring_counter.vcd

Expected Result

The output should continuously follow:

1000 → 0100 → 0010 → 0001 → 1000

The simulation verifies that:

- Reset initializes the counter correctly.
- The "1" shifts by one position every clock cycle.
- The sequence repeats continuously.
- Only one output bit is HIGH at a time.

Future Improvements

The project can be extended to:

- 8-bit ring counter
- 16-bit ring counter
- Parameterized ring counter
- Johnson counter
- Bidirectional ring counter
- LED-based hardware implementation

Conclusion

This project demonstrates the implementation and verification of a 4-bit Ring Counter using Verilog HDL. The design uses a shift-register structure with feedback to generate a repeating one-hot sequence.
