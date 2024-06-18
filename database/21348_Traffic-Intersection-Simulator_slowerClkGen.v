// This program was cloned from: https://github.com/thefranciscoflores/Traffic-Intersection-Simulator
// License: GNU General Public License v2.0

`timescale 1ns / 1ps

module slowerClkGen
    #(parameter N = 100_000_000)
    (CLK100MHZ, reset, clkOut);
    
    input CLK100MHZ, reset;
    output reg clkOut;
    


    reg [27:0] counter = 28'd0;

 always @(posedge CLK100MHZ or posedge reset)
    begin
            if (reset) 
        begin
            counter <= 28'd0; // Reset counter to zero when reset is high  
            clkOut <= 1'b0;
        end 
        else begin
            counter <= counter + 28'd1;     
            if(counter >= (N-1))    counter <= 28'd0;
            clkOut <= (counter < (N/2)) ? 1'b1 : 1'b0;
        end

   end 

endmodule
