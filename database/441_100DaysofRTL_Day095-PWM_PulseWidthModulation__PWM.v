// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module PWM(
    input clk, rst, 
    output reg dout
    );
 
parameter period = 10;
integer count;
integer ton;
reg ncyc;
 
always@(posedge clk)
begin
     if(rst == 1'b1)
        begin
         count <= 0;
         ton   <= 0;
         ncyc  <= 1'b0;
        end   
     else 
       begin
            if(count <= ton) 
              begin
                  count <= count + 1;
                  dout  <= 1'b1;
                  ncyc  <= 1'b0;
              end
            else if (count < period)
              begin
                  count <= count + 1;
                  dout <= 1'b0;
                  ncyc <= 1'b0;
              end
            else
               begin
                   ncyc  <= 1'b1;
                   count <= 0;
               end
       end
end
 
always@(posedge clk)
begin
     if(rst == 1'b0) 
     begin 
         if(ncyc == 1'b1)
            begin
                if(ton < period)
                   ton <= ton + 1;
                else
                   ton <= 0;
            end
     end   
end

endmodule
