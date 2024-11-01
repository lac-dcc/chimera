module top
#(parameter param178 = {({({(8'ha1)} > ((8'h9d) ^~ (8'ha2))), (((8'hbb) ? (8'ha4) : (8'hbe)) + {(8'ha8), (8'hab)})} != (^{{(8'h9d), (8'ha3)}, (+(8'ha2))}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h202):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire144;
  wire [(5'h15):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire146;
  wire signed [(3'h6):(1'h0)] wire147;
  wire signed [(5'h12):(1'h0)] wire148;
  wire signed [(4'hc):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire176;
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  assign y = {wire138,
                 wire60,
                 wire59,
                 wire57,
                 wire15,
                 wire140,
                 wire144,
                 wire145,
                 wire146,
                 wire147,
                 wire148,
                 wire149,
                 wire176,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
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
                 reg141,
                 reg142,
                 reg143,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(wire3);
      if ($signed(reg4[(4'he):(4'hb)]))
        begin
          reg5 <= $signed(wire0[(2'h3):(1'h1)]);
          if (wire0)
            begin
              reg6 <= ((reg5 & (&(~&wire3))) ?
                  (reg4[(3'h7):(3'h7)] & reg4) : $unsigned(reg4));
              reg7 <= wire0;
              reg8 <= reg6;
              reg9 <= ($unsigned((!reg6)) ?
                  ((reg8[(2'h2):(2'h2)] ?
                          $unsigned((&wire2)) : $signed(wire3)) ?
                      $unsigned(($unsigned(reg8) | wire3[(4'h8):(2'h3)])) : (reg4 | reg5[(4'ha):(3'h6)])) : ($signed({reg6[(3'h6):(1'h1)]}) ?
                      (($signed((8'hb2)) ? (8'hb7) : reg8) ?
                          ((wire1 + reg8) - (reg6 == wire2)) : (^~(reg8 ?
                              (7'h41) : reg8))) : (&reg5[(3'h6):(3'h5)])));
              reg10 <= $unsigned((reg8 ?
                  wire3[(3'h7):(3'h5)] : ($signed($unsigned(reg8)) ^~ {(wire2 ?
                          reg6 : wire0),
                      (8'h9e)})));
            end
          else
            begin
              reg6 <= ($signed((wire2[(1'h0):(1'h0)] >> ({reg10} >> (wire1 ?
                  (8'hba) : wire2)))) >= ($unsigned(reg8) ?
                  reg6[(4'hd):(2'h2)] : ($signed($signed(reg5)) ?
                      ($unsigned(wire3) ? (+wire0) : $unsigned(reg8)) : {wire3,
                          reg10[(1'h0):(1'h0)]})));
              reg7 <= $signed($signed((wire0 ?
                  (wire1 ? reg6 : wire0) : $signed((wire1 ? reg7 : reg8)))));
              reg8 <= $signed($signed(wire0));
              reg9 <= (&$unsigned((8'hbf)));
            end
          reg11 <= reg8[(3'h5):(1'h1)];
          reg12 <= (~&$signed((($signed(reg9) <<< $unsigned(reg5)) ^ (-((8'hbf) != reg11)))));
        end
      else
        begin
          reg5 <= ($signed(((reg6[(4'hb):(4'h9)] ~^ (8'hb5)) >>> reg12[(5'h11):(2'h2)])) ?
              $signed((~&((wire2 <= (7'h42)) ~^ {reg12}))) : {($unsigned(reg4) ^ $signed(wire1[(4'ha):(4'h9)])),
                  reg7});
        end
      reg13 <= $signed($signed(reg9[(5'h11):(4'he)]));
      reg14 <= (^~$unsigned((!(-reg9[(3'h6):(3'h6)]))));
    end
  assign wire15 = (&reg9);
  always
    @(posedge clk) begin
      reg16 <= reg11;
      reg17 <= reg13;
      if ($unsigned((8'h9d)))
        begin
          reg18 <= (&reg13[(5'h13):(5'h12)]);
          reg19 <= {$signed(reg9),
              ((|$unsigned(reg4)) > ((|$unsigned(reg5)) <= $unsigned(wire0)))};
        end
      else
        begin
          reg18 <= (-reg11);
          reg19 <= (reg16 * {{$unsigned((reg12 ? wire2 : wire15))},
              $unsigned(({reg17} & reg8))});
          reg20 <= ($unsigned($unsigned($unsigned((^~reg6)))) ?
              $unsigned(($unsigned($signed(reg16)) ?
                  {reg17[(5'h12):(2'h3)],
                      {wire2}} : reg4)) : $unsigned($unsigned((+(7'h42)))));
          reg21 <= $signed(({$signed((~&reg20)), reg12[(2'h3):(2'h2)]} ?
              $signed((-{reg12})) : wire0));
          reg22 <= $unsigned($signed(reg5[(4'ha):(3'h5)]));
        end
      reg23 <= (((reg20 ? {(~&reg8)} : $signed({reg11, (8'h9f)})) ?
          $unsigned(($signed(reg4) ?
              (~|reg9) : reg14)) : (reg7 >= wire15[(1'h0):(1'h0)])) <= (^$unsigned($signed(((8'ha6) ?
          reg19 : reg18)))));
      if ($signed((7'h43)))
        begin
          reg24 <= (-(~&$signed($signed(wire3))));
          reg25 <= $unsigned(wire2[(3'h7):(1'h1)]);
          if ($unsigned($signed($signed($unsigned((reg24 ~^ reg22))))))
            begin
              reg26 <= ($signed(reg23[(1'h0):(1'h0)]) ?
                  wire2 : (({reg18[(3'h4):(2'h3)],
                          (wire2 ? wire1 : reg13)} >= (&$unsigned(reg19))) ?
                      reg13 : (~&(^(7'h40)))));
            end
          else
            begin
              reg26 <= $signed(reg6);
            end
          reg27 <= (-((8'ha0) | (~$signed(wire15[(2'h2):(1'h1)]))));
        end
      else
        begin
          if (reg23)
            begin
              reg24 <= (^(reg23 ?
                  $unsigned(({(8'hbd),
                      (8'h9d)} || reg27[(2'h3):(1'h1)])) : reg9));
            end
          else
            begin
              reg24 <= ($signed({reg26[(3'h4):(1'h0)]}) - (reg25 ?
                  ($signed((wire15 <= reg19)) ?
                      wire0 : reg10) : $signed(reg12[(4'hc):(2'h2)])));
              reg25 <= $signed((reg5 ?
                  (((reg27 << reg21) ? $unsigned(reg22) : {reg12}) ?
                      $unsigned((reg25 || reg12)) : reg18) : (~|$signed(reg23))));
            end
          reg26 <= (($unsigned((|reg11[(3'h5):(3'h5)])) ~^ $unsigned((|(wire15 ?
              reg16 : wire2)))) ^~ $signed(($signed((reg26 ? reg23 : reg7)) ?
              $unsigned((reg10 >>> reg22)) : {reg8[(3'h5):(2'h3)]})));
        end
    end
  module28 #() modinst58 (wire57, clk, reg6, reg18, reg12, reg22, reg19);
  assign wire59 = (-{reg13, wire57[(1'h0):(1'h0)]});
  assign wire60 = ((wire57 != $signed($unsigned(reg21))) ?
                      $unsigned($signed(reg11[(1'h1):(1'h1)])) : $unsigned($unsigned(((~wire3) ?
                          $signed((8'hbf)) : (-reg14)))));
  module61 #() modinst139 (wire138, clk, reg5, reg19, reg10, wire2);
  assign wire140 = {{$signed((~&$signed(wire15))),
                           $unsigned(wire2[(4'h9):(2'h2)])},
                       (((!(reg21 || reg19)) || (^(reg6 > (8'ha1)))) >>> (8'haf))};
  always
    @(posedge clk) begin
      reg141 <= (^~reg11);
      reg142 <= (((~$unsigned((&reg23))) ?
              ($signed(reg141) * (reg12[(4'h8):(1'h0)] ?
                  (&(8'hb8)) : {wire59,
                      wire2})) : (reg10[(4'h9):(3'h7)] >> (reg5[(4'hb):(3'h7)] < $signed(wire138)))) ?
          $unsigned(wire1) : reg26[(3'h7):(3'h6)]);
      reg143 <= wire59;
    end
  assign wire144 = $signed(reg8);
  assign wire145 = (^{{((^reg141) < reg13), $signed((~|(8'hb8)))},
                       (wire138 != (8'had))});
  assign wire146 = {((^$signed((wire60 - reg24))) && reg18)};
  assign wire147 = reg12;
  assign wire148 = reg13;
  assign wire149 = (8'hb9);
  module150 #() modinst177 (wire176, clk, reg141, reg143, reg17, wire57);
endmodule

module module150
#(parameter param175 = ((~^((^{(8'h9e), (7'h41)}) != (~^((7'h42) < (8'haa))))) < {({(^~(8'hb2))} ? ({(8'h9e), (8'hb5)} ? (~|(8'hbb)) : ((8'hab) ? (8'ha8) : (8'hbe))) : (((8'h9c) << (8'hba)) <= {(8'ha4), (8'hb2)}))}))
(y, clk, wire151, wire152, wire153, wire154);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire151;
  input wire [(4'ha):(1'h0)] wire152;
  input wire signed [(5'h13):(1'h0)] wire153;
  input wire [(4'hc):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire155;
  wire signed [(5'h14):(1'h0)] wire156;
  wire signed [(4'he):(1'h0)] wire157;
  wire [(4'ha):(1'h0)] wire158;
  wire [(4'hd):(1'h0)] wire173;
  assign y = {wire155, wire156, wire157, wire158, wire173, (1'h0)};
  assign wire155 = $signed((-($unsigned((wire154 ? wire153 : wire153)) ?
                       (~&(wire154 ?
                           wire151 : wire152)) : {$signed(wire154)})));
  assign wire156 = wire154;
  assign wire157 = {{(~|$unsigned(wire151)), $signed(wire156[(4'hb):(4'h8)])}};
  assign wire158 = ({$signed($unsigned((~|wire156)))} - ($signed(wire154) << $unsigned(wire156[(5'h11):(2'h3)])));
  module159 #() modinst174 (wire173, clk, wire156, wire154, wire151, wire158, wire152);
endmodule

module module61
#(parameter param137 = (((!(~((8'ha1) ? (8'ha4) : (8'ha0)))) ? ((^((8'had) ? (8'h9e) : (8'ha3))) != (~|(~|(8'hb9)))) : (~|{(!(8'ha4)), ((8'hb5) ? (8'hbd) : (8'ha6))})) ? (+((~^{(8'hb8), (8'ha8)}) << (7'h44))) : ((-(((8'ha3) * (8'hb4)) || ((7'h40) ? (8'h9f) : (8'ha6)))) < (8'hb5))))
(y, clk, wire62, wire63, wire64, wire65);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire62;
  input wire signed [(4'hd):(1'h0)] wire63;
  input wire [(4'ha):(1'h0)] wire64;
  input wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire136;
  wire [(2'h2):(1'h0)] wire135;
  wire signed [(4'hf):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire132;
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire66,
                 wire67,
                 wire68,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire97,
                 wire99,
                 wire132,
                 reg98,
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
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire66 = (|$signed(({(~&wire62), ((8'ha0) ? wire62 : wire64)} ?
                      $signed((wire65 ? wire65 : wire62)) : wire65)));
  assign wire67 = (^wire66[(3'h5):(2'h3)]);
  assign wire68 = $unsigned(wire67[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire62)
        begin
          reg69 <= ($signed(((wire67 > $signed((7'h43))) == wire67[(1'h1):(1'h1)])) ?
              (($unsigned(wire63[(4'h8):(3'h6)]) ?
                  ((wire62 ? wire63 : wire68) ?
                      (wire64 ?
                          wire62 : wire62) : $unsigned(wire62)) : wire64[(2'h2):(2'h2)]) ^~ ((^~wire64) || ((wire67 <= (8'hb8)) ^~ (wire67 != (8'haa))))) : $unsigned(($signed((wire64 ?
                      wire66 : wire63)) ?
                  (~(wire65 ? (8'ha5) : wire63)) : wire65[(1'h0):(1'h0)])));
        end
      else
        begin
          reg69 <= (~&$signed(wire63));
        end
      reg70 <= (wire66 ?
          wire68 : $unsigned({($unsigned(reg69) ~^ (wire63 >> (8'hac)))}));
      if ($unsigned(reg70))
        begin
          reg71 <= $unsigned(wire64);
        end
      else
        begin
          reg71 <= wire67[(3'h6):(1'h0)];
        end
      reg72 <= $unsigned((~&wire63));
      reg73 <= $signed((+$signed(wire66[(2'h2):(2'h2)])));
    end
  assign wire74 = {{(^reg73[(5'h13):(3'h6)])},
                      $signed((^~(-$unsigned(reg73))))};
  assign wire75 = $unsigned((|((~&$unsigned(wire63)) <= ((wire74 ^ wire62) * (wire64 ?
                      reg71 : wire65)))));
  assign wire76 = reg72;
  assign wire77 = reg72[(3'h4):(1'h0)];
  assign wire78 = {{wire65[(3'h7):(2'h2)]}, $unsigned(wire68)};
  always
    @(posedge clk) begin
      reg79 <= (&wire67);
    end
  always
    @(posedge clk) begin
      if ({((-wire62[(1'h1):(1'h1)]) & {((wire67 ?
                  reg79 : wire74) <<< $signed((8'ha5)))})})
        begin
          reg80 <= wire65;
          if (wire64)
            begin
              reg81 <= (~(reg71 ? $signed(reg71) : wire64));
              reg82 <= (~|({{(wire77 ? reg79 : (8'hab)), wire68[(4'h9):(4'h8)]},
                      {(wire78 || (8'hac)), wire75}} ?
                  $unsigned({reg73,
                      wire66[(2'h2):(1'h1)]}) : (^~(wire67[(1'h0):(1'h0)] > wire65))));
            end
          else
            begin
              reg81 <= $signed(reg71[(2'h3):(2'h2)]);
              reg82 <= $signed((($signed($unsigned(wire65)) & (reg70 >>> reg71)) ?
                  $unsigned(((reg82 ? wire63 : reg81) << wire77)) : {(reg81 ?
                          {reg73, wire77} : wire75[(4'h8):(3'h6)]),
                      wire65[(3'h5):(2'h3)]}));
              reg83 <= (((((~reg69) ^ (~^wire77)) <<< ($unsigned((8'ha2)) ?
                          (8'h9e) : $signed(reg80))) ?
                      $unsigned($signed($unsigned(wire78))) : {((-wire63) - {reg79}),
                          wire75[(4'he):(4'he)]}) ?
                  ($unsigned((-reg79)) ^ ($unsigned((wire76 ?
                      reg70 : wire63)) != ((-wire76) ?
                      $signed(wire78) : wire62[(2'h2):(1'h0)]))) : (reg80[(2'h2):(1'h0)] ?
                      $unsigned((reg81 ?
                          $signed((8'hb0)) : {reg82, wire75})) : (({wire67} ?
                              (wire68 >= reg69) : $unsigned(wire65)) ?
                          (+$signed(reg81)) : {{reg80}, $unsigned(reg82)})));
              reg84 <= $signed(((^(((8'ha7) ?
                  wire76 : (7'h40)) < $signed(reg83))) ^~ ({$signed(reg70),
                      $unsigned((7'h43))} ?
                  $unsigned($signed(wire63)) : $unsigned((wire76 >= reg81)))));
              reg85 <= ({$unsigned({reg70[(3'h5):(1'h1)],
                      reg69})} + ((-((~^wire78) ?
                  (reg84 ? wire62 : (8'h9e)) : (^reg72))) << {(8'ha1)}));
            end
          reg86 <= ((|(({wire75} ? wire75 : (~^wire65)) < $signed(((7'h40) ?
                  reg85 : wire62)))) ?
              (~&reg80[(1'h0):(1'h0)]) : reg79[(1'h0):(1'h0)]);
        end
      else
        begin
          reg80 <= $signed($unsigned({{$unsigned((8'ha1))}}));
          reg81 <= ((&wire63) ?
              wire64 : ($unsigned($unsigned($signed(wire68))) - ((-((8'ha5) - reg73)) ?
                  wire62[(1'h0):(1'h0)] : (^~(~&reg80)))));
          reg82 <= ((wire65[(4'hc):(1'h0)] ?
              ($signed((wire75 < reg72)) > ($signed(wire67) ?
                  $signed(wire75) : wire64)) : (~reg82)) | $signed($unsigned((~(^~reg69)))));
          reg83 <= (~&(wire64[(2'h3):(1'h0)] ?
              (wire66[(1'h1):(1'h1)] <= $signed(reg81[(4'hb):(3'h4)])) : wire64));
          if (wire63[(3'h5):(2'h2)])
            begin
              reg84 <= wire66;
              reg85 <= (~($unsigned($signed((reg82 <<< (8'hb2)))) ?
                  (((wire75 ?
                      reg69 : reg83) & (8'ha1)) - wire68[(4'h9):(4'h9)]) : reg71));
              reg86 <= wire76;
              reg87 <= ((~&$signed(($signed(reg79) <= (wire62 * reg70)))) ?
                  {{(~^(~^(8'hb7))),
                          reg85}} : ((^$unsigned((wire75 ^ reg73))) == (~&wire77)));
              reg88 <= $signed($unsigned(($signed($unsigned(wire64)) ?
                  (reg82 ?
                      $unsigned(reg87) : (wire74 ?
                          wire64 : reg87)) : (+(~|(8'ha0))))));
            end
          else
            begin
              reg84 <= $unsigned(wire67);
              reg85 <= (wire62[(2'h2):(1'h1)] || (reg88[(1'h0):(1'h0)] ?
                  (^{(reg80 ? wire64 : reg69),
                      reg87[(5'h10):(4'hc)]}) : ((|(wire66 && (7'h41))) ?
                      wire78 : ($unsigned((8'hb0)) == {reg70, reg83}))));
              reg86 <= (~(+$unsigned(({wire62} ~^ wire67))));
              reg87 <= ((+wire63[(2'h2):(1'h1)]) < (!$unsigned($signed((reg83 && reg70)))));
              reg88 <= (-wire74);
            end
        end
      if (wire66[(3'h5):(3'h5)])
        begin
          reg89 <= $signed({$signed(wire67[(1'h0):(1'h0)]), wire65});
        end
      else
        begin
          reg89 <= $unsigned(wire68[(2'h3):(1'h1)]);
          reg90 <= ($signed(wire67[(2'h3):(2'h3)]) ?
              {($signed(wire64) | ((8'hb4) ?
                      (~(8'ha4)) : reg73[(4'h9):(1'h1)]))} : ((reg73 ?
                      $signed(wire74) : ($signed(reg80) <= reg89)) ?
                  reg86 : $signed({((8'hba) ? wire77 : wire66),
                      $unsigned((8'hbd))})));
          if (($unsigned(($signed($signed(wire68)) ?
                  $signed((wire68 ? reg80 : wire78)) : $unsigned(reg84))) ?
              {(-(reg90 != (reg82 ? reg87 : reg79))), wire64} : (|((^~{wire66,
                  (8'hb2)}) == (reg72 * (reg90 ? reg90 : reg81))))))
            begin
              reg91 <= {reg83[(4'hd):(1'h0)]};
            end
          else
            begin
              reg91 <= reg88[(2'h2):(1'h0)];
              reg92 <= ((wire67 >= reg80[(3'h6):(1'h1)]) ?
                  $signed((+(wire75[(2'h3):(2'h3)] != $signed(reg84)))) : (8'hb6));
            end
          reg93 <= $unsigned(wire64);
        end
      if ({(($unsigned(reg84) ?
                  $unsigned($unsigned(wire67)) : ($unsigned((7'h43)) ?
                      ((8'hbf) ? reg86 : wire68) : (reg83 ?
                          (8'haf) : wire78))) ?
              reg80[(3'h4):(2'h2)] : ((-{reg86, reg85}) - (8'h9e))),
          (~&(wire76 ?
              ($unsigned(reg86) == (reg84 ? wire74 : reg72)) : wire62))})
        begin
          reg94 <= ((+$signed($signed($unsigned(wire76)))) ?
              (reg87 ?
                  $unsigned(reg86) : $unsigned($signed(wire67))) : {(^(reg92 ?
                      $signed(wire67) : (reg85 & reg92))),
                  $signed((~|$unsigned((7'h42))))});
          reg95 <= ({wire78[(1'h0):(1'h0)]} ? {(-(!(8'ha8)))} : (8'ha6));
          reg96 <= ((((wire64 ?
              wire74[(4'he):(4'hd)] : (reg93 ?
                  reg71 : reg85)) * reg89) * ($unsigned((wire64 ?
                  reg94 : reg79)) ?
              $unsigned({(8'h9c)}) : reg93)) > reg91);
        end
      else
        begin
          reg94 <= (&((8'hb3) ^ ($signed({reg80}) ?
              (+$signed(reg94)) : wire66)));
        end
    end
  assign wire97 = (8'ha9);
  always
    @(posedge clk) begin
      reg98 <= $unsigned(reg71[(4'h8):(3'h6)]);
    end
  assign wire99 = reg89;
  module100 #() modinst133 (wire132, clk, reg81, reg84, reg87, reg82, wire64);
  assign wire134 = {wire78[(2'h2):(1'h1)]};
  assign wire135 = $signed(wire134);
  assign wire136 = ($unsigned(reg98) ? (8'haa) : reg70);
endmodule

module module28
#(parameter param56 = {(((((7'h44) ? (8'hac) : (7'h41)) ? ((8'ha7) & (8'hb7)) : (~^(8'hb3))) ? (((8'hab) ? (8'hba) : (8'h9d)) ? (~^(8'ha3)) : (^(8'hb1))) : ((8'ha7) ? ((8'ha1) >>> (8'hb4)) : ((8'h9f) ? (8'h9e) : (8'hbc)))) == ((((8'h9e) || (8'haf)) <= ((8'h9e) * (8'ha3))) ? ((!(8'haa)) >>> (~^(8'hb8))) : (~((8'h9c) ? (8'hba) : (8'ha6))))), ({((~(8'hbe)) ? (+(8'h9c)) : ((8'hac) * (7'h44)))} <<< {{(8'ha0)}, (~|(&(7'h42)))})})
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  input wire signed [(4'ha):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire34 = (((($signed((8'haa)) == (wire30 | wire31)) ?
                          $unsigned((wire31 && wire29)) : $unsigned((wire30 ?
                              wire31 : wire32))) ^ wire29[(2'h2):(1'h0)]) ?
                      (~^wire33[(4'he):(2'h3)]) : {wire32});
  assign wire35 = (({$signed(wire31[(3'h4):(1'h0)])} ~^ (~$unsigned(wire34[(2'h2):(1'h1)]))) ?
                      ($unsigned(wire29) ^~ (wire33 * $unsigned($unsigned((8'hb9))))) : wire30);
  assign wire36 = wire31;
  assign wire37 = wire33;
  assign wire38 = $signed((|(wire35 ? wire33[(3'h5):(3'h5)] : (7'h43))));
  always
    @(posedge clk) begin
      reg39 <= $unsigned($signed((((wire29 - (8'haa)) ?
              (wire37 > wire37) : (wire32 >> wire38)) ?
          wire35[(2'h2):(1'h0)] : ((wire38 + (8'ha5)) >> wire38[(4'hc):(3'h7)]))));
      reg40 <= ($unsigned((($signed(wire29) ?
              (&wire29) : wire35[(3'h6):(2'h3)]) << {wire29,
              wire34[(2'h3):(2'h3)]})) ?
          ($signed((&(wire36 ?
              wire31 : wire29))) <<< $signed((-$unsigned(wire30)))) : wire31);
      reg41 <= (wire33 ?
          (wire29[(3'h4):(1'h1)] & (8'ha8)) : (($signed(wire36) ?
              $signed(wire34[(4'hd):(4'h9)]) : wire36) <<< wire34[(4'h8):(3'h6)]));
      reg42 <= $signed((+wire31[(2'h3):(2'h2)]));
      if (((~&$signed(wire30[(4'hb):(1'h0)])) ?
          $signed(reg39) : $signed(reg40)))
        begin
          reg43 <= wire35[(3'h5):(2'h2)];
          if (($unsigned(((wire29 && (|(8'hb0))) ?
                  {$unsigned(wire38)} : $signed(reg40[(4'h8):(3'h6)]))) ?
              $signed((7'h42)) : $unsigned(wire31[(5'h13):(5'h13)])))
            begin
              reg44 <= (~reg39);
              reg45 <= (-(|{$signed(wire31)}));
              reg46 <= reg40[(3'h5):(3'h5)];
              reg47 <= wire38;
            end
          else
            begin
              reg44 <= wire34;
              reg45 <= (^reg42[(3'h7):(3'h4)]);
              reg46 <= $unsigned((reg42 ? {reg47} : reg44[(3'h6):(2'h3)]));
            end
          reg48 <= (|$unsigned(reg45[(1'h0):(1'h0)]));
          reg49 <= {$signed((|reg44[(1'h1):(1'h1)]))};
        end
      else
        begin
          reg43 <= $signed((+reg40[(2'h3):(2'h2)]));
          if ((|$unsigned($unsigned(reg43))))
            begin
              reg44 <= (8'ha2);
              reg45 <= $signed($signed(((7'h44) ?
                  wire36 : ($unsigned(reg43) ?
                      (reg48 ? reg47 : reg47) : (wire37 ? reg43 : wire33)))));
            end
          else
            begin
              reg44 <= wire37[(1'h0):(1'h0)];
              reg45 <= reg40[(1'h0):(1'h0)];
            end
          reg46 <= (!wire35);
          reg47 <= wire29;
        end
    end
  assign wire50 = wire38;
  assign wire51 = $signed($unsigned(reg41));
  assign wire52 = $unsigned((((~^$signed(wire34)) ~^ (-reg42)) ?
                      wire51[(2'h3):(1'h0)] : {(~reg48[(1'h1):(1'h0)]),
                          reg43}));
  assign wire53 = {reg46[(4'hf):(4'hc)]};
  assign wire54 = reg49[(4'h8):(2'h3)];
  assign wire55 = $signed((reg49 >= ((((8'hbb) ? wire53 : reg46) ?
                          wire34 : reg39[(2'h2):(1'h0)]) ?
                      reg42 : (wire54 ?
                          $unsigned(wire53) : ((8'hae) < wire29)))));
endmodule

module module100
#(parameter param131 = (((((-(8'hab)) == ((8'h9e) && (8'h9d))) - ((!(8'haf)) ? ((8'hb7) ? (8'hb0) : (8'hba)) : (8'ha9))) ? (^~(((8'ha2) << (8'ha9)) < (7'h44))) : (^~((!(7'h41)) >= ((8'ha1) == (8'hb2))))) ? ((+(&(|(8'hac)))) && (({(8'hb2), (8'hb2)} <= ((8'hba) ^ (7'h42))) ? (((8'hb5) || (7'h44)) ? ((8'hb7) ^~ (8'haa)) : (~^(8'hb7))) : {((8'ha5) ? (7'h41) : (8'ha0))})) : ((~|(!(8'hab))) >>> (^~(((8'hbd) - (8'hb4)) ? (|(8'hb5)) : ((8'ha6) ? (7'h44) : (8'ha8)))))))
(y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire105;
  input wire signed [(5'h13):(1'h0)] wire104;
  input wire signed [(5'h15):(1'h0)] wire103;
  input wire [(3'h5):(1'h0)] wire102;
  input wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire130;
  wire signed [(4'h9):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire signed [(4'hf):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire106;
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire106,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire106 = wire102[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned((wire101[(2'h3):(2'h3)] ?
          (|(8'hbe)) : (wire101 ? wire105 : wire105))))))
        begin
          reg107 <= wire104;
          if (wire105[(2'h3):(1'h0)])
            begin
              reg108 <= (~&$unsigned(wire104));
              reg109 <= ($unsigned((8'ha7)) || (({wire103[(1'h1):(1'h0)]} + ((~&wire103) ?
                  wire105 : {wire104})) >= wire106[(4'h8):(3'h7)]));
            end
          else
            begin
              reg108 <= $signed($signed($signed((wire101[(4'ha):(4'ha)] << (wire104 ?
                  reg107 : (8'ha0))))));
              reg109 <= ((&$unsigned(((wire102 ? (8'hab) : wire102) ?
                  ((8'had) ? (8'ha8) : reg107) : {reg107,
                      (8'ha0)}))) && wire106);
            end
          reg110 <= (((wire105 >>> ($unsigned(reg108) && ((7'h44) >>> wire102))) || $signed((~$signed(wire102)))) ?
              wire105 : ($unsigned(wire106[(4'hb):(4'hb)]) ^~ $unsigned(wire102[(2'h2):(2'h2)])));
          reg111 <= (wire105[(2'h3):(2'h2)] ?
              $signed((wire104[(2'h3):(1'h1)] >>> $signed((~wire101)))) : ({$signed((reg109 ?
                          wire102 : reg109))} ?
                  $signed($unsigned($signed(wire103))) : $signed($unsigned((wire106 ?
                      wire102 : wire103)))));
        end
      else
        begin
          reg107 <= {(wire104 ?
                  wire105 : $unsigned({wire106[(3'h5):(1'h1)], (~(8'hb9))})),
              $unsigned(reg111[(3'h7):(1'h1)])};
          reg108 <= wire105[(4'h9):(3'h6)];
          reg109 <= $signed((+($signed((~^wire104)) < ((wire104 && wire104) ?
              (wire103 << wire101) : reg107))));
        end
      if (reg109)
        begin
          reg112 <= wire102[(1'h0):(1'h0)];
          reg113 <= wire101;
          if ($unsigned(($unsigned({$unsigned(reg110)}) ?
              {{$unsigned(wire103), wire103},
                  reg112[(2'h3):(2'h2)]} : $signed((&((8'hbb) >> wire101))))))
            begin
              reg114 <= (($unsigned((~|reg110)) ?
                      wire103 : (reg107 ?
                          $unsigned((wire103 & reg111)) : $signed((reg111 ^~ reg110)))) ?
                  (~&((&(reg111 - reg107)) * ($unsigned(reg110) ?
                      ((7'h42) ?
                          wire105 : reg108) : (~&reg109)))) : {$unsigned({(wire103 >> (8'hbd))}),
                      ((~^(reg111 ? wire104 : reg108)) >>> ($signed(reg108) ?
                          (-reg107) : (&reg113)))});
              reg115 <= (~|$unsigned((8'hb8)));
              reg116 <= reg115;
              reg117 <= reg116[(4'hf):(3'h6)];
              reg118 <= (~^$unsigned($signed($signed((wire103 ?
                  (8'ha9) : reg112)))));
            end
          else
            begin
              reg114 <= $signed(reg111);
              reg115 <= $signed(wire106);
              reg116 <= wire103[(4'h9):(3'h7)];
              reg117 <= {$signed(reg114[(1'h0):(1'h0)])};
              reg118 <= wire105;
            end
          reg119 <= $signed(reg115);
        end
      else
        begin
          if (wire106)
            begin
              reg112 <= ((|{wire102[(2'h2):(1'h0)]}) == {reg111[(3'h4):(2'h2)],
                  ((^~(wire102 ^~ reg108)) ?
                      {{(8'ha2), reg107},
                          reg111[(3'h7):(3'h4)]} : (wire106 + reg116))});
              reg113 <= ((!(($signed(reg112) ?
                          (~&reg109) : ((8'hb0) - reg115)) ?
                      (~(^(8'ha9))) : (|(wire104 ? reg117 : reg117)))) ?
                  ((&($signed(reg118) ?
                          ((8'hb8) ? reg113 : wire104) : (~reg107))) ?
                      (reg119[(1'h0):(1'h0)] ?
                          $signed($signed((8'hbc))) : reg114[(3'h5):(3'h5)]) : $unsigned((~reg118[(5'h10):(4'h8)]))) : ($signed((((8'hb5) < reg109) >> (reg119 ?
                      wire102 : (8'hb1)))) || reg115));
            end
          else
            begin
              reg112 <= (($signed(($signed(reg109) >= ((8'ha3) <= (8'hbb)))) << $unsigned((((8'ha8) ^~ wire106) ?
                      reg115 : (wire106 ? reg118 : reg111)))) ?
                  $signed((reg117 + reg115)) : (-reg114));
              reg113 <= $unsigned($unsigned(({$unsigned(reg115)} ^~ (-reg116))));
              reg114 <= ((wire104[(2'h2):(1'h1)] ?
                      ((^~$unsigned(reg111)) ~^ {wire102[(3'h5):(1'h0)],
                          (-reg116)}) : reg113) ?
                  {$unsigned(reg109[(1'h1):(1'h1)]),
                      $unsigned(wire102[(3'h5):(1'h0)])} : (8'hab));
              reg115 <= reg107[(4'hc):(4'h9)];
              reg116 <= (reg115[(4'h9):(4'h9)] ?
                  (reg108[(3'h5):(3'h5)] ^ ((~^wire105[(1'h1):(1'h0)]) ?
                      $signed(reg107) : ($signed((7'h44)) <<< (~wire101)))) : wire106);
            end
          reg117 <= reg111[(4'h8):(2'h3)];
          reg118 <= wire102[(2'h3):(1'h1)];
          reg119 <= (!$signed({$signed((~|wire105)), reg107[(4'h8):(2'h3)]}));
          reg120 <= $signed($signed(reg116));
        end
    end
  assign wire121 = (8'haf);
  assign wire122 = $unsigned({reg107[(4'he):(4'h9)],
                       ((&(~|wire105)) ?
                           $unsigned((~^reg117)) : (~^$unsigned(reg118)))});
  assign wire123 = (8'hb1);
  assign wire124 = reg108;
  assign wire125 = (reg112[(3'h4):(1'h0)] <<< reg111[(4'hb):(1'h0)]);
  assign wire126 = (~^(8'ha0));
  assign wire127 = (+reg108[(3'h4):(3'h4)]);
  assign wire128 = {$unsigned($signed(($signed(reg119) ?
                           {reg113, (7'h42)} : $signed(reg118)))),
                       reg115[(2'h2):(1'h1)]};
  assign wire129 = {(8'ha9)};
  assign wire130 = (~^{{(&(reg115 | (8'hb9))), $unsigned($signed((8'hbf)))},
                       reg119[(2'h2):(2'h2)]});
endmodule

module module159  (y, clk, wire164, wire163, wire162, wire161, wire160);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire164;
  input wire signed [(4'hb):(1'h0)] wire163;
  input wire [(4'he):(1'h0)] wire162;
  input wire signed [(4'ha):(1'h0)] wire161;
  input wire signed [(3'h6):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire172;
  wire signed [(4'ha):(1'h0)] wire171;
  wire signed [(4'h9):(1'h0)] wire170;
  wire [(2'h3):(1'h0)] wire169;
  wire signed [(2'h3):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire167;
  wire signed [(3'h7):(1'h0)] wire166;
  wire [(2'h2):(1'h0)] wire165;
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 (1'h0)};
  assign wire165 = (($signed(wire162) ~^ $signed($signed({wire164}))) > (wire163 >= wire161[(1'h0):(1'h0)]));
  assign wire166 = $signed(wire165);
  assign wire167 = ($unsigned(wire163) >> (~|(~(!{wire163, wire166}))));
  assign wire168 = wire160;
  assign wire169 = ($unsigned(($signed(wire161) == ({wire162, wire160} ?
                       $unsigned(wire164) : wire168))) != (wire167[(1'h0):(1'h0)] ?
                       (({wire161} ?
                           {wire166,
                               wire160} : $unsigned((7'h43))) >> wire162) : ((&((8'hbc) ^ (7'h43))) ?
                           {wire168} : (^$unsigned(wire167)))));
  assign wire170 = {(|$unsigned((~|$unsigned(wire166))))};
  assign wire171 = ($signed($signed(wire161[(4'h8):(3'h6)])) ^ wire166);
  assign wire172 = wire160;
endmodule
