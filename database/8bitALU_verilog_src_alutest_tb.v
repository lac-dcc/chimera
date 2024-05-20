// This program was cloned from: https://github.com/EdricOngKhaiJieh/8bitALU_verilog
// License: Apache License 2.0

// `timescale 1ns / 1ps
// //////////////////////////////////////////////////////////////////////////////////
// // Company: 
// // Engineer: 
// // 
// // Create Date: 04/11/2024 10:58:31 PM
// // Design Name: 
// // Module Name: alutest_tb
// // Project Name: 
// // Target Devices: 
// // Tool Versions: 
// // Description: 
// // 
// // Dependencies: 
// // 
// // Revision:
// // Revision 0.01 - File Created
// // Additional Comments:
// // 
// //////////////////////////////////////////////////////////////////////////////////


module alutest_tb;
    reg CLK;
    reg rst; 
    reg IN0;
    reg IN1; 
    reg IN2; 
    reg IN3; 
    reg IN4; 
    reg IN5; 
    reg IN6; 
    reg IN7; 
 
    wire OUT0;
    wire OUT1;
    wire OUT2;
    wire OUT3;
    wire OUT4;
    wire OUT5;
    wire OUT6;
    wire OUT7;
    
ALU_test DUT(
.CLK(CLK),
.rst(rst),
.IN0(IN0),
.IN1(IN1), 
.IN2(IN2), 
.IN3(IN3), 
.IN4(IN4) , 
.IN5(IN5), 
.IN6(IN6), 
.IN7(IN7),
.OUT0(OUT0),
.OUT1(OUT1),
.OUT2(OUT2),
.OUT3(OUT3),
.OUT4(OUT4),
.OUT5(OUT5),
.OUT6(OUT6),
.OUT7(OUT7)
);

initial begin
CLK = 0; 
end

always #50 CLK = ~CLK ;

initial 
begin
rst = 1 ; 
#50 
rst = 0 ; 
#50
  IN0 = 1 ; 
  IN1 = 0 ; 
  IN2 = 0 ; 
  IN3 = 1 ; 
  IN4 = 0 ; 
  IN5 = 0 ; 
  IN6 = 0 ; 
  IN7 = 0 ;
  
  #50 
  
  IN0 = 0 ; 
  IN1 = 1 ; 
  IN2 = 0 ; 
  IN3 = 1 ; 
  IN4 = 0 ; 
  IN5 = 0 ; 
  IN6 = 0 ; 
  IN7 = 0 ;
 
rst = 1 ; 
#50 
rst = 0 ; 

  #50
  IN0 = 0 ; 
  IN1 = 1 ; 
  IN2 = 0 ; 
  IN3 = 0 ; 
  IN4 = 1 ; 
  IN5 = 0 ; 
  IN6 = 0 ; 
  IN7 = 0 ;
  
rst = 1 ; 
#50 
rst = 0 ; 

  #200
 
  IN0 = 1 ; 
  IN1 = 1 ; 
  IN2 = 0 ; 
  IN3 = 1 ; 
  IN4 = 1 ; 
  IN5 = 0 ; 
  IN6 = 0 ; 
  IN7 = 0 ;
end
endmodule



