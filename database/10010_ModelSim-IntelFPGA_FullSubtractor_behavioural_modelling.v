// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//behavioural modelling for Full Subtractor

module exp_beh(diff, borr, A, B, C);
input A, B, C; output diff, borr;
reg diff, borr;
always @ (A or B or C)
begin
case ({A, B, C})
3'b000 : begin diff = 0; borr = 0; end
3'b001 : begin diff = 1; borr = 1; end
3'b010 : begin diff = 1; borr = 1; end
3'b011 : begin diff = 0; borr = 1; end
3'b100 : begin diff = 1; borr = 0; end
3'b101 : begin diff = 0; borr = 0; end
3'b110 : begin diff = 0; borr = 0; end
3'b111 : begin diff = 1; borr = 1; end
endcase
end
endmodule