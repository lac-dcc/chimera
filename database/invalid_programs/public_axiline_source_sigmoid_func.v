`timescale 1ns/1ps
module sigmoid#(
    parameter dataLen = %dataLen%,
	parameter indexLen =%indexLen%,
	parameter fracLen = %fracLen%
)(
	[dataLen-1:0]in,
	[dataLen-1:0]out
);

	input signed [dataLen - 1 : 0] in;
	output signed [dataLen - 1 : 0] out;
	wire [indexLen - 1 :0] index;

	always @(in)
	begin
		out = 0;

		if (in < -(8 << %fracLen%)) begin
			out = 0;
		end else if (in > (8 << %fracLen%)) begin
			out = 1<<%fracLen%;
		end else begin
		index[indexLen-1]	= in[dataLen-1];
		index[indexLen-2:0]	= in[fracLen+indexLen-%fracIndex%:fracLen-%fracIndex%];
		case(index)
            //
            %indexLen%'d%$index$%: out = %dataLen%'b%$data$%;
		endcase
		end
	end

endmodule
  