module top
#(parameter param24 = (({((~(8'hba)) ? ((8'hab) ? (8'ha4) : (8'ha3)) : ((8'ha4) | (8'hb2))), ((|(8'hb3)) * (~&(8'hba)))} ? (8'h9f) : ((~&((8'hbf) ? (7'h40) : (8'hb1))) ^ ({(8'hac), (7'h44)} >> {(8'hac)}))) <<< (~^{(((8'hb5) >>> (8'ha3)) ? ((7'h41) > (7'h41)) : (~&(8'hb2))), {((8'ha2) ? (8'hae) : (8'hb3)), ((8'hae) - (7'h42))}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire15,
                 wire14,
                 wire13,
                 wire7,
                 wire6,
                 wire5,
                 reg18,
                 reg17,
                 reg16,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(wire1[(3'h7):(1'h1)]);
    end
  assign wire5 = (8'hb3);
  assign wire6 = $signed((wire0 ^~ $signed((wire0 ?
                     (~&wire3) : wire2[(4'hc):(1'h0)]))));
  assign wire7 = (&$signed(wire1[(4'h8):(1'h0)]));
  always
    @(posedge clk) begin
      reg8 <= $unsigned((($unsigned(wire6) >= $signed((wire3 ?
              wire5 : wire1))) ?
          (~&$signed(wire3[(4'h8):(2'h3)])) : wire5));
      reg9 <= {{wire3}};
      reg10 <= {(&wire0[(1'h1):(1'h0)])};
      reg11 <= (reg9 ?
          (~^(reg4 ?
              ({(8'ha7)} << $signed(wire7)) : wire7)) : ($signed((~reg10)) ?
              wire5[(3'h4):(1'h1)] : reg9));
      reg12 <= ({((wire1 ? (reg11 >> wire1) : (reg4 & wire6)) ?
              (wire3 ^~ (reg10 ? (8'hba) : reg10)) : $unsigned((reg4 - reg10))),
          $unsigned(($signed(reg9) <<< (wire7 ?
              wire6 : wire7)))} <= ($unsigned(($unsigned(wire5) >= (~(7'h41)))) ?
          wire2[(1'h0):(1'h0)] : ($unsigned((^~reg9)) ?
              $unsigned((reg11 >>> wire6)) : $unsigned($unsigned(reg11)))));
    end
  assign wire13 = (-wire3[(4'hc):(4'ha)]);
  assign wire14 = wire6;
  assign wire15 = $unsigned((wire6[(4'hc):(4'hb)] ?
                      (reg11[(3'h5):(3'h5)] && $signed($signed(wire14))) : wire7[(3'h6):(3'h5)]));
  always
    @(posedge clk) begin
      if ($unsigned($signed((~&reg12[(3'h4):(1'h1)]))))
        begin
          reg16 <= $unsigned({wire13[(3'h4):(3'h4)]});
          reg17 <= (wire0 ?
              $signed({((wire15 ?
                      reg10 : reg12) == (8'hbc))}) : $unsigned(((~|$unsigned(reg11)) <= (~^(~|wire3)))));
          reg18 <= reg16;
        end
      else
        begin
          reg16 <= $unsigned({(($unsigned((8'ha1)) + (~(8'hbf))) ?
                  (^~(reg12 ? reg8 : reg10)) : $signed({(8'ha1)})),
              (~&(wire3[(4'ha):(2'h3)] ?
                  $signed(wire14) : reg16[(3'h6):(3'h4)]))});
        end
    end
  assign wire19 = (~^(($signed((reg10 & wire14)) ?
                          wire6[(4'h9):(3'h5)] : wire6) ?
                      (^$unsigned((&wire2))) : $signed(((reg9 ?
                              wire14 : wire1) ?
                          {reg12, wire15} : reg11[(5'h11):(3'h5)]))));
  assign wire20 = ($unsigned(wire14) ?
                      $unsigned(($signed($unsigned((8'h9f))) ?
                          $unsigned((8'hbc)) : $signed(wire14))) : (reg8 ?
                          (~(+{wire14,
                              reg8})) : $unsigned($unsigned($unsigned((8'hb0))))));
  assign wire21 = $unsigned({(~^(~^wire14))});
  assign wire22 = (^reg12[(3'h4):(2'h3)]);
  assign wire23 = {wire0[(2'h3):(1'h0)]};
endmodule
