// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Behavioural Modelling for 4:1 Mux

module mux_4_to_1_beh(Y, I0, I1, I2, I3, S1, S0);
output Y; input I0, I1, I2, I3; input S1, S0; reg Y;
always @ (I0, I1, I2, I3, S1, S0)
begin
case ({S1, S0})
2'b00 : begin Y = I0; end
2'b01 : begin Y = I1; end
2'b10 : begin Y = I2; end
2'b11 : begin Y = I3; end
endcase
end
endmodule