module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 (1'h0)};
  assign wire4 = (~(((~|(wire3 == wire2)) - {wire1[(2'h2):(2'h2)],
                     (^~wire1)}) ^~ ({{wire1}, {wire2, wire3}} ?
                     (~(wire2 ^ wire1)) : wire2)));
  assign wire5 = wire4[(1'h1):(1'h0)];
  assign wire6 = $signed(((((~wire0) <<< wire4) != (wire0[(3'h4):(2'h3)] ?
                     (wire3 & (8'hb6)) : wire0)) < ($unsigned((&wire2)) ?
                     wire1[(1'h0):(1'h0)] : (8'hb5))));
  assign wire7 = wire2;
  always
    @(posedge clk) begin
      reg8 <= (&($unsigned(((&wire6) ?
          wire4[(4'h9):(3'h4)] : (|wire0))) >> wire0));
    end
  assign wire9 = $unsigned($signed((((wire1 ? wire3 : wire0) >> {(8'ha4),
                     wire1}) ^~ (8'hbf))));
  assign wire10 = wire0;
  assign wire11 = (8'h9f);
  assign wire12 = $unsigned((wire10 > wire4[(1'h0):(1'h0)]));
  assign wire13 = $signed((((!(~|wire7)) ? wire5 : (^wire4)) ?
                      $signed(((wire6 & wire7) ^ $unsigned(reg8))) : (^~(8'hba))));
  assign wire14 = (($unsigned($signed($signed(wire4))) + wire10) ?
                      $unsigned(($unsigned($signed(wire11)) && {$unsigned((7'h44))})) : $signed($signed((!(wire6 >>> wire2)))));
endmodule
