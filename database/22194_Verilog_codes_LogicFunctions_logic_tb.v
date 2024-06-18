// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module logic_tb;
  reg x1, x2, x3, x4;
  wire g, h, f;
  
  logicfunctions uut (
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .g(g),
    .h(h),
    .f(f)
  );

  initial begin
    $dumpfile("logic_vcd.vcd"); 
    $dumpvars(1);
    x1 = 1; x2 = 0; x3 = 1; x4 = 0;
    #10;
    $display("Test Case 1: x1=%b, x2=%b, x3=%b, x4=%b, g=%b, h=%b, f=%b", x1, x2, x3, x4, g, h, f);

    x1 = 0; x2 = 1; x3 = 1; x4 = 1;
    #10;
    $display("Test Case 2: x1=%b, x2=%b, x3=%b, x4=%b, g=%b, h=%b, f=%b", x1, x2, x3, x4, g, h, f);
    $finish;
  end

endmodule

