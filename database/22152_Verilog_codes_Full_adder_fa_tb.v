// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License



module fa_tb;
    reg a, b, cin;
    wire sum, cout;

    full_adder DUT(a, b, cin, sum, cout);

    initial begin
    	$dumpfile("full_adder.vcd"); 
        $dumpvars(0, fa_tb); 
        $display("Full Adder Testbench");
        $display("--------------------");
        $display("Inputs\t\t|\tOutputs");
        $display("--------------------");

        // Test case 1
        a = 0; b = 0; cin = 0;
        #10;
        $display("%b %b %b\t|\t%b %b", a, b, cin, sum, cout);

        // Test case 2
        a = 0; b = 1; cin = 0;
        #10;
        $display("%b %b %b\t|\t%b %b", a, b, cin, sum, cout);

        // Test case 3
        a = 1; b = 0; cin = 0;
        #10;
        $display("%b %b %b\t|\t%b %b", a, b, cin, sum, cout);

        // Test case 4
        a = 1; b = 1; cin = 0;
        #10;
        $display("%b %b %b\t|\t%b %b", a, b, cin, sum, cout);
	
	// Test case 5
        a = 0; b = 0; cin = 1;
        #10;
        $display("%b %b %b\t|\t%b %b", a, b, cin, sum, cout);

        // Test case 6
        a = 0; b = 1; cin = 1;
        #10;
        $display("%b %b %b\t|\t%b %b", a, b, cin, sum, cout);

        // Test case 7
        a = 1; b = 0; cin = 1;
        #10;
        $display("%b %b %b\t|\t%b %b", a, b, cin, sum, cout);

        // Test case 8
        a = 1; b = 1; cin = 1;
        #10;
        $display("%b %b %b\t|\t%b %b", a, b, cin, sum, cout);

        $finish;
    end
endmodule
