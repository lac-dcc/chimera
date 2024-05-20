// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Behavioural Modelling for 1:4 DeMux

module deMux_1_to_4_beh(I, S1, S0, Y);
input I; input S1, S0;
output [3:0]Y; reg [3:0]Y;
always @ (I or S1 or S0)
begin
case({S1, S0})
2'b00 : begin Y[0] = 1; Y[1] = 0; Y[2] = 0; Y[3] = 0; end
2'b01 : begin Y[0] = 0; Y[1] = 1; Y[2] = 0; Y[3] = 0; end
2'b10 : begin Y[0] = 0; Y[1] = 0; Y[2] = 1; Y[3] = 0; end
2'b11 : begin Y[0] = 0; Y[1] = 0; Y[2] = 0; Y[3] = 1; end
endcase
end
endmodule