// This program was cloned from: https://github.com/buttercutter/DDR
// License: GNU General Public License v3.0

module deserializer
#(
	parameter D = 8,  // data bitwidth
	parameter S = 4,  // deserialization ratio
	parameter INITIAL_S = 0  // initial deserialization ratio, defaults to 0
)
(
	input reset,
	input high_speed_clock,
	input [D-1:0] data_in,
	output reg [D*S-1:0] data_out
);

reg [$clog2(S)-1:0] deserialization_ratio;

always @(posedge high_speed_clock)
begin
	if(reset) deserialization_ratio <= INITIAL_S;

	else deserialization_ratio <= deserialization_ratio + 1;
end

reg [D*(S-1)-1:0] data_temp;

always @(posedge high_speed_clock)
begin
	// new incoming data are inserted at most-significant-bits (MSB) position
	// The oldest data at least-significant-bits (LSB) position will be removed/dropped
	// all old data are shifted to the right such that the new data has enough space to fill in at MSB position

	data_temp <= {data_in, data_temp[D*(S-1)-1 : D]};
end

always @(posedge high_speed_clock)
begin
	// time to switch to new set of data
	if(deserialization_ratio == INITIAL_S) data_out <= {data_in, data_temp};  	 
end

endmodule
