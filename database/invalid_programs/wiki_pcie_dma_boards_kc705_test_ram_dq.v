`default_nettype none
module ram_dq (
	input Clock,
	input ClockEn,
        input Reset,
        input [1:0] ByteEn,
	input WE,
	input [13:0] Address,
	input [15:0] Data,
	output reg [15:0] Q
);

reg [7:0] ram0 [0:1023];
reg [7:0] ram1 [0:1023];
reg [15:0] dout;

always @(posedge Clock) begin
	if (WE) begin
		if (ByteEn[0])
			ram0[ Address ] <= Data[7:0];
		if (ByteEn[1])
			ram1[ Address ] <= Data[15:8];
	end
	Q <= { ram1[ Address ], ram0[ Address ] };
end

endmodule
`default_nettype wire
