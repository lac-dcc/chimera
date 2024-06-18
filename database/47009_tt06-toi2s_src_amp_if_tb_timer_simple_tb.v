// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

// Testbench simple_timer
// Block time out after reset or start_timer + x number of clock cycels 
// Max count  


module timer_tb();
reg clk, reset;
reg start;
wire timer_timeout; 

timer_simple dut(clk, reset, start, timer_timeout);

initial 
begin 
    clk=0;
  forever #5 clk=~clk;
end

initial
begin
 $dumpfile("test.vcd");
 $dumpvars(0,timer_tb);reset=1;
 start=0;
 #20;
 reset=0;
 #63; 
 start=1; 
 #75 
 start=0; 
 $display("End");
 #999999 $finish;
end

endmodule 