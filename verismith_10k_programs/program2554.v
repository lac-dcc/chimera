module top
#(parameter param107 = ((((|{(8'hbd), (7'h43)}) ? (((8'h9c) >>> (8'ha1)) ? ((8'hb5) ? (8'hb6) : (8'hb9)) : ((8'haa) ? (8'ha2) : (8'h9c))) : ((~^(7'h43)) ? ((8'ha7) ? (8'h9f) : (8'hb6)) : ((8'hae) ^ (8'hb6)))) << (~^(-(~(8'h9e))))) & (~|(((~^(8'h9f)) ? ((7'h41) & (8'hbe)) : ((8'hb2) ? (8'hbb) : (7'h43))) || ({(8'hbf)} <= ((8'hb7) <= (8'h9e)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire82,
                 wire6,
                 wire5,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire5 = wire4[(3'h7):(3'h4)];
  assign wire6 = wire1[(4'h8):(2'h2)];
  module7 #() modinst83 (.clk(clk), .wire10(wire1), .y(wire82), .wire8(wire0), .wire9(wire3), .wire11(wire6));
  always
    @(posedge clk) begin
      if ($unsigned({wire6, $unsigned(wire0)}))
        begin
          reg84 <= wire2[(2'h3):(1'h1)];
        end
      else
        begin
          reg84 <= (($signed(wire0) >>> wire6) <= (&$unsigned((!(wire5 ~^ reg84)))));
          reg85 <= wire2[(2'h2):(1'h0)];
          if (wire2)
            begin
              reg86 <= $unsigned(wire0[(4'h8):(3'h6)]);
              reg87 <= ($signed($signed(({reg85} ~^ ((8'haf) ?
                  (8'hbe) : reg84)))) >>> (($signed((wire5 ? wire3 : wire5)) ?
                  reg85[(4'hb):(2'h3)] : wire6) | $signed($signed($unsigned(wire82)))));
              reg88 <= (+wire2);
              reg89 <= (|wire0);
              reg90 <= (wire3[(4'ha):(3'h7)] ? reg87 : ((8'h9e) >>> wire6));
            end
          else
            begin
              reg86 <= (reg87 ? reg84[(5'h11):(4'hd)] : reg89[(3'h4):(2'h3)]);
              reg87 <= (($signed((^~(reg89 ?
                  reg89 : reg87))) - wire4) != (reg90[(3'h6):(3'h6)] ?
                  $unsigned($signed((wire3 ?
                      reg90 : reg88))) : wire0[(1'h1):(1'h1)]));
              reg88 <= reg88[(4'ha):(1'h0)];
              reg89 <= $unsigned($signed($signed(($unsigned(reg85) ?
                  $unsigned(reg85) : wire1))));
            end
        end
      reg91 <= ({((^~(wire4 ^ wire1)) ? (8'h9f) : {$signed(wire4)}),
              $signed(((8'hac) <<< (wire1 ? wire0 : wire5)))} ?
          (8'hbe) : reg89);
      reg92 <= {$signed((wire2 ?
              wire0[(3'h6):(3'h4)] : ($unsigned(reg89) <= $unsigned(wire6))))};
      if ($unsigned($unsigned($signed(reg92))))
        begin
          if ($signed(($signed((~$signed((8'hb9)))) ?
              $unsigned((^~$unsigned(reg92))) : wire82)))
            begin
              reg93 <= $signed(((wire5[(5'h11):(3'h4)] != ((wire82 >>> wire4) >= reg90)) & (8'hb8)));
              reg94 <= (({(+((8'hb0) ? reg91 : wire3)),
                      $unsigned(wire2[(1'h1):(1'h0)])} ?
                  (+reg88[(3'h7):(1'h0)]) : $unsigned(reg93)) != (wire3 & ($unsigned(reg85[(2'h2):(1'h1)]) ?
                  (^~$unsigned((8'hb2))) : (8'ha3))));
              reg95 <= $unsigned((($signed(reg84[(4'hf):(4'hc)]) * reg88[(4'h9):(3'h4)]) ?
                  (8'hb2) : (($unsigned(reg92) ?
                      (8'hb4) : (^~reg90)) ^ ($signed(reg93) ?
                      reg92[(2'h3):(1'h1)] : $signed(reg89)))));
              reg96 <= (wire1 ?
                  ((-($unsigned(reg85) | (wire3 ?
                      reg86 : (8'hb2)))) != reg90) : reg90);
              reg97 <= reg90;
            end
          else
            begin
              reg93 <= ({wire4[(3'h4):(3'h4)],
                      ($signed(((8'haa) > wire82)) <= $signed($unsigned(reg87)))} ?
                  ($unsigned($unsigned($signed(reg87))) ^~ (((~|wire2) ?
                      (|wire82) : $unsigned(wire5)) >> reg84[(4'hf):(3'h7)])) : reg90);
              reg94 <= reg85[(3'h7):(3'h5)];
              reg95 <= reg88;
              reg96 <= (|$unsigned($unsigned(reg95)));
              reg97 <= reg94;
            end
        end
      else
        begin
          reg93 <= $unsigned({{$unsigned((reg87 ? wire5 : wire3))}});
          reg94 <= (8'hbf);
          reg95 <= $unsigned((|(!($unsigned(reg96) ? wire6 : wire1))));
          if ({$signed((+wire2[(1'h0):(1'h0)])), $signed($signed(wire6))})
            begin
              reg96 <= (((reg96[(3'h4):(3'h4)] ?
                  {$signed(wire3)} : reg94[(5'h11):(3'h5)]) && reg88[(4'hc):(2'h2)]) >> ((wire4[(3'h4):(2'h3)] ?
                  $signed($unsigned(wire2)) : $unsigned({reg87})) - $unsigned((!$unsigned(reg87)))));
            end
          else
            begin
              reg96 <= (wire0[(1'h1):(1'h0)] ?
                  ($unsigned(wire4) ?
                      ({$unsigned(wire82),
                          $signed(reg94)} || $signed((reg86 << wire82))) : (reg97[(3'h6):(3'h6)] == $signed(reg86))) : (~&$signed((wire82[(3'h4):(1'h1)] || wire2))));
            end
          if ($unsigned(wire1[(4'hd):(2'h2)]))
            begin
              reg97 <= wire0[(3'h5):(3'h5)];
              reg98 <= $signed((reg91 ?
                  ($signed((reg90 ? (7'h43) : (8'ha9))) ?
                      $unsigned({reg87,
                          wire4}) : wire4[(1'h0):(1'h0)]) : $unsigned((7'h43))));
              reg99 <= ({(({(7'h44), wire3} ?
                      (reg85 ?
                          wire1 : reg86) : (~&wire5)) || (&$unsigned(reg88))),
                  $signed($unsigned($unsigned(wire0)))} | $unsigned(wire5[(4'h8):(4'h8)]));
              reg100 <= reg97[(2'h3):(1'h0)];
              reg101 <= reg87;
            end
          else
            begin
              reg97 <= {(~$signed($unsigned((reg91 ? reg97 : reg85))))};
              reg98 <= (!(+reg93[(1'h0):(1'h0)]));
            end
        end
      reg102 <= reg94;
    end
  assign wire103 = $signed(((wire1 >= {$signed(reg100), {reg101}}) ?
                       reg84[(3'h4):(1'h0)] : (^~(~^(reg101 >> reg97)))));
  assign wire104 = $signed(wire103);
  assign wire105 = (reg92[(3'h5):(3'h5)] ~^ $signed(wire82));
  assign wire106 = wire0;
endmodule

module module7
#(parameter param80 = {(((8'hba) & (+((7'h40) ^~ (8'hab)))) ~^ (((~^(8'hbc)) ^ (8'ha3)) != ((~|(8'hac)) ^ ((8'hb5) ? (7'h42) : (8'haf))))), (^~((^~((8'hbb) ? (8'hb3) : (8'hae))) ? ({(8'hbb)} ^ (8'h9f)) : {((8'h9c) <<< (7'h40)), ((7'h42) ? (8'hab) : (8'hb3))}))}, 
parameter param81 = (+(!param80)))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire77;
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  assign y = {wire79,
                 wire24,
                 wire25,
                 wire40,
                 wire77,
                 reg23,
                 reg22,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed((~&(((wire10 || wire9) ?
          (~^(8'haa)) : $unsigned(wire10)) | (8'h9e)))))
        begin
          if (wire10[(4'hf):(4'ha)])
            begin
              reg12 <= (!wire9[(2'h3):(1'h1)]);
              reg13 <= $signed($unsigned(reg12[(1'h0):(1'h0)]));
            end
          else
            begin
              reg12 <= (+$unsigned((~&((reg12 & (8'hbb)) <<< (wire8 * (8'hbb))))));
              reg13 <= reg13[(4'ha):(4'h8)];
              reg14 <= reg13[(4'ha):(3'h4)];
            end
          if (((-$signed($unsigned({(8'h9d)}))) ?
              ((8'hb1) ?
                  $unsigned(reg14[(1'h1):(1'h1)]) : (($unsigned(reg12) != (reg14 ?
                      wire10 : wire8)) | wire9[(4'hc):(4'h9)])) : $signed((wire11 > (&$unsigned(reg12))))))
            begin
              reg15 <= $signed({reg12[(4'ha):(1'h1)]});
              reg16 <= (^~(wire9[(1'h0):(1'h0)] >>> (wire10[(4'hc):(3'h4)] && (~|(wire10 >>> reg15)))));
              reg17 <= {((~^wire8) ?
                      reg16[(1'h0):(1'h0)] : (((wire9 >= reg14) < {reg15}) ?
                          wire10[(4'ha):(1'h1)] : wire11[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg15 <= (!reg13);
              reg16 <= (8'ha3);
              reg17 <= reg13;
            end
          reg18 <= reg15[(4'he):(4'hb)];
          reg19 <= reg16;
          reg20 <= (reg16[(3'h4):(1'h1)] ^~ (reg18[(4'hc):(3'h6)] ?
              (~(~(8'hbf))) : ((reg19 ?
                  $signed(reg12) : (-(8'hb8))) >>> {(8'hbf)})));
        end
      else
        begin
          if (reg15)
            begin
              reg12 <= reg20;
              reg13 <= $signed($unsigned(($signed($unsigned((8'hab))) ?
                  wire10 : $signed((^~wire8)))));
              reg14 <= $unsigned({wire11[(2'h2):(1'h1)]});
            end
          else
            begin
              reg12 <= (+$unsigned(reg12[(4'h8):(2'h2)]));
            end
        end
      reg21 <= reg17[(2'h2):(1'h0)];
      reg22 <= wire9;
      reg23 <= (wire11 ?
          ({{reg14[(1'h0):(1'h0)], reg22[(1'h1):(1'h1)]}, reg20} ?
              $unsigned((wire9[(4'h8):(3'h6)] <<< wire11[(2'h3):(1'h1)])) : wire11[(2'h2):(1'h1)]) : (reg13 * $signed($signed((!(8'hac))))));
    end
  assign wire24 = (reg19[(3'h7):(1'h1)] ^ $signed(($unsigned((wire10 ^ wire11)) - $signed((+reg12)))));
  assign wire25 = reg22[(2'h3):(2'h2)];
  module26 #() modinst41 (wire40, clk, reg18, reg17, reg14, reg16);
  module42 #() modinst78 (.clk(clk), .wire45(reg19), .wire43(wire10), .wire47(reg12), .y(wire77), .wire46(reg15), .wire44(reg18));
  assign wire79 = $unsigned($signed(($unsigned($unsigned(reg12)) >= (reg18[(4'he):(2'h2)] == wire24))));
endmodule

module module42
#(parameter param75 = (((^~({(8'hbe)} ? (^(8'hb6)) : ((8'hb0) * (8'hb7)))) ? ((8'hb3) >= {(~(7'h44)), ((7'h41) > (8'hbe))}) : (!{((8'ha2) ? (8'hbd) : (8'ha8)), ((8'h9e) <= (8'hb5))})) <= {(((&(8'hb8)) ? (+(8'hae)) : ((8'hae) ? (8'ha7) : (8'ha9))) > (((8'hbe) <= (8'hbc)) ? ((8'hb2) ? (8'hb9) : (8'ha2)) : (~(8'hba))))}), 
parameter param76 = {(~(((param75 ? param75 : param75) >= param75) > (((7'h41) << param75) < (param75 ? (8'hb4) : (8'ha5))))), param75})
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire47;
  input wire signed [(4'h9):(1'h0)] wire46;
  input wire [(5'h14):(1'h0)] wire45;
  input wire signed [(5'h11):(1'h0)] wire44;
  input wire signed [(2'h2):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire48 = ($unsigned((-$unsigned($unsigned(wire44)))) ?
                      {$unsigned({wire47}), wire47} : $signed((wire46 ?
                          wire46[(2'h2):(1'h1)] : $signed((!wire45)))));
  assign wire49 = (+$signed(($unsigned((wire43 ? (8'hba) : wire44)) ?
                      $unsigned(((8'h9e) ?
                          wire47 : wire44)) : wire48[(1'h0):(1'h0)])));
  assign wire50 = ((8'ha1) ?
                      (^$signed(wire47[(4'h8):(3'h4)])) : (~|((((8'hbf) ^~ wire48) ?
                          wire44[(2'h3):(1'h0)] : $signed(wire46)) <<< $unsigned(((8'hb2) <<< wire44)))));
  assign wire51 = (~$signed(($signed({(8'ha0), wire44}) <<< $signed((wire46 ?
                      wire44 : wire44)))));
  assign wire52 = wire47;
  assign wire53 = (wire46 > wire51);
  assign wire54 = {wire45[(4'hf):(3'h6)], wire50[(2'h2):(2'h2)]};
  always
    @(posedge clk) begin
      reg55 <= (($signed(((~(7'h41)) <= wire48[(3'h4):(2'h2)])) ?
              (|{$signed(wire53),
                  (~|wire48)}) : (wire49 ^~ $signed((wire51 * wire47)))) ?
          $unsigned(($unsigned((wire54 == (8'hbe))) != wire48)) : $unsigned((8'hbb)));
      reg56 <= (wire54 || {wire44,
          $signed((((8'hb8) - wire54) >= (~^wire53)))});
    end
  assign wire57 = wire51[(4'ha):(4'h8)];
  assign wire58 = $signed(wire45[(4'hc):(4'h8)]);
  assign wire59 = (!$unsigned($signed((~|(wire47 || reg55)))));
  assign wire60 = {$signed(({wire49, $signed((8'h9d))} ^~ (8'hbe)))};
  assign wire61 = (reg55[(4'ha):(1'h1)] ? $signed(wire48) : wire51);
  assign wire62 = ($signed((|wire60[(1'h0):(1'h0)])) ?
                      $signed((!wire43[(1'h1):(1'h1)])) : $unsigned($unsigned((~$unsigned((8'ha6))))));
  assign wire63 = wire50;
  assign wire64 = {((^wire44[(3'h6):(2'h2)]) ? wire60[(3'h7):(2'h3)] : wire62),
                      (-{(~wire57)})};
  assign wire65 = (8'ha3);
  assign wire66 = (^~$unsigned({$signed(wire60)}));
  always
    @(posedge clk) begin
      reg67 <= $unsigned($unsigned($signed((!wire66))));
      reg68 <= (~|(8'ha8));
      if (wire65)
        begin
          reg69 <= wire49;
          if ($signed((-wire45)))
            begin
              reg70 <= $unsigned(((wire58[(2'h3):(1'h1)] < (-$signed(wire48))) | $unsigned($unsigned($unsigned((8'ha5))))));
              reg71 <= (~&(&((^(wire48 > wire49)) >> (wire46[(4'h9):(3'h6)] <<< $signed(wire62)))));
            end
          else
            begin
              reg70 <= (-(wire49[(4'ha):(3'h6)] ~^ ($unsigned($signed(wire48)) ?
                  (^~$unsigned(wire57)) : (wire63[(2'h3):(2'h3)] ?
                      $unsigned(wire46) : $unsigned(reg55)))));
              reg71 <= $unsigned($unsigned($signed((wire50[(3'h6):(3'h5)] >> (~|wire54)))));
              reg72 <= wire63[(4'hf):(3'h5)];
              reg73 <= $signed((wire49[(3'h4):(2'h3)] ?
                  $signed(wire60[(4'he):(3'h7)]) : ((&((8'haf) + (8'ha2))) | $unsigned($signed(wire66)))));
              reg74 <= wire46;
            end
        end
      else
        begin
          if ((~|wire64[(5'h14):(1'h1)]))
            begin
              reg69 <= ($unsigned($signed((wire53 ?
                      wire66[(4'h8):(1'h1)] : (wire65 || wire61)))) ?
                  ($signed($signed((8'hba))) ?
                      wire60 : {((wire60 * (8'ha3)) ?
                              (|wire46) : wire45)}) : (^{reg70,
                      ((reg69 <= (8'hbe)) ? (!wire65) : (wire53 - wire53))}));
            end
          else
            begin
              reg69 <= (+wire59[(2'h2):(2'h2)]);
              reg70 <= reg67[(1'h0):(1'h0)];
              reg71 <= ((-$signed(((~^wire52) & ((8'h9d) ?
                  reg74 : wire45)))) + ($unsigned((reg74 ?
                      (-(8'hab)) : {wire60, reg68})) ?
                  (((wire51 << wire65) <= (wire43 ? reg73 : wire63)) ?
                      (~|$signed(wire54)) : $signed($unsigned(wire61))) : (($signed(wire57) <= wire61) ?
                      (~^$unsigned(wire59)) : $signed($unsigned((7'h44))))));
            end
          reg72 <= wire64;
        end
    end
endmodule

module module26
#(parameter param38 = (((((~|(8'hb7)) == ((8'hb8) ? (8'hb9) : (8'hb8))) ? (((8'ha1) ? (8'ha1) : (8'hac)) ? (~^(8'hbd)) : ((8'ha8) ? (8'hb2) : (8'hbb))) : ((^(8'ha8)) ? (^~(7'h42)) : ((8'hb9) ? (8'hb8) : (8'h9f)))) ? ((((8'hb3) ? (7'h44) : (8'ha7)) ? ((8'hac) ? (8'hb6) : (8'h9d)) : (^~(8'ha6))) ? (!(8'ha1)) : {((8'h9f) ? (8'hb4) : (8'hb3)), ((7'h43) + (8'ha0))}) : {{((8'hbe) ? (8'ha3) : (8'ha5))}}) >= {{(~^((8'ha8) ? (8'hb2) : (8'hae)))}, (~^(((8'h9f) ? (8'ha7) : (8'hb6)) ? ((8'h9d) | (8'ha9)) : (~^(8'hbf))))}), 
parameter param39 = (&param38))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  input wire [(3'h4):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  assign y = {wire37, wire36, wire35, wire34, wire33, wire32, wire31, (1'h0)};
  assign wire31 = wire29[(1'h0):(1'h0)];
  assign wire32 = wire29[(4'hb):(1'h1)];
  assign wire33 = (~^(~&$signed({$unsigned(wire27)})));
  assign wire34 = wire30;
  assign wire35 = (wire27[(1'h1):(1'h0)] ?
                      $signed((wire30[(3'h6):(2'h3)] << (-wire33))) : $unsigned($unsigned($unsigned(wire32))));
  assign wire36 = (^~(^wire31));
  assign wire37 = ($signed(($signed($signed((8'haa))) ~^ $unsigned($unsigned(wire33)))) ?
                      wire32 : ($unsigned(((+wire30) == (wire27 <<< (8'ha0)))) ?
                          (wire29[(4'hf):(3'h4)] ?
                              $unsigned((wire32 != wire28)) : (8'hb9)) : wire32));
endmodule
