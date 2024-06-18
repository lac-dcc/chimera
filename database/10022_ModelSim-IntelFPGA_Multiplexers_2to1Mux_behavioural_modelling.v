// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Behavioural Modelling for 2:1 Mux

module mux_2_to_1_beh(Y, I0, I1, S);
output Y; reg Y; input I0, I1; input S;
always @ (I0 or I1 or S)
begin
case ({S})
1'b0 : begin Y = I0; end
1'b1 : begin Y = I1; end
endcase
end
endmodule