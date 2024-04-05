`include "fadder_1bit.v"

module tb_fadder_1bit();    

    wire sum, cout;
    reg a,b,cin;

    fadder_1bit fadd(.sum(sum), .cout(cout), .a(a), .b(b), .cin(cin) );

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

    initial 
        $monitor("a = %b, b = %b, cin = %b, cout = %b, sum = %b", a, b, cin, cout, sum);

    initial begin
        $dumpfile("tb_fadder_1bit.vcd");
        $dumpvars;
    end
    
endmodule