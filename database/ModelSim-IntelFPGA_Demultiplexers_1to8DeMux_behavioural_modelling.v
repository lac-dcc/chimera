// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Behavioural Modelling for 1:8 DeMux

module deMux_1_to_8_beh(I, S2, S1, S0, Y);
input I; input S2, S1, S0; output [7:0]Y; reg [7:0]Y;
always @ (I or S2 or S1 or S0)
begin
case({S2, S1, S0})
3'b000 : begin Y[0] = 1; Y[1] = 0; Y[2] = 0; Y[3] = 0; Y[4] = 0; Y[5] = 0; Y[6] = 0; Y[7] = 0; end
3'b001 : begin Y[0] = 0; Y[1] = 1; Y[2] = 0; Y[3] = 0; Y[4] = 0; Y[5] = 0; Y[6] = 0; Y[7] = 0; end
3'b010 : begin Y[0] = 0; Y[1] = 0; Y[2] = 1; Y[3] = 0; Y[4] = 0; Y[5] = 0; Y[6] = 0; Y[7] = 0; end
3'b011 : begin Y[0] = 0; Y[1] = 0; Y[2] = 0; Y[3] = 1; Y[4] = 0; Y[5] = 0; Y[6] = 0; Y[7] = 0; end
3'b100 : begin Y[0] = 0; Y[1] = 0; Y[2] = 0; Y[3] = 0; Y[4] = 1; Y[5] = 0; Y[6] = 0; Y[7] = 0; end
3'b101 : begin Y[0] = 0; Y[1] = 0; Y[2] = 0; Y[3] = 0; Y[4] = 0; Y[5] = 1; Y[6] = 0; Y[7] = 0; end
3'b110 : begin Y[0] = 0; Y[1] = 0; Y[2] = 0; Y[3] = 0; Y[4] = 0; Y[5] = 0; Y[6] = 1; Y[7] = 0; end
3'b111 : begin Y[0] = 0; Y[1] = 0; Y[2] = 0; Y[3] = 0; Y[4] = 0; Y[5] = 0; Y[6] = 0; Y[7] = 1; end
endcase
end
endmodule