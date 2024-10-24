module top
#(parameter param185 = ((((~((8'hb1) << (8'hb6))) ^~ ((!(7'h42)) ? ((8'ha7) ^~ (8'ha1)) : ((8'ha9) ? (8'ha6) : (8'ha4)))) ? (((~|(8'hab)) ? ((8'ha7) ? (8'hae) : (8'hb9)) : ((8'h9d) ? (8'hac) : (8'hb2))) ? (((8'haa) >> (8'ha0)) ^ (~|(8'ha9))) : (+((8'hb9) ? (8'ha9) : (8'ha5)))) : (^(~^((8'hbf) && (8'ha8))))) ? (8'ha2) : ((!({(8'h9c)} ? ((8'haf) ? (7'h44) : (8'ha1)) : ((8'hb2) ? (8'hbf) : (8'haf)))) ~^ {(((7'h44) > (8'hae)) ? (-(8'ha6)) : {(8'hbf), (8'hbf)}), (((8'hbc) ? (8'hb4) : (8'hb3)) <= (|(8'haf)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire184;
  wire signed [(3'h7):(1'h0)] wire183;
  wire signed [(5'h14):(1'h0)] wire179;
  wire [(5'h10):(1'h0)] wire172;
  wire [(5'h13):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire170;
  wire [(5'h15):(1'h0)] wire169;
  wire signed [(4'hd):(1'h0)] wire167;
  wire signed [(4'h8):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire181;
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(4'hb):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg [(4'hc):(1'h0)] reg173 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire179,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire167,
                 wire4,
                 wire181,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  assign wire4 = wire0;
  module5 #() modinst168 (.wire8(wire0), .wire9(wire4), .clk(clk), .wire7(wire1), .y(wire167), .wire6(wire2));
  assign wire169 = $signed(wire2[(4'h9):(1'h0)]);
  assign wire170 = $signed(($signed((~|(8'h9f))) ?
                       wire3[(2'h2):(1'h0)] : wire167[(4'h9):(3'h7)]));
  assign wire171 = (wire1 ?
                       (~&$unsigned($unsigned(wire167[(4'ha):(4'h9)]))) : (|$signed($unsigned($signed(wire0)))));
  assign wire172 = (8'h9f);
  always
    @(posedge clk) begin
      if (((|wire3[(4'h9):(3'h7)]) ?
          $unsigned(wire1[(4'h8):(3'h4)]) : ((~^wire170[(4'h8):(1'h0)]) ?
              wire0[(3'h4):(1'h0)] : (((8'hb4) ?
                  (8'ha1) : ((8'hb1) ?
                      wire1 : (8'had))) && $signed($unsigned(wire167))))))
        begin
          if (($unsigned((wire4[(2'h2):(1'h1)] + $signed(wire169[(3'h5):(1'h1)]))) ?
              wire0[(5'h14):(3'h5)] : $signed(wire167)))
            begin
              reg173 <= wire171[(2'h2):(2'h2)];
              reg174 <= (wire172[(3'h5):(3'h5)] >= {$signed({reg173[(4'h9):(3'h7)],
                      (^~wire1)}),
                  $unsigned($signed($unsigned(wire2)))});
            end
          else
            begin
              reg173 <= $unsigned($unsigned($signed(wire169[(4'h9):(1'h1)])));
              reg174 <= (8'h9d);
              reg175 <= ((wire167[(3'h5):(2'h2)] ?
                  (&wire1[(4'he):(1'h0)]) : $signed((~|(wire169 ?
                      (8'ha0) : reg174)))) << {(+$unsigned(wire2[(4'hd):(3'h4)]))});
              reg176 <= ({(~|$signed({wire172})),
                  (-(8'had))} >> $unsigned((~((~(8'hbd)) <<< (!reg173)))));
            end
        end
      else
        begin
          reg173 <= ($unsigned(wire169) ?
              (^reg176[(4'hb):(4'h8)]) : wire2[(4'hd):(4'h8)]);
          if (($signed($unsigned(($signed(wire170) != wire167))) << $unsigned(wire171[(4'ha):(3'h5)])))
            begin
              reg174 <= $unsigned(wire0[(5'h12):(2'h2)]);
            end
          else
            begin
              reg174 <= ($signed($signed(wire4[(2'h2):(1'h1)])) ?
                  wire2[(1'h0):(1'h0)] : wire2);
              reg175 <= (8'hbf);
              reg176 <= $unsigned((|(~&$signed((reg173 || wire1)))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg177 <= reg175;
      reg178 <= ((~^wire171[(1'h0):(1'h0)]) ^~ ((($signed(wire4) <= (reg175 || wire1)) ?
          $unsigned(wire170[(2'h3):(2'h3)]) : (8'ha6)) ~^ {wire3[(4'ha):(3'h4)]}));
    end
  module138 #() modinst180 (.wire142(reg177), .wire141(reg178), .clk(clk), .wire139(wire1), .y(wire179), .wire140(reg176));
  module138 #() modinst182 (.clk(clk), .y(wire181), .wire142(wire167), .wire141(wire179), .wire139(wire169), .wire140(reg176));
  assign wire183 = (~(wire179[(2'h2):(2'h2)] ?
                       reg174 : $signed((+(reg177 ? wire167 : wire179)))));
  assign wire184 = $unsigned($signed(((!wire183[(3'h5):(1'h0)]) && (wire3[(4'h9):(2'h3)] ?
                       wire2 : (~|wire181)))));
endmodule

module module5
#(parameter param166 = (^~((!(8'h9e)) ? {((8'hb7) <<< ((8'hb5) != (8'hba)))} : {(!((8'ha4) && (8'hbd)))})))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire163;
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire165,
                 wire60,
                 wire22,
                 wire21,
                 wire15,
                 wire62,
                 wire88,
                 wire90,
                 wire91,
                 wire92,
                 wire135,
                 wire137,
                 wire163,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= {wire6, wire9};
      reg11 <= $unsigned(wire7[(4'ha):(3'h4)]);
      reg12 <= reg11;
      reg13 <= $signed(wire6);
      reg14 <= $unsigned((~&(^~$unsigned($unsigned((7'h44))))));
    end
  assign wire15 = wire8;
  always
    @(posedge clk) begin
      reg16 <= {$signed(wire9[(3'h4):(2'h2)])};
      reg17 <= {$signed(wire6[(2'h3):(1'h1)]), $signed(reg16)};
      reg18 <= (reg12 ? wire9 : reg14);
      reg19 <= $signed(wire6[(4'hb):(1'h1)]);
      reg20 <= reg12;
    end
  assign wire21 = ((wire7 & (+$signed($signed(wire15)))) ^ $unsigned($signed(((reg12 + reg11) ?
                      reg18 : (wire8 >>> reg18)))));
  assign wire22 = $unsigned((reg16 ?
                      ((8'hb2) ^ (&(wire15 ?
                          wire21 : (8'ha8)))) : (^($unsigned(reg16) ?
                          (reg20 * (8'h9d)) : wire7[(1'h1):(1'h0)]))));
  module23 #() modinst61 (.y(wire60), .wire24(wire8), .wire27(reg17), .wire26(wire15), .wire25(wire21), .clk(clk));
  assign wire62 = wire60;
  module63 #() modinst89 (.wire64(wire6), .wire65(reg10), .y(wire88), .wire66(wire22), .clk(clk), .wire67(reg14));
  assign wire90 = wire9;
  assign wire91 = (reg16 | (reg12 | (~|reg10[(4'hc):(4'ha)])));
  assign wire92 = ($signed($unsigned(((!wire9) < $signed(wire91)))) ?
                      (({$unsigned(wire6), wire15[(4'hb):(3'h5)]} ?
                          $signed($unsigned(wire8)) : reg10[(5'h11):(5'h10)]) != $signed(wire60[(4'hc):(1'h0)])) : (~|$signed((&$signed(reg13)))));
  module93 #() modinst136 (wire135, clk, wire60, reg14, reg13, reg11, wire22);
  assign wire137 = wire15[(3'h5):(2'h2)];
  module138 #() modinst164 (wire163, clk, wire88, reg20, reg11, reg13);
  assign wire165 = wire88[(3'h6):(1'h0)];
endmodule

module module138
#(parameter param161 = ((|((^(+(8'hb7))) ? (((8'hb2) || (8'haf)) * (8'hb3)) : (((8'ha5) | (8'hac)) ? ((8'ha8) ? (8'hbd) : (8'hb1)) : ((8'hb8) >= (8'ha2))))) ~^ (~((-((8'ha8) <<< (7'h43))) ? (-((8'ha5) ? (7'h44) : (8'hb0))) : ({(8'hbc), (7'h44)} << ((8'h9d) != (7'h41)))))), 
parameter param162 = {(~^((param161 ? (param161 ? param161 : param161) : (param161 ? (8'hb2) : param161)) || (^param161)))})
(y, clk, wire142, wire141, wire140, wire139);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire142;
  input wire [(5'h14):(1'h0)] wire141;
  input wire [(4'hb):(1'h0)] wire140;
  input wire [(5'h15):(1'h0)] wire139;
  wire [(4'he):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire159;
  wire [(5'h15):(1'h0)] wire158;
  wire [(5'h14):(1'h0)] wire157;
  wire [(5'h13):(1'h0)] wire156;
  wire [(4'hb):(1'h0)] wire155;
  wire [(5'h13):(1'h0)] wire153;
  wire [(4'he):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire150;
  wire [(4'hf):(1'h0)] wire149;
  wire [(2'h3):(1'h0)] wire148;
  wire [(4'h9):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire146;
  wire [(2'h2):(1'h0)] wire145;
  wire signed [(5'h13):(1'h0)] wire144;
  wire signed [(2'h2):(1'h0)] wire143;
  reg signed [(2'h3):(1'h0)] reg154 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 reg154,
                 (1'h0)};
  assign wire143 = {(&wire142[(3'h7):(3'h7)])};
  assign wire144 = {(wire143 ? (8'had) : wire143[(1'h1):(1'h1)])};
  assign wire145 = (|$unsigned((&(^{wire144}))));
  assign wire146 = {(wire140 == $signed($signed($signed(wire143))))};
  assign wire147 = (((((wire139 ? wire144 : wire143) ^~ (wire146 * (8'hbe))) ?
                               $signed({wire145, wire139}) : $signed((wire142 ?
                                   (8'hbb) : wire142))) ?
                           $unsigned(wire143[(1'h0):(1'h0)]) : $unsigned(wire141)) ?
                       $signed(((wire142[(1'h0):(1'h0)] ?
                               (wire142 ? (7'h40) : wire145) : wire143) ?
                           wire141[(4'hf):(3'h4)] : (-wire141))) : wire141);
  assign wire148 = $signed({wire146[(4'hd):(1'h0)], wire139});
  assign wire149 = (~^$signed((wire144[(5'h10):(3'h5)] & $unsigned((wire144 >= wire143)))));
  assign wire150 = wire144[(4'h8):(3'h7)];
  assign wire151 = wire147;
  assign wire152 = $unsigned((8'hae));
  assign wire153 = ($signed({wire140[(3'h7):(3'h5)],
                       wire139}) | (+$signed(({wire142, wire140} + wire145))));
  always
    @(posedge clk) begin
      reg154 <= (wire146[(4'hd):(4'hc)] && wire149[(1'h0):(1'h0)]);
    end
  assign wire155 = wire147[(4'h9):(2'h3)];
  assign wire156 = wire153;
  assign wire157 = wire151;
  assign wire158 = $signed({(|$signed({(8'ha2)})), (8'hbc)});
  assign wire159 = wire151[(4'h9):(3'h6)];
  assign wire160 = {$unsigned(({$unsigned(wire142),
                           (wire148 >>> wire143)} >= (+$unsigned(wire149))))};
endmodule

module module93
#(parameter param133 = (~^(~|(((~^(8'ha1)) ? (+(8'hb2)) : (~^(8'ha8))) > (~^((8'hab) ? (8'hab) : (8'hb0)))))), 
parameter param134 = param133)
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire98;
  input wire [(5'h10):(1'h0)] wire97;
  input wire [(2'h3):(1'h0)] wire96;
  input wire signed [(2'h2):(1'h0)] wire95;
  input wire signed [(4'hc):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire130;
  wire signed [(3'h4):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  wire [(4'hd):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire113;
  wire [(4'h9):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire111;
  wire [(5'h10):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  wire [(2'h3):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire103;
  wire signed [(2'h2):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  assign y = {wire132,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire105,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg131,
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
                 reg114,
                 reg106,
                 reg104,
                 (1'h0)};
  assign wire99 = $signed($unsigned((~|$signed($unsigned(wire98)))));
  assign wire100 = $unsigned((~|(~^wire96[(2'h2):(1'h1)])));
  assign wire101 = $signed((wire94[(3'h7):(2'h2)] >>> $signed(wire97[(4'h8):(4'h8)])));
  assign wire102 = $signed((($signed({wire99, wire98}) >= wire95) != wire99));
  assign wire103 = wire102;
  always
    @(posedge clk) begin
      reg104 <= ((((~&(wire100 >= wire102)) ~^ wire95) ? wire99 : wire94) ?
          (($unsigned((~|wire101)) ?
              $signed(wire99[(4'ha):(2'h3)]) : $signed($unsigned(wire101))) + (!$signed(wire103[(1'h0):(1'h0)]))) : {wire100,
              wire102[(2'h2):(1'h1)]});
    end
  assign wire105 = (+$unsigned(wire95[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg106 <= (7'h44);
    end
  assign wire107 = $unsigned(wire100);
  assign wire108 = $unsigned($unsigned($unsigned(((wire105 <= wire107) <= $signed(reg106)))));
  assign wire109 = wire102[(1'h0):(1'h0)];
  assign wire110 = wire103[(2'h3):(1'h1)];
  assign wire111 = (wire98[(4'h8):(1'h1)] == {wire102[(1'h0):(1'h0)],
                       ($unsigned(reg106[(4'h8):(1'h0)]) != $signed($signed((7'h40))))});
  assign wire112 = (reg106[(3'h7):(3'h4)] ?
                       ({({wire111,
                               wire110} > wire108[(2'h2):(2'h2)])} | (-wire98)) : $signed(($signed(wire100[(5'h13):(4'hd)]) <<< wire105[(1'h1):(1'h1)])));
  assign wire113 = {((wire105 ?
                           (^wire110) : {wire98[(3'h5):(3'h4)],
                               $signed((8'h9c))}) | wire109)};
  always
    @(posedge clk) begin
      reg114 <= ({reg104} ?
          {(!(|(reg106 ? wire99 : wire95)))} : $unsigned($signed(wire101)));
      reg115 <= wire100;
      reg116 <= $unsigned(wire109[(4'hb):(4'h9)]);
      if (reg114[(3'h6):(3'h6)])
        begin
          reg117 <= (~wire94[(4'hb):(1'h0)]);
          reg118 <= ({(wire105[(3'h5):(1'h0)] ?
                      (wire108 ?
                          (wire99 <<< (7'h40)) : (reg106 < wire100)) : reg116[(3'h6):(1'h0)]),
                  wire109[(4'h8):(2'h3)]} ?
              (~|$unsigned($unsigned((&reg106)))) : reg114);
          reg119 <= $unsigned(wire105[(4'ha):(3'h6)]);
          if ((~^(-({(reg115 << reg115)} - ((!(8'hb3)) ?
              (wire101 ? wire107 : wire101) : (~&reg115))))))
            begin
              reg120 <= $unsigned((~^((+reg119) ?
                  wire107 : ($unsigned((7'h40)) - (8'ha4)))));
              reg121 <= {($unsigned((reg118[(5'h13):(4'he)] == (8'ha0))) ?
                      $signed($signed((^~wire101))) : (reg120 ?
                          reg104 : $unsigned($unsigned(reg106))))};
              reg122 <= (^(~^{wire113}));
              reg123 <= (reg121 ~^ (8'ha7));
              reg124 <= $signed(({reg119} & (reg118[(2'h3):(1'h1)] || (&wire109[(4'he):(4'h8)]))));
            end
          else
            begin
              reg120 <= ({$unsigned($unsigned($signed(wire113))),
                  ((8'hbd) >> (~|wire105[(4'h8):(1'h0)]))} > (-wire102[(1'h1):(1'h1)]));
              reg121 <= (7'h42);
            end
        end
      else
        begin
          reg117 <= (wire102[(2'h2):(1'h0)] != ($signed(((reg123 + (8'hb5)) == reg123)) > (wire105 | $signed(reg119))));
          reg118 <= {(wire99 ?
                  $signed($signed(wire99)) : $unsigned($signed(reg106[(2'h3):(1'h1)])))};
          reg119 <= $unsigned({wire110[(4'h8):(3'h7)]});
        end
      reg125 <= {{(8'hbf), (reg122[(3'h6):(1'h1)] == ({reg118} ^ {reg104}))},
          reg120};
    end
  assign wire126 = ((({{wire109}} & ((wire110 ? wire110 : reg121) - (reg104 ?
                       reg120 : wire110))) - $unsigned(wire98[(4'h8):(3'h4)])) && (wire111 ?
                       wire100[(1'h0):(1'h0)] : (($unsigned(reg121) ?
                               $unsigned(wire101) : (^~wire107)) ?
                           (((8'hbe) & wire113) ?
                               $unsigned(reg115) : (wire98 || reg122)) : reg120)));
  assign wire127 = (((reg125 ?
                               $unsigned((wire96 | reg124)) : (^((8'hac) ?
                                   reg106 : wire111))) ?
                           {$signed((wire101 >>> reg121))} : wire108[(2'h2):(1'h1)]) ?
                       reg115 : {wire113});
  assign wire128 = wire107;
  assign wire129 = $unsigned((8'hb4));
  assign wire130 = (~|wire101[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg131 <= ($signed(wire102[(2'h2):(1'h0)]) ?
          $unsigned(((~|(&reg119)) <= ((wire100 ? reg118 : wire110) ?
              wire128 : wire111))) : (^{(~|(wire109 ? reg104 : wire97))}));
    end
  assign wire132 = (wire128 | $signed(wire103));
endmodule

module module63  (y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire67;
  input wire [(4'hc):(1'h0)] wire66;
  input wire [(5'h11):(1'h0)] wire65;
  input wire [(4'h9):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  assign y = {wire87,
                 wire86,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire68 = wire67;
  assign wire69 = wire64[(4'h8):(4'h8)];
  assign wire70 = {((|$unsigned($unsigned(wire68))) ?
                          ({wire69, (wire64 ? wire68 : wire66)} ?
                              $signed($unsigned((8'ha2))) : $unsigned((~wire68))) : $signed($signed((|wire67))))};
  assign wire71 = wire64;
  assign wire72 = $signed(wire66);
  assign wire73 = (~&{wire67,
                      {($unsigned(wire71) ?
                              (wire68 ?
                                  wire66 : wire65) : wire70[(2'h3):(2'h3)]),
                          (|$unsigned(wire65))}});
  assign wire74 = (wire67[(4'hc):(2'h2)] + wire70[(1'h0):(1'h0)]);
  assign wire75 = wire65;
  assign wire76 = (~^wire74);
  assign wire77 = $unsigned((|(~^($unsigned(wire71) ?
                      wire75 : $signed(wire73)))));
  always
    @(posedge clk) begin
      reg78 <= wire72[(4'h9):(4'h9)];
      reg79 <= wire72[(4'h9):(2'h3)];
      if ({$unsigned($unsigned($signed((wire74 <<< wire71)))),
          (|(wire69[(3'h6):(2'h2)] + (7'h41)))})
        begin
          reg80 <= $signed(wire71);
          reg81 <= wire65[(4'h8):(2'h2)];
          reg82 <= ((8'hae) ?
              $signed((-(wire76[(3'h7):(3'h5)] && wire73))) : ($unsigned(((wire72 ?
                      (8'ha8) : (8'hb0)) ?
                  $signed(wire73) : {reg81, reg78})) ^ (~wire74)));
          reg83 <= wire73[(5'h10):(4'hd)];
          reg84 <= ($signed(reg82) ? {wire64[(3'h6):(3'h5)]} : wire64);
        end
      else
        begin
          reg80 <= ((~|(~|(+(wire67 ~^ wire74)))) == (+{$signed($signed(wire74))}));
          if (($unsigned(((+$signed((8'hbd))) ?
                  ($signed(reg82) >>> (wire75 ? (8'hb3) : reg82)) : wire66)) ?
              wire68[(4'h8):(3'h6)] : (reg81 == wire64[(1'h0):(1'h0)])))
            begin
              reg81 <= $unsigned((^(8'ha3)));
              reg82 <= wire69[(4'h9):(3'h6)];
            end
          else
            begin
              reg81 <= (-$signed($unsigned($signed(wire77[(3'h7):(1'h0)]))));
              reg82 <= ($unsigned((reg81[(1'h0):(1'h0)] - {wire64[(2'h3):(1'h0)],
                      (reg83 ? wire67 : reg84)})) ?
                  wire75[(4'h8):(3'h5)] : (^wire73));
              reg83 <= ((!(^~$unsigned($unsigned(reg78)))) >> reg79[(4'h8):(3'h6)]);
            end
          reg84 <= reg82[(4'hd):(3'h6)];
          reg85 <= {($unsigned($signed(wire68)) != (wire67 >> (+wire69)))};
        end
    end
  assign wire86 = ((($signed($unsigned(wire73)) << {reg79[(3'h4):(3'h4)],
                          wire71[(2'h3):(2'h3)]}) >= ($unsigned($unsigned(wire75)) >> reg80)) ?
                      $signed(($unsigned((wire68 & wire69)) ~^ (8'hb7))) : (($unsigned((~|reg78)) ~^ $signed(((8'hbe) ?
                          reg80 : wire70))) >>> (-reg83)));
  assign wire87 = (~^(^~wire66));
endmodule

module module23
#(parameter param59 = ({(^~({(8'h9c)} ? ((8'had) - (8'hab)) : ((8'hb9) ? (8'hae) : (7'h44))))} ? ((~(^(8'ha0))) << ((+((8'h9f) ? (8'ha3) : (8'ha6))) < {((8'ha5) == (8'hac)), ((8'hb9) > (8'hb8))})) : (^~((8'hb9) < (((8'hb9) ? (8'hb3) : (8'hb6)) < (&(8'hbd)))))))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire27;
  input wire [(2'h3):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire33,
                 wire32,
                 wire31,
                 reg54,
                 reg53,
                 reg52,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= $signed($unsigned(wire25));
      reg29 <= $unsigned($unsigned(wire24[(4'hb):(3'h5)]));
      reg30 <= (reg28 * $unsigned(wire24));
    end
  assign wire31 = (wire25 & $unsigned((~^($signed(reg29) ^ {reg29}))));
  assign wire32 = $unsigned((~^($signed((reg29 ?
                      (8'ha7) : wire27)) >> $unsigned(reg29))));
  assign wire33 = $signed((~$signed((reg30[(1'h0):(1'h0)] || (~reg28)))));
  always
    @(posedge clk) begin
      reg34 <= (|reg28[(1'h1):(1'h1)]);
      reg35 <= {{$signed($signed((~&wire24))), wire31}, $signed(wire33)};
      reg36 <= $unsigned((8'hb5));
      if ((-reg35[(3'h4):(1'h1)]))
        begin
          reg37 <= $unsigned(wire25[(2'h3):(2'h2)]);
          if ($signed(((-reg37[(3'h7):(1'h1)]) ?
              (reg34[(5'h14):(1'h0)] > wire32) : (&wire26[(2'h3):(2'h3)]))))
            begin
              reg38 <= wire24[(2'h3):(1'h0)];
              reg39 <= (8'ha4);
              reg40 <= ($signed($unsigned($signed((reg30 != reg28)))) == (~wire26));
            end
          else
            begin
              reg38 <= $signed(reg29);
              reg39 <= (reg35[(3'h4):(3'h4)] ^~ $unsigned((wire32[(1'h0):(1'h0)] ?
                  ($signed(reg37) && $signed(wire31)) : ($signed(reg38) ?
                      (reg34 ? reg34 : reg38) : wire24[(3'h5):(2'h2)]))));
              reg40 <= (!wire25[(1'h1):(1'h0)]);
              reg41 <= (~((~|$unsigned(((8'hb0) < wire33))) >>> wire32));
            end
          reg42 <= wire31[(1'h1):(1'h0)];
          reg43 <= $signed({((reg30[(2'h3):(1'h0)] ?
                      (reg34 ? reg30 : wire26) : $signed(reg28)) ?
                  $signed($signed(wire27)) : $unsigned({reg42, reg29})),
              wire25[(5'h10):(4'he)]});
          reg44 <= reg30;
        end
      else
        begin
          reg37 <= {{reg28[(3'h7):(3'h5)], (~wire27)}};
          reg38 <= $signed($signed((($signed(wire31) * $signed(reg35)) ?
              reg34[(3'h4):(3'h4)] : (^~reg43[(3'h6):(3'h4)]))));
        end
      reg45 <= (!$unsigned((8'hbc)));
    end
  assign wire46 = $unsigned(reg35);
  assign wire47 = wire24;
  assign wire48 = $signed($unsigned($unsigned((~$unsigned((8'hbe))))));
  assign wire49 = (~&($signed(((~&wire48) | reg39)) ?
                      $unsigned((reg34[(1'h0):(1'h0)] * wire32[(1'h0):(1'h0)])) : reg40));
  assign wire50 = (7'h42);
  assign wire51 = (reg30 ? (wire48 < reg45) : $unsigned(wire31[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      reg52 <= $signed($unsigned($signed((((8'hb5) ? (8'hb5) : wire47) ?
          wire24 : (wire26 ? wire25 : wire33)))));
      reg53 <= wire32[(3'h4):(2'h2)];
      reg54 <= $signed(wire26);
    end
  assign wire55 = (&(reg53 ? reg37 : (^wire25[(1'h1):(1'h1)])));
  assign wire56 = (reg53[(5'h13):(4'hb)] >> (reg36 ?
                      $signed((reg37 && (&wire55))) : (8'hb4)));
  assign wire57 = (|wire55);
  assign wire58 = ((reg35[(2'h2):(2'h2)] ?
                      (~|$signed(reg29[(1'h1):(1'h1)])) : reg38) + ($signed(wire56) | (!{(&reg52),
                      (~reg34)})));
endmodule
