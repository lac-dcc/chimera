// This program was cloned from: https://github.com/buttercutter/DDR
// License: GNU General Public License v3.0

module serializer 
#(
	parameter D = 8,  // data bitwidth
	parameter S = 4,  // serialization ratio
	parameter INITIAL_S = 0  // initial serialization ratio, defaults to 0
)
(
	input reset,
	input high_speed_clock,
	input [D*S-1:0] data_in,
	output reg [D-1:0] data_out
);

reg [$clog2(S)-1:0] serialization_ratio;

always @(posedge high_speed_clock)
begin
	if(reset) serialization_ratio <= INITIAL_S;

	else serialization_ratio <= serialization_ratio + 1;
end

always @(posedge high_speed_clock)
begin
	data_out <= data_in[serialization_ratio*D +: D];
end

endmodule

