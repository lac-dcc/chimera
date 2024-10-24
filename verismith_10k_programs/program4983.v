module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire210;
  wire [(2'h3):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire22;
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  assign y = {wire210,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire4,
                 wire5,
                 wire6,
                 wire22,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire4 = $signed($signed((wire2[(4'hf):(4'ha)] ?
                     wire2 : $unsigned({wire2, wire0}))));
  assign wire5 = $unsigned(($unsigned((|$unsigned(wire2))) != $signed(wire3)));
  assign wire6 = $unsigned(wire0);
  always
    @(posedge clk) begin
      if (($unsigned((((+wire6) <<< wire2[(5'h10):(2'h2)]) ?
          $signed($signed(wire0)) : $signed(wire2))) >> (|((wire6[(2'h3):(1'h1)] && (wire1 ?
          wire1 : wire6)) ^~ ((^~wire2) ?
          {wire3, wire6} : (wire6 ? (8'hb8) : (8'ha7)))))))
        begin
          reg7 <= $signed((7'h41));
        end
      else
        begin
          reg7 <= (&$unsigned(wire2));
          reg8 <= (+($unsigned((wire1 == (~(8'hb7)))) & ($signed((wire3 ?
                  wire5 : wire2)) ?
              ((&wire6) ?
                  (wire2 ^ wire4) : (wire5 ?
                      reg7 : wire4)) : (^$signed(wire2)))));
        end
      reg9 <= $signed((|$signed(((-wire1) ? (~wire5) : (~wire2)))));
      reg10 <= $unsigned(wire0);
      reg11 <= reg9;
    end
  module12 #() modinst23 (.wire15(wire1), .y(wire22), .wire13(wire6), .wire16(wire0), .clk(clk), .wire14(reg11));
  assign wire24 = $unsigned(($signed($unsigned(wire0[(2'h2):(1'h0)])) ?
                      (7'h41) : $unsigned(((-wire0) ?
                          (wire4 ? wire0 : (8'haa)) : wire3[(1'h1):(1'h0)]))));
  assign wire25 = wire1[(3'h5):(3'h4)];
  assign wire26 = (wire6[(4'h8):(3'h4)] ?
                      reg11[(2'h2):(2'h2)] : (|$signed((!(wire2 != wire0)))));
  assign wire27 = $signed(({{reg8}} ?
                      $signed((((7'h43) > wire6) ?
                          (-wire5) : {wire26})) : $unsigned({(reg11 ?
                              wire1 : wire6)})));
  module28 #() modinst211 (.wire32(wire24), .clk(clk), .wire31(wire26), .y(wire210), .wire30(wire6), .wire29(wire25));
endmodule

module module28
#(parameter param208 = (8'ha6), 
parameter param209 = (~|{(param208 == (!((8'hbd) ? param208 : param208)))}))
(y, clk, wire29, wire30, wire31, wire32);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire29;
  input wire signed [(4'hc):(1'h0)] wire30;
  input wire signed [(5'h10):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire206;
  wire [(5'h15):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire153;
  wire signed [(4'hd):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire171;
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg151 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg173 = (1'h0);
  reg [(3'h4):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg175 = (1'h0);
  assign y = {wire206,
                 wire135,
                 wire33,
                 wire79,
                 wire137,
                 wire153,
                 wire154,
                 wire171,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg173,
                 reg174,
                 reg175,
                 (1'h0)};
  assign wire33 = ({wire30[(2'h3):(2'h2)],
                          $signed(((wire31 ? wire30 : wire31) ?
                              $signed(wire31) : $unsigned(wire31)))} ?
                      wire32 : wire30[(4'hb):(3'h5)]);
  module34 #() modinst80 (.wire38(wire29), .wire37(wire32), .wire36(wire31), .wire35(wire33), .wire39(wire30), .y(wire79), .clk(clk));
  module81 #() modinst136 (wire135, clk, wire33, wire79, wire29, wire31, wire30);
  assign wire137 = (8'hb4);
  always
    @(posedge clk) begin
      if ((^$unsigned($signed($unsigned((-wire32))))))
        begin
          reg138 <= $signed(wire30[(4'ha):(4'h8)]);
          if ((wire32 >= {{$unsigned($unsigned(wire135)),
                  {$signed(reg138), (~&(8'ha1))}},
              (7'h43)}))
            begin
              reg139 <= $unsigned((~$unsigned(wire135[(1'h1):(1'h1)])));
              reg140 <= wire32[(3'h7):(3'h4)];
            end
          else
            begin
              reg139 <= reg139;
              reg140 <= $unsigned(((&{$unsigned(wire29)}) ?
                  (({reg138, wire31} ? (^~wire32) : $signed(reg138)) ?
                      (~$signed(reg140)) : $unsigned({reg140})) : (~&$signed((|wire32)))));
              reg141 <= (reg140 >= wire29);
              reg142 <= $signed({wire29, (8'ha2)});
              reg143 <= (((|{$unsigned(wire79), wire79[(4'hd):(4'hb)]}) ?
                  (wire29[(1'h0):(1'h0)] * ($signed(wire79) ?
                      (~&wire135) : $unsigned(wire32))) : wire31) >>> ($unsigned((|reg138)) ?
                  $unsigned((8'h9c)) : $unsigned(wire33)));
            end
        end
      else
        begin
          if (wire137)
            begin
              reg138 <= reg140[(2'h2):(1'h1)];
              reg139 <= {wire31, (+reg142[(2'h3):(2'h2)])};
              reg140 <= ((8'hb2) ^~ (reg139 ? wire33 : (^~wire31)));
              reg141 <= (-(8'hbb));
            end
          else
            begin
              reg138 <= $signed($signed((reg140 ?
                  (~&(wire31 > wire135)) : (reg142 && reg142))));
              reg139 <= wire137;
              reg140 <= reg138[(3'h5):(2'h2)];
              reg141 <= $unsigned((($unsigned(((8'hbb) ?
                  wire79 : reg138)) * $unsigned($signed(wire137))) ^ $signed(reg138)));
              reg142 <= reg138[(2'h2):(1'h0)];
            end
          reg143 <= $signed((wire29[(2'h3):(2'h2)] != $signed(((wire29 ?
              wire135 : wire30) < wire31[(4'hc):(3'h4)]))));
          if (reg143[(3'h7):(1'h1)])
            begin
              reg144 <= (&((~^(^~(8'hb5))) != (((!reg143) ?
                      reg140 : $unsigned(wire31)) ?
                  $signed({reg139, reg142}) : ({reg142, wire32} <<< wire32))));
              reg145 <= (|wire79);
              reg146 <= wire137;
              reg147 <= (((~&reg139) + wire33) ^ reg141);
            end
          else
            begin
              reg144 <= $unsigned(wire79);
              reg145 <= $unsigned((^~(^~$signed($signed(wire32)))));
              reg146 <= (+$unsigned({wire30,
                  (reg139[(4'hf):(3'h4)] | (~|(8'ha5)))}));
            end
          if ($unsigned(reg145[(4'he):(3'h5)]))
            begin
              reg148 <= {(^~$signed({{reg143, wire31}})),
                  $signed($unsigned((reg141 * reg143)))};
              reg149 <= ($unsigned((((wire29 ^ reg144) <= $signed(wire32)) < (-reg139[(5'h10):(2'h3)]))) ?
                  wire32 : ((8'ha4) ?
                      reg144[(1'h0):(1'h0)] : (~&((reg147 | wire31) ?
                          {reg146, (8'hb6)} : reg145[(3'h5):(1'h0)]))));
            end
          else
            begin
              reg148 <= (^(($unsigned((~^reg145)) | reg146) | $signed(wire137)));
              reg149 <= wire33;
            end
          reg150 <= $unsigned(reg138);
        end
      reg151 <= ({(+((reg147 ? wire33 : wire137) ?
              (reg140 - wire33) : $signed(reg139)))} >>> $unsigned((($signed(reg150) ?
          (~&reg150) : reg148) > $signed(wire31[(4'hb):(1'h1)]))));
      reg152 <= {reg149[(3'h6):(1'h1)]};
    end
  assign wire153 = wire30[(4'ha):(1'h0)];
  assign wire154 = ($unsigned($unsigned((reg138 ?
                           $unsigned(reg146) : {wire33, (8'hb2)}))) ?
                       ($signed((~&((8'hbe) ?
                           reg151 : (8'hb1)))) <= $unsigned((reg142 ?
                           $signed(wire33) : reg140[(3'h5):(2'h2)]))) : $unsigned(($unsigned((^~(8'hbb))) ?
                           wire31 : ({reg141, wire135} > $unsigned(reg145)))));
  module155 #() modinst172 (wire171, clk, wire30, wire79, reg150, wire32, reg152);
  always
    @(posedge clk) begin
      reg173 <= (~&$signed(reg151));
      reg174 <= $unsigned(reg144[(3'h5):(1'h0)]);
      reg175 <= $signed({reg174[(2'h2):(2'h2)]});
    end
  module176 #() modinst207 (wire206, clk, wire32, wire31, wire79, wire171, reg144);
endmodule

module module12
#(parameter param21 = (|(((~^((8'hb2) ? (7'h42) : (8'hb3))) ~^ (^((8'haa) ? (8'h9c) : (8'haa)))) ? (((~^(8'hb9)) ? ((8'hab) ? (8'hae) : (8'hbd)) : ((8'hbe) ? (8'ha1) : (8'had))) || (((8'ha9) ? (7'h43) : (8'ha5)) || ((8'ha6) | (8'ha4)))) : ((((8'ha2) << (8'hb4)) ? {(8'ha4), (8'hb5)} : (8'h9d)) ^~ (((7'h40) < (8'haf)) == ((8'h9d) ? (7'h44) : (7'h41)))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  assign y = {wire20, wire19, wire18, reg17, (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= ($unsigned($signed({wire16,
          $unsigned(wire16)})) & wire13[(2'h3):(2'h2)]);
    end
  assign wire18 = ((8'hbe) & (^~wire14));
  assign wire19 = (&(|wire14));
  assign wire20 = wire18;
endmodule

module module176
#(parameter param205 = (^~(((&(~&(8'hb8))) ? (~&((8'h9d) || (7'h40))) : (|{(7'h44)})) ? {(((8'h9e) ? (8'hb4) : (8'ha2)) & {(7'h41)})} : ((((8'h9f) - (8'hae)) == ((8'hb8) ? (8'hb6) : (8'hb5))) ~^ (8'hbc)))))
(y, clk, wire181, wire180, wire179, wire178, wire177);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire181;
  input wire [(4'ha):(1'h0)] wire180;
  input wire [(4'ha):(1'h0)] wire179;
  input wire [(4'hc):(1'h0)] wire178;
  input wire [(4'ha):(1'h0)] wire177;
  wire [(3'h7):(1'h0)] wire204;
  wire [(4'h9):(1'h0)] wire203;
  wire [(3'h7):(1'h0)] wire202;
  wire [(2'h2):(1'h0)] wire201;
  wire [(3'h7):(1'h0)] wire200;
  wire [(5'h13):(1'h0)] wire199;
  wire [(4'hc):(1'h0)] wire198;
  wire signed [(5'h12):(1'h0)] wire197;
  wire signed [(4'hc):(1'h0)] wire196;
  wire [(5'h14):(1'h0)] wire195;
  wire signed [(2'h3):(1'h0)] wire194;
  wire [(4'ha):(1'h0)] wire193;
  wire [(5'h13):(1'h0)] wire187;
  wire signed [(5'h14):(1'h0)] wire186;
  wire signed [(5'h13):(1'h0)] wire185;
  wire [(3'h4):(1'h0)] wire184;
  wire signed [(5'h10):(1'h0)] wire183;
  wire signed [(5'h15):(1'h0)] wire182;
  reg [(3'h6):(1'h0)] reg192 = (1'h0);
  reg [(5'h15):(1'h0)] reg191 = (1'h0);
  reg [(5'h15):(1'h0)] reg190 = (1'h0);
  reg [(2'h2):(1'h0)] reg189 = (1'h0);
  reg [(4'ha):(1'h0)] reg188 = (1'h0);
  assign y = {wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 (1'h0)};
  assign wire182 = {(~^(+(wire181 ? wire180 : $unsigned((7'h42)))))};
  assign wire183 = wire179;
  assign wire184 = $signed({(8'hae)});
  assign wire185 = {$signed(($signed($signed(wire183)) < (8'h9c))),
                       (~|$unsigned($signed($signed(wire180))))};
  assign wire186 = (((8'had) ?
                       ((|$unsigned(wire182)) ?
                           $signed((8'h9c)) : ($unsigned((8'hba)) ^~ (^~(8'ha7)))) : $unsigned((~(wire185 ?
                           wire179 : (8'ha2))))) >>> $signed((wire185[(3'h5):(1'h1)] ?
                       ((wire179 << wire178) ?
                           wire177 : $unsigned(wire185)) : (8'hb4))));
  assign wire187 = $signed((|wire180[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      reg188 <= (~&wire180[(3'h6):(1'h0)]);
      reg189 <= (wire181 | reg188[(4'h8):(2'h3)]);
      reg190 <= (wire186 ?
          (wire184 ?
              {wire187} : (!{$unsigned(wire180)})) : $signed((~^$unsigned($unsigned(wire184)))));
      reg191 <= wire182[(4'hb):(1'h0)];
      reg192 <= (&$unsigned((((wire185 < wire187) ^ wire183[(2'h2):(1'h1)]) >>> wire187[(2'h2):(1'h0)])));
    end
  assign wire193 = $signed(wire178);
  assign wire194 = ($signed($signed(wire184)) ?
                       {wire187, wire186} : wire181[(5'h10):(3'h4)]);
  assign wire195 = $signed((8'hba));
  assign wire196 = (wire177 < {reg189[(1'h1):(1'h1)]});
  assign wire197 = (|(reg190 < reg188[(4'ha):(3'h6)]));
  assign wire198 = (wire178 ?
                       ((((&wire178) == (~^reg189)) && wire180) >>> ((8'hbd) ~^ (|wire187[(5'h12):(4'hf)]))) : wire179);
  assign wire199 = (reg190[(3'h7):(1'h1)] >> (reg192 && $unsigned((~(wire181 && wire186)))));
  assign wire200 = {(-$signed($unsigned($signed(wire198))))};
  assign wire201 = {(8'hb6)};
  assign wire202 = (wire180 && (wire193[(1'h0):(1'h0)] == (((reg190 ?
                       wire195 : wire182) < wire185[(3'h6):(3'h6)]) >>> wire194[(1'h0):(1'h0)])));
  assign wire203 = (({{$unsigned(wire181)}} ?
                       (($signed(wire194) ? $signed(wire187) : reg188) ?
                           {{wire200,
                                   (8'haa)}} : (~^$unsigned(wire180))) : wire197) ^~ (($signed(wire186) > (-(wire194 == wire179))) <<< wire179));
  assign wire204 = wire185;
endmodule

module module155
#(parameter param170 = (8'hb1))
(y, clk, wire160, wire159, wire158, wire157, wire156);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire160;
  input wire signed [(5'h12):(1'h0)] wire159;
  input wire [(5'h10):(1'h0)] wire158;
  input wire [(4'h8):(1'h0)] wire157;
  input wire signed [(4'hb):(1'h0)] wire156;
  wire [(4'ha):(1'h0)] wire169;
  wire signed [(4'hc):(1'h0)] wire168;
  wire signed [(4'ha):(1'h0)] wire167;
  wire [(5'h15):(1'h0)] wire166;
  wire signed [(3'h4):(1'h0)] wire165;
  wire signed [(5'h15):(1'h0)] wire164;
  wire signed [(3'h5):(1'h0)] wire163;
  wire [(3'h4):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire161;
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 (1'h0)};
  assign wire161 = {wire158, wire159};
  assign wire162 = {(8'had),
                       ($unsigned(wire158) ? $signed(wire158) : {{wire161}})};
  assign wire163 = $unsigned($unsigned($unsigned((^~(wire161 - wire161)))));
  assign wire164 = ((-$signed(wire162[(1'h1):(1'h1)])) ^~ (~^$signed(((^(8'hbe)) < wire159[(5'h11):(4'hf)]))));
  assign wire165 = {wire156[(4'hb):(4'h9)]};
  assign wire166 = ($unsigned($signed($unsigned($signed(wire159)))) <= $unsigned((~&$signed($signed(wire162)))));
  assign wire167 = $unsigned(($signed(($unsigned(wire162) ?
                       wire165 : $signed(wire165))) << wire160[(4'ha):(2'h3)]));
  assign wire168 = wire167[(2'h2):(1'h1)];
  assign wire169 = (($unsigned($unsigned((~&wire165))) ?
                           {wire160, (~|wire156)} : (-((wire162 ?
                               wire159 : wire160) + (wire160 ?
                               (8'ha4) : wire163)))) ?
                       (8'h9f) : (wire162 ?
                           {$unsigned(wire162[(2'h2):(2'h2)]),
                               $signed(wire158[(3'h5):(3'h5)])} : wire167));
endmodule

module module81
#(parameter param134 = (((((~^(8'hbb)) ~^ (~|(8'h9f))) ? (~&((8'ha5) << (7'h41))) : (^{(8'hbc), (8'had)})) ? ((((8'h9d) ? (8'hbe) : (8'h9e)) <= (~^(8'h9f))) ? (8'ha5) : ((~&(8'hab)) ? ((8'ha5) | (8'ha9)) : ((8'h9d) ? (8'hb8) : (8'hb9)))) : (&(8'ha4))) << (((((8'ha7) ? (7'h43) : (8'hbe)) ? (^(8'hb8)) : (!(8'ha6))) > {((8'h9e) ? (8'hbd) : (8'hbe)), (|(8'hb8))}) ? ((((8'ha8) ? (8'h9c) : (8'hb0)) ? ((8'ha1) ? (8'hae) : (7'h43)) : ((8'hb1) < (7'h43))) <= {(~|(8'hba)), (~^(8'hb9))}) : ((((8'h9e) ? (8'haa) : (8'ha5)) ? ((7'h41) & (8'ha3)) : (~|(8'hbf))) >> (((8'h9c) & (8'hb3)) >>> {(8'haa), (8'hb2)})))))
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h20e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire86;
  input wire [(4'hf):(1'h0)] wire85;
  input wire [(5'h14):(1'h0)] wire84;
  input wire signed [(4'he):(1'h0)] wire83;
  input wire signed [(4'hb):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire131;
  wire signed [(3'h4):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire129;
  wire signed [(2'h2):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire115;
  wire [(4'he):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire87;
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  assign y = {wire133,
                 wire131,
                 wire130,
                 wire129,
                 wire116,
                 wire115,
                 wire112,
                 wire108,
                 wire87,
                 reg132,
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
                 reg114,
                 reg113,
                 reg111,
                 reg110,
                 reg109,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
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
                 (1'h0)};
  assign wire87 = wire82;
  always
    @(posedge clk) begin
      if (wire87[(3'h7):(1'h1)])
        begin
          reg88 <= $signed($unsigned(wire85));
        end
      else
        begin
          if (($signed(wire85[(4'hc):(3'h7)]) ?
              $unsigned(reg88) : (~|wire87[(3'h7):(2'h2)])))
            begin
              reg88 <= (+(!$signed(wire86)));
            end
          else
            begin
              reg88 <= wire84[(4'ha):(4'ha)];
            end
          reg89 <= $signed($signed(wire82));
          if (wire83)
            begin
              reg90 <= $signed(wire84[(5'h12):(5'h12)]);
              reg91 <= (+reg90[(1'h0):(1'h0)]);
            end
          else
            begin
              reg90 <= wire86[(5'h13):(4'h8)];
              reg91 <= ($signed($signed((!((8'ha7) ~^ wire83)))) << $signed(wire87));
            end
          reg92 <= reg91[(3'h7):(3'h4)];
        end
      reg93 <= (|($unsigned(wire83) == ($signed((^(8'hb6))) < ({wire87} + reg90))));
      if ($unsigned(($signed(wire86[(5'h12):(4'he)]) & reg88)))
        begin
          reg94 <= ({(+(^~(|wire84)))} ?
              $signed($signed(reg89)) : $unsigned(reg89));
          reg95 <= ({(reg94 ? reg90 : reg91[(2'h2):(2'h2)]),
              wire86[(5'h10):(4'ha)]} - (-wire82[(4'h9):(1'h0)]));
          if (({reg89, reg93} ?
              reg89[(3'h6):(3'h6)] : $signed(($unsigned(reg89) <<< reg91))))
            begin
              reg96 <= (~(wire82[(4'ha):(1'h0)] | (7'h40)));
              reg97 <= (({$unsigned(reg96[(4'hf):(3'h6)])} || (reg94 ?
                      ((reg95 - reg91) != (^~wire84)) : wire82)) ?
                  ($unsigned(reg94) ?
                      ($unsigned(wire87) ?
                          {(wire84 && (8'h9d))} : $unsigned(((8'hb1) != reg95))) : reg94) : wire86[(3'h5):(2'h2)]);
              reg98 <= (~|wire85);
              reg99 <= $signed(reg95[(3'h4):(2'h3)]);
              reg100 <= wire82;
            end
          else
            begin
              reg96 <= {{{(wire87[(4'he):(4'hc)] <<< {reg91, reg93}),
                          ((reg94 - (8'hbc)) ?
                              (|(7'h41)) : $unsigned((8'hb8)))},
                      wire84[(4'hf):(2'h3)]},
                  reg95};
              reg97 <= $signed({(reg96[(2'h2):(1'h1)] || ({reg91} <= (reg91 ?
                      wire84 : wire83))),
                  reg93});
              reg98 <= (((~reg100) || (&($signed(reg92) ?
                      (reg97 ? wire82 : reg93) : reg90[(1'h0):(1'h0)]))) ?
                  reg92 : (+$unsigned(reg94[(4'he):(4'hb)])));
              reg99 <= $unsigned({(|(8'hbc)), reg98});
            end
          reg101 <= $unsigned((+(reg91[(2'h3):(2'h2)] ?
              $signed((wire86 && reg95)) : (~(reg100 ? reg96 : wire82)))));
          reg102 <= reg92[(4'hd):(4'h9)];
        end
      else
        begin
          if (((reg91 | $unsigned($unsigned((reg88 ? wire86 : reg88)))) ?
              ($signed((wire85 ? (reg95 * wire87) : ((8'ha6) <= (8'hae)))) ?
                  (reg100 ?
                      ((^~reg88) ?
                          (-(8'hb6)) : $signed(reg92)) : ((reg93 == reg91) * (reg98 ?
                          (8'hb3) : wire84))) : (reg92 >>> (^~reg97[(3'h5):(3'h4)]))) : reg102))
            begin
              reg94 <= reg96;
              reg95 <= (($signed(reg92[(3'h5):(1'h0)]) ?
                  ($signed(reg97[(2'h3):(1'h0)]) >>> $unsigned(reg96)) : wire86) || reg98);
              reg96 <= reg100[(3'h7):(3'h4)];
              reg97 <= wire85;
            end
          else
            begin
              reg94 <= reg89;
              reg95 <= (^reg100[(2'h2):(1'h0)]);
              reg96 <= ((~&wire82) ?
                  reg91[(3'h4):(1'h1)] : $signed($signed($signed({reg101}))));
              reg97 <= (8'hb2);
            end
          if ($unsigned((+($unsigned((wire83 ?
              wire85 : (8'h9e))) != {(7'h41)}))))
            begin
              reg98 <= (^reg98);
              reg99 <= $signed((reg94 - ((((8'h9f) ?
                      reg93 : reg97) ^ (^~wire87)) ?
                  (8'haa) : (+(~|reg93)))));
              reg100 <= (8'h9d);
              reg101 <= ($signed(reg99[(4'h9):(4'h9)]) >> {wire83,
                  $unsigned(($signed(reg89) >> reg100[(1'h0):(1'h0)]))});
              reg102 <= (8'h9c);
            end
          else
            begin
              reg98 <= reg93;
              reg99 <= $signed($signed(reg92[(4'h8):(2'h2)]));
            end
          if (($unsigned(reg93) ?
              $signed((reg101 >>> ($signed((8'h9c)) ?
                  (|reg102) : $unsigned((8'hb0))))) : {(reg94 ?
                      reg102[(3'h7):(1'h0)] : reg90[(1'h1):(1'h0)]),
                  $unsigned($unsigned((reg101 | reg89)))}))
            begin
              reg103 <= $signed(((+$unsigned($signed(wire83))) ?
                  (~$signed((reg90 & reg92))) : ($signed($signed((8'h9f))) ?
                      reg95 : {$signed(reg89), (reg90 ? reg100 : reg94)})));
              reg104 <= ($signed(((~(reg94 ^~ reg92)) ?
                  reg99 : ((reg88 ?
                      reg102 : (7'h40)) && reg90))) > ($signed($signed($signed(wire84))) < {(reg91 < {reg90,
                      reg88}),
                  reg91}));
              reg105 <= (!$signed(($signed((-wire84)) >= ({wire84} ?
                  wire86[(5'h13):(4'ha)] : reg96))));
              reg106 <= (reg92[(1'h0):(1'h0)] || reg94[(1'h0):(1'h0)]);
              reg107 <= $signed($unsigned($signed({wire83,
                  (wire87 != reg97)})));
            end
          else
            begin
              reg103 <= reg106;
              reg104 <= wire86;
              reg105 <= (!(|{(reg103 & (+reg88)), reg105[(2'h3):(1'h1)]}));
            end
        end
    end
  assign wire108 = reg100;
  always
    @(posedge clk) begin
      reg109 <= wire83;
      reg110 <= reg103;
      reg111 <= $unsigned((reg99 ?
          wire84[(5'h12):(4'h9)] : $signed(((reg101 >> reg101) - (reg107 > reg101)))));
    end
  assign wire112 = $unsigned($signed($unsigned($signed((reg106 ?
                       reg95 : wire84)))));
  always
    @(posedge clk) begin
      reg113 <= $signed(reg97[(3'h6):(3'h4)]);
      reg114 <= (-((wire87[(1'h0):(1'h0)] ?
              (^reg90[(3'h5):(1'h1)]) : $signed((reg101 || reg97))) ?
          reg98[(4'h9):(3'h7)] : ($unsigned($unsigned(reg93)) ?
              ({reg110} >> reg107) : {(^~wire86), reg106[(3'h7):(1'h1)]})));
    end
  assign wire115 = ((($unsigned($signed((8'ha0))) ^~ {$unsigned(reg102),
                           (reg111 << wire82)}) ?
                       reg101 : (reg101 && (~&$signed(wire112)))) == wire87[(3'h4):(1'h1)]);
  assign wire116 = reg99[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      if ($unsigned(reg103))
        begin
          reg117 <= ((reg94 | ($unsigned((^~(7'h42))) ?
                  wire87[(3'h4):(3'h4)] : $unsigned(reg90))) ?
              {((+wire86[(1'h0):(1'h0)]) ?
                      ((^~reg113) ?
                          $signed(wire86) : (reg88 ?
                              wire86 : wire86)) : reg95[(1'h1):(1'h1)])} : ($unsigned(reg98) ?
                  (((reg98 ? (8'ha2) : (8'hb3)) ?
                          {(8'hba)} : (wire87 < reg107)) ?
                      {(7'h44), reg100} : ($signed(reg101) ?
                          $unsigned(wire84) : (8'ha3))) : $signed((~^$unsigned(wire85)))));
          reg118 <= (+(^~(^~$signed(reg103))));
        end
      else
        begin
          reg117 <= $unsigned(reg101);
          reg118 <= (-wire86[(1'h1):(1'h0)]);
          if (($signed({(~&(|reg107)), (|reg107)}) ?
              {$unsigned(reg95[(4'he):(4'ha)]),
                  $signed((~^reg111[(1'h0):(1'h0)]))} : ((8'hbc) ?
                  (($signed(reg110) <<< reg102[(5'h10):(1'h0)]) ?
                      reg111[(2'h2):(1'h1)] : (+(reg104 != reg114))) : (|$signed(reg96[(5'h12):(3'h6)])))))
            begin
              reg119 <= (((~$unsigned(reg96[(5'h11):(5'h11)])) + $signed($unsigned((^reg110)))) ?
                  $signed(wire112[(4'h9):(3'h7)]) : (~($unsigned($signed(reg98)) || reg105)));
              reg120 <= (~&((reg119 ?
                      (^~((8'hb1) ? wire87 : reg101)) : $unsigned((reg97 ?
                          wire85 : reg99))) ?
                  wire112 : reg117[(5'h10):(3'h6)]));
              reg121 <= wire86[(4'ha):(2'h3)];
              reg122 <= reg102;
              reg123 <= ((8'hb8) >= (8'hb5));
            end
          else
            begin
              reg119 <= wire86[(4'hf):(4'ha)];
              reg120 <= ((reg120 ?
                      $unsigned(reg97[(2'h2):(2'h2)]) : {(reg98 <= (reg93 == reg114)),
                          reg120}) ?
                  $unsigned(reg105) : (8'had));
              reg121 <= reg105;
              reg122 <= (((~&reg119) == (((wire116 ? reg88 : reg119) ?
                  wire116[(2'h2):(1'h0)] : $signed(reg102)) >= ($signed(reg114) ?
                  reg89[(1'h0):(1'h0)] : reg99[(4'h9):(3'h7)]))) != reg111);
              reg123 <= $unsigned(wire116);
            end
          reg124 <= (~(^reg102));
        end
      reg125 <= reg123;
      reg126 <= (~&$signed($signed(($unsigned(reg106) ?
          $signed((8'hb8)) : (wire83 > reg120)))));
      reg127 <= reg88[(4'hb):(3'h4)];
      reg128 <= (~&(reg125 ^ $unsigned((-((8'haa) ? wire82 : reg90)))));
    end
  assign wire129 = ({reg122[(1'h1):(1'h0)]} ?
                       (|$signed((reg100[(1'h1):(1'h0)] ^~ reg125))) : reg94);
  assign wire130 = ((~|reg96[(5'h12):(4'hb)]) ?
                       $signed((-$signed(reg105[(2'h2):(1'h1)]))) : (+$signed(wire86)));
  assign wire131 = (($unsigned({{reg122, (8'hb9)}, (~|wire85)}) ?
                       $signed((^~$unsigned(reg103))) : $signed(reg95[(1'h1):(1'h1)])) ~^ ((~&(8'hbc)) <= $unsigned((wire87 - $signed(reg96)))));
  always
    @(posedge clk) begin
      reg132 <= reg89[(2'h3):(2'h3)];
    end
  assign wire133 = (~&((~reg90) >= $signed(((reg91 & reg109) ?
                       $signed(reg93) : $signed(wire115)))));
endmodule

module module34
#(parameter param77 = ((8'hbd) ? ((((~^(8'hab)) ? ((8'h9d) > (8'h9e)) : ((8'hbe) ? (8'ha9) : (7'h43))) & (&((8'ha2) <= (8'had)))) ? ((((7'h44) ? (8'ha4) : (8'hb5)) != (8'hbc)) && {(~(8'had))}) : ((!{(7'h41)}) * (8'h9f))) : (+({(8'hb0)} - (~(|(8'hba)))))), 
parameter param78 = (^~param77))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire39;
  input wire [(5'h10):(1'h0)] wire38;
  input wire [(2'h3):(1'h0)] wire37;
  input wire signed [(3'h7):(1'h0)] wire36;
  input wire signed [(5'h14):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire41;
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire70,
                 wire69,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire41,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
                 reg44,
                 reg43,
                 reg42,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= wire35;
    end
  assign wire41 = (-wire39);
  always
    @(posedge clk) begin
      reg42 <= (($unsigned($unsigned((|wire39))) ?
          $signed(wire39[(3'h4):(1'h1)]) : $signed((+$unsigned(wire36)))) | (-$unsigned(wire38[(2'h2):(2'h2)])));
      reg43 <= ((8'h9f) ?
          (((wire37 * (wire35 ? wire38 : wire41)) ?
              $unsigned(wire41[(3'h7):(2'h3)]) : $signed((|wire37))) >>> $signed(((+reg40) ?
              {wire39} : wire35[(4'h8):(2'h2)]))) : {($signed($unsigned(wire38)) ?
                  (8'hb9) : wire39),
              (+(^~$signed(wire38)))});
      reg44 <= (~&reg42);
    end
  assign wire45 = $unsigned((((~((7'h42) ?
                          wire41 : reg43)) + ((+wire37) + $signed(wire37))) ?
                      (-((~(8'ha8)) ? ((8'hb3) > reg44) : wire38)) : {wire39,
                          (((8'ha5) & (7'h40)) ?
                              $signed(reg43) : $signed(wire38))}));
  assign wire46 = $signed($signed($signed(((reg42 >>> wire35) ?
                      $signed(wire38) : $signed(reg42)))));
  assign wire47 = wire36;
  assign wire48 = (!wire46);
  assign wire49 = $signed($signed(($signed((8'had)) & wire45[(4'hb):(3'h6)])));
  always
    @(posedge clk) begin
      reg50 <= (wire41[(5'h13):(4'ha)] ~^ wire37[(1'h1):(1'h1)]);
      if ($signed(wire39[(2'h2):(1'h0)]))
        begin
          reg51 <= wire37[(1'h0):(1'h0)];
          reg52 <= $unsigned(wire41[(3'h6):(2'h2)]);
          reg53 <= $signed((^~(wire46 ?
              (!(~|wire36)) : $signed(reg51[(2'h3):(1'h0)]))));
        end
      else
        begin
          reg51 <= $unsigned(({reg40, wire48[(3'h4):(3'h4)]} >> reg51));
          reg52 <= $unsigned(reg52[(3'h4):(2'h3)]);
          if ($signed(wire36))
            begin
              reg53 <= ({(($signed(wire37) ?
                          $signed(wire36) : $unsigned(wire41)) ?
                      $signed({(8'hba)}) : (-(reg53 ?
                          wire48 : reg42)))} || (($signed(wire35[(5'h13):(5'h10)]) | ($signed(reg52) != reg50)) != wire46[(4'h8):(3'h7)]));
            end
          else
            begin
              reg53 <= wire45[(5'h11):(3'h5)];
              reg54 <= (8'hb9);
              reg55 <= $unsigned(((reg52[(3'h4):(1'h0)] ?
                      (!$signed(wire36)) : (-$signed(wire45))) ?
                  $signed((wire37 + wire37[(2'h2):(2'h2)])) : $signed(({reg42,
                          reg51} ?
                      (wire45 ? wire39 : (8'h9f)) : reg51))));
              reg56 <= {wire39, (+reg53)};
              reg57 <= wire37;
            end
          reg58 <= $signed((($signed($signed(reg54)) == (8'hb1)) ?
              reg42[(1'h1):(1'h1)] : $unsigned(wire49[(4'hb):(3'h5)])));
        end
      if (((~&(((~wire35) ? reg52[(3'h6):(3'h4)] : wire36) ?
              reg51 : ({wire36} << (reg57 == (8'hb9))))) ?
          wire37[(1'h0):(1'h0)] : (^~$unsigned({(~(7'h42)), $signed(wire48)}))))
        begin
          reg59 <= reg43[(2'h2):(1'h1)];
          reg60 <= (((!wire47[(1'h0):(1'h0)]) ?
              reg52[(1'h1):(1'h1)] : ($unsigned((wire46 || (8'haa))) ?
                  ($signed(reg57) ?
                      reg55[(3'h6):(2'h2)] : $unsigned(reg55)) : reg58[(4'hf):(1'h0)])) >>> $unsigned({$unsigned(wire36[(2'h3):(1'h0)]),
              (~^reg40)}));
          reg61 <= wire49;
          reg62 <= wire47;
        end
      else
        begin
          reg59 <= $unsigned(reg53);
          reg60 <= {reg62[(1'h1):(1'h0)], (^~reg50)};
        end
    end
  always
    @(posedge clk) begin
      reg63 <= (~(&(($unsigned((8'ha5)) ?
          (wire45 ^ wire45) : (reg40 ?
              (8'hb5) : wire48)) == {$unsigned((8'hb9)), (&reg58)})));
      reg64 <= {(reg56[(2'h3):(1'h1)] ? (8'hba) : reg59[(4'h8):(3'h4)])};
      if ($unsigned({($signed((8'hba)) ?
              reg43 : ($signed(wire48) ? (|(8'ha5)) : ((8'haa) ^ wire38)))}))
        begin
          reg65 <= wire39;
        end
      else
        begin
          reg65 <= reg44;
          reg66 <= ({reg40, reg50} | ($signed(($signed(reg50) ?
                  $signed(wire37) : ((8'hb2) | reg64))) ?
              $signed($unsigned(wire47[(3'h6):(1'h0)])) : ($unsigned($signed(reg60)) ?
                  (-(reg60 ? wire38 : reg62)) : $unsigned($unsigned(reg62)))));
          reg67 <= (($unsigned((8'ha1)) ?
                  $signed((-reg59[(1'h0):(1'h0)])) : $unsigned((((8'hb8) ?
                          wire47 : reg58) ?
                      {reg50, wire49} : (reg53 ? (8'ha1) : reg60)))) ?
              $unsigned((((reg66 ? reg58 : (8'ha8)) + (^reg65)) ?
                  {$signed(wire35)} : $signed((reg64 <= reg66)))) : reg50);
          reg68 <= (~^{reg59});
        end
    end
  assign wire69 = (~&reg43[(4'hf):(4'ha)]);
  assign wire70 = {{({$unsigned(reg56)} ?
                              ($signed(wire35) ?
                                  (~reg56) : (reg58 ? reg43 : reg57)) : reg55)},
                      $signed((^~(reg65 ? (!wire49) : {reg68})))};
  always
    @(posedge clk) begin
      reg71 <= (7'h41);
      reg72 <= (8'hb3);
      reg73 <= reg72;
    end
  always
    @(posedge clk) begin
      reg74 <= wire36[(1'h0):(1'h0)];
    end
  assign wire75 = ((reg63 << (reg59 ?
                      ({wire36} ?
                          $unsigned(reg66) : wire41[(4'hd):(4'h9)]) : (reg54[(4'hb):(4'h8)] ?
                          (|wire49) : (~&reg66)))) & {{(~^reg43[(3'h6):(1'h1)]),
                          {$unsigned(wire49), $unsigned((8'h9f))}}});
  assign wire76 = (reg44 <<< $signed($signed(reg62)));
endmodule
