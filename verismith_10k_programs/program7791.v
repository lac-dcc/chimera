module top
#(parameter param92 = ((~|((~^((7'h44) ^ (8'haf))) ? (!((7'h41) ? (8'hb9) : (7'h40))) : {(|(8'hb2)), ((8'hbd) ? (8'hbe) : (8'hbe))})) >> ((&{{(8'ha1), (8'h9c)}, ((8'hb5) ? (8'hbd) : (8'hb6))}) != (8'hb3))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire85;
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire5,
                 wire6,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire85,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned($signed({wire2, $signed(wire4)})));
  assign wire6 = $signed(((&wire4) ^ ($unsigned((wire1 ^ wire3)) >= (|(^~wire2)))));
  always
    @(posedge clk) begin
      if ({(+wire0)})
        begin
          reg7 <= wire1;
          if ($signed((($signed((wire2 ?
                  (8'hb6) : (8'ha7))) < ((wire3 && (8'hba)) * wire1)) ?
              ($signed(wire6[(3'h6):(3'h4)]) - $unsigned({reg7})) : wire2)))
            begin
              reg8 <= $unsigned(wire3[(3'h7):(3'h4)]);
              reg9 <= (wire1[(3'h4):(3'h4)] != (reg7 < (((reg8 | reg7) ?
                  {reg8, wire0} : $unsigned(reg8)) != ((reg8 < wire1) ?
                  $unsigned(reg8) : $signed(wire5)))));
              reg10 <= (!wire4);
              reg11 <= ((-(^wire4[(2'h3):(1'h1)])) ?
                  reg10 : $unsigned((wire4[(2'h2):(2'h2)] * {$signed(reg8),
                      $signed(reg7)})));
              reg12 <= reg8[(4'ha):(1'h1)];
            end
          else
            begin
              reg8 <= (~&wire5);
              reg9 <= (~&$signed($unsigned((8'ha4))));
              reg10 <= $signed(wire6[(3'h4):(2'h3)]);
              reg11 <= ($signed({(&(|(8'hac)))}) ?
                  wire3[(3'h6):(2'h2)] : ({$signed(reg11),
                      ($unsigned(reg11) ?
                          (7'h44) : (wire1 ? reg10 : reg7))} ^~ wire2));
              reg12 <= (~&reg9);
            end
          reg13 <= wire5;
          reg14 <= $unsigned($signed(reg11));
          reg15 <= $signed((~^($signed(wire1) * reg8)));
        end
      else
        begin
          reg7 <= reg8[(4'h8):(1'h0)];
          reg8 <= reg10;
          reg9 <= $unsigned((!{$unsigned(reg14[(4'h9):(3'h6)]),
              (reg14 ? $signed(wire6) : (+(8'ha9)))}));
          if ((^$signed(wire5)))
            begin
              reg10 <= (&wire3);
              reg11 <= wire1[(1'h1):(1'h1)];
              reg12 <= (~&reg15);
            end
          else
            begin
              reg10 <= reg11[(1'h0):(1'h0)];
              reg11 <= $unsigned((($signed((+wire1)) + (&{(8'ha1)})) && {reg14,
                  ($unsigned(wire0) < (|reg13))}));
              reg12 <= $unsigned($signed((((wire0 ?
                  reg12 : reg8) >>> (wire3 & (8'hb8))) >> (reg11 ?
                  wire4[(2'h3):(2'h3)] : (reg14 ? wire1 : reg9)))));
              reg13 <= ($unsigned((^$unsigned({wire6}))) - {$signed(wire4),
                  wire3[(4'ha):(4'h9)]});
            end
        end
      reg16 <= $unsigned({(($unsigned(wire6) << wire3[(3'h4):(2'h2)]) >= $signed((reg9 ?
              reg11 : reg10)))});
      reg17 <= (+reg8[(3'h7):(1'h1)]);
      reg18 <= {reg7[(5'h11):(2'h2)]};
      reg19 <= $signed(wire1[(2'h3):(1'h1)]);
    end
  assign wire20 = (~^(reg7 ?
                      (8'hae) : $signed(((reg16 < reg8) ?
                          (~(8'hab)) : (reg10 && reg18)))));
  assign wire21 = ($unsigned(($unsigned({(8'hb4)}) ?
                      ((+reg10) ?
                          (~reg13) : $signed(reg12)) : (8'ha4))) == reg7[(1'h1):(1'h0)]);
  assign wire22 = wire0[(3'h7):(1'h1)];
  assign wire23 = $unsigned($unsigned((&$signed(wire6[(3'h5):(2'h2)]))));
  assign wire24 = ((wire1 ?
                          ((|wire0[(3'h4):(2'h2)]) ?
                              reg9[(3'h6):(3'h5)] : {$unsigned(wire5)}) : (wire20[(5'h11):(1'h0)] > (8'h9d))) ?
                      wire6[(2'h2):(1'h0)] : $signed(wire2));
  assign wire25 = $signed(reg7);
  assign wire26 = $unsigned(($signed(wire1) != wire0));
  assign wire27 = ((|reg19[(2'h3):(1'h1)]) ?
                      (reg19[(3'h5):(1'h0)] >>> (+$unsigned((wire0 && reg14)))) : $unsigned((^~(+((7'h42) <= wire5)))));
  module28 #() modinst86 (.wire29(reg7), .wire31(wire5), .y(wire85), .wire30(wire26), .clk(clk), .wire32(wire1));
  assign wire87 = reg17;
  assign wire88 = (wire21[(4'ha):(3'h7)] ?
                      ({(~reg18[(1'h0):(1'h0)]), {$signed(wire6), wire5}} ?
                          (8'hbe) : (7'h41)) : $unsigned($unsigned($unsigned((+(7'h40))))));
  assign wire89 = ((wire87 && (wire22[(1'h1):(1'h1)] * ($unsigned(reg13) ?
                          wire26[(1'h1):(1'h0)] : $unsigned(reg16)))) ?
                      ((wire1 ?
                              ((wire5 ^~ reg18) ?
                                  $signed(wire87) : (~|reg15)) : $signed(wire21[(3'h6):(3'h6)])) ?
                          (&wire2[(4'hd):(2'h2)]) : $signed(reg15)) : {{wire2,
                              wire21[(4'ha):(4'h9)]},
                          $signed(reg16[(4'h9):(2'h3)])});
  assign wire90 = reg12[(4'hb):(2'h3)];
  assign wire91 = (reg10[(1'h0):(1'h0)] - $signed($unsigned($signed(reg13[(1'h0):(1'h0)]))));
endmodule

module module28
#(parameter param84 = (((~^((&(8'hb8)) ? (~&(8'hb1)) : (~^(7'h42)))) <= (({(8'hb4)} >>> {(8'ha6), (8'hb1)}) << (~&{(8'hb0), (8'h9e)}))) ? {(((~(7'h41)) ? {(8'hab), (7'h42)} : ((8'hae) ~^ (8'hb4))) ? (8'ha1) : (((8'hbf) ? (8'hb8) : (8'ha1)) + (~(8'hb5)))), (-((!(8'hab)) > ((7'h44) ? (8'hae) : (7'h40))))} : ({(((8'ha1) * (8'h9f)) ? (!(8'ha1)) : ((8'haf) ? (8'hae) : (7'h40))), ({(8'h9d), (8'hb1)} ? ((8'haa) ? (7'h44) : (8'h9e)) : (-(8'hbb)))} ^ {{((8'ha7) | (8'hb2))}, (8'hba)})))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  input wire [(5'h11):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire73;
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire73,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  module33 #() modinst74 (.wire34((8'hab)), .y(wire73), .wire35(wire32), .clk(clk), .wire37(wire29), .wire36(wire31), .wire38(wire30));
  always
    @(posedge clk) begin
      reg75 <= ($unsigned(($unsigned({wire30, wire32}) ?
              ((wire73 << wire73) ?
                  $signed(wire29) : (^wire73)) : wire31[(3'h4):(1'h1)])) ?
          (($signed({wire73}) < $signed((wire32 >= wire29))) ?
              {(&$unsigned(wire30)),
                  ((~^wire30) & (&(8'hb0)))} : $signed(wire31)) : $signed(wire32[(4'h8):(3'h6)]));
      if ($unsigned((wire29[(4'hf):(4'h8)] ?
          (^~((+wire29) ? wire31[(4'hc):(4'ha)] : $signed(reg75))) : wire73)))
        begin
          reg76 <= (~^$signed($unsigned((((8'hbb) || wire31) ?
              $signed(wire30) : {wire31, wire32}))));
          reg77 <= {$signed(($unsigned((wire29 ? wire29 : (8'hab))) ?
                  reg76 : $unsigned({wire73, wire31}))),
              ({((wire29 <= wire73) ? ((8'ha3) - wire29) : (~^reg76))} ?
                  wire29 : ((~^(~|wire29)) < (8'h9f)))};
        end
      else
        begin
          reg76 <= wire73;
          reg77 <= $signed({$unsigned(wire32[(4'hd):(4'hd)])});
        end
    end
  assign wire78 = ({$unsigned($signed($unsigned(wire29))),
                      {(wire29[(5'h14):(5'h12)] != (reg75 - reg77)),
                          $unsigned($unsigned(reg77))}} | ((($signed(wire31) >= $signed((8'hba))) ^~ wire32[(4'h8):(3'h4)]) >= reg77[(2'h2):(1'h0)]));
  assign wire79 = ((~(!(+wire31))) ?
                      wire32[(1'h1):(1'h1)] : ($signed(wire29) << wire29));
  assign wire80 = $signed($unsigned($unsigned(((wire73 < wire32) ^~ (wire79 ?
                      reg75 : wire29)))));
  assign wire81 = $unsigned({((~wire78) ?
                          ({wire73} ^ $unsigned(wire31)) : $unsigned((reg76 ^~ wire30))),
                      $signed($signed(reg77[(3'h7):(3'h7)]))});
  assign wire82 = $signed(({((wire30 ? wire31 : wire79) ?
                          $unsigned(wire80) : (wire80 ?
                              wire29 : wire32))} * $signed({(-(8'ha5)),
                      $signed(wire30)})));
  assign wire83 = wire32[(1'h1):(1'h0)];
endmodule

module module33
#(parameter param72 = (({((+(8'ha4)) ^ (^(8'hbe)))} ? ((((8'hb7) ? (8'hbb) : (8'hb8)) ? ((8'hba) - (8'ha4)) : (!(8'hba))) - (((8'h9d) ^~ (8'hb7)) ? ((8'hbf) | (7'h44)) : (^(8'hb9)))) : ((((8'hb6) >>> (8'hac)) | ((8'ha1) <<< (8'had))) ? ((~(8'ha9)) ? {(8'hbf), (7'h43)} : (!(7'h41))) : (!((8'hab) >> (8'ha4))))) && (^~(({(8'hba), (8'haa)} ? ((8'ha3) == (8'hbb)) : (-(8'hab))) ? ((~|(7'h43)) ^ ((8'ha4) < (8'h9f))) : (-{(8'hbb)})))))
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire38;
  input wire signed [(4'hb):(1'h0)] wire37;
  input wire [(5'h13):(1'h0)] wire36;
  input wire signed [(4'h9):(1'h0)] wire35;
  input wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire41,
                 wire40,
                 wire39,
                 reg68,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire39 = wire36[(4'hd):(3'h4)];
  assign wire40 = wire39[(1'h1):(1'h1)];
  assign wire41 = (!wire36[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ($signed((!(wire39 ? {wire36, (8'ha4)} : $unsigned((&wire40))))))
        begin
          reg42 <= wire37;
        end
      else
        begin
          reg42 <= $unsigned((((^~wire36[(5'h10):(4'hd)]) || $signed($unsigned((8'ha5)))) ^ (wire35[(4'h8):(1'h1)] ^~ $signed(((8'ha5) ?
              (8'hb7) : wire34)))));
          reg43 <= $signed($unsigned(((8'ha5) ?
              $signed($signed(wire34)) : wire37)));
        end
      reg44 <= $unsigned((~&$signed((&wire38[(3'h4):(2'h3)]))));
      reg45 <= ((+$unsigned((reg42 ?
          (-wire37) : (wire39 >>> wire35)))) - (!{reg42[(2'h2):(1'h0)],
          (wire41 ? (reg44 + reg44) : reg43)}));
      if (wire39)
        begin
          reg46 <= $unsigned(($signed((!$unsigned(wire41))) ~^ (^(~&(~^reg44)))));
          reg47 <= wire41;
          reg48 <= (&$signed((($unsigned((8'hb7)) ?
              $unsigned(reg46) : $signed(reg46)) ~^ {$signed(wire37),
              (+wire40)})));
          if (wire38[(1'h1):(1'h1)])
            begin
              reg49 <= reg45[(3'h6):(1'h1)];
              reg50 <= {wire38, $unsigned(reg48)};
            end
          else
            begin
              reg49 <= $signed(((!$signed(wire35)) ?
                  (^~(reg49 ?
                      (reg46 ?
                          (8'ha9) : reg42) : $unsigned(reg44))) : ($signed($signed(wire39)) || wire36[(3'h6):(3'h6)])));
              reg50 <= (((reg47[(4'hb):(1'h0)] ?
                      ($signed((7'h42)) ?
                          $signed(reg49) : wire36) : (~&(^wire37))) == ($signed((wire35 - (8'hb4))) ^ wire37[(3'h4):(2'h3)])) ?
                  ($signed(reg45[(2'h2):(1'h0)]) ?
                      {$signed((reg48 | reg42))} : (reg44 ?
                          reg49 : (wire36 ?
                              wire39 : (reg42 ~^ reg46)))) : ((8'haf) ?
                      (~^reg42) : wire38[(3'h7):(2'h2)]));
            end
          reg51 <= $signed($signed($unsigned(wire40)));
        end
      else
        begin
          reg46 <= reg42;
          reg47 <= $signed((((+reg47) ?
                  ($signed(wire35) ?
                      $unsigned((8'hac)) : (reg49 ?
                          (8'hbe) : reg50)) : ((wire37 ? reg46 : (8'hb9)) ?
                      $signed(wire41) : reg43)) ?
              reg46 : $signed(wire36)));
          reg48 <= $unsigned(reg50);
          reg49 <= (-($unsigned(((reg46 ^~ (8'ha2)) >>> wire40)) ?
              (reg44 ?
                  ({wire41} - $unsigned(reg50)) : (~^(reg44 >> reg44))) : (~&((wire39 || reg46) >> wire34[(1'h0):(1'h0)]))));
        end
      if ($signed((reg43[(5'h13):(3'h7)] ?
          ((~&(^~wire35)) ?
              (~^(wire38 ? (8'ha4) : reg50)) : (!(reg48 ?
                  wire36 : reg46))) : $signed(((~&wire40) ?
              $signed(reg43) : (&(8'hab)))))))
        begin
          reg52 <= (^~wire39[(3'h4):(3'h4)]);
          reg53 <= {$unsigned(wire40), (~|reg49[(3'h6):(3'h6)])};
          if (reg50[(4'hd):(4'hc)])
            begin
              reg54 <= (^~$signed((~$signed((wire34 ? wire40 : (8'hab))))));
            end
          else
            begin
              reg54 <= reg48[(1'h0):(1'h0)];
            end
          reg55 <= wire36[(1'h0):(1'h0)];
        end
      else
        begin
          reg52 <= reg45[(3'h4):(1'h0)];
        end
    end
  assign wire56 = $unsigned($unsigned(($unsigned((reg42 ? reg44 : wire35)) ?
                      wire38[(4'h9):(3'h5)] : reg45[(3'h5):(2'h3)])));
  assign wire57 = reg48;
  assign wire58 = reg55;
  assign wire59 = ($unsigned((^~($unsigned((8'hae)) + (~^wire39)))) ?
                      $unsigned((+$unsigned($signed(reg43)))) : (&($unsigned((-wire38)) ?
                          {(-wire34)} : {{wire56}, wire35[(2'h3):(2'h2)]})));
  assign wire60 = $unsigned(wire40[(2'h3):(2'h2)]);
  assign wire61 = wire36;
  assign wire62 = reg42;
  assign wire63 = $unsigned((((~$unsigned(reg52)) << $unsigned($unsigned(wire59))) <= $unsigned(reg46)));
  assign wire64 = (7'h44);
  assign wire65 = wire38[(3'h6):(1'h0)];
  assign wire66 = $unsigned($unsigned(reg42[(3'h5):(1'h0)]));
  assign wire67 = wire66[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg68 <= ((+(|(reg52[(1'h1):(1'h0)] <<< (wire35 + reg54)))) ?
          (((-$signed(reg42)) ^ ((reg48 != wire60) ?
                  (wire66 + (8'hb5)) : (&wire64))) ?
              $unsigned((reg44[(1'h0):(1'h0)] ?
                  $unsigned(wire40) : (wire65 << wire58))) : (~$unsigned((reg50 && wire34)))) : wire35);
    end
  assign wire69 = {reg43[(4'hc):(4'hb)]};
  assign wire70 = {{(!(8'ha4))}};
  assign wire71 = (~^(reg49 ?
                      (^((wire35 == wire58) ?
                          (reg54 ?
                              wire38 : wire37) : (reg51 >> wire57))) : (wire41 ?
                          (wire34[(1'h1):(1'h0)] ?
                              reg55 : (wire65 ? reg46 : wire64)) : reg54)));
endmodule
