module pcmb_tables(
		input [3:0] TABLE_B1_ADDR,
		output reg [4:0] TABLE_B1_OUT,
		input [2:0] TABLE_B2_ADDR,		// 3:0 but 2x repeat
		output reg [7:0] TABLE_B2_OUT
	);
	
	// Todo: Could be made in combi
	// Out = ((In & 7) << 1) | 1, neg if In[3]
	always @(TABLE_B1_ADDR)
	begin
		case (TABLE_B1_ADDR)
			4'h0 : TABLE_B1_OUT <= 5'd1;
			4'h1 : TABLE_B1_OUT <= 5'd3;
			4'h2 : TABLE_B1_OUT <= 5'd5;
			4'h3 : TABLE_B1_OUT <= 5'd7;
			4'h4 : TABLE_B1_OUT <= 5'd9;
			4'h5 : TABLE_B1_OUT <= 5'd11;
			4'h6 : TABLE_B1_OUT <= 5'd13;
			4'h7 : TABLE_B1_OUT <= 5'd15;
			4'h8 : TABLE_B1_OUT <= -5'd1;
			4'h9 : TABLE_B1_OUT <= -5'd3;
			4'hA : TABLE_B1_OUT <= -5'd5;
			4'hB : TABLE_B1_OUT <= -5'd7;
			4'hC : TABLE_B1_OUT <= -5'd9;
			4'hD : TABLE_B1_OUT <= -5'd11;
			4'hE : TABLE_B1_OUT <= -5'd13;
			4'hF : TABLE_B1_OUT <= -5'd15;
		endcase
	end
	
	always @(TABLE_B2_ADDR)
	begin
		case (TABLE_B2_ADDR)
			3'h0 : TABLE_B2_OUT <= 8'd57;		// Todo: Reduce
			3'h1 : TABLE_B2_OUT <= 8'd57;
			3'h2 : TABLE_B2_OUT <= 8'd57;
			3'h3 : TABLE_B2_OUT <= 8'd57;
			3'h4 : TABLE_B2_OUT <= 8'd77;
			3'h5 : TABLE_B2_OUT <= 8'd102;
			3'h6 : TABLE_B2_OUT <= 8'd128;
			3'h7 : TABLE_B2_OUT <= 8'd153;
		endcase
	end
	
endmodule
