// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module xor_gate_tb;
reg a,b;
wire y;
xor_gate uut(.a(a),.b(b),.y(y));
initial begin
    $dumpfile("xor.vcd");
    $dumpvars(0,xor_gate_tb);
    a = 0; b = 0;
    #10
    $display("%b | %b | %b" , a,b,y);
    a = 0; b = 1;
    #10
    $display("%b | %b | %b" , a,b,y);
    a = 1; b = 0;
    #10
    $display("%b | %b | %b" , a,b,y);
    a = 1; b = 1;
    #10
    $display("%b | %b | %b" , a,b,y);
    end
endmodule