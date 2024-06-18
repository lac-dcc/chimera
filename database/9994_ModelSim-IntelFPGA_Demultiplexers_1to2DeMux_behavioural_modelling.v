// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Behavioural Modelling for 1:2 DeMux

module deMux_1_to_2_beh(I, S, Y0, Y1);
input I; input S;
output Y0, Y1; reg Y0, Y1;
always @ (I or S)
begin
case(S)
1'b0 : begin Y0 = I; Y1 = 0; end
1'b1 : begin Y1 = I; Y0 = 0; end
endcase
end
endmodule