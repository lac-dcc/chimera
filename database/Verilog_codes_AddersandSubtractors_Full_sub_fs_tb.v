// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module full_subtractor_tb;
  reg A, B, Cin;
  wire Diff, Borrow;
  
  full_subtractor uut(A, B, Cin, Diff, Borrow);
  
  initial begin
  $dumpfile("full_subtractor.vcd");
    $dumpvars(0, full_subtractor_tb);
    $monitor($time," A: %b , B: %b , Cin: %b , Diff: %b, Borrow: %b ",A,B,Cin,Diff,Borrow);
    A = 0;B = 0;Cin = 0;
    #10;
    
    A = 1;B = 0;Cin = 0;
    #10;
    
    A = 0;B = 1;Cin = 0;
    #10;
    
    A = 1;B = 1;Cin = 0;
    #10;
    
    A = 0;B = 0;Cin = 1;
    #10;
    
    A = 1;B = 0;Cin = 1;
    #10;
    
    A = 0;B = 1;Cin = 1;
    #10;
    
    A = 1;B = 1;Cin = 1;
    #10;
    $finish;
  end
endmodule
