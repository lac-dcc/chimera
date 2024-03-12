`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:20 10/26/2020 
// Design Name: 
// Module Name:    ext 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module ext(
    input [15:0] imm,
    input [1:0] EOp,
    output reg [31:0] ext
    );
always@(*) begin
	case(EOp)
		2'b00 : begin	// signed extend to 32 digits
			if(imm[15]==1) begin
				ext <= {16'hffff,imm};
			end
			else begin
				ext <= {16'h0000,imm};
			end
		end
		2'b01 : begin
			ext <= {16'h0000,imm};
		end
		2'b10 : begin
			ext <= {imm, 16'h0000};
		end
		2'b11 : begin
			if(imm[15]==1) begin
				ext <= {16'hffff,imm}>>2;
			end
			else begin
				ext <= {16'h0000,imm}>>2;
			end
		end
	endcase
end

endmodule
