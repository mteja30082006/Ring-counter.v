module ring_counter (
    input  wire       clk,
    input  wire       reset,
    output reg  [3:0] q
);

    always @(posedge clk) begin

        if (reset) begin
            // Initialize with one-hot value
            q <= 4'b1000;
        end

        else begin
            // Rotate the 1-bit
            q <= {q[0], q[3:1]};
        end

    end

endmodule