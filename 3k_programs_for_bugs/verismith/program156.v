module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire6,
                 wire5,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = {((!$unsigned($signed(wire3))) < (!((|wire0) >> wire0))),
                     {{(^~(|wire1))}}};
  assign wire6 = wire4[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= {(wire2 == {($unsigned((8'h9f)) >>> (|(8'hac))), wire0})};
      reg8 <= ((!$signed((~(^~wire6)))) && reg7[(3'h5):(3'h4)]);
      reg9 <= $signed({(~&$unsigned(reg8))});
    end
  assign wire10 = $unsigned((~(wire5 ? (|(~wire4)) : (8'haa))));
  assign wire11 = (~^(!(($unsigned(reg7) * wire5) ?
                      $signed($signed((8'hbb))) : (reg8[(2'h2):(2'h2)] == wire1[(3'h7):(3'h7)]))));
  assign wire12 = (-$unsigned(($signed($signed(wire1)) ?
                      reg9[(2'h2):(2'h2)] : wire4[(4'he):(4'he)])));
  assign wire13 = $signed($signed((~&(8'h9e))));
  assign wire14 = (^~$signed((($unsigned((7'h42)) + (reg8 << wire0)) ?
                      $unsigned((wire4 <= (8'ha8))) : $signed(wire13))));
  assign wire15 = ($unsigned({wire4}) >= wire2[(2'h2):(1'h1)]);
  assign wire16 = wire3[(3'h6):(2'h3)];
endmodule
