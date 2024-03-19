module mux2to1_df(f,a,b,s);
	input a,b,s;
	output f;
	
	assign f = s ? a : b;
	//Also we can write f = ((s&a)|((~s&a)))
endmodule