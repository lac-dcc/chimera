module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire230;
  wire signed [(3'h7):(1'h0)] wire229;
  wire [(5'h13):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire227;
  assign y = {wire230,
                 wire229,
                 wire61,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire227,
                 (1'h0)};
  module4 #() modinst62 (.clk(clk), .wire8(wire2), .y(wire61), .wire5((8'ha6)), .wire7(wire1), .wire6(wire3), .wire9(wire0));
  assign wire63 = ($unsigned({(wire61[(4'hb):(2'h3)] < {wire2,
                          wire1})}) <= (($signed((wire61 >>> wire2)) ?
                      wire3[(1'h1):(1'h1)] : wire0[(1'h0):(1'h0)]) & $unsigned((-((7'h43) != wire0)))));
  assign wire64 = $unsigned((wire63 ?
                      (|($unsigned(wire2) << $signed(wire61))) : $signed($unsigned(wire2))));
  assign wire65 = {$signed($unsigned(($signed(wire2) ^ wire3[(3'h5):(2'h2)])))};
  assign wire66 = wire63;
  assign wire67 = (&(&(~^((wire64 & wire65) == $unsigned(wire0)))));
  assign wire68 = $signed({$unsigned($unsigned(wire61[(3'h6):(1'h1)])),
                      $signed(wire63)});
  assign wire69 = wire65[(4'h9):(1'h1)];
  assign wire70 = wire0[(1'h0):(1'h0)];
  assign wire71 = wire2;
  assign wire72 = $signed((^~(wire68[(3'h7):(3'h5)] ?
                      (^$unsigned(wire70)) : ((^~(8'ha2)) - (7'h41)))));
  assign wire73 = (wire61 + $signed(wire2[(4'h8):(3'h6)]));
  assign wire74 = (wire71[(1'h1):(1'h1)] ?
                      (wire72 == $signed((wire61 || wire64[(3'h5):(2'h3)]))) : {((((8'had) > wire67) ?
                              (+wire69) : $signed((8'haf))) >>> {(wire65 ?
                                  wire64 : wire1),
                              (wire67 && wire1)})});
  assign wire75 = {($unsigned($signed(wire70)) ?
                          $unsigned($signed(wire69[(3'h4):(2'h3)])) : wire61),
                      wire65};
  assign wire76 = $signed(wire1);
  assign wire77 = $unsigned(($unsigned($signed(wire65[(5'h12):(4'hb)])) || wire76[(1'h1):(1'h1)]));
  assign wire78 = (wire0[(2'h3):(1'h0)] ?
                      (+(wire71[(2'h2):(1'h1)] ?
                          (|(wire74 || wire1)) : (+$signed(wire63)))) : (((~wire0[(1'h1):(1'h0)]) ?
                              {wire64, wire64} : wire76[(1'h1):(1'h1)]) ?
                          ($signed(wire1) << (~^(8'ha5))) : wire64[(4'hb):(2'h3)]));
  assign wire79 = $signed((wire78[(4'hd):(4'ha)] <<< {$unsigned($signed(wire65)),
                      ($unsigned(wire74) ~^ ((8'ha5) ? wire74 : (8'hbb)))}));
  module80 #() modinst228 (.wire83(wire61), .wire81(wire73), .wire82(wire2), .wire85(wire69), .y(wire227), .clk(clk), .wire84(wire76));
  assign wire229 = {wire74, wire76[(2'h3):(2'h3)]};
  assign wire230 = (-$signed({($unsigned(wire77) >>> (wire0 ?
                           wire73 : wire64))}));
endmodule

module module80  (y, clk, wire81, wire82, wire83, wire84, wire85);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire81;
  input wire signed [(5'h14):(1'h0)] wire82;
  input wire [(5'h12):(1'h0)] wire83;
  input wire [(5'h15):(1'h0)] wire84;
  input wire signed [(5'h11):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire225;
  wire [(4'hf):(1'h0)] wire171;
  wire [(4'h9):(1'h0)] wire170;
  wire signed [(4'he):(1'h0)] wire169;
  wire [(4'hb):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire104;
  assign y = {wire225,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire166,
                 wire107,
                 wire106,
                 wire86,
                 wire104,
                 (1'h0)};
  assign wire86 = wire82[(3'h6):(3'h4)];
  module87 #() modinst105 (.y(wire104), .wire90(wire85), .wire91(wire83), .wire92(wire86), .clk(clk), .wire89(wire81), .wire88(wire82));
  assign wire106 = {wire81, wire82[(4'hf):(4'hb)]};
  assign wire107 = (~^wire82);
  module108 #() modinst167 (wire166, clk, wire104, wire83, wire106, wire86);
  assign wire168 = (8'haf);
  assign wire169 = $unsigned(((((wire107 < wire85) | $unsigned(wire166)) > wire83[(4'hd):(4'h8)]) != (wire85[(4'hd):(3'h7)] ?
                       wire85 : wire106)));
  assign wire170 = $unsigned((^~$signed($signed((-(7'h40))))));
  assign wire171 = (^$unsigned((wire166[(1'h0):(1'h0)] | ((wire166 <<< wire166) == wire168[(3'h4):(1'h1)]))));
  module172 #() modinst226 (.y(wire225), .wire176(wire85), .wire174(wire169), .wire173(wire84), .clk(clk), .wire175(wire82));
endmodule

module module4
#(parameter param60 = (^~((~^(-((8'ha6) == (8'hba)))) && (({(8'hbc)} ? ((8'hb3) ? (8'ha1) : (8'hac)) : {(8'ha7), (8'ha2)}) && (~&(&(8'hbe)))))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire6;
  input wire [(4'he):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire56;
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire27,
                 wire15,
                 wire13,
                 wire11,
                 wire10,
                 wire40,
                 wire56,
                 reg14,
                 reg12,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 (1'h0)};
  assign wire10 = (&(&(((^wire6) >= {(8'haf)}) ^~ $unsigned($unsigned(wire5)))));
  assign wire11 = wire9;
  always
    @(posedge clk) begin
      reg12 <= (wire11 > ((!((~^wire9) + wire5[(4'ha):(4'ha)])) ?
          (+{(^~wire8), wire8[(2'h2):(1'h0)]}) : $unsigned(((wire7 ?
              (8'ha6) : wire7) || $signed(wire8)))));
    end
  assign wire13 = reg12;
  always
    @(posedge clk) begin
      reg14 <= $unsigned((~&(($unsigned(reg12) ?
          (^~wire9) : $unsigned((8'hbb))) * reg12[(3'h6):(3'h5)])));
    end
  assign wire15 = (!(&$unsigned({$signed(wire13), $signed(reg12)})));
  module16 #() modinst28 (.clk(clk), .wire17(wire7), .y(wire27), .wire18(reg14), .wire20(wire11), .wire19(wire8));
  always
    @(posedge clk) begin
      if (wire6)
        begin
          if ($signed($unsigned((+wire27[(2'h2):(2'h2)]))))
            begin
              reg29 <= (^wire6);
              reg30 <= $signed($unsigned((~&$unsigned((wire9 ?
                  wire27 : (8'hb0))))));
              reg31 <= $signed((^~(-$signed($signed(wire15)))));
              reg32 <= (&(wire10[(1'h0):(1'h0)] ~^ ($unsigned($unsigned((8'hb3))) == reg29[(2'h3):(2'h2)])));
              reg33 <= $unsigned(reg31);
            end
          else
            begin
              reg29 <= ({((wire13[(2'h2):(1'h1)] ~^ $signed(reg33)) < (+reg31[(2'h3):(2'h2)])),
                  ($unsigned(reg31) ?
                      (!$unsigned(wire27)) : (&wire8))} <<< (^wire10[(2'h3):(2'h2)]));
              reg30 <= $unsigned((({(!wire5)} ?
                  wire9 : ((reg33 ? reg29 : wire5) || wire8)) <= reg14));
            end
          reg34 <= {reg32};
          reg35 <= reg30[(4'h9):(3'h4)];
          if ($unsigned(($signed((|reg12[(3'h7):(3'h6)])) & $unsigned(((^wire6) ?
              $signed((8'ha8)) : $unsigned(reg31))))))
            begin
              reg36 <= (~^wire27);
            end
          else
            begin
              reg36 <= $signed(wire7[(1'h0):(1'h0)]);
            end
          reg37 <= reg31[(1'h0):(1'h0)];
        end
      else
        begin
          reg29 <= wire13[(2'h3):(2'h3)];
          if (($signed(({$signed(reg30), $signed(wire11)} ?
              ($signed(wire13) != reg34[(1'h0):(1'h0)]) : {$signed(reg12),
                  (wire15 ?
                      reg34 : wire11)})) | (wire9 << $signed((wire9[(2'h3):(2'h3)] << (^~(8'hb6)))))))
            begin
              reg30 <= wire13;
            end
          else
            begin
              reg30 <= (reg35[(4'h8):(3'h7)] ?
                  ((reg12 ?
                      $signed($unsigned(wire7)) : ((reg12 ? wire7 : reg30) ?
                          wire13 : (+reg35))) ^~ reg37[(2'h3):(2'h3)]) : (reg12[(5'h13):(3'h6)] < reg37));
              reg31 <= wire13[(2'h3):(2'h3)];
              reg32 <= $signed(wire5[(3'h5):(1'h1)]);
              reg33 <= $unsigned((8'hae));
              reg34 <= reg37[(2'h2):(1'h1)];
            end
        end
      reg38 <= (!{(($signed((8'ha8)) ?
              reg14 : $unsigned((8'hbd))) != (reg37[(1'h1):(1'h1)] ?
              wire7[(4'h8):(4'h8)] : wire27[(3'h5):(2'h2)]))});
      reg39 <= wire6;
    end
  assign wire40 = wire6[(2'h2):(1'h0)];
  module41 #() modinst57 (.wire45(wire5), .clk(clk), .y(wire56), .wire43(reg34), .wire44(reg14), .wire42(reg37));
  assign wire58 = wire7[(4'ha):(1'h0)];
  assign wire59 = reg37;
endmodule

module module41  (y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire45;
  input wire signed [(4'h8):(1'h0)] wire44;
  input wire signed [(5'h13):(1'h0)] wire43;
  input wire signed [(5'h10):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire47,
                 wire46,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire46 = (wire44[(3'h7):(1'h0)] <= (~&(($signed(wire44) == wire43) || wire45[(3'h4):(3'h4)])));
  assign wire47 = ({{(wire46 ? wire42 : $signed(wire43)),
                              (^~$unsigned(wire43))},
                          $unsigned({wire42, {wire42}})} ?
                      (|$unsigned(wire44[(4'h8):(3'h4)])) : (wire42[(4'h9):(3'h7)] <= (~&wire42)));
  always
    @(posedge clk) begin
      reg48 <= {$unsigned({wire44, (wire42[(3'h5):(2'h3)] == wire47)})};
      if (wire43)
        begin
          reg49 <= ((^(~&($signed(reg48) == (+reg48)))) ?
              {wire44[(2'h2):(1'h1)],
                  $unsigned($unsigned({(8'hb5), reg48}))} : wire46);
          reg50 <= ((!reg48) ?
              ((($unsigned(wire45) ?
                  $unsigned(wire47) : (wire46 << (8'hb1))) && reg48[(3'h6):(2'h2)]) == $unsigned(({wire45,
                      wire42} ?
                  ((8'haa) ?
                      reg49 : wire44) : $unsigned(wire43)))) : $unsigned($unsigned(wire47[(1'h1):(1'h0)])));
        end
      else
        begin
          reg49 <= (+$unsigned(wire42[(1'h1):(1'h0)]));
        end
    end
  assign wire51 = ($signed($signed(((~|reg48) + (wire44 ?
                      wire44 : (8'hbe))))) | wire44[(3'h5):(2'h3)]);
  assign wire52 = (reg48 + {$unsigned($unsigned($signed(wire44)))});
  assign wire53 = (^~wire51[(4'hd):(3'h5)]);
  assign wire54 = $unsigned($signed((8'ha2)));
  assign wire55 = $unsigned($unsigned((8'hbf)));
endmodule

module module16
#(parameter param26 = {(((+((8'haa) ? (8'hb8) : (8'haf))) * (!(7'h42))) <<< (((^~(8'hb1)) ? ((8'ha4) ? (7'h43) : (7'h42)) : ((8'hbd) ? (8'ha6) : (8'hbc))) ? ((&(8'hb5)) ^ ((8'hbf) ^ (7'h41))) : (((8'ha8) ? (8'ha1) : (8'ha9)) ? ((8'hac) > (7'h41)) : ((7'h43) >> (7'h42))))), (({((8'hb4) < (8'hb6))} & {((8'h9c) >>> (8'hba))}) ? {{{(8'hb8), (8'ha4)}}, ((!(8'hb3)) ? ((8'ha9) ? (8'hb2) : (8'hb8)) : (~^(8'ha3)))} : (8'hb8))})
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire signed [(4'ha):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  assign y = {wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = $unsigned(($signed(wire19[(3'h7):(2'h2)]) ?
                      (wire19[(3'h7):(3'h7)] ^~ $unsigned({wire20,
                          wire17})) : (wire20[(3'h7):(3'h4)] ?
                          wire19[(5'h11):(4'h9)] : (&$unsigned(wire19)))));
  assign wire22 = wire21[(4'hd):(3'h4)];
  assign wire23 = (~&$signed((!$signed(((8'hb6) > (8'hbb))))));
  assign wire24 = $signed((wire21 >>> (wire20[(4'h9):(3'h6)] ^~ wire23[(3'h7):(1'h1)])));
  assign wire25 = (~^wire19);
endmodule

module module172
#(parameter param224 = ({((+((8'hb5) ? (8'hb5) : (8'hb4))) * (+(&(8'hb7)))), {(~&((8'h9c) + (8'ha1)))}} || ((^(8'ha5)) ? (((-(8'ha8)) || ((8'h9e) <= (7'h44))) ? {(~^(8'ha6))} : ((^(8'hac)) > ((8'haf) ? (8'hba) : (8'hbd)))) : (!((+(8'had)) ? (-(8'ha2)) : (~|(8'ha0)))))))
(y, clk, wire176, wire175, wire174, wire173);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire176;
  input wire signed [(5'h14):(1'h0)] wire175;
  input wire signed [(4'h8):(1'h0)] wire174;
  input wire signed [(4'he):(1'h0)] wire173;
  wire signed [(3'h4):(1'h0)] wire214;
  wire [(4'ha):(1'h0)] wire213;
  wire signed [(2'h3):(1'h0)] wire183;
  wire [(5'h12):(1'h0)] wire182;
  wire [(4'hb):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire177;
  reg [(5'h14):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg222 = (1'h0);
  reg [(4'h8):(1'h0)] reg221 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg220 = (1'h0);
  reg [(5'h11):(1'h0)] reg219 = (1'h0);
  reg [(3'h7):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg217 = (1'h0);
  reg [(5'h14):(1'h0)] reg216 = (1'h0);
  reg [(3'h4):(1'h0)] reg215 = (1'h0);
  reg [(5'h14):(1'h0)] reg212 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg211 = (1'h0);
  reg [(4'h9):(1'h0)] reg210 = (1'h0);
  reg [(2'h3):(1'h0)] reg209 = (1'h0);
  reg [(2'h3):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg207 = (1'h0);
  reg [(2'h2):(1'h0)] reg206 = (1'h0);
  reg [(5'h11):(1'h0)] reg205 = (1'h0);
  reg [(2'h2):(1'h0)] reg204 = (1'h0);
  reg [(2'h3):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg201 = (1'h0);
  reg [(3'h5):(1'h0)] reg200 = (1'h0);
  reg [(4'h9):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg196 = (1'h0);
  reg signed [(4'he):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg193 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg192 = (1'h0);
  reg [(4'hd):(1'h0)] reg191 = (1'h0);
  reg [(4'hc):(1'h0)] reg190 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg187 = (1'h0);
  reg [(4'h9):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(3'h4):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg180 = (1'h0);
  reg [(3'h4):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg178 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire183,
                 wire182,
                 wire181,
                 wire177,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
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
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg180,
                 reg179,
                 reg178,
                 (1'h0)};
  assign wire177 = wire173;
  always
    @(posedge clk) begin
      reg178 <= wire176;
      reg179 <= wire175;
      reg180 <= (wire176[(4'h9):(4'h9)] ~^ wire173[(1'h0):(1'h0)]);
    end
  assign wire181 = $unsigned($unsigned($signed(wire173)));
  assign wire182 = reg178[(2'h2):(1'h1)];
  assign wire183 = wire182[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg184 <= ((($signed($signed(wire175)) * $unsigned(((8'hb5) ?
          reg180 : wire182))) * wire181) ^~ wire181);
      if (wire182)
        begin
          reg185 <= ((reg184[(3'h4):(2'h2)] ?
                  (~&($unsigned(reg179) || wire174)) : (wire182[(3'h4):(1'h0)] << {reg180[(4'hb):(4'h8)],
                      (wire181 ? (8'h9d) : wire182)})) ?
              $signed($signed((+wire174[(1'h1):(1'h1)]))) : $unsigned(wire174));
          if ($signed($unsigned((-$signed((8'hb9))))))
            begin
              reg186 <= (~|(($unsigned((reg184 == wire182)) ?
                  $unsigned((wire173 >>> reg178)) : {reg184[(1'h1):(1'h1)],
                      $unsigned(wire183)}) > reg185[(3'h4):(2'h2)]));
              reg187 <= {((wire181 ?
                      (~(wire175 ? wire181 : (8'h9c))) : ((-wire176) ?
                          wire181 : (reg178 ?
                              reg178 : reg185))) ^~ $unsigned(reg179)),
                  $unsigned({reg186})};
              reg188 <= $signed(wire176[(2'h3):(2'h3)]);
              reg189 <= (|((((8'hb0) ?
                      (wire174 ? wire175 : wire173) : (reg180 ?
                          wire174 : wire183)) >> (reg187[(2'h3):(2'h3)] ?
                      wire174[(3'h4):(1'h1)] : $unsigned(wire183))) ?
                  ($signed($unsigned(reg184)) && $signed(wire173[(3'h6):(1'h0)])) : $signed((reg178 ?
                      $unsigned(reg188) : {reg186, wire175}))));
            end
          else
            begin
              reg186 <= reg189;
              reg187 <= {wire182};
            end
          if ($signed($signed((~&$signed($unsigned(reg185))))))
            begin
              reg190 <= (-((~|reg185) <<< reg189[(3'h4):(1'h0)]));
              reg191 <= reg185[(3'h4):(2'h2)];
              reg192 <= (((reg186[(2'h3):(1'h0)] >> ((wire173 | reg191) <= $signed(reg186))) ?
                      $signed($signed($signed((8'hb6)))) : wire176) ?
                  {(((reg178 ? reg178 : wire174) ?
                          (wire175 >>> reg185) : $unsigned(reg191)) & $unsigned(((8'ha2) ?
                          reg187 : wire174)))} : $unsigned($unsigned(($unsigned(reg186) + (wire173 ?
                      (8'hb8) : wire181)))));
              reg193 <= (reg187 ? $signed(reg185) : wire182);
            end
          else
            begin
              reg190 <= {($signed(({reg186, (8'hb6)} > (~^reg191))) ?
                      (~&reg179[(1'h1):(1'h0)]) : reg190),
                  $unsigned(((reg184[(2'h3):(1'h1)] ?
                      ((8'hb1) <<< (8'ha7)) : {wire181}) == ((wire177 ?
                      reg179 : wire175) * (|reg180))))};
              reg191 <= wire183[(1'h0):(1'h0)];
              reg192 <= {reg190[(2'h2):(2'h2)],
                  $signed({reg186[(3'h5):(3'h5)], wire181})};
            end
          reg194 <= {($unsigned(reg180) << $signed(wire175)), $signed(reg186)};
          reg195 <= $unsigned($signed((reg186 ?
              $signed((~^reg185)) : ($signed(wire173) ?
                  (wire173 ? wire175 : reg191) : {(8'ha5)}))));
        end
      else
        begin
          reg185 <= (wire176 < wire175);
          reg186 <= $signed((+$unsigned((+(!reg187)))));
        end
      reg196 <= (~&reg194[(4'h9):(3'h4)]);
      if (reg180)
        begin
          if ($signed(reg193[(3'h5):(3'h5)]))
            begin
              reg197 <= reg178;
              reg198 <= $unsigned({(reg188[(1'h0):(1'h0)] ?
                      reg190 : ($unsigned((7'h42)) && reg194[(1'h1):(1'h1)])),
                  (~^wire175[(5'h14):(5'h13)])});
              reg199 <= reg195[(1'h1):(1'h0)];
              reg200 <= $unsigned(($unsigned($unsigned((reg196 ?
                      reg192 : reg178))) ?
                  $signed(reg190[(3'h7):(3'h7)]) : wire181[(1'h1):(1'h0)]));
              reg201 <= {($signed(((wire174 ? (8'hb5) : wire182) ?
                      ((8'hbc) ?
                          reg185 : wire181) : $unsigned(reg190))) << {(^~((8'hb0) ^ reg195))}),
                  $signed((~|((reg186 >= (8'ha8)) ?
                      (reg196 ? reg195 : reg180) : (^~reg189))))};
            end
          else
            begin
              reg197 <= {(-reg185[(3'h5):(1'h0)])};
              reg198 <= (!$unsigned(wire173));
              reg199 <= $unsigned(((($unsigned(reg184) ?
                      (^(8'hbe)) : (reg185 >>> wire175)) ?
                  (reg190 < (wire175 < reg185)) : reg195) >>> wire182[(4'h8):(2'h2)]));
              reg200 <= (($unsigned((^~$unsigned(reg179))) ?
                      $unsigned({$signed(reg192)}) : wire173) ?
                  (^{wire174[(3'h7):(3'h5)],
                      reg194}) : (|($signed($unsigned(reg180)) ?
                      {(wire176 ?
                              reg195 : (8'ha5))} : $signed($unsigned(reg185)))));
            end
          reg202 <= $unsigned({reg200[(3'h5):(2'h3)],
              $unsigned(((wire173 ?
                  (8'hb8) : wire181) < wire182[(4'hf):(4'h9)]))});
          if (reg192)
            begin
              reg203 <= $signed($signed($unsigned(reg193)));
              reg204 <= $signed($unsigned((~^$signed((reg197 ?
                  reg193 : reg193)))));
              reg205 <= $unsigned((^~{($unsigned(wire173) ?
                      (wire173 ? reg197 : wire181) : reg179[(2'h2):(2'h2)])}));
              reg206 <= reg195;
              reg207 <= reg205[(5'h10):(4'ha)];
            end
          else
            begin
              reg203 <= $signed(reg198[(1'h0):(1'h0)]);
              reg204 <= (reg186[(4'h9):(4'h8)] ?
                  $unsigned($signed((|{reg203,
                      (8'ha2)}))) : ((reg204 <<< (reg180[(4'hd):(4'hd)] << {reg186})) >> ((!$unsigned(reg189)) ?
                      reg185[(1'h0):(1'h0)] : ((|(8'hb7)) ?
                          (reg191 ? reg179 : reg190) : (~^wire175)))));
            end
          reg208 <= (~^(8'h9e));
          reg209 <= $signed(reg208[(1'h1):(1'h0)]);
        end
      else
        begin
          reg197 <= $unsigned((~reg192));
          if ($unsigned({(&reg201[(4'hc):(1'h1)])}))
            begin
              reg198 <= (reg194[(4'h9):(2'h3)] ?
                  {$signed((reg193 <= (8'hae)))} : ((~|(7'h41)) ~^ (^~$signed({reg180,
                      reg202}))));
              reg199 <= wire175;
              reg200 <= reg200[(1'h1):(1'h0)];
              reg201 <= {((wire173 ?
                          $unsigned((|reg196)) : $unsigned((wire176 ?
                              reg187 : reg206))) ?
                      wire181 : (wire182 ?
                          (~|((8'ha2) ^ wire183)) : ((+reg202) ?
                              ((8'ha0) ? wire176 : reg185) : (-reg179))))};
              reg202 <= wire174;
            end
          else
            begin
              reg198 <= $signed((+reg178));
              reg199 <= (reg180 ?
                  reg189[(1'h1):(1'h0)] : $signed(wire176[(3'h5):(2'h2)]));
              reg200 <= (~&{((^~((7'h41) ? (8'ha3) : reg198)) ?
                      (|$unsigned(reg202)) : (8'h9d)),
                  {$signed((reg199 ? wire174 : reg189))}});
            end
          if (reg192)
            begin
              reg203 <= (reg180 << (reg193 ?
                  $unsigned((~|$unsigned(reg194))) : (-$signed((~^reg200)))));
              reg204 <= ($signed(((reg209 + (&(8'ha9))) & $signed(reg178[(2'h2):(2'h2)]))) || reg199[(4'h9):(1'h1)]);
              reg205 <= ((-wire174[(2'h2):(1'h0)]) * (wire174 >> reg184[(1'h1):(1'h1)]));
              reg206 <= $signed((($signed((-reg209)) ?
                  $unsigned((8'ha6)) : $signed(wire176[(1'h1):(1'h0)])) + $signed(reg206[(1'h0):(1'h0)])));
            end
          else
            begin
              reg203 <= $signed(($signed(($unsigned(reg194) ?
                  reg194 : reg185[(1'h1):(1'h1)])) >= reg192));
              reg204 <= $unsigned($signed((~|$unsigned((reg187 | reg191)))));
              reg205 <= (^((^(~{(8'hb8)})) + ((reg202 > ((7'h41) ?
                      reg180 : wire182)) ?
                  wire177 : $signed($signed(reg179)))));
            end
          if ((~^($unsigned(wire183) > $unsigned($signed((reg190 ?
              reg203 : reg196))))))
            begin
              reg207 <= ($signed(($signed((~&(8'hb4))) <<< $signed($signed(reg194)))) < (-(~reg204)));
              reg208 <= ({{$unsigned(reg184[(1'h1):(1'h1)])}} <<< (((~$unsigned((8'had))) ?
                      (reg206[(1'h1):(1'h0)] == $unsigned(reg207)) : $signed($signed(reg190))) ?
                  {$unsigned(reg196[(2'h2):(1'h1)]),
                      $unsigned(wire177[(4'ha):(1'h1)])} : $signed({(8'hb3)})));
              reg209 <= ((reg200 | $signed(((reg205 ?
                  (8'ha1) : reg202) >= (reg179 > reg204)))) < $unsigned(reg195[(3'h6):(3'h6)]));
              reg210 <= ((reg198 | ((^~(wire174 >= reg202)) & $signed($unsigned(reg180)))) - (reg192 <= $signed(reg192[(4'ha):(4'h8)])));
            end
          else
            begin
              reg207 <= (((((reg198 ?
                          (8'hbb) : reg205) && (wire175 << (8'hba))) ?
                      (wire175 ?
                          (reg202 ?
                              reg178 : reg205) : reg180[(4'hd):(4'hb)]) : $signed($unsigned(reg210))) ?
                  ({$signed(wire173),
                      reg185} + (!(8'h9f))) : $unsigned(($unsigned(reg184) ~^ (!reg191)))) << (($unsigned(reg192[(3'h4):(3'h4)]) ?
                  reg190 : $unsigned((7'h42))) - ((~(wire173 ?
                  (8'ha4) : wire182)) ~^ (-(wire182 ? reg208 : wire177)))));
              reg208 <= ($unsigned($unsigned(($unsigned(reg195) >>> wire176))) ?
                  (^~wire174) : ((~|reg206[(1'h0):(1'h0)]) ?
                      (8'ha2) : ((~^$unsigned(reg185)) & $signed((-reg178)))));
              reg209 <= wire182;
              reg210 <= reg206;
              reg211 <= ($unsigned(({$signed(wire183),
                      $unsigned((8'ha8))} <<< (~((8'hbd) ~^ reg204)))) ?
                  $unsigned($signed((~|(8'ha7)))) : reg185[(2'h3):(2'h2)]);
            end
        end
      reg212 <= reg196;
    end
  assign wire213 = reg189[(2'h3):(1'h0)];
  assign wire214 = $unsigned($unsigned($signed($signed((~^reg199)))));
  always
    @(posedge clk) begin
      reg215 <= reg204;
    end
  always
    @(posedge clk) begin
      if ((-reg191))
        begin
          reg216 <= $signed({(8'hb4), reg215});
          if ({reg205})
            begin
              reg217 <= (reg194[(4'h8):(3'h5)] ?
                  (((7'h41) ?
                      reg197[(2'h2):(1'h1)] : (^(reg195 < wire174))) > (-{(8'had),
                      reg204})) : ($unsigned((8'ha3)) && (+(7'h42))));
              reg218 <= reg180[(3'h5):(3'h4)];
            end
          else
            begin
              reg217 <= wire183[(2'h2):(1'h0)];
              reg218 <= {(^~reg192[(2'h2):(2'h2)]),
                  ((((8'hb9) < (reg195 <<< reg216)) >> wire173[(4'hb):(4'hb)]) ^~ $unsigned(reg191))};
              reg219 <= (($unsigned($signed($signed(reg206))) ?
                      {($unsigned((7'h40)) ?
                              (~reg194) : (wire213 != wire173))} : $unsigned(reg184[(1'h1):(1'h0)])) ?
                  (^reg180[(2'h3):(2'h3)]) : $unsigned(((reg209[(2'h3):(1'h0)] ?
                      (reg193 ?
                          reg184 : reg196) : reg195) * reg207[(4'ha):(3'h7)])));
              reg220 <= (^~$unsigned((((reg195 ~^ wire183) ?
                  $signed(wire175) : wire183[(2'h3):(2'h2)]) >> $unsigned($unsigned(reg194)))));
              reg221 <= (8'had);
            end
          if (reg189[(3'h4):(2'h2)])
            begin
              reg222 <= ($unsigned((+reg221[(3'h6):(3'h5)])) ?
                  ((reg198[(1'h0):(1'h0)] ?
                      $unsigned((~reg190)) : reg218[(3'h6):(3'h4)]) >>> (((+reg187) ?
                          wire182[(4'hf):(1'h1)] : {reg206}) ?
                      {(reg216 ? (8'ha4) : reg189),
                          $unsigned(reg197)} : ((reg178 ? reg218 : wire175) ?
                          wire177[(4'h8):(4'h8)] : wire175[(2'h3):(2'h3)]))) : {(8'ha6)});
              reg223 <= (&($unsigned((|(reg180 ? (8'h9e) : reg187))) ?
                  reg219[(2'h3):(1'h0)] : $signed(($unsigned(wire177) * (reg198 + reg216)))));
            end
          else
            begin
              reg222 <= reg206[(1'h1):(1'h1)];
            end
        end
      else
        begin
          if (wire213)
            begin
              reg216 <= $unsigned($unsigned(((reg222[(1'h1):(1'h1)] ?
                      (&(8'hbc)) : wire177[(3'h5):(2'h2)]) ?
                  $unsigned($signed(reg191)) : ($signed(reg207) >>> $signed((8'hb9))))));
              reg217 <= ((&reg198) ?
                  (8'ha9) : (($unsigned($unsigned(reg223)) ?
                          ((|(7'h42)) != $unsigned(wire213)) : ((reg217 ~^ reg203) ?
                              reg188 : {wire183, reg194})) ?
                      (reg220[(3'h4):(2'h3)] + reg199[(3'h5):(3'h4)]) : (wire177[(4'hb):(1'h1)] ?
                          $unsigned({wire173,
                              wire182}) : $signed($signed(reg196)))));
              reg218 <= ($signed(($signed((wire177 ? reg200 : wire177)) ?
                      {(reg217 & reg197),
                          reg207} : $unsigned($unsigned((7'h41))))) ?
                  wire174[(3'h7):(3'h5)] : reg178[(1'h1):(1'h0)]);
            end
          else
            begin
              reg216 <= ($unsigned((((reg212 | (8'ha0)) ?
                      (~|reg217) : $signed(wire176)) + wire181[(4'h8):(3'h5)])) ?
                  $unsigned(((reg211[(3'h6):(2'h3)] ?
                      $signed(reg191) : ((8'hac) ?
                          reg222 : (8'ha3))) < (^{reg221}))) : $unsigned((|(^~$unsigned(wire175)))));
              reg217 <= ((($signed((reg191 ?
                      reg202 : reg207)) ^~ (~&(reg186 == (8'ha1)))) ?
                  (~&reg201[(4'ha):(4'ha)]) : reg223[(5'h12):(3'h7)]) * reg208[(1'h0):(1'h0)]);
              reg218 <= (-(~($unsigned(reg197[(1'h1):(1'h0)]) ?
                  wire177[(4'h9):(3'h7)] : wire173[(2'h3):(2'h3)])));
            end
        end
    end
endmodule

module module108  (y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h241):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire112;
  input wire signed [(2'h3):(1'h0)] wire111;
  input wire [(5'h13):(1'h0)] wire110;
  input wire signed [(3'h4):(1'h0)] wire109;
  wire signed [(4'hb):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire164;
  wire signed [(4'hf):(1'h0)] wire163;
  wire [(4'ha):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire161;
  wire [(5'h10):(1'h0)] wire160;
  wire signed [(4'hc):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire143;
  wire signed [(3'h6):(1'h0)] wire142;
  wire [(3'h6):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  wire signed [(3'h7):(1'h0)] wire139;
  wire [(5'h10):(1'h0)] wire138;
  wire [(4'hb):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire117;
  wire signed [(5'h12):(1'h0)] wire116;
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg [(5'h10):(1'h0)] reg155 = (1'h0);
  reg [(5'h10):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire117,
                 wire116,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
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
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg113 <= wire110;
      reg114 <= (wire110 ? (wire111 && reg113[(2'h3):(1'h0)]) : wire112);
      reg115 <= ($signed((7'h44)) ^ reg114[(2'h3):(2'h3)]);
    end
  assign wire116 = $signed((~^(wire110[(4'h9):(4'h9)] ?
                       (wire109 ?
                           $signed(wire112) : reg115) : (wire109[(1'h0):(1'h0)] ?
                           $unsigned(reg115) : {reg115, wire112}))));
  assign wire117 = ((reg114 ?
                       {$unsigned(reg114[(1'h1):(1'h0)]),
                           (~^$signed((8'ha8)))} : (((wire110 > wire110) ?
                               (&reg115) : $signed((8'hbb))) ?
                           $unsigned({(8'hb6)}) : wire109[(1'h1):(1'h1)])) * (+$unsigned((~&reg113))));
  always
    @(posedge clk) begin
      reg118 <= ((~&reg113) ? (8'hbb) : reg114[(2'h2):(1'h1)]);
      if ((wire116 ?
          $signed({$unsigned($unsigned(reg115)),
              $unsigned($signed(reg114))}) : ((reg115[(4'h8):(3'h4)] != (&$signed(reg118))) ^~ (wire112 != (+(wire111 << reg118))))))
        begin
          if (wire109)
            begin
              reg119 <= wire112[(1'h0):(1'h0)];
              reg120 <= (~|(wire117[(1'h0):(1'h0)] ?
                  $signed(reg118[(1'h1):(1'h0)]) : reg113));
            end
          else
            begin
              reg119 <= $signed({(({wire117} ?
                          (|reg115) : (reg114 ? reg120 : reg120)) ?
                      reg119[(1'h0):(1'h0)] : ((reg115 ?
                          reg114 : wire111) >>> $unsigned((8'hbb)))),
                  {$unsigned({reg119, wire110})}});
              reg120 <= wire117;
              reg121 <= (^$signed($unsigned($signed($signed(wire112)))));
              reg122 <= reg121[(1'h1):(1'h0)];
            end
          reg123 <= wire112[(3'h7):(2'h3)];
        end
      else
        begin
          reg119 <= (((|($signed(reg122) ? (&reg114) : wire110)) ?
                  $signed((~^((7'h40) ? reg120 : wire117))) : ((&(wire117 ?
                          reg120 : reg123)) ?
                      $signed((reg119 ?
                          reg120 : reg122)) : $signed({reg114}))) ?
              $unsigned(reg123[(1'h0):(1'h0)]) : (8'ha9));
          reg120 <= $unsigned({(((reg119 ?
                  reg120 : (8'ha8)) & (wire112 ~^ reg118)) | (wire110[(1'h1):(1'h0)] ?
                  reg123[(4'hb):(3'h7)] : wire109[(3'h4):(2'h3)]))});
        end
      if (reg118)
        begin
          reg124 <= wire116;
          reg125 <= wire110[(3'h6):(3'h5)];
          if ((8'ha7))
            begin
              reg126 <= wire117[(3'h5):(1'h1)];
              reg127 <= $unsigned({(reg118[(2'h2):(2'h2)] * (8'h9e)), reg118});
              reg128 <= $signed({{(reg126[(4'hd):(3'h7)] | (reg119 ?
                          reg119 : reg119))},
                  reg114[(2'h2):(2'h2)]});
              reg129 <= reg113;
              reg130 <= (((~|reg126) ?
                  wire112 : {reg121, (~(~|wire111))}) ^ (wire116 <<< reg119));
            end
          else
            begin
              reg126 <= ({$unsigned($unsigned($unsigned(reg119)))} && reg125);
              reg127 <= wire116[(5'h10):(1'h1)];
              reg128 <= (|((~((reg128 && reg125) ?
                  $signed(reg129) : $signed(wire109))) << (reg119[(1'h0):(1'h0)] >>> ((wire116 ?
                  reg122 : (8'hba)) <<< (reg113 >>> reg115)))));
            end
          if (($unsigned(((8'ha2) != (wire111 ?
              (reg119 << reg113) : $unsigned(wire116)))) != (~^$signed(reg113))))
            begin
              reg131 <= (reg125[(4'h8):(3'h7)] ?
                  reg124 : $signed((|(~&$unsigned(reg123)))));
              reg132 <= (({reg118[(2'h2):(1'h0)]} ?
                  {$signed({reg115})} : (reg118[(1'h0):(1'h0)] ~^ ($unsigned(wire117) <= reg125[(4'ha):(2'h3)]))) << ($signed((~$signed(wire109))) ^ (-{$signed(reg126)})));
              reg133 <= $unsigned(($signed({reg121[(3'h5):(2'h3)],
                      (reg121 ? wire117 : reg113)}) ?
                  reg126 : (~^(!$unsigned(reg130)))));
              reg134 <= wire112[(3'h5):(3'h5)];
              reg135 <= ({$signed(((reg121 ? reg131 : reg134) ?
                          (~|reg132) : (|reg134))),
                      reg128[(1'h0):(1'h0)]} ?
                  (^(reg122 >> $unsigned((wire109 ~^ wire117)))) : $unsigned((7'h41)));
            end
          else
            begin
              reg131 <= (wire112[(2'h3):(1'h1)] >= reg128[(1'h1):(1'h0)]);
              reg132 <= reg115;
            end
        end
      else
        begin
          reg124 <= (reg133 <<< $signed({$unsigned((reg134 | reg118)),
              (~^$signed(wire111))}));
          reg125 <= reg124;
          reg126 <= reg119[(1'h0):(1'h0)];
          reg127 <= $signed(reg129[(4'hd):(2'h3)]);
          if ((-reg121[(3'h4):(2'h3)]))
            begin
              reg128 <= reg132;
            end
          else
            begin
              reg128 <= (^({(^~reg119)} == reg122[(3'h4):(1'h0)]));
              reg129 <= {(reg119[(1'h0):(1'h0)] < wire109[(3'h4):(1'h1)]),
                  (reg133[(4'hf):(4'hf)] >> wire116[(1'h0):(1'h0)])};
              reg130 <= $signed($signed((|{(8'hb3)})));
            end
        end
      reg136 <= ((!(((wire117 ? (7'h42) : (8'hb4)) ?
              reg122[(1'h0):(1'h0)] : reg120[(4'hb):(2'h3)]) == ($unsigned(reg130) ?
              (+reg127) : {reg114, reg124}))) ?
          (8'h9f) : reg127);
    end
  assign wire137 = wire116[(2'h2):(1'h0)];
  assign wire138 = ({((+(reg115 ? wire117 : reg130)) ?
                           $signed($unsigned(reg118)) : $unsigned((reg136 ?
                               reg126 : reg118))),
                       (~^reg125[(4'h9):(1'h0)])} < (|(($unsigned(wire109) ^~ $unsigned(reg119)) < ($unsigned(reg129) ?
                       {reg126} : reg119[(3'h6):(1'h1)]))));
  assign wire139 = $signed(reg132[(4'h9):(3'h6)]);
  assign wire140 = ((~(^(((7'h40) ? (8'ha7) : reg131) ?
                           reg124 : ((8'hba) | reg120)))) ?
                       $unsigned(({((8'h9c) ? reg115 : wire112)} ?
                           $signed((-(8'hb7))) : $signed((|wire110)))) : $signed($signed((reg128 ^~ (wire109 ?
                           reg136 : reg121)))));
  assign wire141 = {reg135, reg125[(4'h8):(1'h0)]};
  assign wire142 = reg125;
  assign wire143 = {(wire117[(2'h3):(2'h3)] ?
                           reg124[(1'h0):(1'h0)] : $signed(((wire138 ?
                               wire112 : wire137) * ((8'ha7) | (8'hb2)))))};
  always
    @(posedge clk) begin
      reg144 <= $signed($signed({(!wire138[(3'h5):(3'h4)])}));
      reg145 <= ($signed($signed(reg124[(1'h0):(1'h0)])) + reg129[(3'h5):(3'h5)]);
      if (reg132[(3'h7):(3'h6)])
        begin
          reg146 <= ($signed(($signed(reg118) ^ wire141[(3'h4):(1'h1)])) >>> reg134[(2'h2):(1'h0)]);
        end
      else
        begin
          reg146 <= ((reg114 * $unsigned({$signed(reg115)})) <= (-(^$signed((&reg145)))));
          reg147 <= reg124[(1'h1):(1'h0)];
          if (({($signed(wire112) ?
                      reg124[(3'h6):(1'h0)] : $unsigned($unsigned(wire137))),
                  reg120} ?
              reg129 : ($unsigned($signed($unsigned(reg125))) ?
                  wire141 : reg131)))
            begin
              reg148 <= $unsigned((8'ha9));
              reg149 <= reg147[(5'h10):(3'h6)];
              reg150 <= (reg118 ?
                  $signed(reg129[(3'h6):(3'h5)]) : wire109[(1'h0):(1'h0)]);
              reg151 <= (~reg128);
              reg152 <= $signed(wire111[(2'h3):(2'h2)]);
            end
          else
            begin
              reg148 <= reg132[(2'h2):(1'h0)];
            end
          reg153 <= reg148;
          if ($unsigned(reg120))
            begin
              reg154 <= reg145[(1'h1):(1'h1)];
              reg155 <= $unsigned(((reg118[(4'hc):(4'h9)] ?
                  (reg114[(2'h2):(1'h1)] ?
                      ((8'ha6) ?
                          reg127 : reg125) : reg122[(3'h4):(2'h3)]) : (^~wire138[(4'h8):(3'h6)])) ^ (~^$signed(wire137))));
              reg156 <= $signed($signed(reg121[(3'h5):(1'h1)]));
              reg157 <= $signed(wire116[(1'h1):(1'h1)]);
            end
          else
            begin
              reg154 <= (8'h9c);
              reg155 <= reg157;
              reg156 <= (reg124[(3'h7):(3'h7)] ^~ reg146[(2'h2):(1'h1)]);
              reg157 <= reg136[(3'h5):(3'h5)];
            end
        end
    end
  assign wire158 = wire141[(3'h4):(2'h3)];
  assign wire159 = (8'ha2);
  assign wire160 = reg129[(4'h8):(2'h2)];
  assign wire161 = (reg114[(2'h3):(2'h2)] + $unsigned((&(((8'had) ^~ reg157) + reg122[(1'h1):(1'h0)]))));
  assign wire162 = (($signed(reg123) >> ((+{wire143, reg149}) ?
                       ($signed(reg119) > reg118) : (reg120[(2'h3):(1'h1)] ?
                           (reg118 ? reg131 : (8'hab)) : {reg128,
                               reg146}))) <= $signed((|reg136[(2'h3):(2'h3)])));
  assign wire163 = wire142[(3'h4):(1'h1)];
  assign wire164 = {reg157[(4'he):(1'h1)], $signed((~wire162))};
  assign wire165 = (~^{$unsigned(wire111)});
endmodule

module module87
#(parameter param102 = (^~((8'ha8) > (&((8'ha0) ? {(8'hb0), (8'hbf)} : ((7'h40) || (8'had)))))), 
parameter param103 = {(+(~&param102))})
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire92;
  input wire signed [(2'h3):(1'h0)] wire91;
  input wire signed [(4'he):(1'h0)] wire90;
  input wire signed [(5'h12):(1'h0)] wire89;
  input wire [(5'h13):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg93 <= ({$unsigned($signed(wire92[(1'h0):(1'h0)])),
          wire91} && $signed(wire89[(4'h9):(2'h3)]));
      if (reg93)
        begin
          reg94 <= ((-({wire90[(4'hd):(3'h6)], $unsigned(wire88)} >> ({reg93} ?
              $signed(wire90) : wire88))) == {$unsigned((8'ha2)),
              wire88[(4'hf):(3'h6)]});
          reg95 <= $signed(wire89[(5'h12):(4'ha)]);
          reg96 <= (~|($signed($unsigned((wire92 ? reg93 : reg94))) ?
              ((~reg94) ?
                  $signed(reg95) : reg94[(4'hb):(2'h3)]) : $signed((^~(~^reg95)))));
          reg97 <= ((+($unsigned(reg96[(4'ha):(4'h9)]) > (|(^wire90)))) ?
              reg94[(1'h0):(1'h0)] : $unsigned({reg96, reg94[(4'hb):(3'h7)]}));
        end
      else
        begin
          reg94 <= $unsigned(({wire92, $signed((-wire91))} ?
              ($signed((reg93 ? (8'haf) : (8'hba))) && (((8'ha4) ^ wire92) ?
                  wire90 : {wire91,
                      (8'hb2)})) : ($unsigned({wire91}) ^~ {(!reg93),
                  (wire90 >= wire88)})));
          reg95 <= {reg95[(3'h7):(1'h0)],
              (wire91 ?
                  ($unsigned($signed(wire88)) > (~|wire92[(3'h6):(1'h0)])) : (~|$signed((wire91 >>> wire89))))};
          reg96 <= wire92[(2'h2):(2'h2)];
        end
      reg98 <= $unsigned($unsigned($unsigned((wire88 ?
          wire89[(2'h2):(1'h1)] : (wire91 > reg96)))));
    end
  assign wire99 = {wire91[(1'h0):(1'h0)], (8'ha4)};
  assign wire100 = ((reg98[(1'h0):(1'h0)] ~^ (reg97 | ($signed(reg97) ?
                           (reg95 ? wire89 : reg97) : (wire90 <<< wire88)))) ?
                       $unsigned(((&wire90[(4'hd):(3'h5)]) != (~|$unsigned(wire92)))) : reg98[(1'h0):(1'h0)]);
  assign wire101 = $signed({$unsigned({$signed(reg93)})});
endmodule
