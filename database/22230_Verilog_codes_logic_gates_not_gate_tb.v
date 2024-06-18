// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module not_gate_tb;
reg a;
wire y;
not_gate uut(.a(a),.y(y));
initial begin
    $dumpfile("not.vcd");
    $dumpvars(0,not_gate_tb);
    a = 0;
    #10
    $display("%b | %b ", a,y);
    a = 1;
    #10
    $display("%b | %b ", a,y);
    end
endmodule