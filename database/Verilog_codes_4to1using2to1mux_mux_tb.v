// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module mux_tb();
  reg ta, tb, tc, td;
  reg [1:0] tsel;
  wire y;
  
  mux4x1 dut(.j(ta), .k(tb), .l(tc), .m(td), .sel(tsel), .y(y));

  initial begin
    $dumpfile("mux.vcd");
    $dumpvars(1);
    tsel = 2'b00; ta = 1; tb = 0; tc = 0; td = 0;
    #10;
    tsel = 2'b01; ta = 0; tb = 1; tc = 0; td = 0;
    #10;
    tsel = 2'b10; ta = 0; tb = 0; tc = 1; td = 0;
    #10;
    tsel = 2'b11; ta = 0; tb = 0; tc = 0; td = 1;
    #10;
    $finish();
  end
endmodule
