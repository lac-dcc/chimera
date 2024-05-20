// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module simple_dualport_ram
#(
    parameter WIDTH = 4,
    parameter DEPTH = 2**3
)
(
    input clk,
    input wr_en,
    input [$clog2(DEPTH)-1:0] wr_addr,
    input [$clog2(DEPTH)-1:0] rd_addr,
    input [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout
);

    reg [WIDTH-1:0] mem [DEPTH];

    always @(posedge clk)
        begin
            if(wr_en)
                mem[wr_addr] <= din;
            dout <= mem[rd_addr];
        end

endmodule