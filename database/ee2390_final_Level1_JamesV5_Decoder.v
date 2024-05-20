// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

module SevenSegmentDecoder (
  input [3:0] data, // Input binary data to decode (e.g., Minutes, Tens_Seconds, Ones_Seconds, Tenths_Seconds)
  output reg [6:0] segment // Output signals for the seven segments (a-g) and common anode
);

  // Define segment patterns for each digit (0-9, '-', ' ')
  reg [6:0] segment_patterns [15:0];

  initial begin
    // Assign segment patterns for each digit (modify based on your specific seven-segment display)
    segment_patterns[0] = 7'b0000001; // 0
    segment_patterns[1] = 7'b1001111; // 1
    segment_patterns[2] = 7'b0010010; // 2
    segment_patterns[3] = 7'b0000110; // 3
    segment_patterns[4] = 7'b1001100; // 4
    segment_patterns[5] = 7'b0100100; // 5
    segment_patterns[6] = 0100000; // 6
    segment_patterns[7] = 7'b0001111; // 7
    segment_patterns[8] = 7'b0000000; // 8
    segment_patterns[9] = 7'b0000100; // 9
    segment_patterns[10] = 7'b0111011; // - (dash)
    segment_patterns[11] = 7'b0000000; // Space (all segments off) - adjust based on your display
  end

  always @(data) begin
    segment <= segment_patterns[data];
  end

endmodule