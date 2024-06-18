// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module ha_tb;
  reg A;
  reg B;
  wire SUM;
  wire CARRY;
  
  half_adder ha_inst (.A(A),.B(B),.Sum(SUM),.Carry(CARRY));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, ha_tb);
    A = 0;    B = 0;
    #10;
    $display($time," A: %b , B: %b , Sum: %b , Carry: %b ",A,B,SUM,CARRY);
    A = 1;
    #10;
    $display($time," A: %b , B: %b , Sum: %b , Carry: %b ",A,B,SUM,CARRY);
    B = 1;
    #10;
    $display($time," A: %b , B: %b , Sum: %b , Carry: %b ",A,B,SUM,CARRY);
    A = 0;
    #10;
    $display($time," A: %b , B: %b , Sum: %b , Carry: %b ",A,B,SUM,CARRY);
    $finish;
  end
  
endmodule
