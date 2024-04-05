generate
if(peId == 0 ) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000000;
			10'd1 : rdata = 16'b0000000000000001;
			10'd2 : rdata = 16'b0000000000000010;
			10'd3 : rdata = 16'b0000000000000011;
			10'd4 : rdata = 16'b0000000000000100;
			10'd5 : rdata = 16'b0000000000000101;
			10'd6 : rdata = 16'b0000000000000110;
			10'd7 : rdata = 16'b0000000000000111;
			10'd8 : rdata = 16'b0000000000001000;
			10'd9 : rdata = 16'b0000000000001001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end
else if(peId == 1 ) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000000;
			10'd1 : rdata = 16'b0000000000000001;
			10'd2 : rdata = 16'b0000000000000010;
			10'd3 : rdata = 16'b0000000000000011;
			10'd4 : rdata = 16'b0000000000000100;
			10'd5 : rdata = 16'b0000000000000101;
			10'd6 : rdata = 16'b0000000000000110;
			10'd7 : rdata = 16'b0000000000000111;
			10'd8 : rdata = 16'b0000000000001000;
			10'd9 : rdata = 16'b0000000000001001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end
else if(peId == 2 ) begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000000;
			10'd1 : rdata = 16'b0000000000000001;
			10'd2 : rdata = 16'b0000000000000010;
			10'd3 : rdata = 16'b0000000000000011;
			10'd4 : rdata = 16'b0000000000000100;
			10'd5 : rdata = 16'b0000000000000101;
			10'd6 : rdata = 16'b0000000000000110;
			10'd7 : rdata = 16'b0000000000000111;
			10'd8 : rdata = 16'b0000000000001000;
			10'd9 : rdata = 16'b0000000000001001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end
else begin
	always @(*) begin
		case(address)
			10'd0 : rdata = 16'b0000000000000000;
			10'd1 : rdata = 16'b0000000000000001;
			10'd2 : rdata = 16'b0000000000000010;
			10'd3 : rdata = 16'b0000000000000011;
			10'd4 : rdata = 16'b0000000000000100;
			10'd5 : rdata = 16'b0000000000000101;
			10'd6 : rdata = 16'b0000000000000110;
			10'd7 : rdata = 16'b0000000000000111;
			10'd8 : rdata = 16'b0000000000001000;
			10'd9 : rdata = 16'b0000000000001001;
			default : rdata = 16'b0000000000000000;
		endcase
	end
end
endgenerate
