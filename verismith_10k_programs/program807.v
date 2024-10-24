module top
#(parameter param169 = (((~^(&((8'ha9) & (8'hba)))) & (8'hb6)) * (|((-((8'hae) ? (8'hba) : (7'h41))) < {(8'hb0)}))), 
parameter param170 = (8'hb5))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire168;
  wire signed [(5'h13):(1'h0)] wire167;
  wire [(4'h8):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire165;
  wire [(2'h2):(1'h0)] wire164;
  wire signed [(2'h2):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire147;
  wire signed [(2'h3):(1'h0)] wire148;
  wire [(5'h11):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire150;
  wire [(3'h5):(1'h0)] wire162;
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire9,
                 wire10,
                 wire141,
                 wire147,
                 wire148,
                 wire149,
                 wire150,
                 wire162,
                 reg26,
                 reg25,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (&wire2[(3'h6):(3'h5)]);
      reg5 <= $unsigned($signed((((+(8'hb3)) ?
              (wire2 ? (8'hb6) : wire3) : $unsigned(wire3)) ?
          $signed(wire1[(4'hd):(3'h4)]) : (reg4 ^ (wire0 || reg4)))));
      if (($signed($signed($unsigned(reg5[(4'h8):(3'h4)]))) ?
          $unsigned(wire3[(4'ha):(3'h4)]) : $signed(($unsigned(wire2) - wire2[(4'hb):(4'hb)]))))
        begin
          reg6 <= wire1[(1'h1):(1'h0)];
          reg7 <= wire1[(3'h6):(3'h5)];
        end
      else
        begin
          reg6 <= reg5;
          reg7 <= reg5;
        end
      reg8 <= $signed(wire1);
    end
  assign wire9 = {$signed((($unsigned(reg7) | $signed(wire0)) >> $signed((reg5 ?
                         wire2 : reg7))))};
  assign wire10 = (+wire3);
  always
    @(posedge clk) begin
      if (reg6)
        begin
          reg11 <= {(-wire2[(3'h7):(2'h3)]),
              {(reg7[(3'h7):(1'h1)] ?
                      {((8'hb2) ? wire2 : reg5),
                          $unsigned(reg4)} : ((-reg6) + $unsigned(wire1))),
                  $signed(({(8'hbb), wire9} ?
                      {reg6, wire2} : {(8'hac), reg8}))}};
          reg12 <= reg4[(2'h2):(1'h1)];
          reg13 <= $signed(({reg5, reg8} ? reg8 : (^wire0[(4'he):(4'ha)])));
          reg14 <= (((|wire2) != $signed((!reg13[(1'h1):(1'h0)]))) * reg11[(1'h1):(1'h0)]);
        end
      else
        begin
          reg11 <= wire3[(4'hb):(2'h3)];
          if ((~wire10))
            begin
              reg12 <= $unsigned(((|$signed((reg11 || reg11))) ~^ ((|(8'h9f)) ?
                  ($unsigned(wire2) && reg7[(4'h8):(2'h2)]) : wire2)));
              reg13 <= $unsigned((((~^$unsigned((7'h42))) < reg11) ?
                  reg11[(1'h0):(1'h0)] : ($unsigned((wire0 ?
                      reg4 : reg5)) < (~^$unsigned((8'hbf))))));
              reg14 <= $signed(reg14);
            end
          else
            begin
              reg12 <= (reg4 >= reg14);
              reg13 <= $unsigned(wire0);
              reg14 <= (~^(8'hbc));
              reg15 <= ($signed($signed($signed(reg11))) | (8'ha1));
            end
          if ($signed($unsigned(wire3)))
            begin
              reg16 <= (^(^~({wire1[(2'h2):(1'h1)], {reg13}} && reg14)));
              reg17 <= wire9;
              reg18 <= $unsigned((reg5 ?
                  reg7[(4'hb):(1'h1)] : (~^reg7[(4'hc):(3'h4)])));
              reg19 <= (+(wire3[(3'h5):(3'h5)] ?
                  (~|(reg14 <<< $unsigned(reg7))) : (reg11 ?
                      ((~reg5) > (wire9 == reg16)) : reg4)));
              reg20 <= reg4;
            end
          else
            begin
              reg16 <= reg5[(3'h7):(3'h6)];
              reg17 <= (!((7'h44) >> $signed({(wire3 << reg5),
                  $signed(reg4)})));
              reg18 <= ($signed((reg14[(4'h9):(1'h1)] ?
                  wire2[(3'h5):(2'h2)] : $signed((reg12 ?
                      (8'hbb) : wire9)))) < $unsigned($signed((^~(reg5 ?
                  reg11 : reg12)))));
              reg19 <= {(~&((((8'ha0) * reg8) ?
                          $signed(reg8) : $signed((8'ha0))) ?
                      $signed((reg7 ~^ reg16)) : (!$signed(reg20))))};
            end
          reg21 <= reg13;
          if (((^($signed($unsigned(reg5)) ?
                  reg12 : (~|(reg8 ? reg12 : wire10)))) ?
              $signed(reg16[(1'h1):(1'h0)]) : $signed((reg16[(1'h1):(1'h1)] ?
                  $unsigned(wire3[(1'h1):(1'h0)]) : reg12))))
            begin
              reg22 <= $signed(wire0);
              reg23 <= reg6;
            end
          else
            begin
              reg22 <= (+(!wire10));
              reg23 <= ({($signed((reg11 == reg15)) || ($signed(reg15) ?
                          $signed(wire2) : $unsigned(reg16)))} ?
                  ({wire10[(2'h3):(2'h2)],
                      $signed((&(8'haa)))} >> (wire0 ~^ ($signed((8'had)) ~^ (reg5 | reg8)))) : reg5);
              reg24 <= (~|$signed((reg13 ? reg15 : $signed($signed(wire0)))));
              reg25 <= (wire0[(2'h3):(2'h3)] >= (!$signed($unsigned(reg11))));
              reg26 <= $unsigned((8'hb8));
            end
        end
    end
  module27 #() modinst142 (.wire30(reg24), .y(wire141), .wire32(reg21), .clk(clk), .wire28(reg13), .wire31(reg19), .wire29(reg26));
  always
    @(posedge clk) begin
      reg143 <= wire2[(4'hb):(4'ha)];
      reg144 <= ($signed($unsigned($unsigned(((8'hbf) + reg19)))) != $signed((wire0[(4'h9):(1'h1)] ^~ wire10[(4'he):(4'ha)])));
      reg145 <= ((8'hab) - {wire9});
      reg146 <= (($unsigned($unsigned((~reg17))) - ($unsigned({wire141}) ?
          (reg6 ?
              reg5[(4'h8):(3'h4)] : $signed(reg17)) : ($signed(reg4) ~^ $signed(wire141)))) && (reg143 * ((~$signed(wire141)) + reg18[(1'h1):(1'h1)])));
    end
  assign wire147 = ($unsigned(reg13) ?
                       {(wire1 & (~^(wire141 <<< wire0)))} : ($signed((reg25[(4'ha):(4'h8)] <= (~|reg146))) <<< (reg8[(2'h2):(2'h2)] != (^~((8'h9d) != reg24)))));
  assign wire148 = reg24;
  assign wire149 = (reg143 ?
                       $unsigned($unsigned($unsigned((^~reg7)))) : $signed((reg7[(4'ha):(3'h4)] >> (reg14 ?
                           (reg12 ?
                               (8'ha1) : (8'haa)) : ((7'h40) <= reg146)))));
  assign wire150 = (reg25[(4'hf):(3'h7)] ?
                       ($unsigned($signed({reg24})) ~^ $unsigned($signed($unsigned((8'hbd))))) : (|(({reg146} & {reg17}) ?
                           ((wire9 ? (8'h9c) : reg19) ?
                               (reg144 ?
                                   reg8 : (8'h9c)) : (!reg21)) : $signed($signed(wire148)))));
  module151 #() modinst163 (wire162, clk, reg144, wire3, reg14, reg24);
  assign wire164 = $unsigned(reg23[(3'h7):(2'h2)]);
  assign wire165 = (^$unsigned($signed($signed((wire147 ~^ reg13)))));
  assign wire166 = wire9[(1'h1):(1'h1)];
  assign wire167 = reg20[(1'h1):(1'h1)];
  assign wire168 = (($unsigned((~|(|(8'hba)))) ?
                       $signed(reg21[(4'h9):(3'h4)]) : (reg14 ?
                           (|(reg6 < reg6)) : $unsigned((wire147 ?
                               wire149 : reg5)))) << reg26);
endmodule

module module151
#(parameter param160 = (&(-{{((8'hb3) ? (8'hb6) : (8'hae))}, (~|((7'h44) ? (8'hb1) : (8'ha9)))})), 
parameter param161 = (((&param160) ? (((~param160) >>> param160) ? param160 : (param160 - (param160 && param160))) : (((param160 < param160) & (param160 ? (7'h42) : param160)) ? ((8'hbe) ? {param160} : (~|param160)) : ((!param160) ? ((8'hab) << param160) : (param160 ? param160 : param160)))) ? param160 : (&(^{{param160, param160}}))))
(y, clk, wire155, wire154, wire153, wire152);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire155;
  input wire signed [(4'h8):(1'h0)] wire154;
  input wire [(3'h6):(1'h0)] wire153;
  input wire signed [(4'h8):(1'h0)] wire152;
  wire signed [(5'h12):(1'h0)] wire159;
  wire signed [(5'h15):(1'h0)] wire158;
  wire [(3'h7):(1'h0)] wire157;
  wire signed [(3'h6):(1'h0)] wire156;
  assign y = {wire159, wire158, wire157, wire156, (1'h0)};
  assign wire156 = (|(&$signed($signed(wire154))));
  assign wire157 = $signed($signed((!($unsigned(wire154) < (wire152 && (8'ha7))))));
  assign wire158 = (wire152[(3'h6):(1'h1)] ?
                       $signed((wire152 << wire152)) : ((((wire152 ?
                           wire154 : wire152) >> wire155) ^~ ({wire153} - {wire153,
                           wire155})) < (wire156[(1'h0):(1'h0)] ?
                           (wire153 ?
                               wire156[(3'h5):(2'h3)] : $unsigned(wire153)) : $signed((wire156 == wire153)))));
  assign wire159 = $signed($signed({wire153[(2'h3):(2'h2)],
                       $signed((&wire158))}));
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire32;
  input wire [(4'hc):(1'h0)] wire31;
  input wire [(4'hc):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire29;
  input wire signed [(3'h7):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire140;
  wire [(4'hf):(1'h0)] wire139;
  wire [(3'h7):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire137;
  wire [(5'h14):(1'h0)] wire136;
  wire [(4'hb):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire124,
                 wire91,
                 wire90,
                 wire87,
                 wire37,
                 wire36,
                 wire34,
                 wire33,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg89,
                 reg35,
                 (1'h0)};
  assign wire33 = wire28;
  assign wire34 = $signed($unsigned(((~^$signed(wire29)) && wire28)));
  always
    @(posedge clk) begin
      reg35 <= wire33[(4'hb):(3'h5)];
    end
  assign wire36 = wire32[(4'h9):(3'h6)];
  assign wire37 = wire29[(2'h2):(1'h0)];
  module38 #() modinst88 (.clk(clk), .wire39(wire37), .y(wire87), .wire41(wire33), .wire42(wire32), .wire40(reg35), .wire43(wire34));
  always
    @(posedge clk) begin
      reg89 <= wire31[(1'h1):(1'h0)];
    end
  assign wire90 = (($unsigned(reg35) ?
                          wire37[(1'h0):(1'h0)] : ((wire32 != (8'hb6)) ?
                              wire30 : (~(+wire34)))) ?
                      (wire32[(3'h4):(2'h2)] ?
                          wire87[(4'hd):(4'h8)] : (^~wire34[(4'h9):(2'h3)])) : $unsigned(wire31));
  assign wire91 = ((8'ha1) >> $unsigned((^~wire87[(2'h3):(1'h1)])));
  module92 #() modinst125 (wire124, clk, wire33, wire29, wire37, wire90);
  always
    @(posedge clk) begin
      reg126 <= (wire124[(4'h8):(2'h2)] ?
          wire29[(5'h13):(3'h7)] : (((+wire32) == wire29) ^~ ((8'h9f) <= wire87)));
      reg127 <= (~&{$signed((-reg126[(4'hf):(4'h9)])),
          $unsigned({(reg126 ? wire124 : wire28), $signed((8'hb4))})});
      reg128 <= {(7'h42)};
      if ({(~&$signed($signed((wire90 * wire90))))})
        begin
          if (({({wire87, (reg89 == (8'hbf))} ?
                      (wire31 + (wire91 ? wire34 : wire29)) : (!(reg89 ?
                          wire33 : wire33)))} ?
              {($signed($signed(reg89)) & $unsigned($unsigned(wire90))),
                  $unsigned(wire37)} : {$signed((~&$signed(wire32)))}))
            begin
              reg129 <= (($unsigned($signed(wire29)) + (wire31 ?
                  (!$signed(wire30)) : $signed($unsigned(wire31)))) != (-$unsigned((8'hb2))));
              reg130 <= wire34[(3'h5):(2'h2)];
            end
          else
            begin
              reg129 <= $signed(($unsigned(((reg35 < (7'h44)) ?
                  (reg127 >>> wire30) : $signed(wire28))) <= ($unsigned(reg130) ?
                  $signed($signed(wire30)) : {$signed(wire28)})));
            end
          reg131 <= reg129;
          reg132 <= ({({wire33[(4'h9):(3'h4)]} ?
                  ((^~reg127) ?
                      $unsigned(wire34) : $unsigned(wire87)) : reg127),
              ($signed($unsigned(wire29)) ?
                  {(|(8'hae)), $signed(wire87)} : $unsigned((wire28 ?
                      wire124 : (7'h42))))} < $unsigned((~&(^~wire91[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg129 <= (&wire36);
          reg130 <= $signed(wire87[(4'he):(1'h1)]);
          if ((~|reg126))
            begin
              reg131 <= ((wire37 && $unsigned(((reg128 & reg35) ^ (~|(8'hae))))) > wire91);
              reg132 <= ((wire30[(4'h9):(4'h8)] + ((&$signed(reg127)) & (wire34[(2'h2):(1'h1)] >> $signed((8'hb3))))) == $signed(reg126[(5'h10):(2'h2)]));
              reg133 <= {$signed({($signed(reg35) ^~ reg35[(3'h4):(3'h4)]),
                      (~&(reg89 + reg131))}),
                  {(wire34 ^~ $signed(reg128[(3'h4):(3'h4)])),
                      $unsigned((|wire91))}};
              reg134 <= {$unsigned($unsigned({{wire36}}))};
              reg135 <= ($signed(wire33[(4'hb):(2'h2)]) > $unsigned($unsigned(wire31[(4'hc):(3'h7)])));
            end
          else
            begin
              reg131 <= (^~wire124[(3'h4):(3'h4)]);
              reg132 <= (&($unsigned((!wire37)) >>> $unsigned({reg131[(3'h5):(2'h2)]})));
              reg133 <= $unsigned(((-(~|(8'hbb))) >> reg130));
            end
        end
    end
  assign wire136 = wire28[(2'h3):(2'h3)];
  assign wire137 = ((($signed((+reg133)) <<< $unsigned($unsigned(reg128))) ?
                           ($signed((wire31 ? reg35 : wire36)) ?
                               $signed((~&wire28)) : {$unsigned(wire36),
                                   reg35}) : wire28) ?
                       $unsigned((|$signed((reg135 > reg129)))) : $unsigned(wire30[(3'h7):(3'h6)]));
  assign wire138 = wire29;
  assign wire139 = ((~^wire34) ?
                       $signed((!$signed($unsigned(reg127)))) : (($unsigned({wire33,
                               wire30}) ?
                           wire136[(4'h9):(2'h2)] : ($unsigned((7'h40)) ?
                               $unsigned(wire124) : reg134)) >>> (wire28[(1'h0):(1'h0)] ?
                           (wire136[(3'h7):(3'h6)] ?
                               wire30 : {wire124,
                                   reg135}) : (wire37[(4'hb):(4'h8)] > $unsigned(wire137)))));
  assign wire140 = (+$signed((({wire30} + reg131[(4'hd):(2'h2)]) >> $unsigned((reg132 ?
                       reg89 : wire137)))));
endmodule

module module92
#(parameter param122 = (!(({{(8'ha8), (8'hb2)}} - ({(8'ha5), (8'ha8)} + ((8'ha2) ~^ (8'hb9)))) ? (((&(7'h43)) << {(8'hbf), (8'ha1)}) > (((8'haf) ? (8'h9f) : (7'h43)) ? (8'ha0) : ((8'haf) << (8'ha4)))) : (((|(8'haf)) ? (~|(8'had)) : ((8'hb1) >= (8'ha8))) ? (+((8'hbe) ? (8'hbe) : (8'hbb))) : ({(7'h44)} != (~|(8'hab)))))), 
parameter param123 = param122)
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire96;
  input wire signed [(5'h15):(1'h0)] wire95;
  input wire signed [(4'hc):(1'h0)] wire94;
  input wire [(4'h8):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire [(5'h11):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire97;
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  assign y = {wire121,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire97 = (($signed(wire94) - (((wire96 ? wire96 : wire95) ?
                      wire93[(3'h7):(3'h7)] : ((8'ha6) ?
                          wire94 : (8'ha0))) * wire93)) >> wire93);
  assign wire98 = (wire96[(4'ha):(1'h0)] < (~&wire93));
  assign wire99 = $signed($signed($unsigned($unsigned({wire98, wire93}))));
  assign wire100 = $signed(({$unsigned($unsigned((8'hb9)))} ^~ wire96[(4'hb):(1'h0)]));
  assign wire101 = (wire96 >> (8'h9f));
  assign wire102 = wire96[(1'h0):(1'h0)];
  assign wire103 = ($signed((~&(wire102[(4'hd):(3'h7)] - (wire93 + wire97)))) + (wire94 ?
                       (!((^~wire100) ?
                           wire94[(3'h5):(1'h0)] : $unsigned(wire97))) : wire97[(2'h3):(2'h2)]));
  assign wire104 = (~|$unsigned((8'hb3)));
  assign wire105 = $unsigned($unsigned(wire101[(3'h4):(2'h3)]));
  assign wire106 = wire99[(5'h11):(4'h9)];
  assign wire107 = wire93[(4'h8):(3'h6)];
  assign wire108 = (~&wire99[(3'h5):(3'h5)]);
  assign wire109 = (((~{$signed(wire98),
                       (wire104 ?
                           (8'had) : wire101)}) & (wire108 ^~ ((-wire102) ?
                       (wire98 || wire102) : {wire105,
                           wire104}))) < (wire95[(5'h12):(5'h12)] ?
                       ((&(~wire105)) || wire108) : wire96));
  assign wire110 = wire96;
  assign wire111 = ($unsigned(wire103) ?
                       (wire104 ^ ((8'hb8) ?
                           (~&(-(8'hac))) : (+wire104[(2'h2):(2'h2)]))) : {wire110});
  always
    @(posedge clk) begin
      reg112 <= $unsigned($signed(wire93[(1'h1):(1'h0)]));
      reg113 <= $signed((8'ha9));
      reg114 <= (wire101[(1'h1):(1'h0)] ? (-wire99) : (!{{wire93}}));
      if ({$unsigned((~|($unsigned(wire103) | {wire106, (8'hb5)}))),
          $unsigned(wire111)})
        begin
          reg115 <= (reg112 ? wire107 : reg114[(4'he):(2'h2)]);
          reg116 <= (wire101[(1'h1):(1'h0)] <= reg114);
        end
      else
        begin
          reg115 <= ((wire101[(2'h2):(1'h0)] & wire105[(3'h4):(3'h4)]) & wire102);
          if ((|(~&wire107[(3'h6):(3'h5)])))
            begin
              reg116 <= $signed((($unsigned(wire109[(4'hd):(4'ha)]) ?
                  reg114 : $unsigned($unsigned(wire95))) * $signed(wire106)));
              reg117 <= (~|(~$unsigned(($signed((8'hb5)) ?
                  (~^(8'ha8)) : $signed(wire108)))));
              reg118 <= $signed({$unsigned($unsigned(((7'h44) ?
                      wire100 : wire98))),
                  (~$unsigned((wire105 ? wire97 : reg117)))});
              reg119 <= $unsigned((&(($signed(wire99) | (8'hbc)) ?
                  (+(!reg112)) : wire93)));
              reg120 <= {((reg113 >= (reg118 ?
                          (-(8'haf)) : $unsigned(wire97))) ?
                      $unsigned($unsigned((wire99 ?
                          (8'hac) : wire106))) : (reg119 <= reg112))};
            end
          else
            begin
              reg116 <= $signed($unsigned(($signed(wire101[(1'h1):(1'h0)]) ?
                  (wire105[(4'he):(4'he)] <= (wire100 <<< wire107)) : $signed((~reg114)))));
              reg117 <= reg118;
              reg118 <= ((~^wire93) ~^ {$unsigned($unsigned((wire104 ?
                      wire94 : (8'ha3))))});
            end
        end
    end
  assign wire121 = reg115[(4'h8):(2'h3)];
endmodule

module module38
#(parameter param86 = (^~((!(^((7'h43) ? (7'h44) : (8'hb2)))) ? ((^((8'ha6) ? (7'h42) : (8'ha6))) ? (&((8'had) << (8'hae))) : (((8'hb7) ? (8'hb2) : (8'ha1)) ^~ ((8'ha0) ? (8'ha6) : (8'ha4)))) : ((((8'hba) == (8'ha8)) << (^(7'h40))) ? (((8'ha1) > (8'ha6)) > ((8'hbf) ? (8'h9f) : (8'hac))) : (&{(8'haa), (8'hb9)})))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire43;
  input wire [(5'h13):(1'h0)] wire42;
  input wire [(4'h8):(1'h0)] wire41;
  input wire signed [(2'h2):(1'h0)] wire40;
  input wire signed [(5'h14):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire46,
                 wire45,
                 wire44,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire44 = wire42;
  assign wire45 = wire41[(3'h5):(2'h3)];
  assign wire46 = $signed($unsigned(($signed(wire41) ?
                      ((^wire41) ^~ {wire42, wire42}) : (+$unsigned(wire40)))));
  always
    @(posedge clk) begin
      reg47 <= $signed((|((wire46[(2'h2):(1'h1)] ~^ $signed(wire41)) ?
          (^(~&wire43)) : (wire43 ^ (^~wire40)))));
      if (($signed($unsigned(((reg47 ?
              wire42 : wire44) << (wire40 && reg47)))) ?
          (((~|(reg47 >> (8'hbd))) < (wire42[(5'h10):(3'h7)] ?
                  (wire45 ? wire41 : wire44) : wire45[(2'h2):(1'h1)])) ?
              ((~(^~wire39)) | wire41[(4'h8):(3'h7)]) : $unsigned(((wire42 ?
                  (7'h43) : wire46) & (wire40 ? wire44 : wire40)))) : wire46))
        begin
          reg48 <= $signed($signed(((reg47 ?
                  $signed((7'h43)) : reg47[(2'h3):(1'h1)]) ?
              (&$unsigned(wire41)) : wire41[(3'h5):(2'h3)])));
          if (wire40)
            begin
              reg49 <= $signed(wire46);
              reg50 <= (8'ha5);
              reg51 <= wire45[(2'h2):(2'h2)];
              reg52 <= $signed(wire42);
              reg53 <= (+{((&(^~wire45)) ?
                      (^(reg49 >>> (8'hae))) : {{wire46}, reg49}),
                  {reg50[(1'h1):(1'h1)], wire40[(1'h0):(1'h0)]}});
            end
          else
            begin
              reg49 <= wire42;
              reg50 <= (reg47[(3'h5):(2'h2)] ?
                  wire43[(4'hf):(4'hc)] : $signed(({(wire43 == wire46)} ?
                      wire41 : (|(reg51 ^ reg52)))));
              reg51 <= (($unsigned(((reg50 ? (8'had) : reg50) | (wire42 ?
                          reg53 : wire42))) ?
                      {reg53} : (8'hb5)) ?
                  (-$unsigned(reg50)) : {(-$signed($signed(reg52))),
                      ({$unsigned(reg50), {reg50}} ? (8'ha5) : (~&wire43))});
              reg52 <= reg49[(2'h2):(2'h2)];
            end
          if ((wire42 <<< $unsigned($signed($unsigned(reg51[(2'h2):(1'h0)])))))
            begin
              reg54 <= ($signed(reg51[(1'h0):(1'h0)]) ?
                  reg49[(3'h6):(3'h6)] : $signed($signed($unsigned((wire44 ?
                      (8'ha8) : wire45)))));
              reg55 <= (reg53 ?
                  (~&((reg51[(1'h1):(1'h0)] ? wire40 : $unsigned(reg53)) ?
                      $signed($signed(wire44)) : $signed((|reg54)))) : $signed($unsigned($unsigned((wire41 || wire45)))));
              reg56 <= $unsigned(wire45[(2'h2):(1'h0)]);
              reg57 <= ($unsigned(wire44[(1'h1):(1'h0)]) ?
                  $unsigned(reg52[(1'h0):(1'h0)]) : (|$signed(reg54)));
            end
          else
            begin
              reg54 <= $unsigned($signed((~($signed(reg47) ?
                  (8'ha9) : $signed(wire39)))));
            end
        end
      else
        begin
          reg48 <= wire46;
          reg49 <= wire46[(3'h7):(2'h2)];
          if ((wire39[(2'h3):(1'h0)] ?
              $unsigned(reg49[(2'h2):(1'h1)]) : ($unsigned($unsigned(reg53[(3'h5):(3'h4)])) != (8'ha5))))
            begin
              reg50 <= ({{(~&$signed(reg53))}} ?
                  $signed(wire43) : $signed(($unsigned($unsigned(wire43)) >>> $signed((!reg56)))));
              reg51 <= $signed((reg54 ?
                  (($unsigned((7'h44)) ?
                      (reg50 ? reg50 : wire40) : (wire46 ?
                          reg48 : (8'h9d))) >> reg55[(2'h3):(1'h0)]) : (8'hae)));
            end
          else
            begin
              reg50 <= {reg49[(3'h4):(3'h4)], reg52};
              reg51 <= $signed((~^reg47[(4'ha):(3'h6)]));
              reg52 <= (7'h42);
              reg53 <= $signed($signed(reg52));
              reg54 <= (~|$unsigned(wire42));
            end
          reg55 <= (^~(~^(^((reg48 ~^ reg49) ?
              (8'h9f) : (wire45 ? wire43 : reg56)))));
        end
      if ((^~wire41[(2'h3):(2'h3)]))
        begin
          reg58 <= (wire40[(1'h1):(1'h0)] ? wire41 : (|wire46[(2'h2):(1'h0)]));
          reg59 <= ({(-$unsigned({(7'h43)})), reg55} ~^ (^~({(reg51 ?
                  wire45 : (8'haf)),
              (wire41 >= reg56)} || $unsigned((~|(7'h42))))));
        end
      else
        begin
          reg58 <= (~|wire45[(2'h2):(2'h2)]);
          reg59 <= $signed((8'h9f));
          if (((wire42[(3'h7):(1'h0)] ?
                  {$unsigned(((8'hac) ? reg52 : wire41))} : wire40) ?
              {($unsigned($signed(wire40)) ?
                      wire46[(4'hd):(4'h9)] : {wire40,
                          (reg48 ? reg57 : reg51)}),
                  $signed((8'hb1))} : (-((|{reg47, reg56}) ?
                  $unsigned($signed(reg54)) : wire45))))
            begin
              reg60 <= (|(($unsigned($unsigned(wire40)) + ((reg52 ?
                      reg59 : wire41) ?
                  (wire42 ? reg50 : reg51) : reg47[(4'h9):(3'h6)])) ^~ wire43));
              reg61 <= {wire39[(5'h12):(5'h10)], wire46[(4'hc):(1'h1)]};
              reg62 <= ($signed(wire40[(1'h1):(1'h0)]) - (+$signed($unsigned((wire42 || wire42)))));
              reg63 <= (+$signed(($signed((~^reg48)) ?
                  $signed((wire39 ?
                      wire42 : (8'h9f))) : wire43[(4'h9):(3'h5)])));
              reg64 <= $unsigned(wire42[(2'h3):(2'h2)]);
            end
          else
            begin
              reg60 <= $signed({$unsigned((!{wire46})),
                  ((8'hbb) && ($unsigned(reg52) >= wire41[(1'h0):(1'h0)]))});
              reg61 <= {$signed((!$unsigned((8'hb6))))};
              reg62 <= reg58;
              reg63 <= (-wire44[(4'ha):(3'h5)]);
              reg64 <= (($unsigned(({reg57} && {reg51, reg60})) ?
                      ($signed((wire43 < (7'h43))) ^ $signed(((8'hb0) ?
                          reg51 : (8'hae)))) : {({(8'ha3), reg61} ?
                              reg49 : (!reg56)),
                          ((~wire42) << (^(8'hb3)))}) ?
                  {{$signed((wire44 || reg55)),
                          {(reg52 >> reg60),
                              $signed(reg61)}}} : wire40[(2'h2):(2'h2)]);
            end
          if ((^~{($unsigned((~|(8'hbd))) ?
                  ($unsigned(wire40) ~^ (8'ha1)) : {(reg59 & wire43)})}))
            begin
              reg65 <= reg61;
              reg66 <= {(wire44[(3'h4):(2'h2)] | (reg63 ?
                      reg51[(1'h0):(1'h0)] : reg64[(2'h2):(1'h0)]))};
              reg67 <= (reg51 ? reg62[(4'he):(4'hb)] : reg51);
              reg68 <= (wire42[(3'h6):(2'h2)] != reg60);
              reg69 <= {$unsigned((wire41 ? (8'ha6) : $unsigned({reg52})))};
            end
          else
            begin
              reg65 <= {(|(~|{{reg59, reg69}, (8'hb6)}))};
              reg66 <= $unsigned($signed($signed(reg56)));
              reg67 <= (reg61 ? reg65[(3'h5):(2'h3)] : $signed(reg69));
              reg68 <= $signed(wire43);
              reg69 <= $unsigned(({reg64[(3'h5):(1'h0)],
                      $unsigned(reg54[(2'h2):(1'h0)])} ?
                  (~|wire44) : $signed({wire42[(4'h9):(2'h3)]})));
            end
        end
      reg70 <= $unsigned(($unsigned(wire44) << ($signed(reg54) && {(reg66 && (8'hab)),
          (reg69 << reg58)})));
      reg71 <= $unsigned(wire43[(4'h8):(3'h7)]);
    end
  assign wire72 = {reg69[(4'h8):(2'h3)]};
  assign wire73 = ({wire44, wire42[(4'ha):(2'h2)]} ?
                      ($signed((!$signed(wire46))) == ((~^(~&reg50)) ?
                          ((reg69 ? wire40 : reg50) ?
                              $signed(reg67) : $unsigned(wire42)) : $unsigned(wire44[(4'hc):(2'h3)]))) : wire43);
  assign wire74 = {reg53[(1'h0):(1'h0)]};
  assign wire75 = ($signed(wire73[(5'h13):(4'hd)]) ?
                      (wire45[(2'h2):(1'h0)] < $unsigned({(~|(7'h42)),
                          (reg47 || reg54)})) : reg52[(2'h3):(1'h0)]);
  assign wire76 = ($signed(reg59) < reg54);
  assign wire77 = (~reg63);
  always
    @(posedge clk) begin
      reg78 <= $signed($unsigned($signed($unsigned((reg56 ? wire40 : reg67)))));
      reg79 <= ({$signed((^{reg62})), (!wire76[(4'h8):(2'h3)])} ?
          ($signed(({(8'hb9)} * {wire72})) >>> (((reg48 ?
              reg66 : wire40) ^~ reg59) ~^ $unsigned($signed(reg57)))) : wire40[(1'h1):(1'h0)]);
      reg80 <= (|$signed((reg49[(3'h6):(1'h0)] >= reg56)));
      reg81 <= wire39[(3'h4):(1'h1)];
      if (wire41)
        begin
          reg82 <= wire77;
          reg83 <= reg68;
          reg84 <= $unsigned((!{(((8'hb3) <<< (8'hab)) >>> $unsigned(reg81)),
              reg55[(4'hd):(3'h4)]}));
          reg85 <= (8'had);
        end
      else
        begin
          reg82 <= reg49[(3'h5):(2'h3)];
        end
    end
endmodule
