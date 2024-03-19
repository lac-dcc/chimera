module mux2to1_gate(a,b,s,f);
	input a,b,s;
	output f;
	
	wire c,d,e;
	not(c,s);
	and(d,a,s);
	and(e,b,e);
	
	or(f,d,e);
endmodule