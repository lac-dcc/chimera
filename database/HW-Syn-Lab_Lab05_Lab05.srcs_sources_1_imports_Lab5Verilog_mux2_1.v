`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : mux.v
// Title        : MUX.
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module mux2_1(out,in0,in1,sel);
parameter WIDTH=32;
output	[WIDTH-1:0]	out;
input	[WIDTH-1:0]	in0;
input	[WIDTH-1:0]	in1;
input				sel;

assign out=sel?in1:in0;

endmodule