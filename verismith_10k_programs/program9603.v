module top
#(parameter param84 = (((+((!(8'ha6)) >> ((8'hb6) ? (8'ha1) : (8'hb9)))) ? ((((8'hb4) ? (8'ha2) : (8'hb5)) ? ((8'haf) ? (8'hb2) : (8'ha9)) : ((8'hae) < (8'hae))) ^~ (^((8'hbe) <<< (8'hb2)))) : ((7'h40) ? (^{(8'hab)}) : (8'hbb))) ? ((~{{(8'ha6), (7'h40)}, ((8'hbe) - (8'h9c))}) ? ({((8'hbd) ? (7'h44) : (8'hb8))} <<< (((8'hbd) ? (8'hb6) : (8'ha1)) || (~(8'hb5)))) : ({{(7'h40), (8'ha5)}} != (((8'hbd) - (8'ha1)) ? {(8'h9c), (8'hb0)} : (!(8'ha5))))) : ({(~^{(8'ha5)}), (((7'h41) ? (8'ha2) : (8'ha7)) < (7'h43))} ? ((((8'hb4) >>> (8'ha7)) | ((8'had) <<< (8'h9c))) | (~|(-(8'ha6)))) : (((~^(8'hb0)) < (^~(8'had))) ~^ (((8'h9c) + (8'ha9)) ? {(8'hbd)} : ((8'ha8) ? (8'ha2) : (8'ha2)))))), 
parameter param85 = (((!(-(^~param84))) ? (+((param84 < param84) ? param84 : (param84 ? param84 : param84))) : param84) ? (^param84) : param84))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire82;
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire18,
                 wire26,
                 wire27,
                 wire32,
                 wire33,
                 wire45,
                 wire47,
                 wire82,
                 reg50,
                 reg49,
                 reg48,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = {(wire3 << $signed((^~(wire0 ? wire3 : wire3)))),
                     (~^$signed(((wire2 ?
                         (8'hb9) : wire3) == $unsigned(wire1))))};
  assign wire6 = ((wire3[(1'h0):(1'h0)] || $signed(((7'h41) - wire1[(2'h2):(1'h1)]))) ?
                     wire1 : $signed(wire5[(2'h3):(1'h1)]));
  assign wire7 = ((wire0[(4'hb):(4'h8)] ?
                     (~wire4[(3'h7):(2'h2)]) : wire1[(4'hf):(4'he)]) <= wire6[(4'hd):(4'hb)]);
  assign wire8 = $unsigned($signed((8'hb3)));
  always
    @(posedge clk) begin
      reg9 <= $unsigned(wire0);
      reg10 <= $signed($signed(({(wire3 > wire8),
          (wire5 & wire2)} || (^$unsigned(wire0)))));
      if ($signed(($unsigned(((wire7 - wire6) <= ((8'hb2) ? wire2 : wire4))) ?
          ((wire0[(1'h1):(1'h1)] ? (wire2 * wire2) : reg10[(1'h1):(1'h0)]) ?
              ((|wire2) <= (wire5 ? wire2 : wire0)) : $signed({wire1,
                  wire1})) : ($unsigned((wire4 << (8'ha5))) + wire2))))
        begin
          if ((wire6[(1'h0):(1'h0)] ?
              $signed(wire2[(1'h0):(1'h0)]) : (((^((8'hbc) <<< (8'hb4))) >= $unsigned($unsigned(wire4))) ?
                  (^~({wire8} ? (^~wire0) : $signed(wire4))) : (((!reg9) ?
                          (wire3 ? wire5 : wire7) : {wire5}) ?
                      (&(reg9 ? (8'ha1) : wire8)) : reg10[(1'h1):(1'h0)]))))
            begin
              reg11 <= reg10;
              reg12 <= {wire5, (8'hba)};
              reg13 <= $signed((reg9[(2'h3):(1'h1)] ?
                  reg12[(2'h3):(2'h3)] : $signed(wire7[(4'hf):(4'h9)])));
              reg14 <= $signed((($signed(wire3) ?
                  (wire3[(1'h0):(1'h0)] != $unsigned(wire7)) : reg11[(2'h3):(2'h3)]) ^~ {((8'had) ?
                      (reg13 ? wire5 : wire1) : wire4)}));
            end
          else
            begin
              reg11 <= $signed(wire1);
              reg12 <= (((|($unsigned(reg12) == $unsigned(reg13))) != $unsigned($signed({wire1,
                  wire4}))) <<< $signed(((wire7 ?
                      (|(8'ha1)) : $unsigned((8'hb7))) ?
                  ((wire0 ? reg13 : (8'hbb)) ^~ (wire1 ?
                      wire2 : reg11)) : reg14[(4'hb):(2'h3)])));
              reg13 <= $unsigned(((8'haa) * reg11));
              reg14 <= (wire0 ?
                  ((~($signed(wire1) ~^ $unsigned(wire1))) - {((wire2 ?
                          wire6 : wire8) << $unsigned(reg9)),
                      (|(~|wire5))}) : (reg9 ? wire8 : wire8));
            end
          reg15 <= reg12;
          reg16 <= (^$unsigned(((reg15 ?
              ((8'hab) || wire1) : (|reg10)) <<< $signed(reg11[(4'h8):(3'h4)]))));
        end
      else
        begin
          if ($signed((&$unsigned((~&reg16)))))
            begin
              reg11 <= $unsigned(reg12[(1'h0):(1'h0)]);
              reg12 <= ($signed((reg11[(2'h2):(2'h2)] | (^~wire7[(2'h2):(1'h1)]))) ?
                  $signed(({(wire1 > reg14)} ?
                      (8'h9f) : {(^~reg15),
                          (~wire8)})) : $unsigned(wire6[(1'h0):(1'h0)]));
              reg13 <= (~{reg9[(2'h3):(2'h2)]});
            end
          else
            begin
              reg11 <= ((|(wire6[(3'h7):(3'h4)] < wire2)) ?
                  {$signed($signed((wire5 <= (8'h9f))))} : ({($unsigned(reg14) - (wire2 ^~ wire1))} ?
                      (|$unsigned({(8'hac),
                          reg10})) : (-$unsigned(wire8[(3'h5):(1'h0)]))));
            end
          reg14 <= (!wire7[(3'h6):(3'h5)]);
        end
      reg17 <= (wire8 ? $signed((!(!(-reg14)))) : (|reg14));
    end
  assign wire18 = {($unsigned(((wire7 ? reg10 : reg17) ?
                              $unsigned((8'haf)) : wire6[(4'hf):(4'hd)])) ?
                          (reg11[(3'h6):(2'h3)] ?
                              ((reg13 > wire6) >> $signed(reg12)) : reg17) : (reg13[(1'h0):(1'h0)] ?
                              $unsigned($signed(reg11)) : {(8'h9d),
                                  ((8'hb5) * (8'hb9))}))};
  always
    @(posedge clk) begin
      reg19 <= reg12[(3'h4):(2'h3)];
      if (({$signed((~^((8'hba) && reg16)))} || (($signed($signed(wire6)) ?
              {$signed(wire0), reg14} : (8'had)) ?
          $signed(wire4) : wire6)))
        begin
          reg20 <= $unsigned(reg17[(1'h0):(1'h0)]);
        end
      else
        begin
          if ($unsigned($unsigned($unsigned(((wire0 ?
              reg16 : wire1) != $unsigned(reg11))))))
            begin
              reg20 <= (reg16 & (($signed(reg20) ?
                  $signed((!reg14)) : wire18[(1'h1):(1'h0)]) + (reg9 ?
                  ((reg9 ?
                      reg16 : reg14) & $signed(reg12)) : (^~$signed(reg11)))));
            end
          else
            begin
              reg20 <= (wire0 ?
                  (+(($signed(wire5) ?
                      wire1[(2'h2):(1'h1)] : $unsigned(reg9)) ~^ ((wire5 ?
                          wire4 : wire5) ?
                      (~reg14) : {(8'hae)}))) : (((~$unsigned(reg9)) ?
                      (~^wire8) : {$signed(reg12),
                          {wire3, (8'ha7)}}) | $signed(wire7)));
              reg21 <= $signed($signed($unsigned(({reg20} ?
                  (wire2 ? wire5 : wire3) : (wire18 < reg10)))));
            end
          if ($unsigned($unsigned((wire8[(4'hb):(2'h2)] ^~ reg20))))
            begin
              reg22 <= wire7;
            end
          else
            begin
              reg22 <= $signed($unsigned((-($signed(reg11) ?
                  (&reg21) : (reg21 + reg16)))));
              reg23 <= ((~|$signed($unsigned($signed(wire5)))) * $signed((|wire5[(4'hc):(1'h1)])));
            end
          reg24 <= (~|reg15[(3'h6):(2'h2)]);
          reg25 <= (((reg11[(3'h5):(3'h4)] != ($unsigned(reg19) >= wire8)) ?
                  {reg21[(3'h5):(1'h1)]} : (!(wire5 | ((8'h9f) != wire0)))) ?
              $unsigned((-(~(reg15 * reg11)))) : {$signed(((+wire1) || (wire8 ?
                      reg17 : reg15))),
                  wire4});
        end
    end
  assign wire26 = $signed(($unsigned(($unsigned(reg23) ?
                      (8'hba) : (~^wire8))) | {(&reg17)}));
  assign wire27 = (($unsigned($signed((wire3 << reg13))) >= {(reg19[(1'h0):(1'h0)] ?
                              {reg13, wire1} : $unsigned(reg25))}) ?
                      $signed(($unsigned(((8'hb1) ?
                          wire2 : (8'hb4))) * wire3[(1'h0):(1'h0)])) : ($unsigned({(~|reg14),
                              wire7}) ?
                          (((reg21 ?
                              reg22 : reg15) * wire18) >> reg25) : (8'ha7)));
  always
    @(posedge clk) begin
      reg28 <= wire5[(3'h4):(1'h1)];
      reg29 <= wire26;
      reg30 <= ({reg16[(5'h12):(4'ha)],
          $signed(($signed(wire7) == $unsigned(wire3)))} ~^ reg10);
      reg31 <= ({wire0[(5'h11):(2'h3)]} * $unsigned((reg24[(1'h1):(1'h1)] ?
          {$unsigned(reg13), (wire18 >>> wire27)} : ((reg9 * reg21) ?
              reg19[(3'h7):(3'h7)] : (wire26 <= reg25)))));
    end
  assign wire32 = $unsigned({($unsigned(wire18) ?
                          reg29[(2'h2):(1'h0)] : $unsigned($signed(reg29)))});
  assign wire33 = ($signed(((~^(~reg14)) ?
                      wire26[(1'h1):(1'h1)] : $signed(wire18))) ^ (wire3[(1'h0):(1'h0)] | $signed((^$unsigned(reg15)))));
  module34 #() modinst46 (.wire36(wire6), .wire37(reg21), .wire38(reg13), .clk(clk), .wire35(wire2), .y(wire45));
  assign wire47 = $unsigned((|$signed(reg20[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg48 <= $signed((|{$signed(reg25)}));
      reg49 <= $signed(reg17);
      reg50 <= {$signed(({$unsigned(reg21), $unsigned(reg9)} >> reg21)),
          reg17[(3'h4):(2'h3)]};
    end
  module51 #() modinst83 (wire82, clk, wire18, wire47, reg12, wire26, reg48);
endmodule

module module51  (y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire56;
  input wire signed [(5'h13):(1'h0)] wire55;
  input wire signed [(4'hd):(1'h0)] wire54;
  input wire [(4'hf):(1'h0)] wire53;
  input wire signed [(5'h13):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire76;
  assign y = {wire81, wire80, wire79, wire78, wire76, (1'h0)};
  module57 #() modinst77 (.wire60(wire53), .wire59(wire54), .clk(clk), .y(wire76), .wire58(wire55), .wire61(wire56));
  assign wire78 = (!$unsigned($unsigned((~$unsigned(wire53)))));
  assign wire79 = (~&wire76[(3'h4):(3'h4)]);
  assign wire80 = {((|(~|wire78)) <= {$unsigned(wire56[(4'ha):(1'h0)])}),
                      $unsigned(($unsigned((wire53 - (8'hab))) | ($unsigned(wire56) ?
                          wire55 : (wire54 << wire54))))};
  assign wire81 = (&wire79[(3'h4):(2'h3)]);
endmodule

module module34
#(parameter param43 = {({(((8'ha5) <= (8'had)) & ((8'ha6) ^ (8'hae)))} ? ((&((8'hb2) ? (8'haf) : (8'haf))) ? ({(8'hba)} || ((8'h9f) ? (8'hab) : (8'ha3))) : (~{(8'hbc), (8'ha8)})) : ((((7'h44) <= (8'ha6)) >> ((8'hb3) ? (7'h44) : (8'ha2))) ? ((~^(8'hb2)) ? ((8'haa) || (8'hab)) : ((8'ha0) ? (7'h40) : (8'hbb))) : ({(8'h9e)} ? {(8'ha6)} : ((7'h40) ? (8'hb6) : (8'ha1))))), (((8'had) >= (((7'h44) ? (8'hb4) : (8'haf)) <<< (^(8'hae)))) & ((((8'hb9) ? (8'hbd) : (8'h9c)) ^~ (^~(8'hb8))) ? (((8'hb7) >= (8'had)) ^ ((8'hb3) ? (8'h9d) : (8'haf))) : (7'h43)))}, 
parameter param44 = param43)
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire38;
  input wire signed [(5'h13):(1'h0)] wire37;
  input wire signed [(4'hc):(1'h0)] wire36;
  input wire [(3'h4):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  assign y = {wire42, wire41, wire40, wire39, (1'h0)};
  assign wire39 = $signed($signed(((~|((8'ha5) ?
                      (8'hb7) : wire37)) > (~(wire35 ^ wire37)))));
  assign wire40 = (~^(wire37[(3'h7):(2'h2)] ?
                      ((+$unsigned(wire35)) != {$signed(wire38)}) : wire38[(3'h4):(2'h2)]));
  assign wire41 = wire35;
  assign wire42 = $signed((wire36 | ((wire41[(4'ha):(2'h3)] ?
                          $unsigned(wire41) : $signed(wire41)) ?
                      (|(wire41 & wire41)) : {(wire37 ^~ wire37)})));
endmodule

module module57
#(parameter param75 = ((~|((((8'ha5) ? (7'h42) : (8'hb1)) ? (8'haf) : {(8'hbf), (8'hb5)}) || (~|(~(8'hb3))))) >>> ((~^(((8'hb0) | (8'hbb)) >> ((8'hae) ? (8'ha2) : (8'hb5)))) ? ((~&((8'ha1) <= (7'h44))) < (~^((8'hb2) ~^ (8'had)))) : (~&((8'hb9) ? (-(8'ha6)) : ((8'ha4) ? (8'hb8) : (8'hbc)))))))
(y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire61;
  input wire [(4'hd):(1'h0)] wire60;
  input wire [(4'hd):(1'h0)] wire59;
  input wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 (1'h0)};
  assign wire62 = ($signed($unsigned($signed({wire58}))) ?
                      $signed($unsigned((wire58 ?
                          (7'h41) : ((8'hbb) ~^ wire61)))) : {$unsigned(($unsigned(wire60) ?
                              $signed(wire60) : {(7'h43), wire59}))});
  assign wire63 = wire61[(4'h8):(3'h6)];
  assign wire64 = (~|wire59);
  assign wire65 = ({wire64[(4'ha):(4'h9)]} ?
                      wire64[(1'h1):(1'h1)] : $signed((wire58 ?
                          ((&wire64) >= wire63[(1'h1):(1'h1)]) : {$signed(wire64)})));
  assign wire66 = wire65;
  assign wire67 = {(^(((wire58 ? wire63 : wire66) < $signed(wire58)) ?
                          wire66[(1'h0):(1'h0)] : $unsigned($unsigned(wire63)))),
                      {$signed(wire62[(3'h5):(1'h0)])}};
  assign wire68 = wire58;
  assign wire69 = wire61;
  assign wire70 = $signed((~$unsigned((8'hb0))));
  assign wire71 = $unsigned($unsigned((-(~^$unsigned(wire65)))));
  assign wire72 = ($signed(wire67[(2'h3):(2'h3)]) < ((~^($unsigned(wire65) ?
                          ((8'hb0) || wire58) : $signed(wire60))) ?
                      $unsigned((~^(wire58 ?
                          wire60 : wire59))) : (^~wire68[(4'h9):(1'h1)])));
  assign wire73 = $signed((~^wire62));
  assign wire74 = wire58[(4'hd):(3'h4)];
endmodule
