module top
#(parameter param193 = ({((^{(7'h44), (8'hb6)}) ? (!((8'ha5) ? (8'h9d) : (8'hb1))) : (-(~^(8'ha8)))), (8'hae)} - (!((8'ha5) >>> (((8'hb7) ? (8'hab) : (8'had)) ? (8'ha2) : ((8'ha9) * (8'hb4)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire192;
  wire [(5'h13):(1'h0)] wire191;
  wire [(4'ha):(1'h0)] wire190;
  wire signed [(5'h14):(1'h0)] wire189;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire173;
  wire [(5'h15):(1'h0)] wire175;
  wire signed [(5'h15):(1'h0)] wire176;
  wire signed [(4'h9):(1'h0)] wire178;
  wire signed [(4'hc):(1'h0)] wire179;
  wire [(4'hd):(1'h0)] wire180;
  wire [(5'h10):(1'h0)] wire187;
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg182 = (1'h0);
  reg [(5'h13):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg186 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire79,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire173,
                 wire175,
                 wire176,
                 wire178,
                 wire179,
                 wire180,
                 wire187,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 (1'h0)};
  module5 #() modinst80 (.wire8(wire2), .y(wire79), .wire9(wire0), .wire7(wire1), .clk(clk), .wire6(wire3));
  assign wire81 = (($signed($unsigned($signed(wire1))) >> wire2) ?
                      {wire0[(1'h0):(1'h0)],
                          {$signed((+wire0)),
                              $unsigned($signed(wire3))}} : (8'had));
  assign wire82 = $unsigned(((((~&wire79) + wire1) != {$unsigned(wire1)}) == (~^(wire0[(2'h3):(2'h2)] | wire0[(2'h3):(1'h1)]))));
  assign wire83 = (($unsigned(wire79) ^~ (~&(8'had))) != (|$unsigned({(wire81 ?
                          wire81 : wire4),
                      wire2})));
  assign wire84 = wire4;
  always
    @(posedge clk) begin
      reg85 <= wire81[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg86 <= $signed($signed({(!(wire2 ? wire3 : wire0))}));
      reg87 <= (^((&$unsigned({wire0, reg86})) ?
          wire81[(2'h2):(1'h0)] : (((reg86 | wire84) ?
              (~^wire81) : ((8'ha9) ? wire2 : reg85)) <= wire2)));
      reg88 <= (~|(8'h9d));
      if ($unsigned(wire4))
        begin
          if (reg86)
            begin
              reg89 <= (^$signed(reg87));
            end
          else
            begin
              reg89 <= wire82[(2'h3):(1'h0)];
            end
        end
      else
        begin
          reg89 <= $signed((wire84 ?
              $signed(((+reg85) ?
                  (wire0 >= wire79) : $unsigned(wire84))) : (((wire0 ?
                      wire79 : reg85) ?
                  $unsigned(wire81) : reg87) >> $signed($signed(reg88)))));
          reg90 <= (wire2 ?
              (~|$signed((wire79[(1'h0):(1'h0)] ?
                  (wire83 ~^ wire82) : (8'hb0)))) : ($unsigned(wire84[(3'h6):(2'h2)]) ?
                  wire81 : (-reg85)));
        end
      reg91 <= ((~&(((^(8'ha6)) * reg88[(2'h3):(1'h0)]) ?
          (reg87 ?
              $unsigned(wire81) : reg85[(1'h1):(1'h0)]) : wire1[(3'h4):(2'h2)])) <= reg88[(3'h4):(1'h1)]);
    end
  module92 #() modinst174 (wire173, clk, reg85, wire79, wire82, wire84, wire3);
  assign wire175 = reg89;
  module92 #() modinst177 (.wire93(wire79), .wire94(wire173), .wire96(wire83), .y(wire176), .clk(clk), .wire97(reg85), .wire95(wire82));
  assign wire178 = wire176[(1'h0):(1'h0)];
  assign wire179 = (~^(((~&(wire178 ? (8'ha8) : wire4)) ?
                           (wire2 ?
                               reg87[(4'hc):(3'h6)] : (wire1 || reg88)) : (8'h9c)) ?
                       {(~(&wire176))} : $signed(reg85)));
  module99 #() modinst181 (wire180, clk, wire2, wire81, wire1, wire176);
  always
    @(posedge clk) begin
      reg182 <= (~|(-(~&$signed(reg88))));
      reg183 <= $unsigned($unsigned((wire84 ?
          wire84[(4'h9):(2'h2)] : $unsigned(wire82))));
      reg184 <= reg91[(2'h3):(1'h1)];
      reg185 <= ($unsigned((^($unsigned(wire84) <<< $signed(wire180)))) >> wire178[(2'h2):(2'h2)]);
      reg186 <= wire3;
    end
  module116 #() modinst188 (.y(wire187), .wire117(wire2), .clk(clk), .wire120(wire83), .wire118(reg85), .wire119(wire175));
  assign wire189 = reg89;
  assign wire190 = ((!(reg91 & $signed($signed(wire2)))) ^~ $signed(wire179[(4'h9):(4'h9)]));
  assign wire191 = (-((!$signed($signed(reg85))) ?
                       wire2[(4'h8):(3'h7)] : reg185));
  assign wire192 = ((8'haf) > $unsigned($signed((^~(reg183 ?
                       wire175 : wire191)))));
endmodule

module module92  (y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire97;
  input wire signed [(5'h15):(1'h0)] wire96;
  input wire signed [(5'h11):(1'h0)] wire95;
  input wire [(5'h15):(1'h0)] wire94;
  input wire [(5'h12):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire172;
  wire [(3'h4):(1'h0)] wire171;
  wire signed [(3'h5):(1'h0)] wire170;
  wire signed [(4'hd):(1'h0)] wire169;
  wire signed [(4'hd):(1'h0)] wire168;
  wire signed [(4'hd):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire158;
  wire signed [(4'hd):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire156;
  wire signed [(4'h9):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire signed [(4'ha):(1'h0)] wire152;
  wire signed [(3'h4):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire114;
  wire [(4'ha):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire98;
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg161 = (1'h0);
  reg [(2'h2):(1'h0)] reg160 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire152,
                 wire115,
                 wire114,
                 wire112,
                 wire98,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 (1'h0)};
  assign wire98 = {(~&($signed(wire94) && (wire97 - (wire94 < wire94))))};
  module99 #() modinst113 (.clk(clk), .wire102(wire95), .wire103(wire93), .y(wire112), .wire100(wire94), .wire101(wire96));
  assign wire114 = (~|$unsigned({wire112[(2'h2):(1'h0)], (|{wire96})}));
  assign wire115 = {wire95[(1'h0):(1'h0)]};
  module116 #() modinst153 (wire152, clk, wire96, wire95, wire112, wire114);
  assign wire154 = $unsigned(($unsigned(((wire97 - wire112) ?
                           (!(8'hbc)) : wire98)) ?
                       (8'hb9) : wire98[(2'h2):(1'h0)]));
  assign wire155 = ($unsigned(($signed($signed(wire152)) ?
                           {wire152[(4'ha):(3'h4)]} : wire95[(1'h1):(1'h1)])) ?
                       (wire93 ?
                           ($signed((+(7'h42))) < {$signed(wire97),
                               $unsigned(wire97)}) : {wire112,
                               ($signed(wire93) && $unsigned((7'h41)))}) : wire98);
  assign wire156 = (^~(^(~|wire154)));
  assign wire157 = (wire156[(4'he):(3'h5)] ?
                       $unsigned((!{$unsigned((8'hba)),
                           wire115})) : wire97[(2'h3):(2'h2)]);
  assign wire158 = (~|(-$signed($signed($signed(wire95)))));
  assign wire159 = wire95;
  always
    @(posedge clk) begin
      reg160 <= wire115[(2'h2):(1'h1)];
      reg161 <= wire98;
      if ($signed({wire112, {(~&$unsigned(wire158))}}))
        begin
          reg162 <= $signed(($signed((^$unsigned(wire157))) >> (+($signed((8'h9f)) ?
              (wire158 >>> (8'h9f)) : $signed(wire155)))));
          reg163 <= wire156;
          if ((wire95 ?
              $signed(wire156[(3'h5):(2'h3)]) : (($unsigned({wire159}) >> $signed(wire152)) <<< (wire97[(1'h1):(1'h0)] ?
                  {(7'h43)} : $unsigned(reg161[(4'hc):(1'h1)])))))
            begin
              reg164 <= $unsigned(wire98[(5'h14):(1'h1)]);
            end
          else
            begin
              reg164 <= wire115[(2'h2):(1'h1)];
              reg165 <= wire155;
            end
          reg166 <= (~|$signed(((wire158 ?
                  (reg161 >> wire94) : $unsigned(reg160)) ?
              $unsigned(((8'ha8) ~^ (8'hb4))) : (&(wire112 ?
                  reg161 : wire114)))));
          reg167 <= ($unsigned($unsigned((&$signed(wire115)))) >>> wire152);
        end
      else
        begin
          reg162 <= (((wire157[(3'h6):(2'h2)] ?
              ($unsigned((8'h9c)) ?
                  $signed(wire94) : (8'hb3)) : ((~|reg164) ^ $signed(wire114))) >> $signed(reg165)) >> {($unsigned($signed(wire158)) >> ($unsigned(wire157) ?
                  wire152 : wire157))});
          reg163 <= {(!$signed((reg167[(5'h15):(4'hb)] ^ ((8'hbd) >> wire156))))};
        end
    end
  assign wire168 = ((^~$signed({$unsigned(reg164),
                       {wire156, wire98}})) << $unsigned(reg164));
  assign wire169 = {(~^wire155), $signed($unsigned((~|reg161)))};
  assign wire170 = wire94;
  assign wire171 = $signed((&wire112[(1'h0):(1'h0)]));
  assign wire172 = ($signed(((wire96 < $unsigned(wire170)) ?
                           {$unsigned(reg167)} : $signed({wire96, wire152}))) ?
                       $signed((~^(+(wire159 << wire158)))) : $signed($signed(wire94)));
endmodule

module module5
#(parameter param78 = (((8'hbd) ? ((-((8'hae) ? (8'hb5) : (8'hbf))) <<< (((8'hb6) ~^ (8'hb2)) <<< ((8'ha2) ? (8'ha1) : (8'haa)))) : ((((8'haf) ? (7'h40) : (8'hb1)) ? ((8'hbe) >> (8'h9c)) : ((8'ha2) >= (8'hb5))) ? {(~(8'ha7)), (^~(8'hab))} : (((8'haa) ? (8'haf) : (7'h44)) ? (|(8'ha7)) : ((8'ha8) + (8'hbd))))) <= ((({(8'ha1), (8'had)} ? (8'hbe) : ((8'hb8) <<< (8'h9d))) <= (~((8'hae) ? (8'hac) : (8'h9d)))) ? ((8'hb1) - ({(8'hb4)} && (~(8'had)))) : (8'haf))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  assign y = {wire76, wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = (($signed(((^~wire9) ^ (~&(8'had)))) != wire9[(4'ha):(3'h5)]) > {($unsigned($unsigned(wire8)) ?
                          (!(~wire7)) : (^~(wire8 ? wire8 : wire9)))});
  assign wire11 = {wire10[(2'h2):(1'h1)]};
  assign wire12 = ($unsigned(((~&(wire11 ? (8'hbc) : (8'h9c))) ?
                          (^$unsigned(wire11)) : $signed(wire11[(2'h2):(1'h0)]))) ?
                      {(~wire6[(2'h3):(2'h3)]),
                          wire7[(4'h8):(1'h1)]} : wire9[(2'h3):(1'h0)]);
  assign wire13 = $unsigned(($signed(wire11) + wire11[(3'h7):(2'h2)]));
  assign wire14 = wire7;
  module15 #() modinst77 (wire76, clk, wire10, wire13, wire6, wire11);
endmodule

module module15
#(parameter param74 = ((((!((7'h44) || (8'hb5))) <= ((!(8'hbd)) < (!(8'ha6)))) <<< (^{((8'hbe) ? (8'hbe) : (8'had)), ((8'hb2) ? (8'ha8) : (8'ha4))})) ? ((~^(~|((8'haf) ? (8'ha4) : (8'haa)))) ? ((|((8'h9c) ? (8'h9d) : (7'h40))) | (~|((7'h40) & (8'ha7)))) : {((|(8'ha8)) >> ((8'haf) && (8'hbe)))}) : (|(((~^(8'h9e)) ? ((8'ha9) ^~ (8'hb6)) : (^~(8'hb6))) | (|((8'ha1) ? (8'hb4) : (8'hb0)))))), 
parameter param75 = ((|param74) ? param74 : ((8'h9c) ? ((8'hae) ? (|(param74 ? param74 : param74)) : (8'hb2)) : (((param74 >> param74) ? ((8'haf) <<< param74) : ((7'h41) > param74)) ? (8'h9d) : param74))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire55,
                 wire54,
                 wire53,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire21,
                 wire20,
                 reg73,
                 reg72,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire20 = (wire19[(1'h1):(1'h1)] ?
                      (({(wire19 >>> wire17), ((8'hbc) && (8'haf))} ?
                          ((wire18 ? wire18 : wire18) >>> ((8'hbb) ?
                              wire18 : wire16)) : $unsigned(wire17)) < $unsigned($unsigned((wire19 ?
                          (8'hb6) : wire19)))) : ((|({(8'ha9)} ?
                          {wire19,
                              wire16} : wire16[(1'h1):(1'h0)])) << (-$signed(wire18))));
  assign wire21 = wire17[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      if (($signed($signed((wire17[(3'h4):(1'h0)] << (-wire16)))) <<< ($unsigned($signed((wire20 >> wire16))) ?
          (wire19[(2'h3):(2'h3)] ?
              wire19[(2'h2):(1'h1)] : (~|$unsigned(wire17))) : wire18[(4'h9):(3'h4)])))
        begin
          reg22 <= ($unsigned($unsigned($signed($unsigned((8'haf))))) ?
              (wire21 ?
                  $signed(wire19) : (!$signed(wire20))) : wire18[(3'h4):(1'h1)]);
          reg23 <= {((^(-(~&wire17))) ?
                  ((wire21[(3'h5):(3'h5)] <<< {wire19}) << (wire18[(3'h6):(3'h5)] ^~ (wire18 | wire20))) : ((wire20 ?
                          (wire17 ~^ wire21) : (reg22 ? wire21 : wire19)) ?
                      wire20[(2'h2):(1'h1)] : ({wire20, reg22} ?
                          (wire18 + wire16) : (wire21 >> wire17))))};
          reg24 <= wire18[(1'h1):(1'h0)];
          reg25 <= (wire18 ?
              (($signed(wire19[(2'h2):(1'h0)]) <= wire20[(4'ha):(2'h2)]) >>> wire18[(3'h4):(2'h2)]) : (&((|(wire19 ?
                      (8'hb3) : wire19)) ?
                  wire18 : (-wire17[(2'h2):(2'h2)]))));
          reg26 <= {wire19, $signed(reg24[(1'h1):(1'h1)])};
        end
      else
        begin
          reg22 <= $signed((-reg25));
          if ({(~$unsigned($signed($unsigned(wire18)))), reg25[(3'h6):(3'h6)]})
            begin
              reg23 <= (((^(reg26[(1'h1):(1'h1)] == reg22)) ?
                  (((wire20 ? (7'h44) : reg24) ^~ $unsigned(reg24)) ?
                      {(~^(8'ha3))} : ($signed((8'hb1)) & (^~wire20))) : wire16) | {(!($signed(wire17) > (^reg25))),
                  ($signed(wire17[(4'h8):(1'h0)]) ?
                      wire20 : $signed((wire16 + wire18)))});
              reg24 <= wire19[(1'h1):(1'h1)];
            end
          else
            begin
              reg23 <= {($unsigned($signed((+(8'ha9)))) ?
                      $signed((~^reg23)) : (8'hb3))};
              reg24 <= wire20;
            end
          reg25 <= wire17;
          reg26 <= $signed(wire21);
          reg27 <= (reg24[(3'h4):(2'h3)] ? reg23[(2'h2):(1'h1)] : wire21);
        end
    end
  assign wire28 = (wire17[(3'h4):(1'h0)] != $unsigned(reg23));
  assign wire29 = (~^reg23[(1'h1):(1'h0)]);
  assign wire30 = wire19[(1'h1):(1'h1)];
  assign wire31 = ((8'ha9) ? reg27[(4'h8):(2'h2)] : reg22[(3'h6):(2'h2)]);
  assign wire32 = (((8'haa) ? {wire20} : $signed(reg26[(3'h4):(3'h4)])) ?
                      (!((wire17 || (~wire16)) - wire16)) : $unsigned((8'ha2)));
  always
    @(posedge clk) begin
      reg33 <= ($unsigned($signed($signed($unsigned(wire17)))) << ($signed(reg23[(3'h5):(2'h3)]) ?
          wire16[(4'hc):(4'ha)] : wire32));
      if (wire16[(5'h10):(3'h5)])
        begin
          reg34 <= wire30[(1'h0):(1'h0)];
          if ({((wire28 >= (reg34[(5'h13):(2'h3)] ?
                      (wire20 ? wire20 : reg23) : (wire16 || reg33))) ?
                  wire17 : (~($unsigned(reg22) ~^ wire30[(3'h4):(3'h4)])))})
            begin
              reg35 <= wire29[(1'h1):(1'h1)];
              reg36 <= $signed(((((8'hb7) >>> {reg24}) ?
                  {$unsigned(reg33)} : (8'h9d)) ~^ $signed(wire21)));
              reg37 <= {(reg23[(3'h7):(3'h4)] ?
                      (((~|(8'h9c)) ?
                          {wire18,
                              wire18} : (reg35 || reg25)) - reg35) : $unsigned({(reg35 ?
                              wire32 : reg35)})),
                  wire20[(4'hb):(4'h9)]};
              reg38 <= $signed(($signed(reg36) ?
                  (($signed(wire30) ? (wire32 << reg24) : reg34) ?
                      ({wire20} == {reg26,
                          reg37}) : wire20) : $unsigned(((~&reg24) * (wire19 ?
                      wire16 : reg25)))));
            end
          else
            begin
              reg35 <= $unsigned($signed(wire17));
            end
          reg39 <= $unsigned($signed($unsigned(((reg22 ? wire31 : wire17) ?
              (+wire17) : wire28))));
        end
      else
        begin
          reg34 <= $unsigned($signed(((8'hbc) | $unsigned((8'hb3)))));
          reg35 <= reg34;
        end
      if ($signed(($unsigned(wire32) <= wire19)))
        begin
          if (($unsigned((^~((reg38 ? reg35 : reg34) ?
                  wire16[(4'ha):(4'h8)] : (reg37 <<< (7'h44))))) ?
              wire29 : wire20[(4'hb):(2'h2)]))
            begin
              reg40 <= reg24[(2'h3):(2'h2)];
            end
          else
            begin
              reg40 <= reg39[(4'h9):(1'h1)];
              reg41 <= (~$unsigned(((8'hb8) ?
                  reg38[(3'h4):(2'h2)] : (-{wire19, wire20}))));
              reg42 <= (~|$unsigned((^~(wire20 < (7'h43)))));
              reg43 <= $signed({wire19});
              reg44 <= (wire17[(4'hb):(3'h6)] >>> ({{reg39, (~wire17)},
                      (~(~&reg22))} ?
                  ((-(~reg37)) < $signed({wire20,
                      wire17})) : $unsigned(((^wire20) ? (^~wire28) : reg42))));
            end
          reg45 <= wire20[(5'h10):(4'he)];
          reg46 <= wire19[(1'h1):(1'h0)];
          reg47 <= $unsigned(wire28);
          if (reg39[(1'h1):(1'h0)])
            begin
              reg48 <= $unsigned($unsigned(wire20));
              reg49 <= $signed(({reg34[(4'h8):(2'h3)],
                  $signed(wire20)} << $unsigned(((-wire31) >> reg24[(1'h0):(1'h0)]))));
              reg50 <= $signed(reg24);
              reg51 <= (^~reg23[(1'h0):(1'h0)]);
              reg52 <= $unsigned($signed(reg50));
            end
          else
            begin
              reg48 <= $signed(reg44[(3'h6):(2'h2)]);
              reg49 <= (|reg52);
              reg50 <= ($unsigned($unsigned((reg38[(4'ha):(4'h9)] != (reg40 + reg25)))) ?
                  reg33[(1'h1):(1'h1)] : ($unsigned({(~^wire17)}) != reg37));
              reg51 <= (&(((~(reg37 >>> reg35)) ?
                  wire30[(2'h3):(1'h0)] : reg52[(5'h15):(4'hf)]) || reg52[(5'h12):(1'h0)]));
            end
        end
      else
        begin
          reg40 <= {($signed(reg40[(1'h0):(1'h0)]) > (($signed(reg36) ?
                      wire32[(3'h4):(3'h4)] : (reg45 ? (8'hb0) : wire29)) ?
                  $signed((8'hbc)) : (-((8'ha5) != reg46))))};
          if (((((8'ha9) ? wire19 : $signed(reg34[(4'hd):(4'hc)])) ?
              reg34 : reg22[(4'h8):(2'h2)]) | ($unsigned($signed((&wire32))) ?
              $unsigned((wire29[(3'h4):(1'h0)] >> $unsigned(reg45))) : (~|{(reg49 ^ reg37),
                  (~reg42)}))))
            begin
              reg41 <= $unsigned(((!$unsigned(reg25)) ?
                  (($signed((8'hae)) ^~ (reg50 ?
                      reg27 : reg47)) ~^ (reg33 | {reg46,
                      reg25})) : $unsigned(reg44)));
              reg42 <= $unsigned((($signed((wire18 >> reg44)) <= $unsigned((reg41 ?
                      reg41 : reg38))) ?
                  reg42[(3'h4):(1'h0)] : (($signed((8'had)) <<< $unsigned((7'h44))) ?
                      (~|$signed((7'h44))) : (reg34[(2'h2):(1'h1)] ?
                          (~|reg24) : reg41[(3'h5):(1'h0)]))));
              reg43 <= ((|wire30) ?
                  $signed(($unsigned((~&wire16)) || ($unsigned(wire16) == (reg44 ?
                      reg26 : reg27)))) : (~((-(!reg36)) || (+wire20[(1'h1):(1'h0)]))));
              reg44 <= (reg44 <= (&{$signed(reg25[(2'h2):(2'h2)]), wire20}));
              reg45 <= $unsigned(((wire30 ?
                      (wire32[(3'h5):(1'h0)] * $signed((8'hb6))) : (~&(reg48 ?
                          (7'h43) : reg37))) ?
                  $unsigned(($signed(reg46) ?
                      (reg22 ^ (8'haf)) : $signed(reg42))) : {((wire20 ?
                              (8'hb9) : (8'ha0)) ?
                          (-reg52) : reg26[(1'h0):(1'h0)]),
                      ((reg38 ? reg22 : wire21) == (8'ha6))}));
            end
          else
            begin
              reg41 <= wire32[(4'hb):(2'h3)];
              reg42 <= reg26;
              reg43 <= wire30;
              reg44 <= wire21;
            end
          reg46 <= reg33;
        end
    end
  assign wire53 = (8'hbc);
  assign wire54 = ($unsigned(reg35) * {reg36[(3'h4):(2'h2)],
                      ($unsigned(reg37[(3'h5):(1'h0)]) ?
                          wire32 : ((~reg22) ?
                              (wire32 != wire32) : wire19[(1'h0):(1'h0)]))});
  assign wire55 = $unsigned($unsigned(wire17[(3'h4):(1'h1)]));
  always
    @(posedge clk) begin
      if (((($signed($signed(reg36)) ?
          $unsigned($signed((7'h40))) : reg42[(3'h4):(1'h0)]) == (((reg37 & (8'hb1)) ?
              $signed((8'h9c)) : reg45[(3'h5):(2'h3)]) ?
          $unsigned($unsigned(wire28)) : $signed((~reg52)))) + (8'hb3)))
        begin
          reg56 <= $signed(wire30);
          reg57 <= reg25;
          reg58 <= $unsigned(reg43);
          reg59 <= (~&(!($unsigned((reg33 ^~ reg41)) >= ($unsigned(reg51) * (8'hbc)))));
        end
      else
        begin
          reg56 <= reg45[(2'h3):(2'h2)];
        end
      reg60 <= {{$signed((~reg38[(3'h6):(1'h0)])), {wire31[(3'h6):(1'h1)]}}};
      reg61 <= ((($unsigned($unsigned(reg25)) ?
                  (!$unsigned(wire28)) : {reg50}) ?
              $unsigned(((wire19 >> reg41) <= $unsigned(wire20))) : reg49[(2'h2):(1'h1)]) ?
          wire54[(2'h2):(1'h0)] : reg50[(2'h3):(2'h3)]);
    end
  always
    @(posedge clk) begin
      if (reg60)
        begin
          reg62 <= $unsigned(reg50[(1'h0):(1'h0)]);
          reg63 <= (($signed((wire31[(1'h1):(1'h1)] >= $unsigned(wire29))) && reg39) ?
              {(&((reg60 < (7'h40)) ?
                      $signed(reg61) : wire18[(1'h1):(1'h0)]))} : reg62);
          if (reg62)
            begin
              reg64 <= $unsigned($signed($unsigned($unsigned($unsigned(reg40)))));
              reg65 <= (((($unsigned(wire31) ?
                      (reg60 ? reg34 : wire20) : $signed(reg40)) ?
                  $signed(wire30[(2'h2):(1'h0)]) : $unsigned((^reg24))) <<< (-$unsigned((reg39 < wire53)))) ^ {((-(8'ha9)) >>> $signed({(8'hbc)}))});
              reg66 <= reg64[(5'h13):(4'hf)];
            end
          else
            begin
              reg64 <= wire31[(4'h9):(4'h9)];
              reg65 <= $signed(wire28);
              reg66 <= {$signed(((7'h44) | $signed({reg57, reg22}))),
                  (&{reg40})};
              reg67 <= reg46[(2'h3):(1'h1)];
              reg68 <= (((reg56 >> wire21[(2'h2):(2'h2)]) && $signed((~wire55))) ?
                  ({(reg23 || (reg43 ? reg42 : reg42)), wire55} ?
                      (reg37 ?
                          ($unsigned(wire17) | {reg56, (8'h9f)}) : (reg42 ?
                              reg66 : $unsigned(reg46))) : wire21[(1'h1):(1'h0)]) : (!(reg43[(2'h3):(2'h2)] ?
                      $signed($unsigned(reg39)) : (|{wire55}))));
            end
          reg69 <= (~^$unsigned($unsigned((~|(^~reg37)))));
        end
      else
        begin
          reg62 <= $signed(reg59[(1'h1):(1'h0)]);
          reg63 <= ($signed((^$signed((^~(8'hbc))))) + (8'hb6));
          reg64 <= (reg61[(4'h8):(1'h1)] ?
              ({$signed((!wire19))} ?
                  (^~$unsigned((&reg61))) : (|((reg64 ?
                      reg42 : reg26) >= (reg34 ?
                      reg64 : wire28)))) : ((((reg48 ?
                      reg66 : reg27) != $signed(wire28)) >> reg52[(5'h10):(3'h7)]) ?
                  $signed(($signed(reg24) <= (reg45 << reg22))) : (&(((8'hb9) ?
                          wire30 : reg38) ?
                      (wire21 ? wire19 : (8'hac)) : (reg40 > reg57)))));
          reg65 <= wire53[(4'hc):(3'h5)];
          reg66 <= $signed((($signed($unsigned(wire21)) ?
              ({reg59, reg68} ?
                  reg37 : $unsigned(reg36)) : (~|$unsigned((8'hb1)))) ^~ (8'hb5)));
        end
    end
  assign wire70 = (8'hb5);
  assign wire71 = ({reg47[(4'hc):(3'h6)]} ?
                      $unsigned((8'ha5)) : (|$unsigned((~&$signed((8'ha7))))));
  always
    @(posedge clk) begin
      reg72 <= ($signed($unsigned((reg39[(3'h5):(3'h5)] <= (reg63 ?
              reg58 : reg40)))) ?
          $signed(reg23[(1'h0):(1'h0)]) : (reg38 ^ $unsigned(((wire28 & reg48) ?
              $signed(reg47) : reg60[(4'ha):(3'h5)]))));
      reg73 <= $unsigned(($unsigned((~^reg35[(3'h5):(1'h1)])) ?
          $unsigned(((wire54 >> reg48) ~^ (wire32 <= reg67))) : ((~&(reg52 ?
              wire32 : wire30)) == (reg26 >> (~reg63)))));
    end
endmodule

module module116
#(parameter param150 = ((((~{(8'ha9)}) ? ((~(8'ha6)) * (~|(8'haa))) : (~&(&(8'hb5)))) ? (~((|(8'hbd)) ? ((8'hbc) ? (8'hb6) : (8'h9f)) : (~&(8'hb3)))) : ((((8'ha0) == (8'hb1)) ? ((8'hb2) ^~ (8'h9e)) : (~(8'ha0))) >>> {((8'hb7) ? (8'hb3) : (8'ha3))})) >>> (((~&((8'ha4) ? (8'ha1) : (8'ha2))) <<< (8'ha6)) ? (~^((!(8'h9f)) > ((8'hb3) > (8'hbf)))) : (~|{(^(8'hbe))}))), 
parameter param151 = ((8'hba) | {param150}))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire120;
  input wire signed [(4'hc):(1'h0)] wire119;
  input wire signed [(4'ha):(1'h0)] wire118;
  input wire [(4'he):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire149;
  wire [(5'h15):(1'h0)] wire148;
  wire signed [(4'h8):(1'h0)] wire138;
  wire [(2'h2):(1'h0)] wire137;
  wire [(4'he):(1'h0)] wire136;
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg141 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire138,
                 wire137,
                 wire136,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire120[(2'h3):(1'h0)] ~^ ((wire117 ?
              {wire119} : ($signed(wire119) ?
                  (wire118 ? wire119 : (8'hb4)) : wire120)) ?
          (wire118 <= (|wire119)) : (wire120 ?
              (^wire119) : {wire119[(4'h8):(2'h2)]}))))
        begin
          reg121 <= wire118;
          reg122 <= $signed((wire118[(3'h7):(2'h3)] ?
              wire120 : wire117[(4'hd):(4'hc)]));
          if (reg122[(1'h1):(1'h0)])
            begin
              reg123 <= reg122[(3'h4):(1'h0)];
              reg124 <= reg121[(1'h0):(1'h0)];
              reg125 <= $unsigned((+reg122));
              reg126 <= (8'hb5);
              reg127 <= $signed(($unsigned(reg122[(4'h8):(3'h7)]) ~^ ($signed((reg123 || reg121)) ?
                  reg122 : wire117)));
            end
          else
            begin
              reg123 <= reg125[(4'he):(4'ha)];
              reg124 <= ((-$signed((~&$unsigned((8'hb1))))) ?
                  $signed((8'hb5)) : ($unsigned((~&$unsigned(wire118))) ?
                      (reg125[(3'h6):(3'h6)] > reg124) : reg123));
              reg125 <= (7'h41);
            end
        end
      else
        begin
          if (((+($unsigned(wire118) ?
                  reg126 : ({reg126} - reg124[(4'hf):(3'h7)]))) ?
              (^~wire119[(4'ha):(2'h2)]) : ((&(~(wire120 ?
                  wire117 : reg122))) < {$unsigned(wire119[(3'h5):(1'h0)]),
                  reg125})))
            begin
              reg121 <= reg122[(4'he):(3'h7)];
            end
          else
            begin
              reg121 <= (reg123[(2'h2):(1'h1)] ?
                  (((~|$signed((8'ha1))) != wire119[(1'h1):(1'h1)]) ?
                      wire117 : (reg123 ?
                          $signed($unsigned(wire119)) : reg122)) : $unsigned(((|(!(7'h42))) == (8'h9e))));
            end
          reg122 <= wire117[(3'h4):(2'h3)];
          reg123 <= ((~|$signed(reg124)) ?
              {(&((reg124 ? (8'haf) : reg123) ? {reg122} : (wire118 + reg124))),
                  $unsigned($unsigned((~&wire120)))} : ((^~$signed(reg126[(2'h2):(1'h0)])) != $signed($signed(reg125))));
          reg124 <= ($unsigned($unsigned(($signed(reg127) ?
                  (^reg124) : (reg123 ? reg122 : (8'ha2))))) ?
              $signed(reg121[(4'he):(4'h8)]) : (reg123 ?
                  ($unsigned(wire119[(3'h5):(2'h2)]) ?
                      (|{wire118, reg121}) : (+{reg123, (8'h9d)})) : (8'hbf)));
        end
      reg128 <= (wire117[(4'hc):(4'h9)] >> (8'hb2));
      reg129 <= reg121;
      reg130 <= (^~(({$signed(wire117), $unsigned(reg122)} <= reg128) ?
          $unsigned(reg126) : (~&(~^$signed(reg129)))));
      if (wire120[(4'hf):(3'h6)])
        begin
          if ($unsigned($unsigned(reg129[(2'h2):(2'h2)])))
            begin
              reg131 <= (!({(reg129[(1'h0):(1'h0)] ? (|reg124) : reg129),
                  wire118} ^ wire119));
            end
          else
            begin
              reg131 <= (~(!reg131[(5'h14):(5'h12)]));
              reg132 <= wire119;
              reg133 <= $unsigned({(|((~&(7'h40)) <= (wire120 ?
                      (7'h42) : reg122))),
                  {($unsigned(wire118) ?
                          $signed(wire117) : {reg130, reg124})}});
            end
          reg134 <= ((reg131[(5'h10):(4'ha)] ?
                  {($unsigned(wire118) ~^ (8'hbd)),
                      ({reg124} ^ reg130[(1'h1):(1'h1)])} : ((!reg126) != ((~|wire118) ?
                      (reg124 ~^ reg124) : reg132))) ?
              {wire118[(4'h8):(4'h8)],
                  ($signed((reg129 ? (8'ha9) : wire118)) & ((wire120 | reg131) ?
                      reg122 : reg127[(3'h7):(3'h6)]))} : reg125[(4'hc):(3'h5)]);
          reg135 <= (-$unsigned((~^reg132)));
        end
      else
        begin
          reg131 <= reg122;
          reg132 <= (~&$signed($signed({{reg131}})));
        end
    end
  assign wire136 = $unsigned((&(8'ha9)));
  assign wire137 = $signed((({wire119, $signed(reg128)} ?
                           $unsigned(((8'hb1) ?
                               reg124 : reg134)) : (^(~^(8'ha6)))) ?
                       reg122 : $signed(wire136[(4'h8):(3'h4)])));
  assign wire138 = {$signed(({{wire119},
                           (wire119 <<< reg128)} >= (reg127[(3'h5):(2'h3)] < (^reg134))))};
  always
    @(posedge clk) begin
      if ($signed(wire118[(3'h4):(2'h2)]))
        begin
          if (({(~&(~^$signed(reg125))),
              $unsigned(($signed(reg122) < (reg127 ?
                  reg130 : wire136)))} >> (($unsigned($unsigned((8'hbb))) ?
                  ((reg125 * reg125) >>> {wire138}) : ((reg129 > reg134) >> $signed(reg123))) ?
              reg123 : $unsigned((((8'haf) ? reg134 : (8'ha4)) ?
                  {wire137, reg130} : wire119[(4'hc):(2'h2)])))))
            begin
              reg139 <= (reg122 ?
                  ({(((8'ha0) ^~ wire117) >> (reg133 + reg129))} ?
                      $signed(($signed(reg130) ?
                          reg121 : (reg134 <<< (8'ha5)))) : reg135) : wire136[(1'h1):(1'h1)]);
            end
          else
            begin
              reg139 <= (-$signed(wire136));
            end
          reg140 <= ((($unsigned({reg122, reg126}) ?
              ((reg134 ^ (8'hbd)) ?
                  (|reg124) : {wire118}) : wire138) ~^ $unsigned((|{(8'h9f)}))) * (reg135 <<< ($unsigned({reg121}) - reg127[(3'h7):(1'h0)])));
          if ((wire119 ?
              $unsigned(wire138[(2'h3):(1'h1)]) : ((|((~&reg127) ?
                  (wire120 + reg123) : (^~reg139))) || wire138)))
            begin
              reg141 <= wire137[(2'h2):(2'h2)];
              reg142 <= $signed($signed((~&((^~reg133) ?
                  (reg122 ? (8'had) : (7'h44)) : (~^wire120)))));
              reg143 <= ($unsigned(reg123[(1'h0):(1'h0)]) <= (^(~$signed($signed(reg130)))));
              reg144 <= (&{(reg134 * (7'h42)),
                  (-$signed((reg142 ? (8'ha6) : reg122)))});
              reg145 <= reg129[(1'h0):(1'h0)];
            end
          else
            begin
              reg141 <= ($signed((reg143 ?
                      $unsigned($unsigned(reg124)) : ((reg126 ?
                              wire138 : reg144) ?
                          reg125[(4'h8):(2'h3)] : (^(8'ha4))))) ?
                  {(~^$unsigned(reg129[(1'h0):(1'h0)]))} : reg143);
              reg142 <= (reg129[(1'h0):(1'h0)] - (8'ha0));
            end
        end
      else
        begin
          reg139 <= $unsigned({({(reg130 ? reg122 : reg125), (^~reg124)} ?
                  ($signed(wire138) ?
                      (~reg130) : ((8'hb0) >> reg132)) : $signed($unsigned(reg140)))});
          reg140 <= reg140;
          if (reg129[(1'h0):(1'h0)])
            begin
              reg141 <= (~^reg134);
            end
          else
            begin
              reg141 <= (8'hbf);
              reg142 <= ($unsigned($signed((~(reg130 <= (8'had))))) ?
                  reg124[(1'h1):(1'h0)] : ({$unsigned(reg121[(4'hd):(4'h9)]),
                      ((^reg133) ? wire120 : reg135)} | {wire120}));
              reg143 <= $signed({$unsigned({{wire117}})});
              reg144 <= $signed((((~|(reg130 ? reg126 : reg134)) ?
                  (8'hb2) : ((reg135 <= (8'hbb)) ?
                      $unsigned((8'hb9)) : $signed(reg124))) == $signed(($signed(wire137) < (reg141 ?
                  reg141 : reg129)))));
            end
        end
      reg146 <= {reg126};
      reg147 <= $signed(((reg145[(3'h7):(3'h5)] <<< $unsigned(reg135[(3'h7):(3'h6)])) ?
          $unsigned(reg145[(4'hc):(2'h2)]) : reg132[(3'h4):(1'h1)]));
    end
  assign wire148 = $signed((-((8'hab) ^~ (&(!reg128)))));
  assign wire149 = $unsigned(reg143[(2'h3):(2'h3)]);
endmodule

module module99
#(parameter param111 = ((^~((((8'ha5) ? (8'hb8) : (7'h42)) ? (^(8'ha9)) : ((8'h9f) ? (8'ha7) : (8'hb0))) + {{(8'ha2)}, ((8'hbe) ? (7'h40) : (8'h9e))})) + (~^((8'haf) | (~((8'h9f) ? (8'hbe) : (8'hbd)))))))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire103;
  input wire signed [(5'h11):(1'h0)] wire102;
  input wire [(5'h13):(1'h0)] wire101;
  input wire signed [(5'h15):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(2'h2):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire104;
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire104,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire104 = ({$unsigned((7'h41))} >> wire102[(4'h9):(3'h6)]);
  always
    @(posedge clk) begin
      if ((wire102 ?
          $signed($unsigned((~|wire104[(4'h8):(2'h3)]))) : wire101[(2'h3):(2'h3)]))
        begin
          reg105 <= ((wire102 | wire102[(4'hf):(2'h2)]) ?
              {wire102} : $signed($unsigned((wire100[(4'h8):(3'h4)] ?
                  (8'ha3) : wire103))));
          reg106 <= {wire104};
        end
      else
        begin
          reg105 <= wire100[(4'h8):(4'h8)];
        end
    end
  assign wire107 = ($signed(({{reg105}} && ($signed(reg106) ?
                       (wire103 ?
                           reg105 : (8'h9f)) : (!reg105)))) ~^ (+wire100[(5'h15):(5'h12)]));
  assign wire108 = $signed((~&(~|($signed(wire101) != (reg105 && reg105)))));
  assign wire109 = $unsigned((~&$unsigned(wire100[(2'h2):(2'h2)])));
  assign wire110 = $unsigned({$signed((~&(wire100 ? wire102 : (7'h41)))),
                       $signed((wire107 ?
                           reg105[(5'h14):(4'he)] : (~(7'h41))))});
endmodule
