// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module TB_SWG;
reg [9:0]t;
wire [15:0]o;
sine_wave_generator SWG(o,t);
integer i;
initial
begin
$monitor("o=%d",o);
    #5 t=0;
     for(i=0;i<1024;i=i+1)
    begin
        #5 t=i;
    end
end
endmodule
