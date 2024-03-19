module top_module (input a, input b, input c, output out);//
	reg q;
    andgate inst1 ( q,a,b,c,1,1 );
	assign out = !q;
endmodule

