module top #(parameter param187 = (8'ha9)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire186;
  wire signed [(2'h3):(1'h0)] wire185;
  wire [(4'hc):(1'h0)] wire183;
  wire signed [(2'h3):(1'h0)] wire182;
  wire [(4'hf):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire180;
  wire [(5'h10):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire178;
  reg signed [(3'h5):(1'h0)] reg184 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire4,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire178,
                 reg184,
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
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed($signed((wire2 <<< (wire2[(3'h4):(2'h2)] ?
                     wire1 : (wire1 ? (8'ha9) : wire3)))));
  always
    @(posedge clk) begin
      reg5 <= ($unsigned(wire2) ?
          (8'haf) : (wire0[(1'h0):(1'h0)] > (wire0 << ($unsigned(wire4) ?
              wire1 : $unsigned(wire2)))));
      reg6 <= wire3;
      if (wire3)
        begin
          if (wire3[(2'h2):(1'h1)])
            begin
              reg7 <= $unsigned(reg5[(3'h5):(1'h1)]);
              reg8 <= $unsigned({(&reg6)});
              reg9 <= wire2;
              reg10 <= $unsigned(reg6);
              reg11 <= {reg5[(2'h3):(1'h0)]};
            end
          else
            begin
              reg7 <= ($signed(reg8[(4'ha):(3'h5)]) + ((~&wire0) >>> reg5[(2'h2):(2'h2)]));
            end
          reg12 <= wire1[(4'hc):(3'h5)];
          if ({reg6[(5'h10):(4'hb)]})
            begin
              reg13 <= $unsigned($unsigned((wire2 ?
                  (reg8[(1'h0):(1'h0)] < wire2) : reg7[(2'h3):(1'h0)])));
              reg14 <= (reg12 ?
                  {(~$unsigned((reg9 ? reg8 : wire1))),
                      ((+$signed(reg6)) * reg12)} : $unsigned((($signed(reg10) ?
                          (wire4 ? reg12 : wire2) : (+(8'hbc))) ?
                      reg12[(1'h1):(1'h0)] : $unsigned({reg12}))));
            end
          else
            begin
              reg13 <= reg12[(1'h0):(1'h0)];
              reg14 <= {reg8};
              reg15 <= $unsigned((~|(~&reg8[(3'h5):(2'h3)])));
              reg16 <= (~(~^(^(+$signed(reg11)))));
              reg17 <= ((|reg16[(5'h13):(4'hb)]) * $unsigned(reg8));
            end
        end
      else
        begin
          if (($unsigned((+$signed((-reg14)))) ^~ reg16[(4'h8):(4'h8)]))
            begin
              reg7 <= (reg17[(4'hb):(4'h8)] ?
                  $signed((|(reg15[(3'h6):(1'h1)] >>> (reg14 <= reg9)))) : reg8[(4'h8):(2'h2)]);
              reg8 <= $signed($unsigned(((|(~|(7'h42))) ~^ $signed((&wire2)))));
              reg9 <= reg17;
              reg10 <= (reg17[(2'h2):(2'h2)] ?
                  $unsigned((^(+$signed(reg6)))) : wire1[(4'h9):(3'h7)]);
            end
          else
            begin
              reg7 <= $signed(({$unsigned({reg17, wire2}),
                      reg10[(4'hc):(2'h2)]} ?
                  $unsigned((wire2[(3'h5):(2'h2)] ?
                      wire1[(1'h0):(1'h0)] : (wire1 ?
                          reg10 : reg8))) : $signed(reg6[(1'h0):(1'h0)])));
              reg8 <= (({(8'hbd)} ?
                  reg17[(1'h1):(1'h1)] : $unsigned($signed((reg7 ?
                      (8'hbb) : reg13)))) + $unsigned($unsigned(((reg9 ?
                  (8'hb3) : reg11) && (~reg7)))));
              reg9 <= {reg16[(2'h2):(1'h1)], reg15};
              reg10 <= reg8;
              reg11 <= $signed((~&$signed(reg14[(5'h10):(3'h6)])));
            end
          if ((reg15 << $signed(($signed($unsigned(reg12)) ?
              $signed(reg5) : (8'hba)))))
            begin
              reg12 <= reg8[(3'h7):(2'h3)];
            end
          else
            begin
              reg12 <= {reg5};
              reg13 <= $signed(reg11[(4'ha):(3'h7)]);
              reg14 <= $unsigned({reg7});
            end
        end
      reg18 <= (^{reg14[(4'hd):(4'h9)]});
      reg19 <= (wire0[(3'h6):(1'h0)] ? reg14 : $unsigned(reg13[(2'h3):(2'h2)]));
    end
  assign wire20 = (reg5 ^~ reg8[(4'hb):(2'h2)]);
  assign wire21 = $signed(wire1);
  assign wire22 = (reg5 ? wire4[(3'h5):(3'h4)] : $signed(reg7[(4'h9):(2'h2)]));
  assign wire23 = {({((reg17 ? reg14 : reg11) >> reg14)} ? (8'hb7) : reg18),
                      (^((~&(~|reg5)) == $signed($unsigned(wire21))))};
  module24 #() modinst179 (.wire25(wire22), .wire28(reg13), .wire26(reg8), .clk(clk), .y(wire178), .wire29(reg10), .wire27(reg16));
  assign wire180 = wire21;
  assign wire181 = {wire3[(1'h0):(1'h0)]};
  assign wire182 = (wire23 ?
                       ($signed((8'hba)) ?
                           reg11[(4'hd):(3'h5)] : $signed(reg17[(4'hb):(2'h3)])) : (($unsigned((^~(8'hb0))) ?
                               ($signed((8'ha7)) ?
                                   $unsigned(wire22) : reg5[(3'h5):(1'h0)]) : $unsigned(((8'hb7) >> wire20))) ?
                           reg13 : $unsigned($unsigned((~wire2)))));
  assign wire183 = ($signed({$signed($unsigned(reg13))}) >>> (~&(^(+{reg5,
                       wire178}))));
  always
    @(posedge clk) begin
      reg184 <= reg6[(5'h10):(3'h6)];
    end
  assign wire185 = (8'ha9);
  assign wire186 = {$signed(($signed((&reg12)) ?
                           reg5[(3'h6):(3'h5)] : (+reg9[(3'h6):(2'h3)])))};
endmodule

module module24
#(parameter param177 = ((^(((|(8'ha6)) ? (^~(8'hb2)) : ((8'hbe) || (8'ha8))) != ({(8'hbd)} ? ((7'h44) + (8'hbc)) : ((8'ha7) <<< (8'hac))))) >= {(8'h9c)}))
(y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire25;
  input wire [(5'h14):(1'h0)] wire26;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire signed [(4'h9):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire175;
  wire [(4'hd):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire146;
  wire signed [(3'h6):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire153;
  wire [(3'h6):(1'h0)] wire154;
  wire [(4'hc):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire173;
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire30,
                 wire32,
                 wire33,
                 wire34,
                 wire80,
                 wire82,
                 wire83,
                 wire84,
                 wire146,
                 wire148,
                 wire153,
                 wire154,
                 wire155,
                 wire173,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg31,
                 (1'h0)};
  assign wire30 = ({wire26[(2'h3):(1'h1)],
                          (wire27 >= ($signed(wire26) ?
                              (~^wire25) : $signed(wire25)))} ?
                      $signed(wire29) : wire28[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg31 <= ((wire25 ~^ $signed($unsigned((~&wire26)))) ?
          $signed((8'hbf)) : $signed((wire29 ?
              ((wire29 << (8'haf)) * $unsigned(wire27)) : $signed({wire27}))));
    end
  assign wire32 = (wire26[(3'h5):(3'h4)] || {$unsigned(wire28[(1'h0):(1'h0)]),
                      ($unsigned(wire28) ?
                          $signed((^~wire28)) : ($signed(wire29) ?
                              $unsigned(reg31) : (wire29 >= wire28)))});
  assign wire33 = wire32[(1'h1):(1'h1)];
  assign wire34 = (((8'ha7) ?
                          (wire25[(4'he):(3'h6)] > $unsigned($signed(reg31))) : (wire32 ?
                              ($signed(reg31) > wire29) : reg31[(3'h6):(3'h5)])) ?
                      $signed($signed({(~&wire27)})) : $signed(wire33));
  module35 #() modinst81 (.wire37(wire30), .y(wire80), .clk(clk), .wire39(wire29), .wire36(wire25), .wire38(wire34));
  assign wire82 = $unsigned(((($unsigned(wire25) ?
                          (wire25 + wire29) : (wire27 <= wire29)) ?
                      $unsigned((wire30 >> wire25)) : $unsigned((wire34 ?
                          wire28 : wire30))) && $signed(wire25[(2'h2):(1'h1)])));
  assign wire83 = (8'h9f);
  assign wire84 = (($signed($unsigned(reg31[(1'h1):(1'h1)])) <<< $signed((8'haa))) ?
                      (-wire30) : wire27[(3'h6):(2'h2)]);
  module85 #() modinst147 (.wire87(wire34), .wire89(wire33), .wire90(wire28), .y(wire146), .wire86(wire26), .clk(clk), .wire88(reg31));
  assign wire148 = (&($unsigned((&$signed(wire29))) < {(wire83 ?
                           ((7'h44) ? wire30 : wire146) : ((8'hac) ?
                               (8'hba) : (8'hba)))}));
  always
    @(posedge clk) begin
      reg149 <= $unsigned(($unsigned((&reg31)) ?
          ((8'hb4) ?
              (+(^~(8'hb9))) : $signed({wire25,
                  wire28})) : $unsigned((^$signed(wire148)))));
      reg150 <= $unsigned(($signed((reg149 ?
          {wire29, wire30} : $signed(reg31))) >> wire84[(4'h8):(4'h8)]));
      reg151 <= reg150[(2'h2):(2'h2)];
      reg152 <= wire84;
    end
  assign wire153 = ((^~reg151[(1'h1):(1'h0)]) ?
                       {wire148,
                           wire82} : $signed(((|$signed(wire34)) - (wire26 != wire25[(4'hb):(1'h1)]))));
  assign wire154 = ($unsigned({(|wire34[(3'h4):(1'h0)])}) ?
                       reg150[(1'h0):(1'h0)] : wire34);
  assign wire155 = ($unsigned((&wire25[(4'h9):(1'h0)])) ?
                       (~wire30[(4'h9):(1'h0)]) : wire29);
  module156 #() modinst174 (.wire160(wire148), .clk(clk), .wire158(reg31), .wire157(wire29), .wire161(wire26), .y(wire173), .wire159(reg152));
  assign wire175 = wire83;
  assign wire176 = $unsigned(($unsigned(wire30[(4'hb):(2'h2)]) || $signed($signed($signed(wire82)))));
endmodule

module module156
#(parameter param171 = ((^((&{(8'ha9)}) <<< (((8'hbe) < (8'h9f)) ? ((8'hba) ? (8'hb2) : (8'ha4)) : (8'ha9)))) ? (8'h9c) : {((((8'ha8) ~^ (8'ha5)) ? {(8'hba)} : (^(8'ha0))) >>> ((&(8'hbe)) ? ((8'ha9) - (7'h42)) : ((8'haf) ^~ (8'ha7))))}), 
parameter param172 = (param171 * ({((-param171) <<< (param171 < param171)), ((8'hbc) ? param171 : (~(8'ha9)))} ? ((((8'hb3) ~^ param171) >>> {param171, param171}) >>> (~|{param171})) : param171)))
(y, clk, wire161, wire160, wire159, wire158, wire157);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire161;
  input wire signed [(3'h4):(1'h0)] wire160;
  input wire signed [(4'hd):(1'h0)] wire159;
  input wire signed [(4'he):(1'h0)] wire158;
  input wire signed [(2'h2):(1'h0)] wire157;
  wire signed [(3'h6):(1'h0)] wire165;
  wire signed [(4'h8):(1'h0)] wire164;
  wire signed [(5'h15):(1'h0)] wire163;
  wire [(4'ha):(1'h0)] wire162;
  reg [(3'h5):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg168 = (1'h0);
  reg [(4'hf):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg166 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 (1'h0)};
  assign wire162 = {$unsigned(wire159[(4'h9):(3'h6)])};
  assign wire163 = ($signed((wire157[(1'h0):(1'h0)] ?
                           wire159[(3'h5):(3'h5)] : ((|(8'hbe)) ?
                               $unsigned((8'hab)) : wire157[(1'h0):(1'h0)]))) ?
                       (~wire161) : {$unsigned($unsigned((~^wire162))),
                           (&$signed((wire159 + wire158)))});
  assign wire164 = $signed((wire160[(2'h3):(1'h0)] ?
                       (!$signed((wire157 + wire162))) : $unsigned(wire158)));
  assign wire165 = $signed((+wire164[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg166 <= (wire165 && $unsigned((($unsigned(wire162) + $signed((8'ha5))) ?
          (+(wire163 ^~ wire164)) : wire163[(4'ha):(4'ha)])));
      reg167 <= $signed($unsigned((8'ha9)));
      reg168 <= ((|wire165) << (~(wire164[(3'h6):(1'h0)] ?
          (~wire164) : wire157[(1'h0):(1'h0)])));
      reg169 <= wire161[(3'h4):(2'h2)];
      reg170 <= reg168;
    end
endmodule

module module85
#(parameter param145 = ((^({(+(8'hb6))} ? (~|(^~(8'h9e))) : ((~&(8'hbf)) < (|(7'h41))))) ? (((((8'ha2) ? (7'h42) : (8'hac)) != ((8'ha2) >>> (8'ha5))) ? ((!(7'h43)) ? ((8'h9f) ? (8'ha0) : (8'hbd)) : ((8'ha7) ? (8'h9c) : (8'ha3))) : (((7'h43) ? (7'h41) : (8'ha4)) ^ (~(8'hbb)))) > (!{((8'hb6) ? (8'hb9) : (8'ha1))})) : (^~(+(!(~(8'ha0)))))))
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h23d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire90;
  input wire [(4'h8):(1'h0)] wire89;
  input wire [(5'h15):(1'h0)] wire88;
  input wire signed [(2'h2):(1'h0)] wire87;
  input wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire144;
  wire [(2'h3):(1'h0)] wire143;
  wire [(2'h3):(1'h0)] wire142;
  wire signed [(3'h6):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire113;
  wire [(4'h9):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire [(3'h7):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire97;
  wire signed [(4'hb):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire [(3'h6):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
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
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire91 = ($unsigned($unsigned(($unsigned(wire87) ?
                          wire87 : $unsigned(wire87)))) ?
                      $unsigned(({wire89, {wire87, wire87}} <= ({wire88,
                          wire90} | wire87))) : $signed(wire89));
  assign wire92 = wire90;
  assign wire93 = $signed(wire88);
  assign wire94 = wire90[(3'h5):(2'h2)];
  assign wire95 = $signed({(($unsigned(wire90) != $unsigned(wire93)) ?
                          wire88[(3'h6):(1'h0)] : {(~|wire86),
                              wire88[(5'h12):(4'h9)]}),
                      wire91});
  assign wire96 = wire86[(3'h4):(1'h1)];
  assign wire97 = $signed(($signed($signed({(8'hb0), wire87})) ?
                      (($unsigned(wire95) ?
                              $signed((8'ha6)) : wire94[(1'h1):(1'h0)]) ?
                          (wire90[(4'h9):(2'h3)] ?
                              wire96[(3'h4):(3'h4)] : wire89[(3'h4):(2'h3)]) : (wire93 > (wire91 ^ wire86))) : wire89[(2'h2):(2'h2)]));
  assign wire98 = {{$unsigned($signed(wire89))}, wire89};
  always
    @(posedge clk) begin
      if ((wire97[(1'h0):(1'h0)] ?
          ($unsigned((8'ha1)) ?
              (7'h43) : ($unsigned((~wire96)) ?
                  wire87[(2'h2):(1'h0)] : wire90)) : wire93[(4'hb):(4'ha)]))
        begin
          reg99 <= (((&$unsigned(((8'ha5) ? (7'h40) : wire86))) ?
              wire92[(2'h2):(2'h2)] : $unsigned((!$signed(wire92)))) ~^ (wire88 && (wire87[(2'h2):(2'h2)] ^ wire90)));
          reg100 <= (wire97[(1'h1):(1'h1)] ?
              wire86 : (^~(wire92 ^~ ($signed((8'h9e)) ?
                  (~|wire88) : (wire92 == (8'hab))))));
          reg101 <= wire90;
          reg102 <= {wire90[(3'h4):(3'h4)]};
          reg103 <= (^~($unsigned((&(wire97 != wire97))) * (|(&$unsigned(wire97)))));
        end
      else
        begin
          if (reg103[(3'h6):(2'h2)])
            begin
              reg99 <= ({($unsigned(wire90[(1'h0):(1'h0)]) ?
                      wire89 : ($unsigned(wire97) <= $unsigned((8'hbc))))} != ($unsigned({(^wire96),
                  wire92[(1'h0):(1'h0)]}) <<< $unsigned($unsigned({reg100,
                  reg101}))));
              reg100 <= ((8'hba) & (8'h9d));
              reg101 <= wire89;
            end
          else
            begin
              reg99 <= (^$unsigned(wire93));
              reg100 <= reg101[(4'hd):(4'hd)];
              reg101 <= {(~^wire98[(3'h5):(2'h3)]),
                  ((~(^~(~wire87))) | $unsigned(reg99[(4'h9):(4'h9)]))};
              reg102 <= wire86;
              reg103 <= ((~^$unsigned((wire90[(3'h5):(3'h4)] ?
                      $unsigned(wire97) : (!wire91)))) ?
                  {{wire97, wire98[(1'h0):(1'h0)]},
                      reg101} : ($unsigned(wire98) && ({(!wire97),
                      (wire95 >>> wire88)} ^~ ((^wire95) ?
                      {wire95, wire95} : $unsigned(reg101)))));
            end
        end
      reg104 <= ({(wire88[(2'h3):(2'h3)] & ((|wire88) ?
                  (wire88 > wire86) : (~^wire86)))} ?
          $signed((wire89[(4'h8):(2'h2)] ?
              {((7'h43) >>> reg102)} : $signed((wire87 ?
                  wire88 : wire92)))) : (^~{$unsigned((+reg101))}));
    end
  assign wire105 = $unsigned(reg100);
  assign wire106 = reg99;
  assign wire107 = ((&{$unsigned($signed(wire94)), wire98[(1'h0):(1'h0)]}) ?
                       (8'ha3) : ({($unsigned(wire94) & (~reg100)),
                           wire90} - (wire106 ?
                           (|(wire93 ~^ wire92)) : ((^reg104) << (!wire90)))));
  assign wire108 = reg103[(1'h1):(1'h0)];
  assign wire109 = (^wire89);
  assign wire110 = wire94;
  assign wire111 = wire98[(2'h2):(1'h0)];
  assign wire112 = ((8'hb9) ?
                       ($signed((~wire88[(5'h13):(4'he)])) ?
                           (!wire110) : {wire98,
                               $unsigned(wire87)}) : $unsigned({($unsigned(wire87) ?
                               $signed(reg104) : ((8'hae) ? reg101 : (8'ha1))),
                           $signed($unsigned(wire89))}));
  assign wire113 = $signed({wire94[(1'h0):(1'h0)]});
  assign wire114 = {(({{wire105}} ~^ ((wire112 ?
                               wire109 : wire111) << (|wire109))) ?
                           ($unsigned(reg100) >> (((7'h41) ?
                               wire95 : wire95) > wire91)) : {(wire109[(3'h6):(1'h1)] ?
                                   $signed(wire88) : (~|wire91)),
                               ($unsigned(wire110) ?
                                   wire111[(2'h3):(2'h3)] : {wire88,
                                       wire108})})};
  always
    @(posedge clk) begin
      reg115 <= (+$unsigned((($signed(wire98) == (wire111 == wire109)) ?
          $signed($unsigned(wire98)) : $signed({wire97}))));
      if (wire93)
        begin
          if (reg103)
            begin
              reg116 <= (wire88 - $unsigned(((^(wire89 ?
                  wire110 : reg102)) ~^ wire112)));
              reg117 <= (-($signed(wire93) ?
                  $unsigned((^$signed(reg99))) : wire106));
              reg118 <= $signed((^((reg104[(2'h3):(2'h2)] <<< ((8'hb2) ?
                  wire93 : wire114)) ^~ (&((8'hb3) <<< reg99)))));
              reg119 <= (~|(~&(((reg116 ? wire91 : (8'hae)) ^~ (~wire95)) ?
                  wire91[(3'h6):(3'h4)] : (|$unsigned((8'haa))))));
              reg120 <= wire93;
            end
          else
            begin
              reg116 <= wire107;
            end
          reg121 <= {(~^$unsigned(wire105[(4'h9):(1'h1)]))};
        end
      else
        begin
          if ({wire111, wire96[(3'h5):(1'h1)]})
            begin
              reg116 <= (wire109[(4'h8):(3'h4)] ?
                  $unsigned((reg119[(1'h1):(1'h1)] ?
                      ((wire107 == (8'hac)) * $signed((8'hac))) : $signed(reg120[(2'h3):(2'h3)]))) : $signed(((&wire107) ?
                      $unsigned(reg120) : $unsigned($signed(reg102)))));
              reg117 <= $signed(wire114[(1'h1):(1'h0)]);
              reg118 <= {$signed($unsigned(wire114[(3'h6):(1'h1)])),
                  (wire106 && $signed((!((8'hbe) < wire108))))};
            end
          else
            begin
              reg116 <= wire114[(3'h4):(2'h3)];
              reg117 <= wire86[(5'h11):(4'hf)];
              reg118 <= wire90[(2'h3):(2'h2)];
              reg119 <= ((~&(wire108 ~^ wire106)) <= ({reg104[(2'h3):(2'h2)],
                      (!{wire94, wire97})} ?
                  wire111 : (!(|(reg115 ? wire113 : wire109)))));
            end
          reg120 <= $signed((reg104[(1'h0):(1'h0)] && (($unsigned(wire108) ^~ $unsigned(reg121)) >= ($unsigned(wire86) ?
              (^~wire113) : (~^reg99)))));
          reg121 <= wire106;
        end
      if (wire114[(1'h0):(1'h0)])
        begin
          reg122 <= {(^~$unsigned($unsigned((wire105 ? (8'hb9) : reg115)))),
              wire88[(5'h15):(2'h2)]};
          reg123 <= {(($signed((reg119 ? reg102 : (8'hbd))) ? wire95 : wire97) ?
                  (~{((7'h42) != wire92),
                      (~&(8'hb8))}) : wire87[(2'h2):(2'h2)])};
          reg124 <= wire97[(1'h1):(1'h0)];
          if ($unsigned(((&$unsigned(wire107[(3'h6):(1'h0)])) ^~ wire105)))
            begin
              reg125 <= {reg104,
                  (((|$signed((8'had))) << $unsigned(wire105)) ?
                      (^wire92) : ($unsigned(reg117[(1'h1):(1'h1)]) >> $signed($signed(wire87))))};
              reg126 <= (+reg100);
            end
          else
            begin
              reg125 <= (reg102 ?
                  ((reg99[(4'hf):(1'h1)] >> (~$unsigned(wire111))) < (^(&(reg102 ^~ (8'hb5))))) : reg121);
              reg126 <= reg123;
              reg127 <= (wire90 ?
                  (&($signed($signed(reg118)) ?
                      wire91[(4'hc):(4'h9)] : $unsigned((^reg104)))) : {(wire93[(4'hb):(3'h6)] ?
                          $signed(wire110[(1'h1):(1'h0)]) : $signed($unsigned(reg102)))});
            end
          reg128 <= reg99;
        end
      else
        begin
          reg122 <= $signed($unsigned(reg102[(1'h0):(1'h0)]));
          if ($signed($unsigned(reg103)))
            begin
              reg123 <= $signed((reg124[(3'h5):(1'h1)] >= $unsigned((reg120 <<< ((8'haf) < wire113)))));
              reg124 <= $unsigned(reg104);
              reg125 <= reg124;
              reg126 <= wire107[(3'h4):(2'h2)];
            end
          else
            begin
              reg123 <= $unsigned((^(7'h42)));
            end
          if ((~^reg128[(4'ha):(4'h9)]))
            begin
              reg127 <= ((8'haa) == (~&$signed(((wire110 != reg103) ?
                  (-reg115) : (-wire114)))));
              reg128 <= $unsigned($unsigned((8'hbe)));
              reg129 <= ({{(|$unsigned(reg123))}} ?
                  ((!reg117) ?
                      (8'hbb) : (wire91[(4'hd):(4'h9)] & wire91)) : $signed(((reg119 * $signed(reg102)) ?
                      $signed(reg116[(3'h6):(3'h5)]) : {{reg126, reg117},
                          reg120[(5'h13):(5'h10)]})));
            end
          else
            begin
              reg127 <= {(8'ha5),
                  $unsigned(({wire105,
                      ((7'h41) ? wire92 : (8'ha1))} <<< wire108))};
              reg128 <= ({wire86[(3'h4):(1'h1)]} & reg118);
              reg129 <= $unsigned(({(-(|reg120))} ?
                  $unsigned(({wire94} ~^ $signed(wire89))) : $unsigned($signed((reg117 | (7'h43))))));
              reg130 <= $unsigned((reg103[(2'h3):(2'h3)] ?
                  reg116 : (wire91[(3'h4):(1'h1)] - (-reg116[(4'hb):(1'h1)]))));
            end
          reg131 <= $unsigned((&(&(~|$unsigned((8'hbe))))));
        end
      reg132 <= ($signed($signed($signed($unsigned(wire96)))) && wire90);
      if ((8'hb8))
        begin
          reg133 <= (!(^~(&(((8'ha1) - wire112) ?
              (wire94 <= reg99) : wire91[(4'hd):(3'h5)]))));
          if ((~|reg124[(4'ha):(1'h1)]))
            begin
              reg134 <= (~&((~|((wire106 ? reg123 : wire90) ?
                  wire94[(1'h0):(1'h0)] : (wire89 & reg116))) ^~ ($signed(reg128) <<< (wire95[(1'h0):(1'h0)] ?
                  reg124 : $signed(reg120)))));
              reg135 <= reg132;
              reg136 <= (~$unsigned($signed((8'h9e))));
            end
          else
            begin
              reg134 <= (+(8'hb5));
            end
          reg137 <= $unsigned($signed($unsigned(reg130)));
          reg138 <= (~^reg127);
          reg139 <= $unsigned(reg131);
        end
      else
        begin
          reg133 <= $unsigned($unsigned((((~|reg116) ^ {reg101, (8'hb6)}) ?
              (wire114[(1'h0):(1'h0)] ?
                  (wire112 ? reg131 : (8'ha7)) : (reg100 ?
                      wire114 : reg133)) : $unsigned((~^wire94)))));
          reg134 <= {reg123[(4'h9):(2'h2)], reg135};
          if (($unsigned(((~|(reg124 ? (8'hae) : wire88)) ?
                  $signed($signed((8'hbc))) : ($unsigned(reg117) ?
                      ((8'hbc) ? (8'h9f) : wire92) : reg125[(2'h2):(1'h0)]))) ?
              ((&reg122) && ($unsigned($signed(reg124)) != $signed(reg135[(2'h2):(1'h0)]))) : $unsigned($unsigned($unsigned((wire105 ?
                  reg131 : (8'ha4)))))))
            begin
              reg135 <= reg124;
              reg136 <= wire114[(1'h1):(1'h0)];
              reg137 <= wire106;
              reg138 <= (8'ha5);
              reg139 <= reg120[(4'h8):(1'h0)];
            end
          else
            begin
              reg135 <= (!reg123[(4'hc):(3'h5)]);
              reg136 <= (+($signed($unsigned({wire111, reg116})) ?
                  $unsigned($unsigned($signed((8'hbf)))) : (reg138 ~^ wire106[(4'h8):(1'h0)])));
              reg137 <= $unsigned($signed($signed(reg128[(1'h0):(1'h0)])));
              reg138 <= (+wire113[(4'hc):(2'h2)]);
              reg139 <= wire109[(3'h5):(1'h1)];
            end
          reg140 <= $signed((((|$signed(wire110)) << $signed(reg115[(2'h2):(2'h2)])) ?
              wire95[(1'h1):(1'h0)] : (($unsigned(wire105) ?
                  (^~(8'hba)) : $signed(wire88)) | (~|$signed((7'h41))))));
          reg141 <= $signed($signed(reg131));
        end
    end
  assign wire142 = $signed((8'h9c));
  assign wire143 = {wire114};
  assign wire144 = reg120[(2'h3):(1'h1)];
endmodule

module module35
#(parameter param79 = ((^({{(8'hbd), (8'ha2)}} ? (+(|(8'hb9))) : (((8'had) ? (8'hbc) : (8'ha6)) ? {(8'hb9)} : ((7'h43) == (8'hba))))) * (-{(((8'hac) ? (8'h9e) : (8'had)) >> ((8'hb5) ? (8'ha1) : (8'hb9)))})))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h1df):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire39;
  input wire signed [(4'ha):(1'h0)] wire38;
  input wire [(4'ha):(1'h0)] wire37;
  input wire [(4'hb):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire53,
                 wire52,
                 wire51,
                 wire46,
                 wire45,
                 wire44,
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
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire37[(2'h2):(1'h1)])
        begin
          reg40 <= $signed(($unsigned($signed(wire36[(4'hb):(3'h6)])) >>> $signed($unsigned(wire37))));
          reg41 <= (~^$unsigned(((&wire37[(4'h8):(2'h3)]) && (wire37[(3'h7):(2'h3)] >>> (reg40 == wire37)))));
        end
      else
        begin
          reg40 <= $unsigned(reg41[(3'h7):(3'h6)]);
          reg41 <= (($unsigned($signed(wire37)) << ({(7'h42)} ?
              (8'hb7) : $unsigned(wire38[(3'h7):(3'h6)]))) + $unsigned(wire36));
          reg42 <= $unsigned({wire37[(1'h1):(1'h1)], wire39[(4'h8):(4'h8)]});
          reg43 <= wire39;
        end
    end
  assign wire44 = wire39[(3'h7):(2'h3)];
  assign wire45 = (+reg42[(3'h7):(3'h4)]);
  assign wire46 = (~&{($signed((^~wire45)) ?
                          (reg41 || (wire44 << wire37)) : $signed(wire44))});
  always
    @(posedge clk) begin
      reg47 <= ($unsigned(reg43[(4'hc):(3'h5)]) ?
          reg41[(1'h1):(1'h1)] : {$unsigned(((wire37 <= reg43) ?
                  (|wire36) : (wire36 >= wire44)))});
      if (({$signed((reg40 ? (wire37 ? wire46 : wire39) : reg47)),
          $signed((+$signed((8'ha8))))} <<< $signed((wire38 && reg42))))
        begin
          if ($unsigned(($signed(((reg40 ^~ reg43) <= ((8'hbc) ?
                  reg42 : reg47))) ?
              wire46[(4'he):(4'he)] : (((reg40 | reg42) ?
                      $unsigned(wire45) : wire44) ?
                  $signed({reg40}) : wire44))))
            begin
              reg48 <= $signed(((|(wire39 <= $unsigned(wire44))) >>> ((+{wire46,
                  reg41}) ^~ $signed(reg40))));
              reg49 <= wire38[(3'h4):(2'h2)];
              reg50 <= (~^($unsigned({(reg41 ^ (8'had)),
                  $unsigned(wire38)}) & reg48[(1'h1):(1'h0)]));
            end
          else
            begin
              reg48 <= reg42;
              reg49 <= (~&(+((+(wire45 ? reg47 : reg43)) ?
                  {(wire39 == reg42), {reg43}} : {(reg47 != reg49)})));
              reg50 <= (|((((wire36 ? wire36 : wire44) >= (!wire38)) ?
                      $signed($unsigned(wire44)) : $signed((wire45 > (8'hb3)))) ?
                  ($signed((&wire37)) ?
                      wire38 : (~|reg42[(4'hb):(4'h9)])) : reg41[(2'h3):(2'h3)]));
            end
        end
      else
        begin
          reg48 <= $signed($unsigned((reg43[(4'hd):(4'ha)] ^~ (reg40 <<< $signed(reg48)))));
          reg49 <= wire37;
          reg50 <= (~$signed($unsigned(wire45[(4'hc):(4'h9)])));
        end
    end
  assign wire51 = reg50[(3'h6):(1'h0)];
  assign wire52 = ((~&$signed(((reg49 + wire38) ?
                          $signed(wire44) : (wire46 ? reg40 : wire36)))) ?
                      wire51 : ((~^(&$unsigned(wire45))) || (8'ha3)));
  assign wire53 = {{$signed(wire44), wire38[(2'h3):(2'h2)]}};
  always
    @(posedge clk) begin
      if ($signed($signed(reg47)))
        begin
          reg54 <= $unsigned((reg47 ? $signed($unsigned((+wire53))) : wire37));
          reg55 <= (~&{$signed((~|{wire51, (8'hbe)}))});
          reg56 <= ((^$unsigned((~(8'hb0)))) + $signed((reg48 + ($signed(reg47) ?
              $signed(reg50) : reg55))));
        end
      else
        begin
          reg54 <= {$unsigned($unsigned(($signed(reg43) < (8'hac))))};
          if (reg47[(3'h6):(3'h6)])
            begin
              reg55 <= (8'hb6);
            end
          else
            begin
              reg55 <= ($signed((((~&wire53) ?
                      wire37 : ((8'ha8) ?
                          wire37 : wire53)) && $signed((reg42 >>> wire46)))) ?
                  ($signed($unsigned(wire52)) ?
                      (|($unsigned(reg40) ?
                          $signed((8'hb0)) : wire38[(1'h0):(1'h0)])) : ($signed((8'ha6)) > reg56)) : reg43);
              reg56 <= (~|({(reg41[(4'hc):(2'h3)] && (+reg42))} ?
                  reg56 : reg40));
              reg57 <= (($unsigned(wire37[(1'h0):(1'h0)]) << (^~reg56)) > {wire37,
                  (((reg48 ? wire53 : reg50) ?
                      reg54[(1'h0):(1'h0)] : (reg56 ?
                          reg48 : wire37)) >>> ($unsigned(reg42) ?
                      wire36[(4'ha):(3'h7)] : reg50[(1'h0):(1'h0)]))});
              reg58 <= (^~$signed(($signed({wire36}) ?
                  ({wire46} ? reg40[(3'h5):(2'h2)] : $signed(reg48)) : {wire53,
                      (+reg54)})));
              reg59 <= (((reg54 <<< wire44) >> $unsigned(reg57)) ?
                  $signed(reg40) : $unsigned(reg54));
            end
          if ((&(+(^($signed(reg40) ? (^wire37) : reg48)))))
            begin
              reg60 <= {$signed(reg58[(1'h0):(1'h0)])};
              reg61 <= $unsigned($signed(($signed(wire45) << reg47)));
              reg62 <= {reg55[(1'h1):(1'h1)]};
            end
          else
            begin
              reg60 <= ((^wire51[(3'h6):(1'h1)]) ^~ wire36);
              reg61 <= {reg48[(4'ha):(4'h8)]};
            end
          reg63 <= $unsigned($unsigned(wire46));
        end
      reg64 <= $unsigned({((!(~^(7'h42))) ? (8'h9d) : wire45)});
      reg65 <= $signed($unsigned((wire46[(4'hf):(3'h4)] ?
          $signed($signed(reg48)) : (wire46 && ((8'hb6) ?
              (8'ha4) : (8'hb9))))));
    end
  assign wire66 = ((reg60[(4'hd):(1'h0)] | $signed(wire53[(2'h2):(1'h1)])) ?
                      (($unsigned(reg55[(2'h2):(1'h1)]) ?
                          reg62[(3'h7):(2'h2)] : {reg58[(4'h9):(1'h0)],
                              (wire44 > reg59)}) + wire38[(3'h4):(2'h2)]) : (~|reg62[(5'h11):(3'h5)]));
  assign wire67 = reg40;
  assign wire68 = wire51[(4'ha):(3'h5)];
  assign wire69 = $signed(reg61);
  assign wire70 = $signed(reg40[(4'hd):(3'h4)]);
  assign wire71 = ({$unsigned({$unsigned(reg41),
                          reg40[(4'h8):(1'h1)]})} || ($signed(((^~wire67) ?
                          wire69[(2'h2):(1'h1)] : wire45)) ?
                      {wire37[(4'h9):(3'h7)],
                          ($signed(wire67) ?
                              $signed(reg61) : (+wire45))} : {$unsigned($unsigned(reg50))}));
  assign wire72 = (($unsigned(wire51) > ($signed({reg47, reg55}) ?
                      reg49 : (+reg42[(4'hc):(4'ha)]))) << (&(reg43[(4'he):(2'h2)] >= $unsigned((reg49 == reg49)))));
  assign wire73 = ((reg40[(3'h6):(3'h4)] ?
                          {($unsigned(reg49) ?
                                  reg56[(4'h9):(3'h4)] : (reg65 ?
                                      (8'hbc) : wire46))} : $signed({$signed(wire66),
                              $unsigned(wire69)})) ?
                      $signed(($unsigned($unsigned(reg58)) ?
                          $unsigned($signed(reg55)) : ((wire68 == reg56) ~^ (-wire46)))) : (wire44 ?
                          wire71[(1'h0):(1'h0)] : (8'hab)));
  assign wire74 = wire53[(1'h0):(1'h0)];
  assign wire75 = (~^$unsigned({((~wire39) + wire44[(3'h5):(2'h2)]),
                      (-{reg42})}));
  assign wire76 = $signed(((($unsigned(wire68) ?
                      reg58 : $unsigned(wire74)) >>> (|(reg58 & reg61))) >>> reg57[(4'h9):(4'h8)]));
  assign wire77 = (8'h9d);
  assign wire78 = (+wire77);
endmodule
