`timescale 1 ns/100 ps
// Version: 8.6 8.6.0.34


module reset_buffer(GL,CLK);
output GL;
input  CLK;

    wire CLKP, GND;
    
    GND GND_1_net(.Y(GND));
    PLLINT pllint1(.A(CLK), .Y(CLKP));
    CLKDLY Inst1(.CLK(CLKP), .GL(GL), .DLYGL0(GND), .DLYGL1(GND), 
        .DLYGL2(GND), .DLYGL3(GND), .DLYGL4(GND));
    
endmodule
