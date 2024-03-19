`include "fadder_4bit.v"
module tb_fadder_4bit();

    wire [3:0] sum;
    wire cout;
    reg [3:0] a,b;
    reg cin;

    fadder_4bit faddr(.sum(sum), .cout(cout), .a(a), .b(b), .cin(cin));

    initial begin
        $dumpfile("tb_fadder_4bit.vcd");
        $dumpvars;
    end

    initial begin
            a = 4'b0101; b = 4'b1000; cin = 0;
        #5  a = 4'b0101; b = 4'b1000; cin = 1;
        #5  a = 4'b1101; b = 4'b1001; cin = 0;
        #5  a = 4'b1101; b = 4'b1001; cin = 1;
    end

endmodule