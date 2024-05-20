// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_2x1();
reg a,b,sel;
wire y;

mux2x1 dut(.a(a),.b(b),.sel(sel),.y(y));

initial begin
    $dumpfile("2x1.vcd");
    $dumpvars(1);
    sel = 0 ; a = 1; b = 1;
    #5
    sel = 1; a = 1; b = 1;
    #5
    $finish();
end
endmodule