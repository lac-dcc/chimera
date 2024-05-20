// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module mod_N_counter
      #(parameter N = 6,
        parameter LENGTH = 3)
        
       (input clk,reset, output reg [LENGTH-1:0] counter);
        
        always@(posedge clk)
        begin
            if(reset)
            counter <= 0;
            else
                if(counter == N-1)
                counter <= 0;
                else
                counter <= counter + 1;
         end        
endmodule
