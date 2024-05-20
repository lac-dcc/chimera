// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Behavioural Modeling for 2 to 4 Decoder

module decoder_2_to_4_beh(A, B, Y0, Y1, Y2, Y3);
input A, B; output Y0, Y1, Y2, Y3; reg Y0, Y1, Y2, Y3;
always @ (A or B)
begin
case ({A, B})
2'b00 : begin Y0 = 1; Y1 = 0; Y2 = 0; Y3 = 0; end
2'b01 : begin Y0 = 0; Y1 = 1; Y2 = 0; Y3 = 0; end
2'b10 : begin Y0 = 0; Y1 = 0; Y2 = 1; Y3 = 0; end
2'b11 : begin Y0 = 0; Y1 = 0; Y2 = 0; Y3 = 1; end
endcase
end
endmodule