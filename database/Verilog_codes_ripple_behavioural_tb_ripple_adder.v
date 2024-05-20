// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module RCA_TB;
  wire [3:0] S, Cout;
  reg [3:0] A, B;
  reg Cin;
  wire[4:0] add;
  
  ripple_carry_adder rca(A, B, Cin, S, Cout);
  assign add = {Cout[3], S};
  
  initial begin
  $dumpfile("ripple.vcd");
  $dumpvars(1);
    $monitor("A = %b: B = %b, Cin = %b --> S = %b, Cout[3] = %b, Addition = %0d", A, B, Cin, S, Cout[3], add);
    A = 1; B = 0; Cin = 0; #3;
    A = 2; B = 4; Cin = 1; #3;
    A = 4'hb; B = 4'h6; Cin = 0; #3;
    A = 5; B = 3; Cin = 1; #3;
    $finish;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
