`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : adder.v
// Title        : ADDER.
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module adder(S,Cout,A,B,Cin);
parameter WIDTH=31;
output	[WIDTH-1:0]	S;
output				Cout;
input	[WIDTH-1:0]	A;
input	[WIDTH-1:0]	B;
input				Cin;

assign {Cout,S}=A+B+Cin;

endmodule