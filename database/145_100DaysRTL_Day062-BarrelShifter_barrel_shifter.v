// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module mux_2_1(
    input [1:0] i,
    input sel,
    output y_out    
    );
    assign y_out= sel ? i[1] : i[0];
endmodule


module mux_4_1(
    input [3:0] i,
    input [1:0]select,
    output y_out
    );
    wire [1:0]w;
    
    mux_2_1 m1(i[1:0], select[0], w[0]);
    mux_2_1 m2(i[3:2], select[0], w[1]);
    mux_2_1 m3(w, select[1], y_out);
endmodule


 module mux_8_1(
    input [7:0] i,
    input [2:0]select,
    output y_out
    );
    wire [1:0]w;
    
    mux_4_1 m1(i[3:0], select[1:0], w[0]);
    mux_4_1 m2(i[7:4], select[1:0], w[1]);
    mux_2_1 m3(w, select[2], y_out);
  endmodule     


////////////////////////////////////////////////////

module barrel_shifter(
    input [7:0] data,
    input [2:0] amt,
    output [7:0] out
    );

    mux_8_1 m0(data, amt, out[0]);
    mux_8_1 m1({data[0], data[7:1]}, amt, out[1]);
    mux_8_1 m2({data[1:0], data[7:2]}, amt, out[2]);
    mux_8_1 m3({data[2:0], data[7:3]}, amt, out[3]);
    mux_8_1 m4({data[3:0], data[7:4]}, amt, out[4]);
    mux_8_1 m5({data[4:0], data[7:5]}, amt, out[5]);
    mux_8_1 m6({data[5:0], data[7:6]}, amt, out[6]);
    mux_8_1 m7({data[6:0], data[7]}, amt, out[7]);
    
endmodule
