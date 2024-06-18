// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module DATA_MEMORY_TB;

    parameter DATA_WIDTH = 32;
    parameter ADD_WIDTH = 32;
    parameter DEPTH = 128;
    reg clk, reset_n, write_enable;

    reg [ADD_WIDTH - 1 : 0] address;
    reg [DATA_WIDTH - 1 : 0] data;
    wire [DATA_WIDTH - 1 : 0] out;
    wire [DATA_WIDTH - 1 : 0] test;

    DATA_MEMORY dut(.clk(clk),
                    .reset_n(reset_n),
                    .write_enable(write_enable),
                    .address(address),
                    .write_data(data),
                    .read_data(out),
                    .test_value(test));

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin

        reset_n = 0;
        write_enable = 0;
        address = 32;
        data = 32'hAA;
        
        #10
        reset_n = 1;
        write_enable = 1;

        repeat(10) begin
            #10
            address = $random % (DEPTH) & 32'h7fff_ffff;
            data = $random;
        end

        #5
        $finish;
    end

endmodule
