// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
module sqrt (
	in,	//in should be unsigned
  	out,
  	rout,
  	done
);
	//--------------------------------------------------------------------------------------
	parameter inLen = 32;	//length of sqrt is dataLen/2
    parameter qLen = inLen / 2;
	parameter rLen = inLen / 2 + 1;
	//--------------------------------------------------------------------------------------

	//--------------------------------------------------------------------------------------
	input [inLen - 1 : 0 ]  in;
	output [qLen - 1 : 0 ] out;
	output signed [rLen - 1 : 0] rout;
	output reg done;
	//--------------------------------------------------------------------------------------
integer i;
reg signed [rLen - 1 : 0] r;
reg [qLen - 1 : 0] q;

always @ (in) begin
    done = 0;
	r = 0;
	q = 0;

	for (i = inLen / 2 - 1; i >= 0 ; i = i - 1) begin
		#1
		if (r[rLen - 1] == 0) begin
			r = (r << 2) | (in >> (i + i) & 3);
			r = r - ((q << 2) | 1);
		end else begin
			r = (r << 2) | (in >> (i + i) & 3);
			r = r + ((q << 2) | 3);
		end

		if (r[rLen - 1] == 0) begin
			q = (q << 1) | 1;
		end else begin
			q = (q << 1) | 0;
		end
	end
    if (r<0) r= r+((q<<1)|1);
    done = 1;
end
assign out = q;
assign rout = r;

endmodule
