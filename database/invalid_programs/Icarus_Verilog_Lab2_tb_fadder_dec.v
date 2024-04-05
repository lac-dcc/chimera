`include "fadder_dec.v"
module tb_fadder_dec();
	
	reg a, b, cin;
	wire sum, cout;
	
	fadder_dec addr(.cout(cout), .sum(sum), .cin(cin), .a(a), .b(b));
	
	initial begin 
		$dumpfile("tb_fadder_dec.vcd");
		$dumpvars;
	end
	
	initial 
		$monitor(" a = %b, b = %b, cin = %b, sum = %b, cout = %b",a,b,cin,sum,cout);
		
	initial begin
		
			a = 0; b = 0; cin = 0;
        #5  a = 0; b = 0; cin = 1;
        #5  a = 0; b = 1; cin = 0;
        #5  a = 0; b = 1; cin = 1;
        #5  a = 1; b = 0; cin = 0;
        #5  a = 1; b = 0; cin = 1;
        #5  a = 1; b = 1; cin = 0;
        #5  a = 1; b = 1; cin = 1;
		
	end
	
endmodule