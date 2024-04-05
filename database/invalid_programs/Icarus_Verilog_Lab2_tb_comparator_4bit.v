`include "comparator_4bit.v"
module tb_comparator_4bit();
	
	reg [3:0] a;
	reg [3:0] b;
	wire agtb, altb, aeqb;
	
	comparator_4bit comp(.agtb(agtb), .altb(altb), .aeqb(aeqb), .a(a), .b(b));
	
	initial begin
		$dumpfile("tb_comparator_4bit.vcd");
		$dumpvars(0,tb_comparator_4bit);
	end
	
	initial begin
	   a=4'b0000; b=4'b0000;
	#5 a=4'b1000; b=4'b1011;
	#5 a=4'b0010; b=4'b0111;
	#5 a=4'b0101; b=4'b1111;
	#5 $finish();
	end
	
	initial 
		$monitor("a = %b, b = %b,signa = %b, signb = %b, agtb = %b, altb = %b, aeqb = %b",a, b,comp.signa, comp.signb, agtb, altb, aeqb);
endmodule