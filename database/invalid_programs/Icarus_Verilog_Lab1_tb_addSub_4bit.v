`include "addSub_4bit.v"
module tb_addSub_4bit();
    
    wire [3:0] sum;
    wire cout;
    reg [3:0] a,b;
    reg cin;
    reg sel;

    addSub_4bit addsub(.sum(sum), .cout(cout), .a(a), .b(b), .cin(cin), .sel(sel));

    initial begin
        $dumpfile("tb_addSub_4bit.vcd");
        $dumpvars;
    end

    initial begin
            a = 4'b0101; b = 4'b1000; cin = 0; sel = 0;
        #5  a = 4'b0101; b = 4'b1000; cin = 0; sel = 1;
        #5  a = 4'b0101; b = 4'b1000; cin = 1; sel = 0;
        #5  a = 4'b0101; b = 4'b1000; cin = 1; sel = 1;
        #5  a = 4'b1101; b = 4'b1001; cin = 0; sel = 0;
        #5  a = 4'b1101; b = 4'b1001; cin = 0; sel = 1;
        #5  a = 4'b1101; b = 4'b1001; cin = 1; sel = 0;
        #5  a = 4'b1101; b = 4'b1001; cin = 1; sel = 1;
    end

endmodule