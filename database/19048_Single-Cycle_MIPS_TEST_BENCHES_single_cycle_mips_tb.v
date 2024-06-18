// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module SINGLE_CYCLE_MIPS_TB;

    parameter DATA_WIDTH = 32;
    reg clk;
    reg reset_n;
    wire [DATA_WIDTH - 1 : 0] test_value;

    TOP_MIPS dut(
        .clk(clk),
        .reset_n(reset_n),
        .test_value(test_value)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end
    
    initial begin
        reset_n = 0;
        #2
        reset_n = 1;

        #500
        $finish;
    end

endmodule
