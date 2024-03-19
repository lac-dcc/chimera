`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : micropc.v
// Title        : Micro PC.
// Library      : nanoLADA - microsequencer
// Purpose      : Computer Architecture, Design and Verfication
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module micropc(mpc,lpc,z,i,l,clock);
output reg	[3:0] mpc;
input		[3:0] lpc;
input	z;
input	i;
input 	l;
input	clock;

reg [3:0] mpc_new;

always @(posedge clock)
begin
	mpc=mpc_new;
end

always @(z or i or l)
begin
	if (z==1)
		mpc_new=4'b0000;
	else if (i==1)
		mpc_new=mpc+1;
	else if (l==1)
		mpc_new=lpc;
end

endmodule