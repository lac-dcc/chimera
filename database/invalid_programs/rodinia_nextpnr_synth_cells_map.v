module \$lut (A, Y);
	parameter WIDTH = 0;
	parameter LUT = 0;
	input [WIDTH-1:0] A;
	output Y;

   generate
	if (WIDTH == 1) begin
		LUT #(.K(`LUT_K), .INIT({8{LUT}})) _TECHMAP_REPLACE_ (.I({1'b1, 1'b1, 1'b1, A[0]}), .Q(Y));
	end else
		if (WIDTH == 2) begin
			LUT #(.K(`LUT_K), .INIT({4{LUT}})) _TECHMAP_REPLACE_ (.I({1'b1, 1'b1, A[1], A[0]}), .Q(Y));
		end else
			if(WIDTH == 3) begin
				LUT #(.K(`LUT_K), .INIT({2{LUT}})) _TECHMAP_REPLACE_ (.I({1'b1, A[2], A[1], A[0]}), .Q(Y));
			end else
				if(WIDTH == 4) begin
					LUT #(.K(`LUT_K), .INIT(LUT)) _TECHMAP_REPLACE_ (.I(A), .Q(Y));
				end 
    endgenerate
endmodule

module  \$_DFF_P_ (input D, C, output Q); DFF  _TECHMAP_REPLACE_ (.D(D), .Q(Q), .CLK(C)); endmodule
