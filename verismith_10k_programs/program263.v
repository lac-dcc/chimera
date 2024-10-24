module top
#(parameter param26 = ((~&(~&(^~((8'ha8) >>> (8'hb8))))) ? ((|(|{(8'hb8), (8'hb6)})) ^~ (-(((8'ha7) >> (8'hb3)) ? {(8'ha9)} : (~&(8'ha3))))) : ((+(+((8'ha1) ? (7'h42) : (8'had)))) ? ((!(~(8'hb1))) ? ({(8'h9e), (8'hb9)} ? ((8'hbd) <= (8'hb2)) : (7'h44)) : (((8'hbc) ? (8'ha9) : (8'h9d)) ? (+(8'hb5)) : ((7'h40) >= (8'ha8)))) : (&(^(-(8'h9f)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire7,
                 wire6,
                 wire5,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (~^(|$signed($signed(wire1[(2'h2):(1'h1)]))));
  assign wire6 = ({{(|wire3[(3'h6):(3'h6)])},
                     wire4[(4'hc):(4'hc)]} > {wire2[(2'h3):(2'h2)]});
  assign wire7 = (wire1[(2'h3):(1'h0)] >>> wire4[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ((+(^~$unsigned((wire7[(2'h2):(2'h2)] != (wire0 ? wire1 : wire3))))))
        begin
          reg8 <= (($unsigned(wire1[(1'h1):(1'h0)]) ?
                  wire6[(2'h3):(1'h1)] : wire7[(1'h0):(1'h0)]) ?
              $signed((~&{(~&wire4)})) : $signed(($unsigned($unsigned(wire2)) ?
                  (wire6[(2'h2):(1'h1)] * $signed(wire0)) : ($signed(wire2) * $unsigned(wire7)))));
        end
      else
        begin
          if (({wire6} ?
              $unsigned(($signed(wire0[(3'h7):(2'h2)]) >= wire5)) : (~^reg8[(2'h2):(1'h0)])))
            begin
              reg8 <= ($unsigned(wire5) ?
                  wire3[(3'h6):(3'h6)] : ((wire7 <<< ($unsigned(wire5) - (wire1 ?
                          (8'hb2) : wire7))) ?
                      {($unsigned((7'h44)) & $signed(wire2)),
                          reg8[(2'h2):(1'h1)]} : (reg8[(1'h1):(1'h0)] ?
                          wire5[(1'h1):(1'h1)] : (|$unsigned(wire4)))));
              reg9 <= $unsigned((({(&wire6), $unsigned(wire7)} ?
                  (wire5[(1'h0):(1'h0)] <<< (wire0 <= wire6)) : wire5[(1'h1):(1'h1)]) && ((~$unsigned(wire2)) ?
                  (wire1[(1'h0):(1'h0)] ?
                      (wire5 ? (8'ha3) : wire0) : ((8'ha5) ?
                          (8'h9d) : wire1)) : {wire7})));
            end
          else
            begin
              reg8 <= $unsigned((wire4[(1'h1):(1'h0)] * wire7[(2'h3):(1'h1)]));
            end
          reg10 <= (~wire7[(1'h0):(1'h0)]);
          if ((wire6 + (~|(!$unsigned($unsigned(wire7))))))
            begin
              reg11 <= $signed({$signed($signed((!(8'ha0))))});
            end
          else
            begin
              reg11 <= $signed(wire0);
              reg12 <= (!$signed($unsigned($unsigned(wire3))));
              reg13 <= reg9;
              reg14 <= {((+(8'hbe)) << (wire5 ?
                      {$signed(reg10), ((8'ha8) ? wire2 : wire1)} : ((reg13 ?
                          reg12 : wire1) ~^ wire0)))};
              reg15 <= (&($unsigned($signed((wire2 ? reg11 : reg9))) ?
                  wire6[(4'ha):(3'h7)] : $unsigned((^~$signed(wire2)))));
            end
          if ($unsigned(reg11[(4'hd):(4'hc)]))
            begin
              reg16 <= ((($unsigned({(7'h40), (7'h42)}) && wire3) ?
                      (^(|$unsigned((8'hb2)))) : (+reg9[(4'hb):(4'hb)])) ?
                  $signed($unsigned(((^reg8) - $signed(wire6)))) : wire3);
              reg17 <= reg10[(2'h2):(2'h2)];
            end
          else
            begin
              reg16 <= {((^$unsigned($signed(reg11))) ?
                      reg16[(1'h1):(1'h0)] : reg17),
                  ($unsigned(wire6[(4'hb):(4'ha)]) <= wire2)};
              reg17 <= ((+reg8) ?
                  ($unsigned({wire3[(1'h0):(1'h0)], $signed(reg17)}) ?
                      {((reg12 <= wire2) <<< (wire0 ?
                              reg11 : reg10))} : wire2) : (($signed($signed(reg17)) ?
                          $signed($unsigned(wire5)) : reg11) ?
                      {$unsigned((&wire5))} : wire4[(2'h3):(2'h3)]));
              reg18 <= (wire4[(2'h3):(2'h3)] & ($unsigned($unsigned((8'hb8))) ~^ reg16));
              reg19 <= ((reg14 >>> reg8[(1'h0):(1'h0)]) << (+($unsigned({reg13}) == (-(wire1 << wire0)))));
              reg20 <= ((($unsigned((reg14 & reg15)) ?
                      reg19 : ($unsigned(wire5) >= (reg11 ? wire6 : wire3))) ?
                  (reg17 > ((^~reg12) & reg17)) : wire2[(1'h0):(1'h0)]) && ((~^$unsigned((reg10 == (8'hbb)))) ?
                  $signed($unsigned(((8'ha4) != wire0))) : (|($unsigned(wire5) ?
                      wire4[(4'h9):(3'h6)] : (~&reg10)))));
            end
        end
      reg21 <= (8'ha0);
    end
  assign wire22 = $signed(wire6);
  assign wire23 = $unsigned($unsigned(wire1[(1'h0):(1'h0)]));
  assign wire24 = reg10;
  assign wire25 = (^reg9);
endmodule
