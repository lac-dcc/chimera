/*
 * simple dual ported register file
 *
 * (C) Arlet Ottens <arlet@c-scape.nl>
 */
module regfile(
    input clk,
    input rdy,
    input [6:0] op,
    input [7:0] DI,
    output [7:0] DO );

reg [7:0] regs[31:0];                   // register file

initial begin
    regs[0]  = 2;                       // X register 
    regs[1]  = 3;                       // Y register 
    regs[2]  = 8'h41;                   // A register
    regs[3]  = 8'hff;                   // S register
    regs[4]  = 8'h00;                   // always zero
    regs[5]  = 8'h01;                   // always zero 
    regs[6]  = 8'hff;                   // for DEC
    regs[7]  = 8'h00;                   // Z register, always zero
    regs[8]  = 8'hf9;                   // NMI - 1
    regs[9]  = 8'hfb;                   // RST - 1
    regs[10] = 8'hfd;                   // BRK - 1
end

`ifdef SIM
wire [7:0] X = regs[0];
wire [7:0] Y = regs[1];
wire [7:0] A = regs[2];
wire [7:0] S = regs[3];
`endif

wire [4:0] reg_wr = {3'b000, op[5:4] }; 
wire [4:0] reg_rd = {1'b0,   op[3:0] };
assign DO = regs[reg_rd]; 
wire we = op[6];

/*
 * write register file. New data for any of the 
 * registers always comes from the ALU output.
 */
always @(posedge clk)
    if( we & rdy )
        regs[reg_wr] <= DI;

endmodule
