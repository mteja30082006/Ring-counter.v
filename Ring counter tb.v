`timescale 1ns/1ps

module ring_counter_tb;

    reg clk;
    reg reset;

    wire [3:0] q;

    // Instantiate Ring Counter
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Initialize signals
        clk = 1'b0;
        reset = 1'b1;

        // Apply reset
        #10;
        reset = 1'b0;

        // Allow counter to run
        #50;

        // Apply reset again
        reset = 1'b1;
        #10;

        reset = 1'b0;

        // Run again
        #50;

        $finish;

    end

    // Display simulation results
    initial begin

        $monitor(
            "Time=%0t | Reset=%b | Q=%b",
            $time,
            reset,
            q
        );

    end

    // Generate waveform
    initial begin
        $dumpfile("ring_counter.vcd");
        $dumpvars(0, ring_counter_tb);
    end

endmodule