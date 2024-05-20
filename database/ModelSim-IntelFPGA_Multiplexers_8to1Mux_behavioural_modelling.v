// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Behavioural Modelling for 8:1 Mux

module mux_8_to_1_beh(Y, I, S2, S1, S0);
input [7:0]I; input S2, S1, S0; output Y; reg Y;
always @ (I or S2 or S1 or S0)
begin
case ({S2, S1, S0})
3'b000 : begin Y = I[0]; end
3'b001 : begin Y = I[1]; end
3'b010 : begin Y = I[2]; end
3'b011 : begin Y = I[3]; end
3'b100 : begin Y = I[4]; end
3'b101 : begin Y = I[5]; end
3'b110 : begin Y = I[6]; end
3'b111 : begin Y = I[7]; end
endcase
end
endmodule