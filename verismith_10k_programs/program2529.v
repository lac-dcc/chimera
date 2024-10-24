module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg12,
                 (1'h0)};
  assign wire4 = (wire1 < (~|(^~wire3)));
  assign wire5 = wire0;
  assign wire6 = wire2;
  assign wire7 = $unsigned((~^(~&$signed((!wire0)))));
  assign wire8 = $unsigned(wire6);
  assign wire9 = ((8'hae) || (^wire1[(4'hb):(3'h5)]));
  assign wire10 = wire6;
  assign wire11 = wire0;
  always
    @(posedge clk) begin
      reg12 <= wire10[(4'hc):(4'ha)];
    end
endmodule
