// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

// Testbench state_contoller for amp frontend 
// Simulate:
//   Startup process 
//   Error conditon on amp (glitch/amp reset) 
// Copyright Jørgen Kragh Jakobsen, November 2021 
`timescale 1ns/1ns
module amp_state_control_tb();

reg clk, reset;
reg nerror,audio_locked; 

amp_state_control dut(clk,reset,audio_locked,nerror, 
                      nenable, nmute, send_config);

initial 
begin 
    clk=0;
  forever #5 clk=~clk;     // 100 MHz
end

initial
begin
 $dumpfile("amp_state_control.vcd");
 $dumpvars(0,amp_state_control_tb);
 reset        = 1;
 audio_locked = 0;
 nerror       = 1;
 
 #20;
 reset=0;

 #400000; 
 audio_locked = 0;
 #200000; 
 audio_locked = 1;
 
 #600000; 
 $display("End");
 $finish;
end

endmodule 