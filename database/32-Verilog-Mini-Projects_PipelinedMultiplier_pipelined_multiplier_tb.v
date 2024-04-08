`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Test Bench
//////////////////////////////////////////////////////////////////////////////////

module MULTI_32bit_tb;

    reg clk;
    reg rst;
    reg [31:0] A;
    reg [31:0] B;
    wire [31:0] F;
   
    
    MULTI_32bit uut ( .clk(clk), .rst(rst), .A(A), .B(B), .F(F));
    
    initial begin
    A = 0;
    B = 0;
    clk <= 1'b0;
    rst <= 1'b1;
    

#10 clk <= ~clk;
    
    A = 32'h0000; B = 32'h0001;

#10 clk <= ~clk;
#10 clk <= ~clk;
    
    A = 32'h0010; B = 32'h0001;

#10 clk <= ~clk;
#10 clk <= ~clk;
    
    A = 32'h00F0; B = 32'h0040;

#10 clk <= ~clk;
#10 clk <= ~clk;
    
    A = 32'hC000; B = 32'h1000;

#10 clk <= ~clk;
#10 clk <= ~clk;
    
    A = 32'hAA00; B = 32'h0100;

#10 clk <= ~clk;
#10 clk <= ~clk;
    
    A = 32'h0A01; B = 32'h0020;

#10 clk <= ~clk;
#10 clk <= ~clk;
  
    A = 32'h0030; B = 32'h0009;
    
#10 clk <= ~clk;
#10 clk <= ~clk;

    A = 32'h0020; B = 32'h00010;
    
#10 clk <= ~clk;
#10 clk <= ~clk;

    A = 32'h9000; B = 32'h8000;
    
#10 clk <= ~clk;
#10 clk <= ~clk;

 A = 32'h0003; B = 32'h0001;
 
 #10 clk <= ~clk;
 #10 clk <= ~clk;
 
 #10 clk <= ~clk;
 #10 clk <= ~clk;
 
 #10 clk <= ~clk;
 #10 clk <= ~clk;
    
  end  

    
endmodule
