// This program was cloned from: https://github.com/shuji-oh/PLI_TDC_for_CAN
// License: MIT License

module out_hex(
	input CLK,
	input [11:0] data1,
	input [20:0] data2,
	output reg [6:0] HEX_5,
	output reg [6:0] HEX_4,
	output reg [6:0] HEX_3,
	output reg [6:0] HEX_2,
	output reg [6:0] HEX_1,
	output reg [6:0] HEX_0
);

always @(posedge CLK) begin
	case (data1[11:8])
		4'h0: HEX_5 = 7'b1000000;
		4'h1: HEX_5 = 7'b1111001;
		4'h2: HEX_5 = 7'b0100100;
		4'h3: HEX_5 = 7'b0110000;
		4'h4: HEX_5 = 7'b0011001;
		4'h5: HEX_5 = 7'b0010010;
		4'h6: HEX_5 = 7'b0000010;
		4'h7: HEX_5 = 7'b1011000;
		4'h8: HEX_5 = 7'b0000000;
		4'h9: HEX_5 = 7'b0010000;
		4'hA: HEX_5 = 7'b0001000;
		4'hB: HEX_5 = 7'b0000011;
		4'hC: HEX_5 = 7'b1000110;
		4'hD: HEX_5 = 7'b0100001;
		4'hE: HEX_5 = 7'b0000110;
		4'hF: HEX_5 = 7'b0001110;
		default:HEX_5 = 7'b1000000;
    endcase
end

always @(posedge CLK) begin
	case (data1[7:4])
		4'h0: HEX_4 = 7'b1000000;
		4'h1: HEX_4 = 7'b1111001;
		4'h2: HEX_4 = 7'b0100100;
		4'h3: HEX_4 = 7'b0110000;
		4'h4: HEX_4 = 7'b0011001;
		4'h5: HEX_4 = 7'b0010010;
		4'h6: HEX_4 = 7'b0000010;
		4'h7: HEX_4 = 7'b1011000;
		4'h8: HEX_4 = 7'b0000000;
		4'h9: HEX_4 = 7'b0010000;
		4'hA: HEX_4 = 7'b0001000;
		4'hB: HEX_4 = 7'b0000011;
		4'hC: HEX_4 = 7'b1000110;
		4'hD: HEX_4 = 7'b0100001;
		4'hE: HEX_4 = 7'b0000110;
		4'hF: HEX_4 = 7'b0001110;
		default:HEX_4 = 7'b1000000;
	endcase
end
	
always @(posedge CLK) begin
	case (data1[3:0])
		4'h0: HEX_3 = 7'b1000000;
		4'h1: HEX_3 = 7'b1111001;
		4'h2: HEX_3 = 7'b0100100;
		4'h3: HEX_3 = 7'b0110000;
		4'h4: HEX_3 = 7'b0011001;
		4'h5: HEX_3 = 7'b0010010;
		4'h6: HEX_3 = 7'b0000010;
		4'h7: HEX_3 = 7'b1011000;
		4'h8: HEX_3 = 7'b0000000;
		4'h9: HEX_3 = 7'b0010000;
		4'hA: HEX_3 = 7'b0001000;
		4'hB: HEX_3 = 7'b0000011;
		4'hC: HEX_3 = 7'b1000110;
		4'hD: HEX_3 = 7'b0100001;
		4'hE: HEX_3 = 7'b0000110;
		4'hF: HEX_3 = 7'b0001110;
		default:HEX_3 = 7'b1000000;
	endcase
end

always @(posedge CLK) begin
	case (data2[11:8])
		4'h0: HEX_2 = 7'b1000000;
		4'h1: HEX_2 = 7'b1111001;
		4'h2: HEX_2 = 7'b0100100;
		4'h3: HEX_2 = 7'b0110000;
		4'h4: HEX_2 = 7'b0011001;
		4'h5: HEX_2 = 7'b0010010;
		4'h6: HEX_2 = 7'b0000010;
		4'h7: HEX_2 = 7'b1011000;
		4'h8: HEX_2 = 7'b0000000;
		4'h9: HEX_2 = 7'b0010000;
		4'hA: HEX_2 = 7'b0001000;
		4'hB: HEX_2 = 7'b0000011;
		4'hC: HEX_2 = 7'b1000110;
		4'hD: HEX_2 = 7'b0100001;
		4'hE: HEX_2 = 7'b0000110;
		4'hF: HEX_2 = 7'b0001110;
		default:HEX_2 = 7'b1000000;
    endcase
end

always @(posedge CLK) begin
	case (data2[7:4])
		4'h0: HEX_1 = 7'b1000000;
		4'h1: HEX_1 = 7'b1111001;
		4'h2: HEX_1 = 7'b0100100;
		4'h3: HEX_1 = 7'b0110000;
		4'h4: HEX_1 = 7'b0011001;
		4'h5: HEX_1 = 7'b0010010;
		4'h6: HEX_1 = 7'b0000010;
		4'h7: HEX_1 = 7'b1011000;
		4'h8: HEX_1 = 7'b0000000;
		4'h9: HEX_1 = 7'b0010000;
		4'hA: HEX_1 = 7'b0001000;
		4'hB: HEX_1 = 7'b0000011;
		4'hC: HEX_1 = 7'b1000110;
		4'hD: HEX_1 = 7'b0100001;
		4'hE: HEX_1 = 7'b0000110;
		4'hF: HEX_1 = 7'b0001110;
		default:HEX_1 = 7'b1000000;
	endcase
end
	
always @(posedge CLK) begin
	case (data2[3:0])
		4'h0: HEX_0 = 7'b1000000;
		4'h1: HEX_0 = 7'b1111001;
		4'h2: HEX_0 = 7'b0100100;
		4'h3: HEX_0 = 7'b0110000;
		4'h4: HEX_0 = 7'b0011001;
		4'h5: HEX_0 = 7'b0010010;
		4'h6: HEX_0 = 7'b0000010;
		4'h7: HEX_0 = 7'b1011000;
		4'h8: HEX_0 = 7'b0000000;
		4'h9: HEX_0 = 7'b0010000;
		4'hA: HEX_0 = 7'b0001000;
		4'hB: HEX_0 = 7'b0000011;
		4'hC: HEX_0 = 7'b1000110;
		4'hD: HEX_0 = 7'b0100001;
		4'hE: HEX_0 = 7'b0000110;
		4'hF: HEX_0 = 7'b0001110;
		default:HEX_0 = 7'b1000000;
	endcase
end

endmodule
