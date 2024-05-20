// This program was cloned from: https://github.com/yukinagata3184/de0_blinkL
// License: MIT License

// testbench for cnt1sec
// Verify that gen1hz is HIGH at 50x10^6 clock rises. (DE0's system clock is 50MHz.)
// author:yukinagata3184

module cnt1sec_tb;

parameter CYCLE = 100;
parameter HALF_CYCLE = 50;
parameter DELAY = 10;

reg CLK, RST;
wire gen1hz;

cnt1sec cnt1sec(.CLK(CLK), .RST(RST), .gen1hz(gen1hz));

always begin
    CLK = 1'b1;
#HALF_CYCLE CLK = 1'b0;
#HALF_CYCLE;
end

initial begin
       RST = 1'b0;
// Prevent racing
#10;   RST = 1'b1;
#CYCLE RST = 1'b0;
// Check edge pattern
#(2*CYCLE);
// Check center pattern
#CYCLE force cnt1sec.cnt50mhz = 26'd25_999_998;
       release cnt1sec.cnt50mhz;
#(2*CYCLE);
// Verify that gen1hz is HIGH at 50x10^6 clock rises. 
#CYCLE force cnt1sec.cnt50mhz = 26'd49_999_998;
       release cnt1sec.cnt50mhz;
#(3*CYCLE) $stop;
end

endmodule