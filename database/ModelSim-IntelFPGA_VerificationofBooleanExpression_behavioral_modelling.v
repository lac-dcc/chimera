// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//to verify the Boolean Expression, Y = AB + BC + CA using Behavioral Modelling

module exp_beh(Y, A, B, C);
input A, B, C; output Y;
reg Y;
always @ (A or B or C)
begin
case ({A, B, C})
3'b000 : begin Y = 0; end
3'b001 : begin Y = 0; end
3'b010 : begin Y = 0; end
3'b011 : begin Y = 1; end
3'b100 : begin Y = 0; end
3'b101 : begin Y = 1; end
3'b110 : begin Y = 1; end
3'b111 : begin Y = 1; end
endcase
end
endmodule