// This program was cloned from: https://github.com/omkarbajaj073/expensive-cow
// License: Apache License 2.0

/* clock */
`timescale 1ps/1ps
module clock(output clk);
    reg theClock = 1;

    assign clk = theClock;
    
    always begin
        #500;
        theClock = !theClock;
    end
endmodule