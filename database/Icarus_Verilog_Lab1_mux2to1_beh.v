module mux2to1_beh(f,a,b,s);

	input a,b,s;
	output f;
	reg f;
	
	always@ (s or a or b)
		if(s == 1)
			f = a;
		else
			f = b;

endmodule