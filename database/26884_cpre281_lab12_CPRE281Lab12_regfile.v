// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module regfile(DATAP3, DATAP2, DATAP1, DATAP0, DATAQ3, DATAQ2, DATAQ1, DATAQ0, RP2, RP1, RP0, RQ2, RQ1, RQ0, WA2, WA1, WA0, LD_DATA, WR, CLRN, CLK);
//address and control ports
input RP2, RP1, RP0, RQ2, RQ1, RQ0, WA2, WA1, WA0, WR, CLRN, CLK;

//input data port
input [3:0] LD_DATA;

//output data ports
output DATAP3, DATAP2, DATAP1, DATAP0, DATAQ3, DATAQ2, DATAQ1, DATAQ0;

//wire declarations
wire [3:0] DATAP, DATAQ;
wire [3:0] R0, R1, R2, R3, R4, R5, R6, R7;
wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

registerrr my_reg0(.IN(LD_DATA), .Load(Y0), .Clk(CLK), .OUT(R0), .CLear(CLRN));
registerrr my_reg1(.IN(LD_DATA), .Load(Y1), .Clk(CLK), .OUT(R1), .Clear(CLRN));
registerrr my_reg2(.IN(LD_DATA), .Load(Y2), .Clk(CLK), .OUT(R2), .Clear(CLRN));
registerrr my_reg3(.IN(LD_DATA), .Load(Y3), .Clk(CLK), .OUT(R3), .Clear(CLRN));
registerrr my_reg4(.IN(LD_DATA), .Load(Y4), .Clk(CLK), .OUT(R4), .Clear(CLRN));
registerrr my_reg5(.IN(LD_DATA), .Load(Y5), .Clk(CLK), .OUT(R5), .Clear(CLRN));
registerrr my_reg6(.IN(LD_DATA), .Load(Y6), .Clk(CLK), .OUT(R6), .Clear(CLRN));
registerrr my_reg7(.IN(LD_DATA), .Load(Y7), .Clk(CLK), .OUT(R7), .Clear(CLRN));

Decoder3to8 my_decoder(.EN(WR), .W2(WA2), .W1(WA1), .W0(WA0), .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .Y4(Y4), .Y5(Y5), .Y6(Y6), .Y7(Y7));

assign DATAP3 = DATAP [3];
assign DATAP2 = DATAP [2];
assign DATAP1 = DATAP [1];
assign DATAP0 = DATAP [0];

Mux8_4b my_muxP(.S2(RP2), .S1(RP1), .S0(RP0), .W0(R0), .W1(R1), .W2(R2), .W3(R3), .W4(R4), .W5(R5), .W6(R6), .W7(R7), .F(DATAP));

assign DATAQ3 = DATAQ [3];
assign DATAQ2 = DATAQ [2];
assign DATAQ1 = DATAQ [1];
assign DATAQ0 = DATAQ [0];

Mux8_4b my_muxQ(.S2(RQ2), .S1(RQ1), .S0(RQ0), .W0(R0), .W1(R1), .W2(R2), .W3(R3), .W4(R4), .W5(R5), .W6(R6), .W7(R7), .F(DATAQ));

endmodule

