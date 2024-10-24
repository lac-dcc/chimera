module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1d5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire238;
  wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire232;
  wire signed [(3'h6):(1'h0)] wire234;
  wire signed [(5'h12):(1'h0)] wire235;
  wire signed [(4'hb):(1'h0)] wire236;
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  assign y = {wire238,
                 wire12,
                 wire29,
                 wire30,
                 wire31,
                 wire232,
                 wire234,
                 wire235,
                 wire236,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3[(4'ha):(4'h8)];
      if (((wire3[(4'ha):(3'h5)] ^~ $unsigned((&((8'hbc) ~^ reg5)))) >>> (^$unsigned(({wire0} ?
          $unsigned(wire0) : $signed((8'hbb)))))))
        begin
          reg6 <= (^wire0[(3'h5):(3'h5)]);
        end
      else
        begin
          reg6 <= $signed(wire2);
          reg7 <= wire3[(1'h1):(1'h0)];
          reg8 <= ({wire0[(1'h1):(1'h0)],
                  (wire4[(4'h9):(1'h0)] + $signed({wire2}))} ?
              ($signed($unsigned(wire2[(3'h4):(2'h2)])) >> (wire1[(1'h1):(1'h0)] ?
                  (~&$unsigned(wire0)) : wire4[(3'h7):(2'h2)])) : $unsigned((wire4[(1'h1):(1'h1)] ~^ (-reg7))));
          reg9 <= (reg8 >> {$signed(wire1[(1'h1):(1'h0)])});
          reg10 <= wire3;
        end
      reg11 <= ((^~(&reg10)) ?
          $signed({reg7[(1'h1):(1'h1)],
              (^~$signed(reg10))}) : ({(!$unsigned(reg9)),
              $unsigned($unsigned(reg10))} != $signed(((wire2 < reg5) > (reg9 ?
              wire3 : reg10)))));
    end
  assign wire12 = (wire2 != (wire0 ? {$unsigned((~^(8'hac)))} : wire2));
  always
    @(posedge clk) begin
      reg13 <= reg11;
      reg14 <= $unsigned((|reg11[(1'h1):(1'h0)]));
      if ((($signed((wire3 || wire3[(4'h9):(1'h1)])) && reg8) ?
          $signed(reg8[(1'h0):(1'h0)]) : ($unsigned($signed((~reg7))) ^ reg11[(1'h0):(1'h0)])))
        begin
          reg15 <= {(&$unsigned(reg9[(3'h4):(1'h0)]))};
          if (($signed(wire12[(1'h0):(1'h0)]) ?
              ($signed($signed(((8'h9e) ?
                  reg5 : (8'hb0)))) >= (~&reg8)) : (reg5 << $signed(((reg13 >= wire0) ?
                  (reg7 << (8'hbb)) : $unsigned((8'hb1)))))))
            begin
              reg16 <= ($unsigned($unsigned(reg15[(5'h12):(4'ha)])) <<< ($unsigned($unsigned($signed(reg9))) ?
                  $unsigned(reg14) : (({reg10, wire4} ~^ {wire4, wire2}) ?
                      reg6[(4'hc):(4'ha)] : wire0[(2'h2):(1'h1)])));
              reg17 <= ((reg10[(2'h2):(1'h0)] * (($unsigned(wire4) - (reg9 ?
                  wire1 : reg9)) - (reg8[(1'h1):(1'h0)] || {reg16,
                  wire12}))) - (~|($unsigned({reg9}) ?
                  (8'had) : $signed({wire2}))));
              reg18 <= $signed((reg11 ?
                  wire4 : ($signed((&wire0)) >> (((8'hb3) ?
                      reg17 : reg8) ^ $signed(wire1)))));
              reg19 <= wire4[(5'h10):(3'h6)];
              reg20 <= (^~((((wire4 ? (8'hb0) : reg13) ?
                      $unsigned(reg15) : (reg11 * wire1)) ?
                  $unsigned($signed(reg15)) : ((+(8'hb7)) ?
                      {reg8, wire1} : reg18)) + reg17));
            end
          else
            begin
              reg16 <= ($signed(reg13[(1'h0):(1'h0)]) ?
                  $signed((-$signed($unsigned(reg20)))) : reg9);
            end
          reg21 <= $signed((wire2[(2'h3):(1'h1)] > reg5));
          if (($signed(reg5) | wire4[(4'ha):(3'h4)]))
            begin
              reg22 <= reg13[(1'h0):(1'h0)];
              reg23 <= reg9;
              reg24 <= ($signed((wire0[(1'h0):(1'h0)] ?
                      (((8'ha0) ? wire1 : reg13) ?
                          (wire0 ?
                              reg10 : wire3) : reg19[(4'ha):(2'h3)]) : (reg5 <= (8'hb5)))) ?
                  (reg6[(2'h3):(1'h0)] ?
                      (|$signed((wire4 ? wire4 : reg5))) : (((reg20 << wire4) ?
                              (reg9 && (8'ha1)) : (|reg17)) ?
                          $unsigned(wire12[(4'ha):(4'h9)]) : ($unsigned((8'ha5)) >>> (reg18 ?
                              reg19 : reg13)))) : (reg9[(3'h6):(1'h1)] ?
                      $unsigned((~^wire12)) : $signed((-(reg19 ?
                          (8'hbc) : reg21)))));
              reg25 <= ((&(7'h41)) ?
                  $unsigned(wire3[(3'h4):(3'h4)]) : reg16[(1'h1):(1'h1)]);
            end
          else
            begin
              reg22 <= (!{(^((!reg22) ? reg5 : $signed(reg16))),
                  $signed(((!(8'hb0)) ? (^~reg17) : {wire0, reg11}))});
              reg23 <= wire12[(3'h7):(3'h7)];
              reg24 <= reg14[(4'h8):(2'h2)];
              reg25 <= ($unsigned($signed($unsigned($unsigned(reg13)))) <<< $unsigned($unsigned(({reg5,
                  (8'hb2)} == $unsigned(reg24)))));
            end
          reg26 <= reg19[(3'h7):(2'h3)];
        end
      else
        begin
          if (($unsigned(reg8) <<< $signed($unsigned((reg25[(2'h2):(2'h2)] >>> (|reg17))))))
            begin
              reg15 <= reg7;
            end
          else
            begin
              reg15 <= $signed(($signed((8'h9f)) ?
                  {(~&((8'ha8) >> (8'hb0)))} : $unsigned(wire3[(3'h7):(3'h4)])));
              reg16 <= (-($unsigned(wire4) ?
                  {reg17} : ({(&reg22), (reg7 ? (8'ha9) : reg6)} - (((8'hbe) ?
                      reg16 : reg24) * (reg13 ^~ reg7)))));
              reg17 <= $unsigned((|(8'ha7)));
              reg18 <= (reg25[(1'h0):(1'h0)] | (+{$signed($unsigned(wire4))}));
              reg19 <= reg9[(1'h1):(1'h0)];
            end
          reg20 <= ((reg26[(3'h5):(2'h3)] ^ ((reg20 ?
                      $unsigned((8'hbc)) : $signed(wire1)) ?
                  (~|(&(8'hb5))) : wire0)) ?
              (^wire1[(3'h6):(3'h6)]) : reg15);
        end
      reg27 <= (!((($unsigned((8'h9d)) ? reg8 : {wire0, (8'ha5)}) ?
          ((reg9 ?
              reg19 : wire0) <<< reg18) : wire2[(4'h8):(4'h8)]) ~^ {$signed($signed(wire1))}));
      reg28 <= ({((reg18 ? (wire1 != reg20) : $signed(reg24)) ?
              reg9[(3'h7):(1'h0)] : $unsigned(reg24[(2'h3):(2'h2)]))} == ((~(&reg5[(5'h11):(4'h8)])) < $unsigned((((8'ha7) & reg15) > ((7'h42) < reg13)))));
    end
  assign wire29 = $signed(wire3);
  assign wire30 = (((8'hbd) ? (8'had) : wire2) ?
                      (8'ha4) : $unsigned((((~reg13) * (reg17 * reg8)) ^~ reg17[(1'h0):(1'h0)])));
  assign wire31 = (&reg23[(2'h3):(2'h3)]);
  module32 #() modinst233 (.wire35(reg8), .clk(clk), .wire33(reg15), .wire37(wire4), .wire34(wire29), .y(wire232), .wire36(reg13));
  assign wire234 = reg17;
  assign wire235 = wire234[(3'h4):(2'h3)];
  module32 #() modinst237 (wire236, clk, reg25, reg26, reg16, wire29, reg24);
  module61 #() modinst239 (.wire65(reg13), .clk(clk), .wire63(reg6), .y(wire238), .wire64(reg22), .wire62(reg5));
endmodule

module module32
#(parameter param231 = ((({(^~(8'h9c)), (~^(8'hbb))} ^~ {((8'hb7) ~^ (8'h9e)), (7'h41)}) ? (+((!(8'hbd)) ? {(8'h9f), (8'ha5)} : ((8'haa) * (8'hba)))) : ((((7'h41) | (8'hb7)) ? ((7'h42) * (8'haf)) : (8'hb4)) >>> (((7'h40) ? (8'hb3) : (8'ha1)) ? ((8'hbd) ? (8'hbd) : (8'ha5)) : ((8'ha3) ? (8'hba) : (8'hb4))))) ~^ ((^((~^(8'ha0)) && (8'haa))) | {(~|((8'ha0) == (8'h9f)))})))
(y, clk, wire33, wire34, wire35, wire36, wire37);
  output wire [(32'h2c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire33;
  input wire [(5'h13):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire35;
  input wire [(4'hf):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire197;
  wire [(3'h5):(1'h0)] wire196;
  wire signed [(2'h2):(1'h0)] wire194;
  wire signed [(3'h6):(1'h0)] wire147;
  wire [(3'h6):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire149;
  wire signed [(5'h14):(1'h0)] wire171;
  reg signed [(5'h10):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg229 = (1'h0);
  reg [(4'ha):(1'h0)] reg228 = (1'h0);
  reg [(3'h7):(1'h0)] reg227 = (1'h0);
  reg [(3'h7):(1'h0)] reg226 = (1'h0);
  reg [(3'h4):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg224 = (1'h0);
  reg signed [(4'he):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg222 = (1'h0);
  reg [(3'h7):(1'h0)] reg221 = (1'h0);
  reg [(2'h3):(1'h0)] reg220 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg219 = (1'h0);
  reg [(3'h5):(1'h0)] reg218 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg217 = (1'h0);
  reg [(4'ha):(1'h0)] reg216 = (1'h0);
  reg [(4'hc):(1'h0)] reg215 = (1'h0);
  reg [(4'ha):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg213 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg211 = (1'h0);
  reg [(4'h8):(1'h0)] reg210 = (1'h0);
  reg [(3'h7):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg208 = (1'h0);
  reg [(4'h8):(1'h0)] reg207 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg205 = (1'h0);
  reg [(5'h11):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  assign y = {wire197,
                 wire196,
                 wire194,
                 wire147,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire93,
                 wire149,
                 wire171,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg38 <= (((($signed((8'h9c)) <= (wire35 < wire34)) ?
              ((^wire34) ? {wire37} : {(8'hb9), wire35}) : ($signed((8'ha4)) ?
                  wire35[(3'h4):(1'h0)] : wire37[(4'hb):(3'h4)])) ?
          (^(~^(wire33 & wire36))) : ((wire33[(3'h4):(3'h4)] == (~|wire37)) >>> $unsigned((~^wire34)))) ~^ {$signed(wire36),
          ($unsigned($unsigned(wire36)) - ((wire37 ?
              wire36 : wire35) > wire34[(2'h3):(1'h0)]))});
      reg39 <= {wire37, $signed($unsigned($unsigned((~(8'h9c)))))};
      reg40 <= ($unsigned(((wire34 ?
              (wire34 ? (8'hab) : wire35) : (wire36 && (8'hb7))) ^~ ((wire36 ?
                  wire36 : reg38) ?
              {wire34} : $signed(wire35)))) ?
          $unsigned((($signed(wire35) ? wire37 : $unsigned(reg39)) ?
              $unsigned({wire33}) : wire34[(4'he):(4'ha)])) : wire37);
      reg41 <= $signed($signed((wire35 ? wire36 : (^(&(7'h44))))));
      if ($unsigned((wire37[(4'hf):(4'ha)] ? wire33 : wire34[(2'h3):(2'h2)])))
        begin
          if (wire35[(4'hc):(2'h2)])
            begin
              reg42 <= $signed((~reg41[(1'h0):(1'h0)]));
              reg43 <= reg42;
              reg44 <= $signed((reg41 > $signed(wire34)));
              reg45 <= reg40;
              reg46 <= (((reg42[(5'h12):(2'h3)] ?
                      (|((8'h9f) ? reg43 : (7'h41))) : reg39) ?
                  reg42[(2'h3):(2'h2)] : reg38) >> wire35[(5'h14):(4'hf)]);
            end
          else
            begin
              reg42 <= $signed($unsigned($signed($unsigned($unsigned(wire37)))));
              reg43 <= $signed(reg40[(2'h2):(1'h0)]);
              reg44 <= $unsigned($signed(($unsigned($unsigned(wire37)) ?
                  (~|(reg42 <<< wire35)) : wire36)));
            end
          reg47 <= (wire35 ?
              reg46 : ((~|$signed((reg46 - reg43))) <= $signed($signed((reg41 | reg43)))));
        end
      else
        begin
          reg42 <= (wire34 ? (!$signed((|reg42[(4'hb):(3'h5)]))) : reg45);
          reg43 <= $signed($signed(($signed((|(8'h9e))) - (reg41 - reg45[(2'h2):(2'h2)]))));
        end
    end
  assign wire48 = $signed($signed(wire35[(5'h10):(2'h2)]));
  assign wire49 = (~&reg44[(2'h3):(1'h1)]);
  assign wire50 = $signed((8'ha5));
  assign wire51 = ((-(|reg47)) ?
                      ((|({reg45} || $signed(reg40))) != ((8'hb2) ?
                          wire33 : wire34[(2'h3):(2'h2)])) : (~(((~|wire36) <= (reg40 ?
                          wire33 : reg44)) >= $unsigned(wire49[(1'h1):(1'h0)]))));
  assign wire52 = $signed((+(|wire50)));
  assign wire53 = (~|$signed(wire49[(2'h2):(1'h1)]));
  assign wire54 = {($unsigned((wire52 ? (wire50 & wire35) : $signed(reg44))) ?
                          reg43[(3'h7):(3'h6)] : (wire52 ?
                              $signed($unsigned(wire35)) : $signed((&wire51))))};
  assign wire55 = reg45;
  assign wire56 = (~&reg44[(4'ha):(3'h6)]);
  assign wire57 = (+$unsigned($unsigned($signed({wire36, wire53}))));
  assign wire58 = ({(((8'hb2) ?
                              (wire36 >> reg45) : $unsigned((7'h40))) - ($signed(wire56) + wire50[(5'h10):(2'h2)]))} ?
                      $unsigned({(8'hb5)}) : $unsigned($signed($signed(reg45))));
  assign wire59 = reg40;
  assign wire60 = (reg44[(4'hd):(4'hc)] ?
                      (((~|$unsigned(reg42)) ~^ wire57) ?
                          $unsigned(wire35[(4'hb):(2'h3)]) : ($signed($unsigned(wire55)) ?
                              $unsigned((reg39 ? wire37 : wire57)) : (reg47 ?
                                  $signed(reg47) : wire54))) : (($signed((-wire56)) ?
                          $signed((8'hb1)) : {wire57[(2'h3):(2'h2)],
                              $signed(wire56)}) >>> wire34[(4'hc):(2'h3)]));
  module61 #() modinst94 (.wire64(reg40), .wire63(reg38), .y(wire93), .wire65(wire58), .wire62(reg41), .clk(clk));
  module95 #() modinst148 (wire147, clk, reg43, wire56, wire93, wire51);
  assign wire149 = (wire58 ?
                       (~^{$unsigned((wire55 && wire55)), (7'h41)}) : reg40);
  module150 #() modinst172 (wire171, clk, reg43, wire37, wire57, wire35, reg47);
  module173 #() modinst195 (wire194, clk, wire37, reg43, wire149, wire171, wire60);
  assign wire196 = wire37[(2'h3):(1'h0)];
  assign wire197 = ((((wire147[(1'h0):(1'h0)] & (~&wire34)) ?
                       ($signed((8'ha0)) >= $signed(wire60)) : (^reg47[(3'h5):(2'h2)])) - wire56[(1'h1):(1'h0)]) * $unsigned($signed((8'hbc))));
  always
    @(posedge clk) begin
      reg198 <= $unsigned(({wire55[(4'hf):(1'h0)]} ?
          {wire149[(4'ha):(2'h3)],
              ({(7'h40), wire33} && (8'ha0))} : $signed({{wire34, (8'haf)}})));
      if ((~^$unsigned(($unsigned({wire197,
          wire197}) & $signed((reg44 | (8'ha9)))))))
        begin
          reg199 <= $signed({$unsigned(reg46),
              (~|$signed((wire57 ? wire93 : wire51)))});
          reg200 <= (($signed(wire54[(4'ha):(3'h6)]) ?
              $unsigned($signed($unsigned(reg45))) : ((wire49[(1'h0):(1'h0)] ?
                  $unsigned(wire197) : $unsigned((8'hb9))) * wire53[(3'h5):(2'h2)])) - ($unsigned($unsigned((!(8'had)))) != wire57[(4'hd):(4'hd)]));
          reg201 <= (wire93 < $unsigned(((~|$signed(wire48)) | reg38)));
          reg202 <= wire197;
          reg203 <= wire93;
        end
      else
        begin
          reg199 <= ((wire197 ?
              (8'hba) : {(reg41[(4'hb):(4'h9)] ?
                      $unsigned((8'ha1)) : (~(8'ha2))),
                  ((8'hb6) * (reg201 ?
                      reg198 : reg200))}) <<< $signed(($unsigned($unsigned(wire93)) ?
              wire171 : $unsigned((wire52 << reg47)))));
          reg200 <= {{reg47,
                  ($unsigned((wire52 ? wire37 : (7'h43))) ?
                      ((wire60 | wire54) - (reg200 <= wire59)) : (~|wire48[(3'h4):(2'h3)]))}};
        end
      reg204 <= (reg45 ?
          $unsigned(reg200[(5'h11):(4'h9)]) : $signed((wire35 >>> ((!wire58) ?
              $unsigned(wire93) : reg38[(1'h1):(1'h0)]))));
      reg205 <= ((($signed(wire54) ^ reg204) != (($unsigned(wire53) ?
          (~wire36) : (wire147 ?
              (8'hb8) : (7'h44))) | ($signed(reg44) - (|(8'hbf))))) * $unsigned($signed(wire36)));
      if (((~^$signed($signed((wire57 != wire194)))) >> $unsigned(reg199[(2'h2):(1'h0)])))
        begin
          reg206 <= ((($signed(((8'h9e) ? wire194 : (8'hb3))) ?
                  (((8'hb0) << wire171) ? (!(8'ha3)) : {reg205}) : (8'hb4)) ?
              $unsigned($unsigned($unsigned(wire59))) : ($unsigned((&wire149)) << {wire58[(3'h5):(2'h2)]})) ^ $unsigned((^({reg39} <= {reg205}))));
          if ($unsigned($signed((~(wire51[(4'h8):(3'h7)] != ((8'hba) ?
              reg206 : wire50))))))
            begin
              reg207 <= (&(reg201 ?
                  (($signed(reg200) != wire60[(2'h2):(1'h1)]) <<< $unsigned($unsigned(reg38))) : {reg200}));
              reg208 <= (~wire197);
              reg209 <= (wire34[(2'h2):(2'h2)] <<< $signed((8'hb1)));
            end
          else
            begin
              reg207 <= (!(({(reg40 ^~ wire53), {wire196}} ?
                  (~$unsigned((8'hb1))) : (&wire93[(1'h0):(1'h0)])) || $signed($signed((wire50 <= wire50)))));
            end
          reg210 <= (-{((&reg206[(3'h4):(2'h2)]) - wire197), (reg41 & reg208)});
          reg211 <= $signed((~|wire35));
          reg212 <= (((8'hb1) * ($unsigned({reg46}) + ((8'hab) ?
              $unsigned((8'ha2)) : (wire60 ?
                  wire93 : reg40)))) * (^~{(^wire53[(4'h8):(2'h2)])}));
        end
      else
        begin
          reg206 <= ($unsigned($signed((((8'hb1) <= reg199) ?
                  wire147 : (reg204 - wire36)))) ?
              $signed(wire56) : $unsigned($unsigned((~|{(8'hbe)}))));
          reg207 <= (-$unsigned(wire149));
          if ($unsigned(((+(~&(~^reg212))) ^ (+((reg212 ? reg208 : wire48) ?
              {reg40, wire52} : (|wire197))))))
            begin
              reg208 <= (~^(($signed($unsigned(wire48)) != ($signed(reg40) ?
                      ((8'ha5) ? reg201 : wire171) : $unsigned(wire54))) ?
                  (&(!$unsigned(wire194))) : ($unsigned((wire48 ?
                      reg45 : wire48)) && reg39[(3'h4):(2'h2)])));
              reg209 <= $unsigned(reg47[(1'h1):(1'h1)]);
              reg210 <= reg42[(5'h11):(4'hf)];
            end
          else
            begin
              reg208 <= reg204;
              reg209 <= reg207[(3'h6):(2'h3)];
              reg210 <= reg46[(3'h5):(3'h4)];
              reg211 <= reg204[(2'h2):(2'h2)];
              reg212 <= $signed($unsigned(wire194));
            end
          if ((8'had))
            begin
              reg213 <= (&(($unsigned($signed(wire54)) & ({(8'h9c),
                  (8'haa)} * $unsigned((8'hba)))) + $unsigned(reg40[(3'h5):(1'h0)])));
              reg214 <= reg203;
              reg215 <= ((+$unsigned(($signed(wire56) <<< $unsigned(reg42)))) ~^ ($unsigned((reg202[(2'h2):(2'h2)] == (~^wire36))) ?
                  wire35 : (~&$signed($unsigned(wire51)))));
              reg216 <= (reg210 ?
                  $signed(wire60[(4'h8):(1'h0)]) : wire149[(1'h1):(1'h1)]);
            end
          else
            begin
              reg213 <= (^~$signed(($unsigned(wire57) >= (~&(~&(8'ha5))))));
              reg214 <= ((&(~&((reg207 ? reg42 : reg203) ?
                      {wire196, (8'ha2)} : (wire56 >> wire37)))) ?
                  {{$unsigned(reg39[(1'h0):(1'h0)])}} : $unsigned($unsigned($unsigned((~&(8'ha3))))));
              reg215 <= wire35;
              reg216 <= (!$unsigned($signed(reg200[(3'h4):(1'h1)])));
              reg217 <= reg202;
            end
          reg218 <= reg38;
        end
    end
  always
    @(posedge clk) begin
      if (wire59)
        begin
          reg219 <= wire54;
          reg220 <= wire36[(1'h0):(1'h0)];
          reg221 <= ((|wire49) ?
              $unsigned($signed(reg220[(2'h3):(1'h1)])) : ((~&((~|(8'hbe)) ?
                      $signed((8'hb6)) : reg45)) ?
                  (~reg42) : ((~{reg209}) ?
                      {(^~wire33), {wire37, wire35}} : $unsigned((~|wire34)))));
        end
      else
        begin
          reg219 <= $unsigned((8'ha4));
          reg220 <= (~^(^~wire52));
        end
      if (($unsigned(wire197[(2'h2):(1'h0)]) != (~|wire196)))
        begin
          reg222 <= $signed((wire194[(1'h1):(1'h0)] ?
              ($signed((reg210 >> wire51)) ?
                  ($unsigned(wire52) ? (^~wire56) : (8'h9e)) : (reg218 ?
                      reg200 : {reg217,
                          wire93})) : $signed(((|reg211) >= wire51[(4'hd):(4'h8)]))));
        end
      else
        begin
          reg222 <= (reg204[(2'h3):(1'h0)] ?
              ($unsigned(((^reg205) ?
                  $signed(wire147) : ((8'haf) ?
                      reg212 : wire93))) - $unsigned({reg219[(1'h1):(1'h0)]})) : $unsigned(wire51));
        end
      reg223 <= wire147[(3'h4):(1'h0)];
      if ((^~$unsigned((wire36[(2'h3):(2'h2)] ^ {$signed(reg201)}))))
        begin
          reg224 <= $unsigned(reg47);
          reg225 <= $signed((($signed((reg216 ?
                  reg222 : (8'hbe))) ^ ({(8'hab)} & reg224[(2'h3):(1'h1)])) ?
              (~&(^(reg199 ?
                  reg219 : (8'hb5)))) : ((reg41[(2'h2):(1'h0)] << reg47[(2'h2):(1'h1)]) ?
                  $signed(((8'hb2) ? reg46 : (8'hb0))) : $signed((~reg204)))));
          reg226 <= (+(reg43 ?
              (-(!reg205[(4'hb):(2'h2)])) : (reg46 ?
                  {(reg47 > reg211), wire60} : ({reg42} ?
                      $signed((8'ha1)) : $unsigned(wire57)))));
        end
      else
        begin
          reg224 <= (reg47[(4'hd):(4'hc)] + $signed($unsigned((-reg202))));
          reg225 <= wire52[(2'h2):(1'h0)];
        end
      if (({reg207} <= (reg210 ?
          ($signed($unsigned((8'hb7))) >= (|$signed(reg220))) : wire54[(4'h8):(1'h1)])))
        begin
          reg227 <= (($unsigned((+reg207)) ?
                  $unsigned((+{wire56})) : ($unsigned($unsigned(wire93)) <<< $signed(reg215))) ?
              (8'ha6) : $signed((~&((wire197 >>> wire56) ?
                  (reg210 | (8'hac)) : (+wire57)))));
          reg228 <= (~($unsigned(reg38[(1'h1):(1'h1)]) ?
              ((wire51 ~^ (reg226 ? reg225 : (8'hba))) & {(-reg220),
                  (reg198 >>> reg41)}) : (-wire149)));
          reg229 <= $signed($signed(wire60[(4'h8):(4'h8)]));
        end
      else
        begin
          reg227 <= reg206;
          reg228 <= wire34[(5'h11):(5'h11)];
          reg229 <= reg229[(3'h5):(1'h0)];
          reg230 <= (~|(~&{$signed((-reg212))}));
        end
    end
endmodule

module module173  (y, clk, wire178, wire177, wire176, wire175, wire174);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire178;
  input wire signed [(3'h6):(1'h0)] wire177;
  input wire [(4'h8):(1'h0)] wire176;
  input wire signed [(3'h5):(1'h0)] wire175;
  input wire signed [(2'h3):(1'h0)] wire174;
  wire signed [(4'ha):(1'h0)] wire193;
  wire [(4'hf):(1'h0)] wire192;
  wire signed [(4'h8):(1'h0)] wire191;
  wire signed [(5'h12):(1'h0)] wire190;
  wire [(4'hc):(1'h0)] wire189;
  wire [(4'hb):(1'h0)] wire188;
  wire [(3'h7):(1'h0)] wire187;
  wire signed [(2'h2):(1'h0)] wire186;
  wire signed [(4'ha):(1'h0)] wire185;
  wire [(5'h15):(1'h0)] wire184;
  wire signed [(5'h15):(1'h0)] wire183;
  wire signed [(3'h5):(1'h0)] wire182;
  wire [(5'h12):(1'h0)] wire181;
  wire signed [(5'h12):(1'h0)] wire180;
  wire [(3'h7):(1'h0)] wire179;
  assign y = {wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 (1'h0)};
  assign wire179 = wire178[(4'h9):(3'h4)];
  assign wire180 = wire174[(2'h3):(2'h3)];
  assign wire181 = ((8'hb7) ?
                       {(wire178[(3'h7):(3'h6)] ?
                               $signed((~wire180)) : $unsigned(((8'hb3) ?
                                   wire174 : wire176)))} : wire180);
  assign wire182 = wire178;
  assign wire183 = wire180[(4'h8):(3'h6)];
  assign wire184 = wire182;
  assign wire185 = (8'hb7);
  assign wire186 = $signed(wire178);
  assign wire187 = (~^(&$signed((|((8'hbb) ? wire178 : wire182)))));
  assign wire188 = (8'hba);
  assign wire189 = $unsigned(($signed(((wire175 >>> wire175) ^ (wire184 && wire176))) ^~ $signed({wire186[(1'h1):(1'h0)]})));
  assign wire190 = wire184;
  assign wire191 = wire183[(5'h11):(4'he)];
  assign wire192 = wire186[(2'h2):(2'h2)];
  assign wire193 = (~|$signed(((+(wire184 - wire182)) ?
                       {wire190[(3'h7):(3'h5)],
                           $signed(wire190)} : (~|$signed(wire174)))));
endmodule

module module150  (y, clk, wire155, wire154, wire153, wire152, wire151);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire155;
  input wire [(4'h8):(1'h0)] wire154;
  input wire [(5'h12):(1'h0)] wire153;
  input wire signed [(4'ha):(1'h0)] wire152;
  input wire signed [(4'h9):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire170;
  wire [(5'h11):(1'h0)] wire169;
  wire [(5'h13):(1'h0)] wire168;
  wire [(3'h5):(1'h0)] wire167;
  wire [(2'h2):(1'h0)] wire166;
  wire [(4'ha):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire164;
  wire signed [(4'h9):(1'h0)] wire163;
  wire signed [(5'h14):(1'h0)] wire162;
  wire signed [(3'h4):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire158;
  wire [(5'h11):(1'h0)] wire157;
  wire [(4'hc):(1'h0)] wire156;
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 (1'h0)};
  assign wire156 = ((|wire155[(3'h4):(2'h3)]) > (wire153[(1'h1):(1'h0)] ~^ {wire153[(4'ha):(2'h3)],
                       ($signed(wire154) ?
                           {wire151} : (wire154 ? wire155 : wire152))}));
  assign wire157 = $unsigned(($signed(wire155[(2'h3):(1'h1)]) || $unsigned($signed(wire151))));
  assign wire158 = (-($signed({$signed(wire155),
                       wire157[(1'h0):(1'h0)]}) != (wire154 ?
                       $signed((wire154 * (8'ha6))) : ($unsigned(wire153) ?
                           (wire151 ?
                               wire151 : wire153) : $unsigned(wire154)))));
  assign wire159 = (~|$signed(wire155[(1'h0):(1'h0)]));
  assign wire160 = ((^~$unsigned(((&wire157) ?
                       $signed(wire151) : $signed(wire159)))) >>> $unsigned((wire151[(1'h1):(1'h1)] < wire154)));
  assign wire161 = (wire152 ?
                       ($signed({(wire155 ? wire153 : wire157),
                           (~&wire157)}) - wire155[(2'h2):(1'h1)]) : (-(wire160[(3'h7):(3'h7)] >= wire155[(3'h5):(3'h5)])));
  assign wire162 = wire161;
  assign wire163 = $unsigned((^wire154[(2'h3):(2'h2)]));
  assign wire164 = $signed((~^(!$unsigned(wire161[(1'h1):(1'h0)]))));
  assign wire165 = wire161;
  assign wire166 = ($signed({wire162, {(wire158 >>> wire165), (|wire158)}}) ?
                       wire160[(4'he):(3'h4)] : $unsigned(({(wire164 ?
                               wire156 : wire158)} >> {wire152,
                           (wire162 ^~ wire162)})));
  assign wire167 = $signed((~|(^$unsigned((~|wire156)))));
  assign wire168 = wire155[(3'h7):(2'h3)];
  assign wire169 = ({wire167[(2'h2):(2'h2)],
                       wire166[(2'h2):(2'h2)]} <= (wire161[(3'h4):(2'h2)] ?
                       (($signed(wire159) ?
                           wire164[(3'h7):(3'h4)] : wire154[(3'h4):(1'h1)]) & wire155) : {(~|(~|wire160)),
                           $signed(wire160)}));
  assign wire170 = {(wire166 ?
                           (wire153[(5'h11):(4'hf)] ?
                               ($unsigned(wire153) ?
                                   wire156[(3'h6):(2'h2)] : $signed(wire161)) : wire159) : wire162[(5'h11):(4'ha)]),
                       ($unsigned(wire162) ? (7'h40) : (-wire151))};
endmodule

module module95
#(parameter param146 = ((8'hbe) - (&(({(8'ha6)} <= (^~(8'h9d))) ? {(|(8'haf))} : {(~(8'hb7)), ((7'h40) + (7'h42))}))))
(y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h23d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire99;
  input wire [(4'hb):(1'h0)] wire98;
  input wire signed [(4'hd):(1'h0)] wire97;
  input wire signed [(3'h7):(1'h0)] wire96;
  wire signed [(3'h7):(1'h0)] wire145;
  wire [(4'hc):(1'h0)] wire144;
  wire signed [(4'hb):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire125;
  wire [(4'hd):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(4'hb):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg100 <= (~&$unsigned(((^~(wire97 + wire96)) ?
          {$unsigned(wire96), wire98} : wire99[(3'h5):(1'h1)])));
      reg101 <= ($signed(reg100[(2'h3):(2'h2)]) + (~&(!((wire98 ?
              (8'hbd) : reg100) ?
          (reg100 + wire99) : (+wire98)))));
      if ((~&$unsigned($signed(reg101[(1'h1):(1'h0)]))))
        begin
          if ({wire98, $signed((8'hb7))})
            begin
              reg102 <= wire98;
              reg103 <= wire97;
              reg104 <= $unsigned(wire99);
            end
          else
            begin
              reg102 <= ({reg100,
                  ($signed((reg102 || reg102)) | ((wire98 ?
                      wire97 : reg100) ^~ reg100[(3'h4):(2'h2)]))} > (+{(~&(reg101 == wire96)),
                  reg100}));
            end
          reg105 <= reg100[(4'ha):(1'h0)];
          reg106 <= reg104[(4'hb):(4'h9)];
          reg107 <= (~^$signed($signed(wire96)));
        end
      else
        begin
          reg102 <= $unsigned((((reg106[(3'h7):(3'h6)] || (reg104 ?
              (8'hb5) : wire98)) >= reg103) > (^($signed(reg107) ?
              $signed((8'h9e)) : $unsigned(reg101)))));
          reg103 <= (8'hae);
          reg104 <= reg105[(1'h0):(1'h0)];
        end
      reg108 <= {($unsigned($unsigned((reg105 < reg104))) ?
              wire96[(3'h7):(3'h7)] : wire96[(3'h6):(1'h1)]),
          $signed(($unsigned(reg102) <= (+wire97)))};
      reg109 <= $signed(reg101);
    end
  assign wire110 = $signed(reg109);
  assign wire111 = $unsigned(($unsigned($signed({reg109})) ?
                       ((^~(reg103 >> reg106)) != $unsigned({reg101})) : reg103[(2'h2):(2'h2)]));
  assign wire112 = reg103[(4'hf):(4'h8)];
  assign wire113 = $unsigned($signed($signed($signed(wire97[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if ((~^$signed(wire110[(4'h9):(1'h1)])))
        begin
          reg114 <= reg102[(3'h4):(3'h4)];
          if ((((^~$signed($signed(wire97))) <<< (((wire98 + (8'hb7)) >>> {(8'ha6),
                  reg114}) ?
              ($signed(reg106) ?
                  (8'hb1) : $signed(wire113)) : ($signed(reg109) ?
                  $signed(reg105) : wire112[(2'h2):(1'h0)]))) <<< ((($signed(reg104) ?
              reg108[(3'h6):(3'h6)] : (8'hb1)) ^ $unsigned($unsigned(reg105))) <= reg109)))
            begin
              reg115 <= $signed(($signed((reg107 << $signed(reg104))) ?
                  ($signed({wire113}) > ((wire98 ?
                      (7'h43) : reg104) > (reg106 == wire99))) : wire110[(2'h3):(2'h2)]));
            end
          else
            begin
              reg115 <= ({(((wire99 >= wire112) - (~^(8'h9f))) >>> (~&$signed(wire113)))} ?
                  (~|((reg101[(4'ha):(3'h5)] ? $signed(wire99) : (~|reg105)) ?
                      ($signed(reg115) - reg106) : wire112)) : $signed((wire111 ?
                      $signed(reg108) : (((8'haf) ?
                          reg115 : reg115) | wire97))));
              reg116 <= $signed((((reg108[(3'h4):(2'h3)] | $signed(wire110)) != $unsigned(((8'ha6) > (8'hbb)))) ?
                  reg100[(2'h2):(1'h1)] : (($unsigned(reg104) ?
                      {(8'ha6)} : (reg108 ?
                          reg104 : reg102)) || $unsigned((~&wire97)))));
              reg117 <= ($signed({{wire110}}) != {{($signed(reg116) <= (!reg109)),
                      ($signed(reg108) ? $signed((8'hac)) : $signed(reg115))},
                  wire99[(1'h0):(1'h0)]});
              reg118 <= reg117;
            end
          reg119 <= $unsigned((~|{$signed($unsigned(wire98)),
              ($unsigned(reg107) ? $unsigned(reg109) : (^~(8'hba)))}));
        end
      else
        begin
          reg114 <= $signed($unsigned($signed($signed(reg108[(4'h8):(3'h5)]))));
          reg115 <= $signed($unsigned((wire96 ?
              (~^(^wire111)) : ($unsigned((8'hb1)) >>> (wire99 ^ reg107)))));
        end
      reg120 <= wire99;
      reg121 <= reg107;
      reg122 <= $unsigned((|{reg105}));
      reg123 <= $signed((!$signed(($unsigned(wire113) ?
          $unsigned(reg103) : $signed(wire98)))));
    end
  assign wire124 = wire112[(4'hc):(3'h7)];
  assign wire125 = reg109;
  assign wire126 = (((reg114[(4'h9):(3'h5)] ?
                       ((^(7'h40)) | {reg106}) : ((^~reg109) && {reg104})) >= (($signed(reg103) | $unsigned(reg116)) ?
                       reg100[(4'hb):(3'h7)] : reg120[(1'h1):(1'h1)])) <<< {$signed(($signed((8'ha4)) >> $unsigned(reg106))),
                       (($signed(wire99) ?
                           (reg120 ? (8'ha6) : reg105) : (reg107 ?
                               reg117 : reg114)) | (&((8'hbd) >= (8'hb4))))});
  assign wire127 = ((~^(($signed(wire126) ?
                       reg105[(3'h7):(1'h0)] : reg108) & wire96[(1'h0):(1'h0)])) ^ (((~|reg122) && (~&$unsigned(reg123))) <= $unsigned($unsigned($unsigned(reg121)))));
  assign wire128 = $unsigned((((^reg119[(2'h2):(1'h1)]) ?
                       ($unsigned(reg107) ?
                           reg114 : $signed(reg101)) : $signed((wire97 ?
                           reg100 : wire111))) > $unsigned((+$signed(reg102)))));
  always
    @(posedge clk) begin
      reg129 <= $signed($unsigned(((8'haa) ?
          wire128[(4'h9):(3'h5)] : reg103[(3'h5):(2'h3)])));
      reg130 <= (~|($unsigned({((8'h9c) << wire113), (reg108 <<< wire98)}) ?
          (reg108 ? wire98 : (|{reg129})) : reg119));
      reg131 <= $unsigned($unsigned(wire111[(5'h11):(3'h5)]));
      if ($unsigned($unsigned(reg116)))
        begin
          if (reg109)
            begin
              reg132 <= $signed(reg117[(4'h9):(3'h7)]);
              reg133 <= wire97[(4'h8):(3'h4)];
            end
          else
            begin
              reg132 <= $signed((&reg107[(3'h6):(1'h0)]));
              reg133 <= ((~(wire96 ?
                      (~^{wire110, wire126}) : (|$unsigned(reg103)))) ?
                  (((reg114 ?
                      $unsigned((8'hba)) : (8'hbf)) <<< ({wire111} == {reg130,
                      reg122})) & $signed(($unsigned(reg109) ?
                      (reg100 != reg133) : reg105[(1'h1):(1'h0)]))) : {($unsigned($signed(reg103)) ?
                          ({wire126} ?
                              $unsigned(wire127) : $signed((7'h42))) : wire110),
                      {wire128[(4'h8):(3'h5)],
                          (&(wire97 ? wire125 : wire111))}});
              reg134 <= $signed({reg108[(3'h4):(2'h3)],
                  ((wire126 ? {reg116, reg104} : ((8'ha7) ~^ wire111)) ?
                      $signed($unsigned(reg122)) : ((wire98 ~^ reg131) ?
                          (~^wire113) : $signed(wire97)))});
              reg135 <= reg107;
            end
        end
      else
        begin
          reg132 <= (8'ha3);
          reg133 <= ($unsigned((~&($signed(wire127) ^~ $signed(wire124)))) ?
              (-reg103) : wire128);
          reg134 <= (!(~&reg130[(1'h1):(1'h0)]));
          reg135 <= reg115[(3'h7):(2'h2)];
          reg136 <= ((8'haf) <<< wire113);
        end
      if ((&(-(8'had))))
        begin
          reg137 <= (reg118 ? reg129[(1'h0):(1'h0)] : (&reg134[(1'h1):(1'h0)]));
        end
      else
        begin
          reg137 <= (~^((7'h43) || reg103));
          reg138 <= (($signed(reg116[(3'h7):(3'h7)]) < {{$unsigned(reg116)},
                  wire111[(5'h12):(3'h5)]}) ?
              reg134 : (($unsigned(wire99[(1'h0):(1'h0)]) ?
                  ({reg135,
                      (8'h9c)} << $signed((8'ha1))) : $unsigned((~^wire113))) < ($signed($unsigned(reg114)) && $signed(((8'hb0) ?
                  reg115 : reg116)))));
          reg139 <= wire96;
          if ((reg120 ?
              ($signed(((wire128 ? reg103 : reg136) & (reg134 ?
                      (8'ha5) : reg117))) ?
                  reg137 : (wire128[(4'h9):(4'h8)] ?
                      (~|((8'hb0) >= reg135)) : reg120[(1'h1):(1'h0)])) : ((reg131 || (8'hb7)) ?
                  ((^(|reg132)) < $unsigned($unsigned(reg103))) : (~&(reg118 ?
                      reg104 : $unsigned((8'hbf)))))))
            begin
              reg140 <= (reg108[(2'h2):(1'h1)] ?
                  $signed((~^reg129)) : wire98[(1'h1):(1'h0)]);
              reg141 <= $unsigned((8'hb3));
              reg142 <= (({($signed(reg131) << $unsigned(reg105)),
                  ($unsigned(reg117) ?
                      (reg137 ?
                          wire98 : (8'ha9)) : $unsigned(reg120))} & reg134) * $unsigned(reg139));
            end
          else
            begin
              reg140 <= $unsigned(reg141);
              reg141 <= wire99;
              reg142 <= {($signed(reg123) + $signed((reg136[(4'hb):(1'h1)] <= $unsigned((8'ha1)))))};
            end
          reg143 <= (~&reg142[(3'h5):(3'h5)]);
        end
    end
  assign wire144 = (((reg105 != (~&(wire125 <= (7'h40)))) ?
                           (((~|wire124) ?
                               reg109 : reg109[(4'h8):(3'h4)]) != (reg130 <= reg129)) : $unsigned($signed((reg123 ?
                               wire110 : reg132)))) ?
                       $unsigned($unsigned({reg102, (^~reg108)})) : wire98);
  assign wire145 = reg114[(4'hf):(4'h9)];
endmodule

module module61
#(parameter param91 = (^~(!((&(|(8'hbd))) ? (-{(8'ha9)}) : (((8'hb5) ? (8'hae) : (8'ha8)) ? ((8'hac) == (8'ha1)) : ((8'ha3) ? (8'hb1) : (8'ha8)))))), 
parameter param92 = (((((param91 ? param91 : param91) && (param91 || param91)) || {(param91 ^~ param91)}) ? {((param91 ? param91 : param91) <<< param91)} : (~^((8'hab) ? {param91} : param91))) ? (+({{(8'hb1), (8'hba)}} ? (~|(~|param91)) : ((param91 ~^ param91) >>> {(8'ha3)}))) : (^(^(param91 != {param91})))))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire65;
  input wire signed [(5'h14):(1'h0)] wire64;
  input wire [(4'hb):(1'h0)] wire63;
  input wire [(4'h9):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire70,
                 wire69,
                 wire68,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg73,
                 reg72,
                 reg71,
                 reg67,
                 reg66,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg66 <= ((wire62[(1'h1):(1'h1)] ?
              (~^{(~|wire62)}) : (^~{wire64, $unsigned(wire65)})) ?
          {$unsigned((!(-wire64)))} : $signed(wire64[(5'h14):(2'h2)]));
      reg67 <= (^wire64);
    end
  assign wire68 = $unsigned((~((wire62[(3'h4):(1'h0)] ? (~^wire64) : {reg66}) ?
                      wire64 : (wire63[(3'h6):(1'h0)] < $signed(reg66)))));
  assign wire69 = wire62;
  assign wire70 = wire63[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg71 <= wire62;
      reg72 <= wire65[(3'h6):(1'h1)];
      reg73 <= $unsigned($unsigned((|{(wire69 ^ wire69)})));
    end
  assign wire74 = (reg72[(2'h2):(1'h0)] ?
                      ($signed(($unsigned(wire68) ~^ ((8'hb8) ?
                          (8'hb1) : wire69))) * {(wire69 ?
                              (reg71 ? wire69 : wire64) : wire70),
                          (~^((8'hbf) ?
                              wire69 : wire64))}) : (^~$signed(reg66)));
  assign wire75 = ($signed((-($unsigned(wire70) ?
                          reg66[(3'h5):(2'h3)] : wire64))) ?
                      reg71[(4'hf):(2'h2)] : $unsigned((($unsigned(wire64) >> wire62[(3'h7):(2'h3)]) == (wire63 ?
                          (&wire63) : {(8'had), wire62}))));
  assign wire76 = {$signed(reg72),
                      {wire64[(5'h11):(3'h7)], wire68[(3'h6):(3'h5)]}};
  assign wire77 = ($unsigned(wire76[(5'h14):(5'h11)]) ?
                      ($signed({{reg72}}) ?
                          (wire74[(1'h0):(1'h0)] <<< wire68) : ($signed($unsigned((8'ha2))) <= {$unsigned(reg72),
                              (reg67 >> wire74)})) : reg66[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg78 <= ((((7'h41) ? {reg66} : ((~&wire64) > $unsigned(wire68))) ?
          (((^~wire76) & $unsigned(reg73)) ?
              reg66[(3'h6):(1'h0)] : $unsigned(wire75[(5'h14):(4'h9)])) : reg72[(4'ha):(1'h0)]) ^~ $unsigned(((~^$signed(wire76)) >= ((wire69 ^~ wire64) ?
          reg66 : reg71))));
      if (wire70[(4'h8):(2'h2)])
        begin
          reg79 <= wire70;
        end
      else
        begin
          reg79 <= $unsigned(((((~reg72) ?
                  (reg73 ^~ (8'h9e)) : (8'hbf)) & $signed((^~reg79))) ?
              $unsigned(wire69) : wire74));
        end
      reg80 <= wire62;
      reg81 <= $unsigned((~|($signed($unsigned(wire65)) > wire75[(4'he):(4'h8)])));
      reg82 <= reg73;
    end
  assign wire83 = $signed(reg80);
  assign wire84 = reg78;
  assign wire85 = ((~wire74) ?
                      ($signed(reg71[(4'hd):(1'h1)]) ^~ (&$unsigned((reg79 <= reg79)))) : (~|$unsigned($unsigned(((8'hb2) + wire74)))));
  assign wire86 = {wire74[(1'h0):(1'h0)], ($unsigned(wire85) >> wire69)};
  assign wire87 = wire65[(1'h0):(1'h0)];
  assign wire88 = $signed(reg73);
  assign wire89 = wire84;
  assign wire90 = reg81[(5'h11):(2'h2)];
endmodule
