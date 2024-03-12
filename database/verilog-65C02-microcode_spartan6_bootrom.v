module bootrom(
    input clk,
    input [10:0] addr,
    output [7:0] data );

wire [7:0] DO;
wire DOP;

assign data = DO;

RAMB16BWER #(.DATA_WIDTH_A(9)) rom(
    .CLKA(clk),
    .DIA(9'b0),
    .DIPA(1'b0),
    .ENA(1'b1),
    .RSTA(1'b0),
    .WEA(1'b0),
    .ADDRA(addr),
    .DOA(DO),
    .DOPA(DOP) );

endmodule
