// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module registerfile(DATAP3, DATAP2, DATAP1, DATAP0, DATAQ3, DATAQ2, DATAQ1, DATAQ0, RP1, RP0, RQ1, RQ0, WA2, WA1, WA0, LD_DATA, WR, CLRN, CLK);

//address and control ports
input RP1, RP0, RQ1, RQ0, WA2, WA1, WA0, WR, CLRN, CLK;

//input data port
input [3:0] LD_DATA;

//output data ports
output DATAP3, DATAP2, DATAP1, DATAP0, DATAQ3, DATAQ2, DATAQ1, DATAQ0;

//wire declarations
wire [3:0] DATAP, DATAQ;
wire [3:0] R0, R1, R2, R3;
wire [3:0] Y0, Y1, Y2, Y3;

Decoder2to4 my_decoder(.En(WR), .W2(WA2), .W1(WA1), .W0(WA0), .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3));

assign DATAP3 = DATAP [3];
assign DATAP2 = DATAP [2];
assign DATAP1 = DATAP [1];
assign DATAP0 = DATAP [0];

registerrr my_reg0(.IN(LD_DATA), .Load(Y0), .Clk(CLK), .OUT(R0), .CLear(CLRN));
registerrr my_reg1(.IN(LD_DATA), .Load(Y1), .Clk(CLK), .OUT(R1), .Clear(CLRN));
registerrr my_reg2(.IN(LD_DATA), .Load(Y2), .Clk(CLK), .OUT(R2), .Clear(CLRN));
registerrr my_reg3(.IN(LD_DATA), .Load(Y3), .Clk(CLK), .OUT(R3), .Clear(CLRN));


mux4to1 my_muxP(.S1(RP1), .S0(RP0), .W0(Y0), .W1(Y1), .W2(Y2), .W3(Y3), .F(DATAP));

assign DATAQ3 = DATAQ [3];
assign DATAQ2 = DATAQ [2];
assign DATAQ1 = DATAQ [1];
assign DATAQ0 = DATAQ [0];

mux4to1 my_muxQ(.S1(RQ1), .S0(RQ0), .W0(R0), .W1(R1), .W2(R2), .W3(R3), .F(DATAQ));

endmodule

