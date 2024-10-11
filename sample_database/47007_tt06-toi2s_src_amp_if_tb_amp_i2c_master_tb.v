// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

// Testbench i2c_master block for amp frontend 
// Simulate:
//   Send off i2c config setting when triggered 
// 
// Copyright Jørgen Kragh Jakobsen, November 2021 

`timescale 1ns/1ns

module amp_i2c_master_tb();

reg clk, reset;
reg send_cfg;


amp_i2c_master dut(clk,reset,send_cfg,
                   i2c_sda,i2c_scl);
                   
initial 
begin 
    clk=0;
  forever #5 clk=~clk;     // 100 MHz
end

initial
begin
 $dumpfile("amp_i2c_master.vcd");
 $dumpvars(0,amp_i2c_master_tb);
 reset        = 1;
 send_cfg     = 0;
 #100;
 reset = 1;
  
 #100;
 reset = 0;
 
 #2000; 
 send_cfg = 1; 

 #400000;
 $display("End");
 $finish;
end

endmodule 