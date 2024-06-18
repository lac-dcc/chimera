// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module testbench;
reg clk;
reg si;

wire [3:0]q;
sipos uut(.clk(clk),.si(si),.q(q));

    initial
    begin
        $dumpfile("sipoo.vcd");
        $dumpvars(1);
        clk = 0;
        si = 1;
        #10
        si = 0;
        #10
        si = 0;
        #10
        si = 1;
        #10
    $monitor($time, "Clk:%b , Si: %b , Q: %b ",clk,si,q);
    end
    $finish;
    always #15 clk = ~clk;
endmodule