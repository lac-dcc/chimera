// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

// Full Subtractor Testbench
module full_subtractor_tb;
  reg A, B, Cin;
  wire Diff, Borrow;
  
  full_subtractor uut(A, B, Cin, Diff, Borrow);
  
  initial begin
  $dumpfile("full_subtractor.vcd");
    $dumpvars(0, full_subtractor_tb);
    // Test case 1
    A = 0;
    B = 0;
    Cin = 0;
    #10;
    
    // Test case 2
    A = 1;
    B = 0;
    Cin = 0;
    #10;
    
    // Test case 3
    A = 0;
    B = 1;
    Cin = 0;
    #10;
    
    // Test case 4
    A = 1;
    B = 1;
    Cin = 0;
    #10;
    
    // Test case 5
    A = 0;
    B = 0;
    Cin = 1;
    #10;
    
    // Test case 6
    A = 1;
    B = 0;
    Cin = 1;
    #10;
    
    // Test case 7
    A = 0;
    B = 1;
    Cin = 1;
    #10;
    
    // Test case 8
    A = 1;
    B = 1;
    Cin = 1;
    #10;
    
    $finish;
  end
endmodule
