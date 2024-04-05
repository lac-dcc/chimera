`timescale 1ns/1ps
`include "ALU.v"
`include "PC.v"
`include "IC.v"
`include "register8.v"
`include "register4.v"
`include "tristateBuff.v"
`include "triBuff4.v"
`include "RAM.v"
`include "bcd2disp.v"


module CPU(input clkin, output [7:0] OutPut, output [6:0] LED1, output [6:0] LED2);
wire [7:0] bus;
wire [3:0] MemAddr;
wire [7:0] Aout;
wire [7:0] Bout;
wire [7:0] Instout;
wire [3:0] Pcount;
wire [3:0] Addr_in;
wire [7:0] Dispout;
wire [7:0] aluOut;
wire HLT, MI, RI, RO, IO, II, AI, AO, SO, SU, BI, OI, CE, CO, J;
wire PCrst, flag;


assign clk = (clkin & ~HLT);


register8 A(.clk(clk), .D(bus), .Q(Aout), .EI(AI));
tristateBuff triA(.data(Aout), .dataOut(bus), .enable(AO));

register8 B(.clk(clk), .D(bus), .Q(Bout), .EI(BI));

register8 InstReg(.clk(clk), .D(bus), .Q(Instout), .EI(II));
triBuff4 triInstReg(.data(Instout[3:0]), .dataOut(bus[3:0]), .enable(IO));

ALU alu(.A(Aout), .B(Bout), .op(SU), .res({flag,aluOut}));
tristateBuff tri_alu(.data(aluOut), .enable(SO), .dataOut(bus));


PC pc(.clk(clk), .rst(1'b0), .enable(CE), .jmp(J), .jmploc(bus[3:0]), .count(Pcount));
triBuff4 tripc(.data(Pcount), .dataOut(bus[3:0]), .enable(CO));


register4 MemAdd(.clk(clk), .D(bus[3:0]), .Q(Addr_in), .EI(MI));

RAM ram(.clk(~clk), .address(Addr_in), .write_enable(RI), .read_enable(RO), .data(bus));


IC ic(.clk(clk), .enable(1'b1), .Instruction(Instout[7:4]), .ctrl_wrd({HLT, MI, RI, RO, IO, II, AI, AO, SO, SU, BI, OI, CE, CO, J}));


register8 O(.clk(clk), .D(bus), .Q(OutPut), .EI(OI));


bcd2sevenseg seg0(.bcd(OutPut[3:0]), .seg(LED1));
bcd2sevenseg seg1(.bcd(OutPut[7:4]), .seg(LED2));

endmodule