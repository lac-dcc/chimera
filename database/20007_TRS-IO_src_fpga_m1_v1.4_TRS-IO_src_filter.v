// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

//----Filter Module--------------------------------------------------------------

module filter (
  input clk,
  input in,
  output out,
  output falling_edge,
  output rising_edge);
  
localparam [3:0] FILTER_WIDTH = 8;

reg filtered;

reg [FILTER_WIDTH:0] raw; always @(posedge clk) begin
  raw <= {raw[FILTER_WIDTH - 1:0], in};
  filtered <= ((raw[FILTER_WIDTH:1] == {FILTER_WIDTH{1'b1}}) | (raw[FILTER_WIDTH:1] == {FILTER_WIDTH{1'b0}})) ? raw[2] : filtered;
end

reg [1:0] seq; always @(posedge clk) seq <= {seq[0], filtered};
assign falling_edge = seq == 2'b10;
assign rising_edge = seq == 2'b01;
assign out = seq[0];

endmodule
