// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module mod_5_counter
       (input clk,reset, output reg [2:0] counter);
        
        always@(posedge clk)
        begin
            if(reset)
            counter <= 0;
            else
                if(counter == 4)
                counter <= 0;
                else
                counter <= counter + 1;
         end        
endmodule


//////////////////////////////////////////////////////////////////////////////////


module D_flipflop(
    input clk, reset, d,
    output reg Q
    );
    
    always@(posedge clk)
          begin
            if({reset})
                Q<= 1'b0;
            else 
                Q <= d;
            end

endmodule


//////////////////////////////////////////////////////////////////////////////////


module freq_div_by5(
    input clk, reset,
    output clk_by5
    );
    wire[2:0] q;
    wire temp; 
    
    mod_5_counter M5C(clk, reset, q);
    
    D_flipflop D(~clk, reset, q[1], temp);
    
    or(clk_by5, q[1], temp);
    
endmodule
