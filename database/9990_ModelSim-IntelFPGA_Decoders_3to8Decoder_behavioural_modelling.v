// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Behavioural Modelling for 3 to 8 Decoder

module decoder_3_to_8_beh(A, B, C, Y);
input A, B, C; output [7:0]Y; reg [7:0]Y;
always @ (A or B or C)
begin
case({A, B, C})
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