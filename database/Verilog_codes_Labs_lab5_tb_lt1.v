// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_ll1;
  reg [3:0]A, B; 
  reg Cin;
  wire [3:0] S;
  wire Cout;
  wire[4:0] add;
  
  ll1 cla(A, B, Cin, S, Cout);
  
  assign add = {Cout, S};
  initial begin
  $dumpfile("ll1.vcd");
  $dumpvars(1);
    $monitor("A = %b: B = %b, Cin = %b --> S = %b, Cout = %b, Addition = %0d", A, B, Cin, S, Cout, add);
    A = 1; B = 0; Cin = 0; #3;
    A = 2; B = 4; Cin = 1; #3;
    A = 4'hb; B = 4'h6; Cin = 0; #3;
    A = 5; B = 3; Cin = 1;
  end
endmodule