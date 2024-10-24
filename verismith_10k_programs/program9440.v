module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire26;
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire29, wire28, wire7, wire8, wire26, reg4, reg5, reg6, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (({(8'ha5), wire3} <<< {$signed((7'h41)),
          {$signed(wire0),
              wire3[(4'hf):(4'h8)]}}) & $unsigned($signed((wire1[(4'h8):(2'h2)] ?
          (wire3 ~^ wire1) : wire0[(2'h3):(2'h3)]))));
      reg5 <= (-((wire3 > $unsigned($unsigned(wire2))) < reg4[(4'h8):(3'h4)]));
      reg6 <= ($signed(wire0[(4'ha):(4'h8)]) ?
          $signed($signed($unsigned({wire3}))) : (~wire3));
    end
  assign wire7 = (~|(reg4 & ({((8'haf) != reg6)} < {{reg4}})));
  assign wire8 = $unsigned($signed((~wire0[(3'h5):(1'h0)])));
  module9 #() modinst27 (wire26, clk, wire2, reg4, wire0, wire1);
  assign wire28 = reg5[(1'h1):(1'h1)];
  assign wire29 = $signed(wire28);
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire14 = $signed((8'hb6));
  assign wire15 = (~^(wire11[(4'h9):(3'h4)] ?
                      ((wire11[(3'h7):(1'h0)] && wire11) ?
                          $signed($signed(wire11)) : $unsigned(((8'hb9) ?
                              wire13 : wire10))) : ($signed(wire14) >>> $unsigned($unsigned(wire14)))));
  assign wire16 = $unsigned(((($unsigned(wire11) >> $unsigned(wire12)) ?
                      $unsigned((+wire15)) : wire10) < ((wire14 | (wire10 - wire12)) || (wire14 ?
                      (wire15 ~^ wire14) : (wire10 ^ (8'hb6))))));
  assign wire17 = $signed(wire11[(4'h9):(3'h5)]);
  assign wire18 = ($signed(wire16) ?
                      $signed($signed($unsigned((wire14 >>> (8'ha6))))) : (wire15 ?
                          $unsigned(($unsigned(wire10) ?
                              (wire15 ?
                                  (8'hac) : wire13) : $unsigned(wire17))) : wire15));
  assign wire19 = wire14;
  always
    @(posedge clk) begin
      reg20 <= wire13;
      reg21 <= wire14[(1'h0):(1'h0)];
      reg22 <= {wire12[(4'h8):(2'h3)]};
      reg23 <= (8'hae);
    end
  assign wire24 = wire15;
  assign wire25 = $unsigned($signed($unsigned((&(+wire11)))));
endmodule
