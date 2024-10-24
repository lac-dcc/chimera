module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire84;
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire21,
                 wire22,
                 wire23,
                 wire84,
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
                 reg7,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = $signed($signed($unsigned((-(wire0 < wire1)))));
  always
    @(posedge clk) begin
      reg7 <= $unsigned(wire6[(4'hc):(2'h3)]);
      reg8 <= wire0[(3'h7):(2'h3)];
      if (($signed(wire6) ?
          wire1[(2'h3):(2'h2)] : (+(wire6 * {(reg8 ^~ wire0),
              (wire3 ? wire5 : wire4)}))))
        begin
          reg9 <= ($signed($unsigned((~^wire3))) < $signed({$signed((8'ha2))}));
          reg10 <= $unsigned(((wire6 >> (8'hbd)) <= wire2));
          if ($unsigned(($unsigned((wire5[(1'h0):(1'h0)] ?
                  (~reg9) : {(8'ha0)})) ?
              {wire4} : wire5[(1'h1):(1'h0)])))
            begin
              reg11 <= $signed($unsigned(wire2[(4'h9):(2'h2)]));
              reg12 <= (8'ha1);
              reg13 <= reg9[(3'h6):(1'h1)];
              reg14 <= $unsigned((reg11 && (-{reg11, wire0[(1'h1):(1'h0)]})));
              reg15 <= $signed((!(~wire1)));
            end
          else
            begin
              reg11 <= $signed((&$unsigned((-{reg11, (8'hab)}))));
              reg12 <= ((&reg12) ^ wire4);
              reg13 <= (reg11 ?
                  $unsigned(({$unsigned((8'hbd)),
                      reg12[(3'h4):(2'h2)]} << $unsigned((~&(7'h41))))) : ($unsigned(reg11[(1'h0):(1'h0)]) ?
                      ($unsigned($unsigned((8'h9d))) ?
                          (8'hb0) : reg12[(1'h0):(1'h0)]) : (reg8 ?
                          reg10[(5'h12):(4'hd)] : (~&$unsigned(wire3)))));
            end
        end
      else
        begin
          if ($unsigned((!$unsigned($signed(wire4)))))
            begin
              reg9 <= $signed((^reg11));
            end
          else
            begin
              reg9 <= reg14[(4'hf):(4'hc)];
              reg10 <= $signed(reg11[(3'h4):(2'h3)]);
            end
        end
      if (((!((((8'hb9) ? wire3 : wire6) ? (8'h9c) : wire4[(2'h3):(1'h0)]) ?
              $signed(((8'hb1) && reg13)) : reg7)) ?
          reg11 : wire0[(3'h6):(3'h5)]))
        begin
          reg16 <= (reg12 ?
              wire6 : {($unsigned($signed(wire5)) ?
                      (8'hb9) : $unsigned((wire5 ^ wire1)))});
          if ($signed(reg12))
            begin
              reg17 <= wire4[(4'hc):(2'h2)];
              reg18 <= (~&((~((reg14 ? wire3 : reg12) ?
                  wire5[(1'h1):(1'h1)] : reg9)) ^ reg16[(2'h2):(2'h2)]));
              reg19 <= ((reg18[(4'hb):(4'h8)] ?
                  $unsigned(($signed(reg9) ?
                      $signed((8'had)) : ((8'hb8) ?
                          reg15 : reg17))) : {$signed(wire5),
                      (8'ha0)}) - $unsigned(reg15[(2'h2):(1'h0)]));
              reg20 <= $signed($unsigned((~^reg11)));
            end
          else
            begin
              reg17 <= wire0[(3'h5):(3'h4)];
              reg18 <= (reg9[(4'h9):(3'h7)] ?
                  wire3[(3'h4):(1'h1)] : ($signed(reg17) + ({{(8'hb9)}} != $unsigned($signed(reg9)))));
              reg19 <= {((($signed((8'hb1)) ?
                      (~reg12) : $signed(reg15)) + reg8) > ($unsigned($unsigned(reg12)) || (&(&reg8)))),
                  reg16[(2'h2):(1'h0)]};
              reg20 <= wire3;
            end
        end
      else
        begin
          if ($unsigned(reg18[(4'h8):(3'h5)]))
            begin
              reg16 <= {$unsigned(reg7[(4'h9):(3'h5)]),
                  $signed($unsigned($unsigned((reg8 == reg14))))};
              reg17 <= ({reg10} ?
                  $unsigned((wire5 ~^ reg12[(2'h3):(1'h1)])) : (reg9 | (~^reg13[(1'h0):(1'h0)])));
              reg18 <= $unsigned($signed(($signed(reg19) * ($signed(reg13) ?
                  {(8'hb6)} : (reg13 > reg20)))));
              reg19 <= (wire3 ?
                  $signed($unsigned($unsigned((+reg11)))) : $signed($unsigned($signed(((8'ha3) || reg12)))));
              reg20 <= (^~(+{reg12[(3'h4):(1'h1)], reg20[(5'h15):(3'h5)]}));
            end
          else
            begin
              reg16 <= $unsigned({({(8'hb5)} == reg18)});
            end
        end
    end
  assign wire21 = ({reg11} - wire5[(1'h0):(1'h0)]);
  assign wire22 = $signed((reg11[(2'h3):(2'h3)] ? reg14 : reg13));
  assign wire23 = (((wire22[(1'h1):(1'h1)] >= ($signed(wire3) ?
                          $unsigned(reg10) : reg19[(3'h6):(2'h2)])) ?
                      $signed(((^~reg11) ?
                          wire2[(4'hc):(4'hb)] : {reg14})) : reg14[(4'he):(4'hc)]) & (+wire2));
  module24 #() modinst85 (.y(wire84), .wire25(reg20), .wire26(reg14), .wire29(reg18), .clk(clk), .wire28(wire1), .wire27(reg11));
endmodule

module module24
#(parameter param83 = ((((+(-(8'hb4))) ? (((8'ha1) ? (7'h42) : (8'ha7)) != (~^(7'h40))) : (((8'h9c) ? (8'h9f) : (8'ha3)) ? {(8'hab), (8'hbc)} : (&(8'hb8)))) >>> (((~|(7'h40)) >= ((8'ha3) ? (8'ha6) : (8'h9e))) ? (((8'ha9) ? (8'hba) : (8'hb8)) - {(8'hb4), (7'h44)}) : (~^{(8'ha5), (8'h9e)}))) ? (|((((8'haa) <= (7'h43)) ? (8'h9e) : (-(8'hbd))) ? (((8'h9d) ? (8'ha9) : (8'had)) >> ((8'hac) <= (8'hbc))) : ((&(8'ha9)) ? ((8'ha5) ? (8'ha3) : (7'h44)) : (~^(8'ha2))))) : (((((8'hb1) > (8'hbe)) ? (&(8'had)) : ((8'hb9) ? (8'hb4) : (8'ha4))) ? (((8'hb6) ? (7'h42) : (8'ha1)) ? ((8'ha9) | (7'h43)) : (8'ha8)) : (|(~&(8'ha4)))) ? ((^((8'ha1) == (7'h41))) ? (((8'ha1) >> (8'ha8)) > (&(8'ha8))) : ({(8'ha1)} ? ((8'hbb) ~^ (8'haa)) : {(8'ha6)})) : ((&((8'hbc) ? (8'h9e) : (8'ha8))) ? (((7'h44) ? (8'hb7) : (8'hb3)) ? (!(7'h43)) : (^(8'hb3))) : ({(8'hbe), (8'hbe)} ? (^(8'hb3)) : (^(8'h9c)))))))
(y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire25;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire27;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire62;
  assign y = {wire81,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire30,
                 wire62,
                 (1'h0)};
  assign wire30 = $signed(wire27[(3'h6):(3'h5)]);
  module31 #() modinst63 (wire62, clk, wire28, wire25, wire27, wire30, wire29);
  assign wire64 = wire27;
  assign wire65 = (!$unsigned((~&$signed((~^wire64)))));
  assign wire66 = (wire30[(4'h9):(4'h8)] ^ wire26[(1'h1):(1'h0)]);
  assign wire67 = (((wire64 & (~^(-wire64))) ~^ (~&wire30[(1'h1):(1'h1)])) ?
                      $signed(wire29[(4'h8):(1'h1)]) : wire26[(1'h0):(1'h0)]);
  assign wire68 = (({{wire30}} ^~ $unsigned($unsigned(wire26[(2'h2):(2'h2)]))) ?
                      wire62[(1'h0):(1'h0)] : $unsigned(wire29));
  module69 #() modinst82 (wire81, clk, wire68, wire66, wire64, wire30);
endmodule

module module69
#(parameter param80 = (({(((8'had) ? (8'ha8) : (8'hb9)) < (7'h43))} != (8'hb1)) ? (8'ha6) : {{{(8'hac)}}}))
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire73;
  input wire [(2'h2):(1'h0)] wire72;
  input wire [(3'h7):(1'h0)] wire71;
  input wire signed [(4'h9):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  assign y = {wire78, wire77, wire76, wire75, reg79, reg74, (1'h0)};
  always
    @(posedge clk) begin
      reg74 <= wire72;
    end
  assign wire75 = wire72[(2'h2):(2'h2)];
  assign wire76 = wire70[(3'h5):(1'h0)];
  assign wire77 = wire71;
  assign wire78 = {((((wire77 ? (7'h40) : wire77) ?
                                  wire77[(4'h8):(3'h4)] : (wire76 ?
                                      wire72 : reg74)) ?
                              (!(wire77 ? (8'hb0) : wire70)) : wire75) ?
                          (!(!$unsigned(wire71))) : wire71)};
  always
    @(posedge clk) begin
      reg79 <= wire75;
    end
endmodule

module module31
#(parameter param61 = ({({((8'h9c) ? (8'h9c) : (8'ha4)), ((8'hb1) ? (8'h9c) : (8'hb7))} ^ {(8'h9e), {(8'ha6), (8'ha0)}}), {((~^(8'ha8)) + ((8'ha0) ? (8'ha5) : (8'hbc))), {(8'hbe), ((8'hb6) ? (8'ha6) : (8'hbd))}}} ? (|((((8'hbc) > (7'h42)) * (^~(8'ha3))) ^~ (8'hbe))) : (~((((8'ha5) ? (8'hb4) : (8'hb7)) ? ((7'h40) ? (8'ha1) : (8'ha7)) : (&(8'ha5))) >> (~|(^~(8'hab)))))))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  input wire [(2'h2):(1'h0)] wire34;
  input wire [(4'ha):(1'h0)] wire33;
  input wire [(2'h3):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
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
                 (1'h0)};
  assign wire37 = ($unsigned(wire35[(1'h0):(1'h0)]) | (-(-({wire35} != $signed(wire35)))));
  assign wire38 = ({((~&(~wire37)) ?
                          (wire37[(4'hf):(4'h9)] ?
                              $unsigned(wire35) : (8'h9f)) : (~|(^wire35)))} < $unsigned(wire32[(1'h1):(1'h0)]));
  assign wire39 = wire33[(3'h7):(1'h0)];
  assign wire40 = ($signed((wire32[(1'h0):(1'h0)] - (8'ha4))) ?
                      wire37 : $signed((7'h43)));
  assign wire41 = {wire39, wire37};
  assign wire42 = wire35;
  always
    @(posedge clk) begin
      reg43 <= {($unsigned((-$unsigned(wire33))) | wire42[(2'h2):(2'h2)]),
          wire32[(2'h3):(2'h2)]};
    end
  always
    @(posedge clk) begin
      if ((^~wire37[(5'h10):(4'ha)]))
        begin
          reg44 <= wire40;
        end
      else
        begin
          reg44 <= $unsigned($unsigned($unsigned($signed(wire32))));
          if ($signed($unsigned($signed($unsigned(((8'hb6) ?
              wire42 : (8'hba)))))))
            begin
              reg45 <= (8'h9f);
              reg46 <= reg44[(4'h8):(4'h8)];
              reg47 <= $signed((wire42 ?
                  ($signed(((8'ha0) ? (8'ha8) : wire33)) ?
                      $unsigned((wire33 ?
                          wire39 : wire34)) : ($unsigned((8'hac)) ^~ $signed(wire35))) : (+wire37[(4'hd):(4'hb)])));
              reg48 <= ((($unsigned((wire41 ?
                      wire36 : wire42)) ^ reg45[(3'h7):(2'h2)]) ?
                  wire42 : wire39) - (-(wire41 * (reg46[(2'h2):(2'h2)] ?
                  ((8'hac) ? wire42 : reg43) : (reg44 ? (8'ha2) : wire40)))));
            end
          else
            begin
              reg45 <= {$unsigned($unsigned($signed({wire37, reg47}))),
                  ((reg43 == (~&(-reg48))) >> (~|$unsigned($signed(reg48))))};
              reg46 <= ($unsigned((reg44 ?
                      ({wire40} > ((8'h9c) * wire34)) : $signed($unsigned(wire39)))) ?
                  wire32 : $unsigned((wire34 ?
                      (+(~wire37)) : $signed((wire36 ? reg44 : (8'h9d))))));
              reg47 <= $signed($signed((8'had)));
              reg48 <= {((|wire41[(3'h5):(2'h3)]) ?
                      reg46[(3'h5):(1'h0)] : {$unsigned({(8'ha6)}),
                          (!$signed((7'h42)))}),
                  ($unsigned((&wire41[(3'h4):(1'h1)])) ?
                      ((~(reg45 ? wire33 : wire32)) ?
                          reg46 : $unsigned($signed(wire35))) : $unsigned($signed((reg43 ?
                          wire34 : reg46))))};
              reg49 <= wire39[(4'ha):(4'h8)];
            end
          reg50 <= (($unsigned((wire39[(4'ha):(1'h1)] ?
                  wire42[(2'h3):(1'h1)] : {wire33})) ?
              $unsigned((~&wire40)) : (+$unsigned($signed(wire41)))) - ($unsigned($unsigned((!(8'hb6)))) ?
              wire42[(3'h6):(2'h3)] : (8'hbd)));
          reg51 <= (&($unsigned(((wire39 ? wire33 : (8'ha1)) ?
              reg48[(4'h8):(2'h3)] : wire35[(1'h1):(1'h1)])) & ((!$unsigned(reg44)) ^~ (wire34[(1'h1):(1'h0)] <<< $unsigned(wire41)))));
          reg52 <= ($unsigned($signed($signed((reg45 * wire42)))) & (((8'hbb) ?
              ($unsigned(reg47) ?
                  (+wire41) : {(8'hab)}) : $unsigned($signed(wire35))) && $signed(wire37[(3'h7):(3'h5)])));
        end
      reg53 <= (((({reg51} ?
              (reg48 >= reg52) : (^~wire34)) < (((8'hb2) < wire34) == reg51)) ?
          (wire39[(2'h3):(1'h1)] != $unsigned(wire35)) : (+$signed(reg50))) > wire40[(3'h6):(2'h2)]);
      reg54 <= (&$unsigned(reg46[(3'h4):(3'h4)]));
      reg55 <= $unsigned((($unsigned($signed(wire36)) ?
          $signed((|reg52)) : reg47) <<< $signed($unsigned((reg51 ?
          reg50 : wire39)))));
    end
  assign wire56 = reg45;
  assign wire57 = reg55[(5'h15):(4'hc)];
  assign wire58 = (reg50[(5'h12):(4'h9)] >>> reg52[(4'ha):(4'ha)]);
  assign wire59 = $unsigned(($signed({(wire37 * wire40), reg50}) ?
                      (((+(7'h43)) << {(8'ha3)}) ?
                          ((wire58 ?
                              wire33 : wire56) && $unsigned(wire40)) : (reg49 ?
                              (+wire39) : reg52[(4'hf):(4'ha)])) : reg55[(3'h5):(1'h0)]));
  assign wire60 = (({{(|reg45)}} ?
                          reg45[(4'ha):(4'h9)] : ((~^reg43) & (reg46[(4'h9):(1'h0)] || (~|(8'ha6))))) ?
                      (wire36 && (~|$signed(wire37))) : wire33);
endmodule
