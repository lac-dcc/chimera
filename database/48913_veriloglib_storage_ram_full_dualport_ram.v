// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module full_dualport_ram
#(
    parameter WIDTH = 8,
    parameter DEPTH = 2**4
)
(
    input clk_a, clk_b,
    input wr_en_a, wr_en_b,
    input [$clog2(DEPTH)-1:0] addr_a, addr_b,
    input [WIDTH-1:0] din_a, din_b,
    output reg [WIDTH-1:0] dout_a, dout_b
);

    reg [WIDTH-1:0] mem [DEPTH];    // Memory is shared between port A and B

    // Port A
    always @(posedge clk_a)
        begin
            dout_a <= mem[addr_a];
            if(wr_en_a)
                begin
                    mem[addr_a] <= din_a;
                    dout_a <= din_a;    // Pass-through i.e. write-before-read behavior
                end
        end

    // Replicate previous block for port B
    always @(posedge clk_b)
        begin
            dout_b <= mem[addr_b];
            if(wr_en_b)
                begin
                    mem[addr_b] <= din_b;
                    dout_b <= din_b;
                end
        end

endmodule