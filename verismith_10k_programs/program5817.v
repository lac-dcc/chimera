module top
#(parameter param162 = {((!({(8'ha7)} + {(8'haf), (7'h40)})) ? (&(~{(8'hb7)})) : ((~((8'ha2) ^ (8'hb2))) << (+(8'ha4))))}, 
parameter param163 = (^~(-(^param162))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire161;
  wire signed [(3'h6):(1'h0)] wire160;
  wire signed [(4'hc):(1'h0)] wire159;
  wire [(5'h14):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire156;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire156,
                 wire29,
                 wire28,
                 wire27,
                 wire15,
                 wire14,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ((&wire3) < ((wire4[(3'h5):(3'h4)] ^ (wire2 || wire0[(4'h8):(4'h8)])) ?
          ((wire3 | (wire1 ^~ wire0)) ^~ {(+wire2),
              wire2[(4'h9):(2'h2)]}) : ({wire0, (wire0 && (8'ha4))} ?
              ($signed((8'ha8)) > (^wire1)) : wire3[(4'ha):(2'h2)])));
      reg6 <= $signed(wire4[(4'h8):(3'h6)]);
      if ((+$signed((8'ha5))))
        begin
          reg7 <= wire3[(4'h8):(3'h7)];
          reg8 <= (~|$unsigned(reg6[(3'h4):(1'h0)]));
          reg9 <= $unsigned(((($unsigned(wire0) <= ((8'hb8) ?
              wire2 : reg7)) != ((wire2 ?
              wire1 : wire4) || (wire2 ^~ wire1))) > $signed($signed((reg6 ?
              wire4 : reg7)))));
          if ((reg5[(4'hd):(1'h0)] ?
              wire4 : $signed($unsigned($unsigned((wire4 ? reg6 : reg6))))))
            begin
              reg10 <= (~(wire0[(4'hd):(4'hc)] ?
                  ($signed(reg9) ?
                      wire3[(3'h6):(1'h0)] : wire2) : (~&$unsigned((wire0 ?
                      wire2 : (7'h41))))));
            end
          else
            begin
              reg10 <= wire3;
            end
          reg11 <= $signed((reg7 ?
              $signed(reg5[(4'h8):(2'h3)]) : $signed(({(8'hb5),
                  reg9} * (~wire3)))));
        end
      else
        begin
          reg7 <= wire2[(2'h3):(1'h0)];
          reg8 <= (&{$unsigned(((wire3 ? reg11 : wire4) ?
                  reg10 : $signed(reg6)))});
        end
      reg12 <= $unsigned((|$unsigned($signed(reg8))));
      reg13 <= ((^wire2) > (wire3 ?
          $unsigned($unsigned((wire1 ? wire1 : reg5))) : ((reg9 && ((8'hb9) ?
                  (8'ha1) : reg8)) ?
              reg5 : ($signed(reg5) ^~ $unsigned(wire0)))));
    end
  assign wire14 = wire1;
  assign wire15 = (|$unsigned($signed(reg5[(4'hb):(3'h4)])));
  always
    @(posedge clk) begin
      if (reg6[(3'h5):(2'h2)])
        begin
          if ($unsigned($unsigned((~&{(^~reg13), (wire3 | reg10)}))))
            begin
              reg16 <= ((reg7 <= ($signed((wire14 && (7'h43))) ?
                  (reg12 ? (wire15 < wire1) : (+wire4)) : reg9)) & ((((~wire2) ?
                          reg10[(2'h2):(1'h0)] : (reg12 ? (8'ha1) : wire2)) ?
                      reg11[(4'he):(4'hb)] : $unsigned(reg9)) ?
                  (8'ha3) : $signed(wire3[(4'h9):(3'h7)])));
            end
          else
            begin
              reg16 <= ($unsigned(reg5[(4'ha):(3'h5)]) ?
                  reg6 : $unsigned($signed($unsigned(reg7[(2'h2):(1'h0)]))));
              reg17 <= (~|$unsigned(wire0[(3'h4):(1'h1)]));
              reg18 <= (^((($signed((8'ha2)) >> (reg11 ?
                      (8'hb6) : (8'h9c))) != (-(reg8 >>> wire0))) ?
                  (reg6[(3'h5):(2'h3)] == {wire2,
                      wire15}) : (reg7[(2'h2):(1'h0)] >>> ($signed(wire15) | reg12))));
              reg19 <= (({$signed((|wire4))} ?
                  (($unsigned(reg18) < $unsigned(wire2)) << (-(reg8 >= reg7))) : (($unsigned(reg7) + $unsigned(wire0)) ?
                      ({(8'h9d)} != {reg6}) : ({(8'hb7),
                          reg9} ~^ $unsigned(wire4)))) ~^ ({(~&(reg10 || wire4))} != reg12[(3'h6):(1'h0)]));
            end
          reg20 <= ({$signed(((reg13 << reg16) ? $unsigned((8'hb7)) : {reg13})),
                  wire0} ?
              {(&(~(|reg11)))} : {(8'hb5), reg19});
          reg21 <= (~&($unsigned((((8'ha1) != wire3) ?
                  reg19[(1'h0):(1'h0)] : $unsigned(reg18))) ?
              reg6[(1'h0):(1'h0)] : reg10[(1'h0):(1'h0)]));
          reg22 <= $unsigned((wire0 ?
              wire2 : $signed(($unsigned(reg5) ?
                  ((8'hac) ^ reg11) : $signed(reg9)))));
          reg23 <= wire1[(2'h2):(2'h2)];
        end
      else
        begin
          reg16 <= wire2;
          if ($signed((reg9 ? (^~((-reg6) | wire4[(3'h4):(1'h1)])) : reg20)))
            begin
              reg17 <= $signed((8'ha6));
              reg18 <= {wire14[(4'ha):(3'h4)],
                  ($unsigned((((8'hab) + wire4) < (+wire3))) ?
                      reg23 : $signed($unsigned($unsigned(reg21))))};
              reg19 <= (reg8 ^~ $unsigned($signed(((reg5 > reg5) >>> $signed(reg13)))));
              reg20 <= $signed(reg21[(2'h2):(1'h0)]);
            end
          else
            begin
              reg17 <= reg10;
            end
          reg21 <= $signed((!wire4[(2'h2):(1'h1)]));
          reg22 <= {{((~reg22) && $signed($unsigned(reg22)))}};
        end
      reg24 <= {(reg6[(3'h5):(1'h0)] ?
              wire3[(2'h2):(1'h0)] : $signed((reg6 ?
                  (^~reg8) : (reg6 ^~ reg18)))),
          (reg10 ?
              $unsigned(({reg6} + (reg8 ?
                  reg6 : reg19))) : wire0[(4'h9):(3'h4)])};
      reg25 <= $unsigned({reg24[(2'h2):(1'h0)],
          $signed((reg11 ? (reg18 >> reg11) : (~^reg16)))});
      reg26 <= $signed(wire1);
    end
  assign wire27 = {(~|{reg12[(4'hb):(3'h7)]})};
  assign wire28 = (7'h41);
  assign wire29 = wire28[(4'h9):(3'h6)];
  module30 #() modinst157 (.wire33(reg9), .clk(clk), .wire31(reg26), .wire32(wire29), .wire34(wire14), .y(wire156), .wire35(reg8));
  assign wire158 = $unsigned(($signed(wire29[(5'h10):(4'hc)]) >> $unsigned((|(wire156 - wire3)))));
  assign wire159 = $unsigned(wire1);
  assign wire160 = (($signed(reg11) + $signed(((|wire158) ?
                       reg22[(1'h1):(1'h1)] : $unsigned(wire28)))) <= $unsigned((&(!(wire3 ?
                       reg9 : wire29)))));
  assign wire161 = $unsigned($unsigned((reg23 ?
                       (8'hb2) : ((&reg17) ~^ $unsigned(reg17)))));
endmodule

module module30  (y, clk, wire31, wire32, wire33, wire34, wire35);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire [(5'h10):(1'h0)] wire33;
  input wire [(4'hc):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire152;
  wire signed [(4'he):(1'h0)] wire151;
  wire signed [(4'hc):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire149;
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire104,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire53,
                 wire149,
                 (1'h0)};
  assign wire36 = $signed($signed((7'h40)));
  assign wire37 = (7'h44);
  assign wire38 = (wire34 | $signed(wire36[(1'h0):(1'h0)]));
  assign wire39 = (8'hbf);
  assign wire40 = (~&$unsigned(wire34));
  assign wire41 = (+(~^(~^(8'hab))));
  module42 #() modinst54 (wire53, clk, wire32, wire33, wire40, wire38, wire34);
  assign wire55 = wire38[(4'ha):(3'h6)];
  assign wire56 = $signed($unsigned(wire33));
  assign wire57 = wire35[(3'h4):(2'h2)];
  assign wire58 = $signed($signed(wire57[(1'h0):(1'h0)]));
  assign wire59 = wire33[(4'hb):(3'h7)];
  module60 #() modinst105 (.wire63(wire32), .wire64(wire40), .wire65(wire31), .y(wire104), .wire62(wire38), .wire61(wire57), .clk(clk));
  module106 #() modinst150 (wire149, clk, wire53, wire55, wire35, wire41, wire38);
  assign wire151 = (|wire59[(3'h4):(2'h2)]);
  assign wire152 = ((($unsigned((wire55 ?
                       wire41 : wire35)) - {$signed((8'h9f))}) >> ($unsigned(wire58[(3'h6):(1'h1)]) ^~ ($unsigned(wire37) ^ (^wire37)))) - ((wire38 ?
                       ($unsigned((8'ha8)) ?
                           (wire35 ?
                               wire34 : wire57) : (!wire58)) : $signed((~wire35))) - (~&($unsigned(wire31) >= (~|wire149)))));
  assign wire153 = $unsigned({((((8'hbb) ? wire53 : wire104) ?
                               wire56 : $signed(wire34)) ?
                           $unsigned(wire35[(1'h0):(1'h0)]) : (+$signed(wire40)))});
  assign wire154 = (wire38 >>> ($signed(($unsigned(wire55) == wire151[(4'h8):(3'h4)])) < $signed($signed((8'hbb)))));
  assign wire155 = $unsigned(($signed($unsigned((wire151 ? wire34 : wire32))) ?
                       $unsigned({(wire38 ?
                               wire41 : wire104)}) : (!{(^wire32)})));
endmodule

module module106
#(parameter param147 = ({(+({(8'hb8)} ? ((8'h9e) || (8'ha9)) : ((8'ha1) ? (8'ha2) : (8'hbe))))} ? ((+{((8'haf) & (8'hb5))}) ? {(7'h43), {(^~(7'h42))}} : {(((8'hba) << (8'hac)) - ((8'ha7) ? (8'haf) : (8'haf)))}) : (((~^((8'ha8) != (8'hbb))) ? (^~((8'hb3) | (8'ha6))) : ({(7'h41), (8'had)} >> ((8'ha8) < (8'h9e)))) | {({(7'h41), (8'ha4)} ? (~&(8'hb1)) : (^(8'h9e))), (((8'ha8) ? (7'h42) : (8'hbc)) ? (-(8'ha9)) : ((8'ha7) ? (8'hab) : (8'hba)))})), 
parameter param148 = {(~&((|{param147, param147}) ? ({param147} != (param147 <<< param147)) : (~&(param147 == param147))))})
(y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire111;
  input wire [(4'hb):(1'h0)] wire110;
  input wire signed [(4'h8):(1'h0)] wire109;
  input wire [(4'ha):(1'h0)] wire108;
  input wire [(5'h12):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire146;
  wire [(2'h3):(1'h0)] wire130;
  wire signed [(5'h10):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(2'h3):(1'h0)] wire122;
  wire [(4'hf):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire116;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire112;
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg143 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  assign y = {wire146,
                 wire130,
                 wire129,
                 wire128,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg145,
                 reg144,
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
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire112 = wire111;
  assign wire113 = ((&{$unsigned(wire107)}) ?
                       (!(((wire108 - wire107) > wire111[(1'h1):(1'h1)]) ?
                           $unsigned(wire108[(3'h5):(3'h4)]) : $unsigned(wire107))) : (~|((wire111[(1'h0):(1'h0)] ~^ (wire112 ?
                           wire109 : wire110)) + $signed(wire108))));
  assign wire114 = (~&wire108);
  assign wire115 = (($signed((-(wire114 ? wire108 : wire111))) ?
                       {(wire107[(1'h0):(1'h0)] < wire112[(2'h2):(1'h1)])} : $unsigned((wire107 ?
                           (+wire112) : wire108[(1'h1):(1'h1)]))) >>> $signed($unsigned(wire107)));
  assign wire116 = ((~|$signed(($signed((8'hb5)) ?
                       $unsigned(wire109) : wire107))) && $unsigned($unsigned($unsigned((-wire107)))));
  assign wire117 = ((!(wire113[(4'h9):(1'h1)] <<< (|{wire109}))) ?
                       (wire114 & (~&wire113)) : ((8'haa) <= $signed((&$unsigned(wire110)))));
  assign wire118 = (wire114[(2'h2):(2'h2)] ?
                       (~|($signed(wire117[(4'h8):(3'h7)]) == (wire107 == wire108))) : $signed({(~|(wire108 < wire109))}));
  assign wire119 = (8'hba);
  assign wire120 = (8'hac);
  assign wire121 = (({((^(8'hba)) ?
                               $unsigned(wire108) : wire117)} * {(~&(+wire113)),
                           $signed((wire119 != (8'hb5)))}) ?
                       $unsigned($signed({(-wire112)})) : (~wire120[(1'h1):(1'h1)]));
  assign wire122 = (~&$unsigned(($signed((wire119 * wire108)) > $signed($signed(wire121)))));
  always
    @(posedge clk) begin
      reg123 <= $unsigned(wire115);
      reg124 <= {$signed(($unsigned(wire121) ?
              (+{wire116}) : wire118[(1'h1):(1'h0)]))};
      reg125 <= reg123[(4'hf):(4'ha)];
      reg126 <= $unsigned(wire115[(1'h1):(1'h0)]);
      reg127 <= $unsigned($signed(wire112[(1'h1):(1'h0)]));
    end
  assign wire128 = wire107;
  assign wire129 = (!(wire120 >>> {{wire122, $signed(reg124)}}));
  assign wire130 = $unsigned($signed({$unsigned($unsigned(wire111))}));
  always
    @(posedge clk) begin
      if (reg123[(3'h5):(1'h1)])
        begin
          if ($unsigned($signed($unsigned(($signed(wire118) ?
              ((8'hbe) ? wire107 : wire108) : {wire118, wire115})))))
            begin
              reg131 <= ({(^~((~&wire121) & $signed(reg124))),
                  $unsigned(wire111)} * {{(!(wire114 ? wire115 : wire112)),
                      {wire115[(3'h4):(1'h0)], ((8'haf) ? wire118 : wire129)}},
                  (~^wire119[(4'h9):(4'h9)])});
              reg132 <= (~&wire122[(1'h0):(1'h0)]);
              reg133 <= (reg132 ?
                  (~wire114) : (~&({(wire119 ?
                          reg123 : wire111)} - wire107[(4'h8):(1'h0)])));
              reg134 <= ({(^~wire119[(4'he):(3'h5)])} || wire119[(2'h3):(1'h0)]);
            end
          else
            begin
              reg131 <= $signed(((~|wire128) && wire119));
              reg132 <= {(~&reg123), (8'haa)};
            end
          if ($signed((wire122[(2'h2):(1'h1)] && reg131[(2'h2):(1'h0)])))
            begin
              reg135 <= ((~|((~reg126) ?
                  ({wire110} < $signed(wire128)) : (~&(wire112 <<< reg134)))) | wire117);
              reg136 <= {(!$signed(wire117[(1'h1):(1'h0)])), reg134};
              reg137 <= reg132[(3'h4):(2'h3)];
            end
          else
            begin
              reg135 <= $signed(wire130);
              reg136 <= wire116;
              reg137 <= (~^reg137[(2'h2):(1'h0)]);
              reg138 <= {reg123[(4'ha):(4'h9)]};
              reg139 <= (((~^$unsigned((wire112 <= wire116))) ?
                  (wire116[(4'h8):(3'h5)] ?
                      ({wire109} || (reg133 ?
                          wire112 : reg123)) : wire130) : wire118) || ($unsigned(((~wire107) ?
                  (~&(8'hb4)) : ((7'h44) <= wire113))) && ($unsigned(((8'hbc) ?
                      wire119 : wire111)) ?
                  {(wire116 >= wire114)} : $signed((wire122 * wire121)))));
            end
          reg140 <= (($unsigned(($unsigned(reg139) * (-(8'hb9)))) ?
                  ($signed((reg125 ? wire120 : (8'hb4))) ?
                      reg132[(1'h0):(1'h0)] : ($unsigned((8'h9c)) + $unsigned(reg139))) : $signed(((^~wire117) >>> (wire114 ~^ reg124)))) ?
              ((wire114[(3'h5):(1'h1)] ?
                      $signed((reg132 ?
                          wire128 : wire117)) : $unsigned({wire130})) ?
                  ((~|(wire110 ?
                      wire108 : wire116)) <<< $unsigned((^~reg125))) : $signed(((~|reg134) ?
                      reg134 : (wire107 ?
                          (8'hb3) : (8'hab))))) : $unsigned($unsigned((^~(wire107 && reg124)))));
          reg141 <= (~^((wire111 ?
              ({(8'h9f), wire109} ?
                  $signed(reg131) : wire110[(4'ha):(4'h9)]) : reg139) > reg126[(1'h0):(1'h0)]));
          reg142 <= {$signed($unsigned($signed((wire110 || wire121))))};
        end
      else
        begin
          reg131 <= $signed($unsigned($signed($signed((reg124 ?
              reg138 : wire112)))));
          if ((7'h40))
            begin
              reg132 <= ((+(&$unsigned(wire128))) ?
                  {wire120[(1'h1):(1'h0)],
                      $signed({(reg137 >= reg137),
                          reg137})} : (wire114[(4'h8):(2'h3)] ?
                      $unsigned(reg133) : (reg139 ~^ ((~^wire112) ~^ $signed(wire121)))));
              reg133 <= wire128[(1'h0):(1'h0)];
              reg134 <= wire113[(3'h6):(2'h3)];
              reg135 <= $unsigned((8'hb1));
            end
          else
            begin
              reg132 <= ($unsigned(reg132[(1'h1):(1'h0)]) ?
                  (~&wire114[(3'h5):(3'h4)]) : wire108[(1'h0):(1'h0)]);
              reg133 <= $signed(reg134);
            end
          reg136 <= {$unsigned($unsigned($unsigned($unsigned(wire122))))};
        end
      reg143 <= {((wire129[(1'h1):(1'h1)] - $unsigned($signed(wire128))) ?
              reg136 : ($signed($unsigned(reg138)) ?
                  wire110[(2'h2):(2'h2)] : ((reg126 ? (8'ha9) : wire116) ?
                      ((8'hb8) >>> (8'hbe)) : wire112))),
          $signed(wire121[(1'h1):(1'h0)])};
      reg144 <= reg131;
      reg145 <= (reg137 >>> (((8'hb6) && reg124) || $signed($signed((~wire107)))));
    end
  assign wire146 = $unsigned(wire117);
endmodule

module module60
#(parameter param102 = {(~^{(^((8'ha1) && (7'h43))), {(8'ha4), (~|(8'had))}})}, 
parameter param103 = (param102 ? (8'h9e) : (-({((8'hb3) ? param102 : param102)} ? param102 : (param102 << (8'ha5))))))
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire65;
  input wire signed [(3'h5):(1'h0)] wire64;
  input wire [(5'h15):(1'h0)] wire63;
  input wire signed [(4'ha):(1'h0)] wire62;
  input wire [(3'h4):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire94,
                 wire89,
                 wire84,
                 wire83,
                 wire82,
                 wire70,
                 wire69,
                 reg96,
                 reg95,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire64[(2'h2):(1'h1)]))
        begin
          reg66 <= ((wire62[(1'h1):(1'h0)] ?
                  $unsigned(wire62[(2'h3):(1'h1)]) : wire65[(1'h0):(1'h0)]) ?
              (wire61[(2'h2):(1'h1)] ?
                  {((-wire65) ^~ (wire64 ?
                          wire64 : (7'h43)))} : wire62) : wire65[(4'he):(4'hd)]);
          reg67 <= $unsigned(wire63);
          reg68 <= (^(-($signed(wire62) ? (^~reg67[(2'h3):(1'h1)]) : (8'hba))));
        end
      else
        begin
          if ((8'hbd))
            begin
              reg66 <= ((!(($unsigned(wire62) ? (^~reg68) : $unsigned(reg67)) ?
                      {wire63,
                          $unsigned(wire64)} : $unsigned($unsigned(reg68)))) ?
                  {$unsigned($signed(wire62[(4'h9):(4'h9)])),
                      $signed(($signed(reg68) ?
                          reg67 : ((8'hb9) ?
                              wire62 : reg67)))} : (wire65 ~^ ($unsigned((^wire63)) ?
                      $unsigned((~&reg67)) : (&wire64))));
            end
          else
            begin
              reg66 <= wire62;
            end
        end
    end
  assign wire69 = wire61[(2'h3):(2'h2)];
  assign wire70 = (~wire62[(3'h7):(2'h2)]);
  always
    @(posedge clk) begin
      if ({$signed(wire63)})
        begin
          reg71 <= ((reg68 << wire64) ?
              {((!wire62) != reg67[(3'h6):(2'h2)])} : (-$signed((8'ha5))));
          if ({wire63})
            begin
              reg72 <= (wire70 ?
                  wire61[(1'h0):(1'h0)] : (~(reg71 ?
                      reg71 : $unsigned($signed(wire69)))));
              reg73 <= wire64;
              reg74 <= (^{((~$unsigned((8'hbc))) ?
                      ({reg73} + (reg72 << reg66)) : (|(^wire70)))});
              reg75 <= $signed(((~&reg73[(1'h1):(1'h0)]) ?
                  {(~|reg73[(4'hc):(3'h7)])} : wire65));
              reg76 <= wire63;
            end
          else
            begin
              reg72 <= (wire70[(4'ha):(2'h2)] == $signed(wire61[(2'h3):(2'h2)]));
              reg73 <= wire70[(3'h5):(2'h2)];
              reg74 <= wire65;
            end
          if ($signed({reg73}))
            begin
              reg77 <= (-reg67);
              reg78 <= $signed(wire70[(3'h5):(1'h1)]);
            end
          else
            begin
              reg77 <= (-$unsigned($signed((reg76 ?
                  wire61[(1'h0):(1'h0)] : $unsigned(wire63)))));
              reg78 <= ($signed(($unsigned(reg68[(3'h4):(1'h0)]) ?
                  reg77[(1'h0):(1'h0)] : ((wire62 ? reg77 : reg75) ?
                      reg76 : reg74))) & reg76[(4'h9):(1'h1)]);
              reg79 <= $unsigned($signed({(reg67 >= $signed(reg78))}));
            end
        end
      else
        begin
          reg71 <= {($signed((~(wire65 ? reg68 : reg72))) ?
                  $unsigned(reg75) : $unsigned($signed(((8'hb7) ?
                      reg78 : reg73)))),
              $signed(wire62)};
        end
      reg80 <= (wire64 ? (|(wire65[(4'h8):(1'h0)] | (8'ha8))) : (8'ha9));
      reg81 <= wire65;
    end
  assign wire82 = reg68[(1'h1):(1'h0)];
  assign wire83 = ((+$signed(($signed(reg79) ?
                      $unsigned(wire82) : (reg76 ? reg72 : reg72)))) ^~ wire64);
  assign wire84 = reg78[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg85 <= (wire69 ?
          $unsigned({reg72, reg68[(1'h1):(1'h0)]}) : reg78[(5'h10):(4'h8)]);
      reg86 <= $unsigned((8'hb0));
      reg87 <= {$signed(reg81[(3'h6):(2'h3)]), (^~reg77[(3'h5):(3'h4)])};
      reg88 <= (-(+{wire84}));
    end
  assign wire89 = $unsigned($signed($signed(reg77[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg90 <= $signed(reg68[(3'h7):(3'h7)]);
      reg91 <= {(reg88 ?
              ($unsigned($unsigned(reg87)) ?
                  {reg66[(3'h6):(3'h4)],
                      (reg81 ?
                          wire64 : reg87)} : ((reg79 + reg71) < (wire62 ~^ reg85))) : (~{(reg78 ?
                      wire83 : wire89),
                  $signed(reg75)}))};
      reg92 <= reg91[(2'h2):(1'h1)];
      reg93 <= (reg91 ?
          ($signed({reg73[(4'hd):(4'hc)], wire69}) ?
              ((wire64 - wire89[(3'h4):(1'h0)]) * $unsigned($unsigned(reg74))) : (reg88 ?
                  (+(reg79 ?
                      reg92 : (8'hbb))) : reg67[(1'h1):(1'h1)])) : {(reg91[(2'h2):(1'h1)] ?
                  (~|{(8'hb2), reg79}) : wire63[(5'h12):(4'h8)]),
              $signed((^$unsigned((7'h42))))});
    end
  assign wire94 = (((~reg91) ?
                      $unsigned(((wire65 ?
                          wire63 : reg66) || {reg77})) : wire84) * $unsigned(((~$signed(reg88)) ?
                      (+(wire70 << (7'h42))) : $signed($signed(reg92)))));
  always
    @(posedge clk) begin
      reg95 <= $unsigned((+$unsigned(((^reg73) ?
          (wire84 ? wire89 : wire63) : (reg71 ? reg75 : wire61)))));
      reg96 <= (~|(($signed($signed(reg79)) ?
          reg92 : (wire61 ? (8'ha0) : reg80[(1'h0):(1'h0)])) >= (|reg95)));
    end
  assign wire97 = {$signed({$unsigned((reg74 ? reg74 : reg74))}),
                      $signed(({reg67[(1'h0):(1'h0)], $unsigned(wire82)} ?
                          $unsigned({wire65, reg87}) : $signed(wire62)))};
  assign wire98 = $signed({(^wire65[(4'ha):(4'h8)]),
                      $signed($signed(reg67[(2'h2):(2'h2)]))});
  assign wire99 = (reg93 ?
                      (($unsigned((reg74 ? wire94 : reg87)) ?
                          ((-reg92) <<< $unsigned(reg77)) : reg76) >= $unsigned($unsigned({reg92,
                          wire83}))) : (~|(((^reg96) ?
                          (^reg68) : (wire62 >> wire84)) >= $unsigned((|(8'hb2))))));
  assign wire100 = $signed({$signed((~wire89)),
                       $signed((wire94[(3'h4):(2'h3)] * (reg93 ?
                           wire98 : reg91)))});
  assign wire101 = {reg87[(2'h2):(1'h0)],
                       $unsigned({(~|(wire64 ? reg76 : reg72))})};
endmodule

module module42
#(parameter param52 = ((~|((~|((8'hac) ? (8'hbc) : (8'h9c))) & (^((8'ha5) ? (8'hbd) : (8'hb5))))) | {{(((8'hab) != (8'ha6)) ? ((8'hb0) || (7'h42)) : ((8'ha6) >> (8'hab))), {((8'hb4) ? (7'h44) : (8'ha9))}}, (8'ha8)}))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire47;
  input wire [(3'h7):(1'h0)] wire46;
  input wire signed [(4'hc):(1'h0)] wire45;
  input wire signed [(5'h10):(1'h0)] wire44;
  input wire [(4'ha):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  assign y = {wire51, wire50, wire49, wire48, (1'h0)};
  assign wire48 = {{(wire44[(4'hf):(4'hf)] ?
                              (wire47 || (wire44 ?
                                  wire45 : wire44)) : wire44[(4'h8):(3'h6)])},
                      wire44[(1'h0):(1'h0)]};
  assign wire49 = $unsigned(((wire48 ?
                          $unsigned({wire45, (8'haa)}) : (&(~&wire44))) ?
                      wire44 : wire47));
  assign wire50 = ($signed((-wire49)) ?
                      wire44 : ((((wire43 && wire47) ?
                          $signed(wire44) : (&wire47)) != $unsigned($unsigned(wire44))) * $signed(wire47)));
  assign wire51 = $unsigned((|($signed($signed(wire48)) ^ {{wire50, wire46}})));
endmodule
