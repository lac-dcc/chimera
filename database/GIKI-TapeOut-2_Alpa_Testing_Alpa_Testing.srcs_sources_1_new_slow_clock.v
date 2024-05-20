// This program was cloned from: https://github.com/HUZAIFA-TARIQ/GIKI-TapeOut-2
// License: Apache License 2.0

`timescale 1ns / 1ps







module slow_clock(
    input clk,
    output reg clk_1hz,
    output reg clk_1000hz
);

    reg [25:0] counter;
    reg [25:0] counter2;
            
    always @(posedge clk)
    begin
        ////if(counter == 100000000) //50 million, half of 100mhz
       // if(counter == 50000000)
       if(counter == 25000000)
            begin
            counter         <= 0;
            clk_1hz         <= ~clk_1hz ; 
            end
        else 
            counter         <= counter + 1;
    end
    
    
    always @(posedge clk)
    begin
        //if(counter2 == 131072)
       if(counter2 == 65536)
        //if(counter2 == 262144)
        begin
            counter2        <= 0;
            clk_1000hz      <= ~clk_1000hz;
        end
        else
            counter2        <= counter2 + 1;
    end









endmodule