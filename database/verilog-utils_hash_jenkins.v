`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:       Chris Shucksmith
// Create Date:    10:06:51 04/04/2011
// Design Name:
// Module Name:    jenkins
// Project Name:
//   Jenkins hash generator based on http://en.wikipedia.org/wiki/Jenkins_hash_function
//   originally proposed by Bob Jenkins here http://www.burtleburtle.net/bob/hash/doobs.html - not the
//   hash proposed in the text, but a simplification for single bytes.
//
// Additional Comments:
//   uint32_t jenkins_one_at_a_time_hash(char *key, size_t len) {
//      uint32_t hash = 0;
//      uint32_t i;
//      for(i = 0; i < len; ++i) {
//          hash += key[i];
//          hash += (hash << 10);
//          hash ^= (hash >> 6);
//      }
//      hash += (hash << 3);
//      hash ^= (hash >> 11);
//      hash += (hash << 15);
//      return hash;
//  }
//
//
//////////////////////////////////////////////////////////////////////////////////
module jenkins(
    input CLOCK,
	input sample,
    input [7:0] value,
    output [31:0] hash,
	output complete
    );

	reg [31:0] work = 0;
	reg [31:0] out = 0;
	reg started = 0;
	reg complete_int = 0;

	// per-byte calculations (combinatorial)
	wire [31:0] c1 = work + value;
	wire [31:0] c2 = c1 + (c1 << 10);
	wire [31:0] c3 = c2 ^ (c2 >> 6);
	// post-processing output stage (combinatorial)
	wire [31:0] o1 = work + (work << 3);
	wire [31:0] o2 = o1 ^ (o1 >> 11);
	wire [31:0] o3 = o2 + (o2 << 15);


	always @(posedge CLOCK) begin
		if (sample) begin
			work <= c3;
			started <= 1;
			complete_int <= 0;
		end else if (started && !sample) begin
			started <= 0;
			complete_int <= 1;
		end else if (!started) begin
			complete_int <= 0;
			work <= 0;
			started <= 0;
			complete_int <= 0;
		end
		out <= o3;

	end

	assign hash = out;
	assign complete = complete_int;

endmodule
