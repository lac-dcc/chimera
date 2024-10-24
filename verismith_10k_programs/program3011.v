module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire48;
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire5,
                 wire6,
                 wire7,
                 wire13,
                 wire14,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire48,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = (($signed(wire3[(5'h12):(2'h2)]) ?
                         wire2 : wire4[(3'h4):(3'h4)]) ?
                     ($signed(wire4[(3'h6):(3'h4)]) ?
                         wire4 : $signed((~(8'ha5)))) : $signed(wire3[(1'h1):(1'h0)]));
  assign wire7 = wire5[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg8 <= (~&(~^$signed(wire3[(2'h2):(2'h2)])));
      reg9 <= ((~$signed((-(wire0 ? reg8 : wire2)))) + $unsigned(wire2));
      reg10 <= (~^(8'hb9));
      reg11 <= {(~&reg9[(1'h1):(1'h0)]),
          ((-$unsigned((-wire1))) == (reg9 << ((reg10 ? reg10 : reg10) ?
              (wire7 ~^ reg10) : reg8[(3'h5):(2'h2)])))};
      reg12 <= $signed(($unsigned(wire4) & ({((8'hb8) ? wire6 : wire7),
          wire5[(2'h2):(1'h1)]} - wire5[(4'h9):(1'h0)])));
    end
  assign wire13 = ($signed((reg11[(1'h0):(1'h0)] ?
                      $signed((wire4 <<< wire6)) : (reg11[(1'h0):(1'h0)] <= (reg8 >= wire5)))) <<< $unsigned((wire7 ^~ (8'h9f))));
  assign wire14 = (($unsigned((~^{reg9, wire13})) + wire4[(2'h2):(1'h1)]) ?
                      $signed(($signed($signed(wire0)) ?
                          $signed((~|wire5)) : reg12)) : ((^~((reg8 ?
                              wire0 : wire13) ?
                          (wire1 ? wire2 : wire4) : (reg9 ?
                              reg9 : wire13))) && (wire1 <= wire0[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      reg15 <= ({(^$signed($signed(reg10)))} < (-(~&wire1)));
      reg16 <= (~&($unsigned(reg9[(1'h0):(1'h0)]) ?
          wire3 : wire14[(4'hd):(3'h7)]));
      if (wire0[(2'h3):(1'h1)])
        begin
          if (reg10[(3'h5):(3'h5)])
            begin
              reg17 <= $signed((reg15[(5'h10):(4'ha)] || $signed((reg16 ~^ ((8'hbf) ?
                  wire5 : wire7)))));
              reg18 <= reg15;
              reg19 <= ((((&$signed(reg11)) ?
                          $unsigned(wire13[(3'h4):(2'h2)]) : $unsigned((|reg12))) ?
                      ({(wire2 ? (8'ha6) : reg9), {reg15, (8'h9c)}} ?
                          ({reg16, reg18} ?
                              (wire7 | reg11) : (wire7 ?
                                  reg16 : wire5)) : $signed(wire13[(2'h3):(1'h0)])) : reg15) ?
                  (~^($unsigned((wire5 ?
                      wire4 : reg11)) + $signed((~&(8'h9d))))) : (~&($unsigned((reg16 ?
                      reg12 : wire6)) >= {$signed(wire2), $unsigned(wire13)})));
            end
          else
            begin
              reg17 <= (8'ha5);
              reg18 <= (wire0[(1'h0):(1'h0)] ?
                  ($signed(({reg8,
                      reg18} | {wire3})) ^~ wire2) : (reg16 >> ($signed($signed(wire7)) > (wire14 <<< (~&wire0)))));
              reg19 <= ((^~wire6[(3'h7):(1'h0)]) | (reg10[(1'h0):(1'h0)] ?
                  ((wire3 ? reg17 : reg12) ?
                      ((reg15 >> reg18) ?
                          $signed(wire6) : (&reg17)) : $signed((wire4 >> reg11))) : wire0));
            end
          reg20 <= {$signed(reg11), wire14[(3'h4):(1'h0)]};
          if ((^~$signed(reg18[(1'h1):(1'h0)])))
            begin
              reg21 <= {($unsigned($unsigned((^wire3))) && (((8'hbb) ~^ (~(8'hb2))) ^~ $signed($unsigned(wire6))))};
            end
          else
            begin
              reg21 <= $signed($signed(wire4[(3'h7):(1'h1)]));
              reg22 <= ((~$signed((+$unsigned(reg19)))) ?
                  reg15[(4'hd):(1'h0)] : (7'h41));
            end
          reg23 <= $unsigned(wire0);
          reg24 <= ($unsigned(reg20) ?
              (({$signed(reg11)} ?
                      $unsigned((wire7 ~^ wire7)) : $signed(wire13[(2'h2):(2'h2)])) ?
                  $signed({wire4[(3'h4):(1'h1)],
                      $signed(wire14)}) : $unsigned(reg16)) : (($signed({reg12}) && $signed((reg23 ~^ reg19))) ?
                  (^~wire7[(3'h5):(3'h5)]) : $signed(($signed(wire6) <<< $unsigned(wire7)))));
        end
      else
        begin
          reg17 <= $signed($unsigned(reg11));
          reg18 <= $unsigned(wire13);
          reg19 <= reg24;
          if ($unsigned($unsigned(reg12[(1'h0):(1'h0)])))
            begin
              reg20 <= (!{(($unsigned(wire0) ?
                      {(8'ha5), (8'hbc)} : (~^wire2)) - ((reg19 ?
                          reg21 : reg15) ?
                      {reg22} : (wire13 ? wire1 : reg11))),
                  $signed(((~^reg9) & $unsigned(reg12)))});
              reg21 <= $unsigned(($signed(wire14[(5'h15):(4'ha)]) ?
                  wire7 : (-(&(wire4 <<< reg22)))));
            end
          else
            begin
              reg20 <= $signed(reg21[(1'h0):(1'h0)]);
              reg21 <= ({$signed((~((8'hbd) ? wire1 : (8'hb0))))} ?
                  $unsigned(wire0) : reg21);
              reg22 <= (|$unsigned(wire5[(4'h8):(1'h0)]));
              reg23 <= ($signed(reg23[(1'h0):(1'h0)]) || (+{(~&(+reg22))}));
            end
          reg24 <= wire5;
        end
    end
  assign wire25 = {((8'hb2) ?
                          (reg16[(3'h4):(1'h1)] ?
                              (~&(reg17 > (8'ha5))) : $signed((reg16 ~^ (8'ha8)))) : {$signed({reg16})})};
  assign wire26 = $unsigned(((+{(wire0 ^~ (8'hb2))}) ?
                      {reg19,
                          {$signed(wire0),
                              reg15[(4'hb):(4'h8)]}} : $unsigned((reg21[(1'h0):(1'h0)] & wire6[(1'h0):(1'h0)]))));
  assign wire27 = $unsigned($signed((((~(8'hbc)) ? (!reg8) : $signed(wire7)) ?
                      ((reg15 ?
                          wire7 : wire25) ^~ (reg17 << reg19)) : $unsigned((wire14 - reg21)))));
  assign wire28 = {((^~reg19) ?
                          (~wire27) : (!((reg18 ?
                              wire0 : (8'hbd)) ~^ (~&(7'h40))))),
                      (-wire25[(3'h6):(1'h1)])};
  assign wire29 = wire3;
  assign wire30 = (~|(|(^~(+reg15))));
  assign wire31 = wire0;
  assign wire32 = wire6[(3'h6):(3'h5)];
  assign wire33 = (&(-{reg21[(2'h2):(1'h1)],
                      ((reg20 ? reg11 : wire5) == $signed(wire32))}));
  module34 #() modinst49 (wire48, clk, reg11, reg17, reg20, wire14, reg22);
  assign wire50 = {$unsigned($unsigned($unsigned((reg8 * reg20))))};
  assign wire51 = $signed(reg22);
  assign wire52 = {$signed((($unsigned(wire48) ?
                          (~&wire31) : wire25[(3'h6):(1'h0)]) ^ (^$unsigned(wire7)))),
                      $signed(($signed(((8'haf) ?
                          (8'hb8) : reg20)) == wire14[(3'h5):(1'h0)]))};
endmodule

module module34
#(parameter param47 = ((((-{(8'hae), (8'hae)}) ? (((8'haa) >> (8'ha2)) ? (!(8'hb6)) : ((8'hb0) >> (8'hab))) : (!(^(8'hae)))) ? ({((8'hb2) ^ (7'h40))} ? (((8'hbd) - (8'hb9)) ? (&(8'haa)) : ((7'h44) ? (8'had) : (8'hbb))) : ((~^(8'hb6)) ~^ (+(8'h9f)))) : ((((8'hb6) ? (8'hb2) : (8'ha7)) ? {(8'hb4)} : ((8'h9f) << (8'hbc))) ? (((8'hbc) > (7'h44)) >= ((7'h42) >>> (8'hab))) : ((!(7'h44)) ? (~|(8'hb2)) : ((8'hb4) ? (8'h9c) : (8'hbf))))) == (((~&(&(8'hb9))) ? ((^(8'ha2)) ^ ((8'hb8) == (8'haa))) : {(~&(8'hb2)), {(8'ha6)}}) ? ((^((7'h40) == (8'ha2))) ^ (((7'h43) < (8'haa)) ? ((8'hbd) ? (8'hbb) : (8'ha4)) : ((8'ha1) ? (8'haa) : (8'hae)))) : ((&(~|(8'hba))) >>> (^~{(8'hbc)})))))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire39;
  input wire [(5'h11):(1'h0)] wire38;
  input wire [(4'hb):(1'h0)] wire37;
  input wire [(3'h4):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  assign y = {wire46, wire45, wire44, wire42, wire41, wire40, reg43, (1'h0)};
  assign wire40 = $unsigned(wire35[(4'hc):(3'h7)]);
  assign wire41 = wire35[(4'hf):(4'he)];
  assign wire42 = wire38;
  always
    @(posedge clk) begin
      reg43 <= (^~($unsigned(wire35[(5'h11):(4'hd)]) ?
          ({$unsigned(wire40), wire40} ?
              wire41[(3'h5):(2'h3)] : wire40[(4'he):(3'h7)]) : wire38[(1'h1):(1'h0)]));
    end
  assign wire44 = wire38;
  assign wire45 = wire37[(4'h8):(3'h5)];
  assign wire46 = $unsigned($unsigned(wire38));
endmodule
