module microcode(
    input clk,
    input enable,
    input reset,
    input [8:0] addr,
    output [31:0] data );

wire [31:0] DO;
wire [3:0] DOP;

assign data = DO[31:0];

RAMB16BWER #(.DATA_WIDTH_A(36),
             .INIT_A (36'b0000_000_00000_01_000_0000_00000_00_01110000),    // jump to 170 (reset)
             .SRVAL_A(36'b0000_000_00000_01_000_0000_00000_00_01110000))    // jump to 170 (reset)
rom(
    .CLKA(clk),
    .DIA(32'b0),
    .DIPA(4'b0),
    .ENA(enable),
    .RSTA(reset),
    .WEA(1'b0),
    .ADDRA({addr,5'b0}),
    .DOA(DO),
    .DOPA(DOP) );

`include "microcode_init.v"

endmodule
