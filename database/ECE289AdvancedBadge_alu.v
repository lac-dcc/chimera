// This program was cloned from: https://github.com/ochsnega/ECE289AdvancedBadge
// License: MIT License

module alu(
	input [31:0] l_in,
	input [31:0] r_in,
	input [4:0] control,
	output reg [31:0] result
);

reg signed [31:0] l_in_signed;
reg signed [31:0] r_in_signed;

always@(*)
begin
	l_in_signed = l_in;
	r_in_signed = r_in;
end

always@(*)
begin
	case (control)
		5'd0: result = l_in + r_in; // Addition
		5'd1: result = l_in - r_in; // Subtraction
		5'd2: result = l_in & r_in; // Bitwise AND
		5'd3: result = l_in | r_in; // Bitwise OR
		5'd4: result = l_in ^ r_in; // Bitwise XOR
		5'd5: // Signed less than
		begin
			case ({l_in[31], r_in[31]})
				2'b00: 
				begin
					if (l_in < r_in)
						result = l_in;
					else
						result = r_in;
				end
				2'b01: result = r_in;
				2'b10: result = l_in;
				2'b11:
				begin
					if (l_in < r_in)
						result = r_in;
					else
						result = l_in;
				end
			endcase
		end
		5'd6: // Unsigned less than
		begin
			if (l_in < r_in)
				result = l_in;
			else
				result = r_in;
		end
		5'd7: // Shift right (sign extend)
		begin
			case (r_in[4:0])
				5'd0: result = l_in;
				5'd1: result = {l_in[31], l_in[31:1]};
				5'd2: result = {{2{l_in[31]}}, l_in[31:2]};
				5'd3: result = {l_in[31], l_in[31], l_in[31], l_in[31:3]};
				5'd4: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:4]};
				5'd5: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:5]};
				5'd6: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:6]};
				5'd7: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:7]};
				5'd8: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:8]};
				5'd9: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:9]};
				5'd10: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:10]};
				5'd11: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:11]};
				5'd12: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:12]};
				5'd13: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:13]};
				5'd14: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:14]};
				5'd15: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:15]};
				5'd16: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:16]};
				5'd17: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:17]};
				5'd18: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:18]};
				5'd19: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:19]};
				5'd20: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:20]};
				5'd21: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:21]};
				5'd22: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:22]};
				5'd23: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:23]};
				5'd24: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:24]};
				5'd25: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:25]};
				5'd26: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:26]};
				5'd27: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:27]};
				5'd28: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:28]};
				5'd29: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:29]};
				5'd30: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31:30]};
				5'd31: result = {l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31], l_in[31]};
			endcase
		end
		5'd8: // Shift right (append zeros)
		begin
			case (r_in[4:0])
				5'd0: result = l_in;
				5'd1: result = {1'd0, l_in[31:1]};
				5'd2: result = {2'd0, l_in[31:2]};
				5'd3: result = {3'd0, l_in[31:3]};
				5'd4: result = {4'd0, l_in[31:4]};
				5'd5: result = {5'd0, l_in[31:5]};
				5'd6: result = {6'd0, l_in[31:6]};
				5'd7: result = {7'd0, l_in[31:7]};
				5'd8: result = {8'd0, l_in[31:8]};
				5'd9: result = {9'd0, l_in[31:9]};
				5'd10: result = {10'd0, l_in[31:10]};
				5'd11: result = {11'd0, l_in[31:11]};
				5'd12: result = {12'd0, l_in[31:12]};
				5'd13: result = {13'd0, l_in[31:13]};
				5'd14: result = {14'd0, l_in[31:14]};
				5'd15: result = {15'd0, l_in[31:15]};
				5'd16: result = {16'd0, l_in[31:16]};
				5'd17: result = {17'd0, l_in[31:17]};
				5'd18: result = {18'd0, l_in[31:18]};
				5'd19: result = {19'd0, l_in[31:19]};
				5'd20: result = {20'd0, l_in[31:20]};
				5'd21: result = {21'd0, l_in[31:21]};
				5'd22: result = {22'd0, l_in[31:22]};
				5'd23: result = {23'd0, l_in[31:23]};
				5'd24: result = {24'd0, l_in[31:24]};
				5'd25: result = {25'd0, l_in[31:25]};
				5'd26: result = {26'd0, l_in[31:26]};
				5'd27: result = {27'd0, l_in[31:27]};
				5'd28: result = {28'd0, l_in[31:28]};
				5'd29: result = {29'd0, l_in[31:29]};
				5'd30: result = {30'd0, l_in[31:30]};
				5'd31: result = {31'd0, l_in[31]};
			endcase
		end
		5'd9: // Shift left (append zeros)
		begin
			case (r_in[4:0])
				5'd0: result = l_in;
				5'd1: result = {l_in[30:0], 1'd0};
				5'd2: result = {l_in[29:0], 2'd0};
				5'd3: result = {l_in[28:0], 3'd0};
				5'd4: result = {l_in[27:0], 4'd0};
				5'd5: result = {l_in[26:0], 5'd0};
				5'd6: result = {l_in[25:0], 6'd0};
				5'd7: result = {l_in[24:0], 7'd0};
				5'd8: result = {l_in[23:0], 8'd0};
				5'd9: result = {l_in[22:0], 9'd0};
				5'd10: result = {l_in[21:0], 10'd0};
				5'd11: result = {l_in[20:0], 11'd0};
				5'd12: result = {l_in[19:0], 12'd0};
				5'd13: result = {l_in[18:0], 13'd0};
				5'd14: result = {l_in[17:0], 14'd0};
				5'd15: result = {l_in[16:0], 15'd0};
				5'd16: result = {l_in[15:0], 16'd0};
				5'd17: result = {l_in[14:0], 17'd0};
				5'd18: result = {l_in[13:0], 18'd0};
				5'd19: result = {l_in[12:0], 19'd0};
				5'd20: result = {l_in[11:0], 20'd0};
				5'd21: result = {l_in[10:0], 21'd0};
				5'd22: result = {l_in[9:0], 22'd0};
				5'd23: result = {l_in[8:0], 23'd0};
				5'd24: result = {l_in[7:0], 24'd0};
				5'd25: result = {l_in[6:0], 25'd0};
				5'd26: result = {l_in[5:0], 26'd0};
				5'd27: result = {l_in[4:0], 27'd0};
				5'd28: result = {l_in[3:0], 28'd0};
				5'd29: result = {l_in[2:0], 29'd0};
				5'd30: result = {l_in[1:0], 30'd0};
				5'd31: result = {l_in[0], 31'd0};
			endcase
		end
		5'd10: result = l_in_signed * r_in_signed; // Signed multiplication
		5'd11: result = {r_in[19:0], 12'b0}; // Load constant into upper bits of a word
		5'd12: // Check equal
		begin
			result[31:1] = 31'b0;
			if (l_in == r_in)
				result[0] = 1'b1;
			else
				result[0] = 1'b0;
		end
		5'd13: // Check not equal
		begin
			result[31:1] = 31'b0;
			if (l_in == r_in)
				result[0] = 1'b0;
			else
				result[0] = 1'b1;
		end
		5'd14: // Check signed less than
		begin
			result[31:1] = 31'b0;
			case ({l_in[31], r_in[31]})
				2'b00: 
				begin
					if (l_in < r_in)
						result[0] = 1'b1;
					else
						result[0] = 1'b0;
				end
				2'b01: result[0] = 1'b0;
				2'b10: result[0] = 1'b1;
				2'b11:
				begin
					if (l_in < r_in)
						result[0] = 1'b0;
					else
						result[0] = 1'b1;
				end
			endcase
		end
		5'd15: // Check signed greater than or equal
		begin
			result[31:1] = 31'b0;
			case ({l_in[31], r_in[31]})
				2'b00: 
				begin
					if (l_in < r_in)
						result[0] = 1'b0;
					else
						result[0] = 1'b1;
				end
				2'b01: result[0] = 1'b1;
				2'b10: result[0] = 1'b0;
				2'b11:
				begin
					if (l_in < r_in)
						result[0] = 1'b1;
					else
						result[0] = 1'b0;
				end
			endcase
		end
		5'd16: // Check unsigned less than
		begin
			result[31:1] = 31'b0;
			if (l_in < r_in)
				result[0] = 1'b1;
			else
				result[0] = 1'b0;
		end
		5'd17: // Check unsigned greater than or equal
		begin
			result[31:1] = 31'b0;
			if (l_in < r_in)
				result[0] = 1'b0;
			else
				result[0] = 1'b1;
		end
		default: result = 32'd0;
	endcase
end

endmodule 
