module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 reg18,
                 reg17,
                 reg16,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire4[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      reg6 <= (wire2 ? $unsigned((!(!wire2))) : wire2[(1'h1):(1'h1)]);
      reg7 <= $unsigned((^~wire2));
      reg8 <= $unsigned(wire0);
      reg9 <= (8'hbb);
    end
  assign wire10 = ($unsigned(($signed(wire3) ?
                          $signed((wire1 <= wire2)) : ($unsigned(reg8) + wire0[(3'h4):(2'h3)]))) ?
                      {wire0[(2'h3):(2'h2)],
                          wire2} : $unsigned({((wire5 & wire4) ?
                              ((8'ha1) ? wire4 : wire4) : $signed((8'haf))),
                          $unsigned($signed(reg9))}));
  assign wire11 = $signed((8'hb3));
  assign wire12 = wire10[(3'h6):(3'h5)];
  assign wire13 = ($signed($unsigned(wire0)) >>> {wire4[(1'h0):(1'h0)],
                      (({wire10} ? $signed(wire11) : wire4) ?
                          {$unsigned(reg7),
                              (wire2 ?
                                  wire4 : (8'ha8))} : ((!wire11) == reg9[(5'h12):(3'h7)]))});
  assign wire14 = {$unsigned(reg8)};
  assign wire15 = wire11;
  always
    @(posedge clk) begin
      reg16 <= {wire12[(2'h3):(1'h1)], wire4[(3'h4):(2'h2)]};
      reg17 <= $unsigned((($signed((wire4 - wire15)) ^ (^(&wire11))) == (^wire5)));
      reg18 <= ($unsigned($unsigned(wire5)) ?
          wire2[(4'ha):(3'h7)] : $unsigned(({(|reg7), wire13} ?
              $signed($signed(reg6)) : wire4[(2'h2):(1'h1)])));
    end
  assign wire19 = {reg18[(4'ha):(3'h7)]};
  assign wire20 = {(reg17[(2'h2):(1'h0)] ?
                          {$signed((reg8 ~^ (8'ha2)))} : wire10[(1'h1):(1'h0)]),
                      (wire13 ^ $signed($signed((reg7 ? wire2 : wire14))))};
  assign wire21 = $unsigned((wire0[(2'h2):(1'h1)] ?
                      reg16[(2'h2):(1'h1)] : $unsigned($unsigned((8'ha9)))));
  assign wire22 = ($unsigned($unsigned((+(wire5 ? wire3 : reg18)))) != (wire2 ?
                      ((wire10[(1'h1):(1'h0)] ~^ ((8'hbf) ? reg8 : wire3)) ?
                          $signed($signed(wire13)) : wire11[(1'h0):(1'h0)]) : $signed({wire21[(1'h1):(1'h0)]})));
  assign wire23 = reg16;
endmodule
