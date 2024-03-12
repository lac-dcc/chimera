// Testbench for 256-level PWM generator
// Author: Niels A. Moseley
//         Symbiotic EDA / Moseley Instruments
//         10-11-2018

module tb;

reg  clk   = 0;
reg  rst_n = 0;
wire pwm;

// clock generation
always #1 clk=~clk;

// devices under test
pwmled dut(clk, rst_n, pwm);

initial
begin
    $dumpfile("pwmled.vcd");
    $dumpvars;

    #4 rst_n = 1'b1;
    #154000 $finish;
    
end

endmodule
