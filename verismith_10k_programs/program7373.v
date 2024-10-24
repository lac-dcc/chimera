module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = (wire0[(3'h5):(3'h5)] * $signed(($signed($unsigned(wire0)) >>> ((wire4 ?
                         (8'hb8) : wire1) ?
                     {wire0} : (wire2 < wire0)))));
  assign wire6 = wire3;
  assign wire7 = wire2;
  assign wire8 = (!wire2);
  assign wire9 = $unsigned((wire8 | $signed((^~wire1))));
  always
    @(posedge clk) begin
      reg10 <= ((^~(|{(wire7 ? wire1 : (8'ha8))})) ?
          wire6[(4'h9):(3'h5)] : (+wire7));
      reg11 <= {$unsigned(((!{wire0, wire5}) ?
              ((|wire1) > $signed(reg10)) : ((!(8'hb2)) ?
                  wire5 : (reg10 - (8'hae))))),
          (($signed(wire5[(4'h8):(3'h6)]) ^~ wire3) > wire3)};
      reg12 <= (-((8'ha5) ^~ wire1[(3'h4):(2'h2)]));
    end
  assign wire13 = {$unsigned(($unsigned((wire4 ?
                          reg11 : (8'hb4))) >> (~|wire8)))};
  assign wire14 = wire6;
  assign wire15 = wire2[(1'h1):(1'h0)];
  assign wire16 = reg11;
  assign wire17 = wire15;
  assign wire18 = reg10[(4'hb):(4'hb)];
  assign wire19 = (!$unsigned(($unsigned((!wire4)) < (wire16[(2'h3):(1'h1)] != wire6[(4'h9):(3'h5)]))));
  assign wire20 = (~^(&$signed(reg11[(2'h3):(1'h0)])));
  assign wire21 = $signed(wire18[(2'h2):(1'h1)]);
endmodule
