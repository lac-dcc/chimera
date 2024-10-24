module top
#(parameter param182 = (~|(&((((8'ha7) ? (7'h41) : (8'ha6)) == ((8'hbd) ? (8'hb7) : (8'hac))) && ((|(8'h9e)) && ((7'h43) ? (8'h9e) : (8'h9c)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire181;
  wire signed [(2'h3):(1'h0)] wire180;
  wire signed [(3'h4):(1'h0)] wire179;
  wire [(3'h7):(1'h0)] wire177;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire71;
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire177,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire4,
                 wire71,
                 (1'h0)};
  assign wire4 = (~$unsigned({$unsigned((wire0 > (8'hbd))), (~^wire2)}));
  module5 #() modinst72 (wire71, clk, wire3, wire1, wire0, wire2, wire4);
  assign wire73 = {wire0[(5'h14):(1'h0)]};
  assign wire74 = $signed((|$unsigned(({wire3, (8'ha2)} ?
                      $signed(wire2) : (~^wire1)))));
  assign wire75 = wire73[(1'h1):(1'h1)];
  assign wire76 = $unsigned(wire73[(3'h4):(2'h3)]);
  assign wire77 = wire1[(4'h8):(3'h7)];
  assign wire78 = (~|{$signed($signed($unsigned(wire1))),
                      $unsigned($unsigned((wire1 > wire1)))});
  assign wire79 = ($unsigned((wire3 ?
                      $signed(wire71) : $signed((wire4 ?
                          (8'ha4) : wire71)))) * (wire3 ?
                      ((8'ha3) ?
                          (~&wire1[(2'h3):(2'h3)]) : (wire77[(5'h12):(2'h2)] != (wire74 ?
                              wire78 : wire3))) : (~(wire0 ?
                          (wire78 ^ wire77) : wire74))));
  module80 #() modinst178 (.wire84(wire3), .wire81(wire79), .wire82(wire2), .clk(clk), .wire83(wire76), .y(wire177));
  assign wire179 = wire71[(2'h3):(1'h0)];
  assign wire180 = wire73[(3'h5):(3'h5)];
  assign wire181 = wire75[(3'h5):(1'h0)];
endmodule

module module80
#(parameter param175 = ({((8'hb1) ? (8'hb3) : {((8'ha2) < (8'hb3))})} ^~ (((((8'hac) < (8'h9d)) > ((8'hb9) ? (8'hb2) : (8'hb1))) || (^((8'hb3) & (8'hbb)))) ? (8'h9e) : {(((8'hbf) ? (8'hb7) : (8'hba)) ? (+(8'hb9)) : {(8'hb6)})})), 
parameter param176 = ((param175 - (~(&(param175 ? param175 : param175)))) ? ({(+param175)} ~^ (param175 ? ((param175 ? param175 : param175) << {param175, param175}) : param175)) : (param175 ? (^~param175) : (7'h43))))
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire84;
  input wire signed [(5'h13):(1'h0)] wire83;
  input wire [(5'h14):(1'h0)] wire82;
  input wire [(5'h14):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire174;
  wire signed [(4'hf):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire162;
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg signed [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg168 = (1'h0);
  reg [(3'h7):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  assign y = {wire174,
                 wire130,
                 wire85,
                 wire162,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 (1'h0)};
  assign wire85 = $unsigned(wire82);
  module86 #() modinst131 (.y(wire130), .wire91(wire82), .wire88(wire83), .wire87(wire81), .wire90(wire85), .clk(clk), .wire89(wire84));
  module132 #() modinst163 (wire162, clk, wire130, wire81, wire85, wire84, wire83);
  always
    @(posedge clk) begin
      reg164 <= wire85[(5'h11):(4'h8)];
      if (reg164)
        begin
          reg165 <= (reg164 ?
              ((((wire83 >>> wire81) < (~&reg164)) ?
                      ($unsigned(wire130) ?
                          (wire85 + wire81) : (wire85 == wire85)) : (~(~&wire130))) ?
                  (({wire83} ?
                      ((8'hbd) >= (8'hb3)) : (wire82 == reg164)) || (8'had)) : ($signed({wire83}) != wire84)) : wire162[(1'h1):(1'h0)]);
        end
      else
        begin
          if ($unsigned($unsigned((~(wire130 ?
              $unsigned((7'h40)) : $unsigned((8'hb8)))))))
            begin
              reg165 <= {(~&((^~reg165[(3'h4):(1'h0)]) ?
                      ((^~wire83) ?
                          (wire130 ? wire82 : wire130) : (wire84 ?
                              wire81 : wire162)) : ((wire82 ?
                          wire82 : wire85) > $signed(wire162)))),
                  $unsigned(($unsigned(wire81[(5'h13):(1'h0)]) ?
                      ($unsigned(wire81) + $unsigned(wire162)) : $unsigned((wire82 <= wire83))))};
            end
          else
            begin
              reg165 <= (wire83 ?
                  (^~$signed(((wire130 ? reg165 : wire84) ?
                      (wire81 * reg165) : $signed(wire81)))) : (reg164[(2'h3):(2'h3)] ?
                      ((wire83[(4'hb):(3'h5)] <<< {(7'h40),
                          reg165}) <<< wire83) : {reg165,
                          $unsigned((reg164 ? wire162 : wire83))}));
              reg166 <= wire84;
              reg167 <= (~&wire162[(1'h1):(1'h0)]);
            end
          reg168 <= wire84[(2'h2):(1'h1)];
          reg169 <= ((wire81[(2'h2):(2'h2)] ?
                  $signed($signed(wire84)) : {($unsigned(wire83) ^~ $signed(wire84))}) ?
              reg166 : ($signed($signed(wire82[(2'h3):(2'h2)])) ?
                  (!reg166) : wire130));
          reg170 <= $unsigned(wire84);
          reg171 <= reg165;
        end
      reg172 <= $unsigned(((($signed(reg171) <= (reg168 ?
          reg166 : reg170)) <<< $signed(wire82[(2'h2):(2'h2)])) >> (((wire84 ?
              wire130 : wire162) == wire83[(3'h5):(2'h3)]) ?
          $unsigned($signed((8'hb2))) : $unsigned(reg167))));
      reg173 <= (&($signed({(8'ha3)}) && $signed(((reg167 ? reg168 : wire85) ?
          {(8'hbe)} : (wire130 ? wire130 : reg165)))));
    end
  assign wire174 = $signed($unsigned({reg172[(4'hc):(3'h4)]}));
endmodule

module module5
#(parameter param69 = ((-({(7'h40), ((8'hba) + (8'h9f))} << (((8'ha7) ~^ (8'ha0)) ? {(8'hbb)} : ((8'hb4) * (8'haf))))) ? (8'hbb) : {{((8'hb8) ? ((8'hb3) * (8'ha0)) : {(8'hb9)})}}), 
parameter param70 = ((|param69) | param69))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  assign y = {wire68,
                 wire67,
                 wire65,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire12,
                 wire11,
                 (1'h0)};
  assign wire11 = (^~({$signed(wire6[(4'h8):(3'h6)])} ?
                      $unsigned(wire10[(3'h4):(3'h4)]) : {wire9}));
  assign wire12 = ((wire7[(4'hb):(3'h5)] ?
                      $unsigned({(wire8 ? wire11 : wire9),
                          $signed(wire8)}) : {((&wire7) >> $signed(wire10)),
                          {((8'hb3) ?
                                  (8'hb0) : wire7)}}) || wire10[(4'hc):(2'h3)]);
  module13 #() modinst40 (.wire15(wire7), .clk(clk), .wire16(wire8), .wire17(wire12), .y(wire39), .wire14(wire11));
  assign wire41 = (^~wire39[(3'h7):(2'h3)]);
  assign wire42 = wire12;
  assign wire43 = ((wire11[(3'h7):(2'h2)] >>> $signed($signed((wire41 ?
                          wire41 : wire9)))) ?
                      (wire42[(4'hd):(4'hc)] ? wire10 : wire8) : (+(8'hb9)));
  assign wire44 = wire8[(4'h8):(3'h4)];
  assign wire45 = $unsigned(wire41);
  assign wire46 = {($signed($signed($unsigned(wire7))) | ({$signed(wire42)} ?
                          ((wire9 & wire10) ?
                              $signed(wire43) : {wire43, wire44}) : (&wire11))),
                      $unsigned($signed($signed((8'h9d))))};
  assign wire47 = wire42[(5'h12):(1'h1)];
  assign wire48 = $unsigned($signed(wire6[(3'h7):(3'h6)]));
  assign wire49 = $signed(wire47[(1'h1):(1'h1)]);
  assign wire50 = wire47;
  assign wire51 = $signed(($signed((^{(8'hbd)})) * $signed(wire9)));
  module52 #() modinst66 (.wire54(wire48), .clk(clk), .wire55(wire43), .wire56(wire11), .y(wire65), .wire53(wire39));
  assign wire67 = (wire12[(3'h4):(3'h4)] > wire8);
  assign wire68 = (8'h9c);
endmodule

module module52  (y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire56;
  input wire signed [(3'h4):(1'h0)] wire55;
  input wire signed [(5'h11):(1'h0)] wire54;
  input wire [(5'h10):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire57;
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire57,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire57 = $signed(wire56[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg58 <= wire55;
      reg59 <= {($signed((((8'had) ? wire53 : wire56) ^~ ((8'ha0) > wire57))) ?
              $unsigned((wire56[(4'ha):(4'h9)] ?
                  $unsigned(wire56) : (!wire53))) : (!wire56))};
    end
  assign wire60 = $signed((&{{(wire53 >= (8'hbc)), (reg58 > wire55)}}));
  assign wire61 = $unsigned(wire57[(4'h9):(2'h3)]);
  assign wire62 = wire56;
  assign wire63 = $signed((wire55[(2'h3):(2'h2)] ?
                      (~&{reg58}) : (wire56[(1'h1):(1'h0)] >> ($unsigned(wire61) ?
                          (-wire54) : wire55))));
  assign wire64 = $signed(((((8'h9c) <<< $unsigned(wire61)) ?
                          (~^$unsigned(wire63)) : (-$unsigned(wire57))) ?
                      $unsigned($signed((wire55 && (8'ha5)))) : {$unsigned(wire53[(4'hb):(1'h0)]),
                          ($signed(wire56) ? {(8'ha6)} : (&wire62))}));
endmodule

module module13
#(parameter param38 = (-((~^(|(^~(8'ha8)))) < {({(8'hb2), (8'ha2)} ? {(8'hb6), (8'hb4)} : ((8'ha1) == (8'ha9)))})))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire [(3'h6):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 (1'h0)};
  assign wire18 = {(wire16[(3'h4):(1'h0)] ^ (~&wire15)),
                      {$signed((8'ha8)), $signed(wire16[(5'h14):(4'ha)])}};
  assign wire19 = wire15;
  assign wire20 = wire18;
  assign wire21 = $signed(($unsigned((7'h44)) ~^ $signed(wire20[(5'h12):(1'h0)])));
  assign wire22 = (~((-$unsigned($unsigned(wire20))) ?
                      (+(~(wire16 == wire20))) : (7'h41)));
  assign wire23 = $signed($signed(((~|$signed((8'hbc))) ?
                      (8'hac) : wire15[(2'h2):(1'h1)])));
  assign wire24 = wire21[(4'h8):(2'h3)];
  assign wire25 = (~^wire19[(4'hf):(4'he)]);
  assign wire26 = wire14[(1'h0):(1'h0)];
  assign wire27 = $signed(wire16[(5'h13):(5'h12)]);
  assign wire28 = wire27;
  assign wire29 = ((&(8'h9d)) << ((~&($signed(wire28) ?
                      (wire14 < wire23) : $signed(wire21))) > (-$unsigned((wire28 >>> wire23)))));
  assign wire30 = wire16;
  assign wire31 = wire19[(3'h4):(2'h2)];
  assign wire32 = $signed($signed(($signed((!wire26)) ?
                      (~^wire31[(1'h0):(1'h0)]) : ((~^(8'ha7)) ?
                          (^wire20) : $signed(wire22)))));
  assign wire33 = {$unsigned($unsigned((!wire30))), wire27[(3'h5):(2'h3)]};
  assign wire34 = $unsigned($unsigned($unsigned((wire32 ?
                      $signed(wire27) : (wire32 ? wire22 : wire19)))));
  assign wire35 = wire23[(3'h5):(3'h5)];
  assign wire36 = wire30[(4'ha):(2'h3)];
  assign wire37 = {(wire36 && (wire36[(3'h4):(1'h0)] != wire28[(1'h0):(1'h0)]))};
endmodule

module module132
#(parameter param161 = ((((8'haa) || (8'hae)) <= (({(8'hb9), (8'hb3)} ? (~(8'hb5)) : ((8'ha9) ? (8'ha8) : (8'h9d))) ? ((!(8'haf)) ? ((7'h42) ? (8'hbe) : (8'hb4)) : ((8'ha9) ? (8'hb5) : (8'h9c))) : {(~(8'ha1))})) ? (((((8'hb9) ? (8'ha8) : (8'ha7)) ? ((8'ha9) ? (8'ha1) : (8'hb1)) : (-(8'hbb))) ? (+{(8'ha8), (8'hac)}) : ({(7'h40), (8'hbe)} - {(8'hbc), (8'haf)})) * {({(8'ha5)} >= (^~(8'hb1))), (^~{(8'ha8), (8'hb3)})}) : ((-(8'ha7)) >>> (^~((8'hac) <<< ((8'ha2) * (8'hae)))))))
(y, clk, wire137, wire136, wire135, wire134, wire133);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire137;
  input wire [(4'hd):(1'h0)] wire136;
  input wire signed [(3'h5):(1'h0)] wire135;
  input wire [(4'he):(1'h0)] wire134;
  input wire signed [(4'h9):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire160;
  wire [(4'hd):(1'h0)] wire159;
  wire signed [(5'h10):(1'h0)] wire158;
  wire signed [(4'he):(1'h0)] wire157;
  wire [(4'h8):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire155;
  wire [(5'h14):(1'h0)] wire154;
  wire signed [(5'h14):(1'h0)] wire153;
  wire [(4'hd):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire145;
  wire [(4'h8):(1'h0)] wire144;
  wire signed [(4'h9):(1'h0)] wire139;
  wire [(3'h7):(1'h0)] wire138;
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire146,
                 wire145,
                 wire144,
                 wire139,
                 wire138,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  assign wire138 = wire133;
  assign wire139 = wire137;
  always
    @(posedge clk) begin
      if (wire138[(1'h1):(1'h1)])
        begin
          reg140 <= $signed($signed(((|$unsigned((8'h9e))) | (|((8'hb7) ?
              (8'haa) : wire137)))));
        end
      else
        begin
          reg140 <= $unsigned(wire133);
          reg141 <= wire137;
          reg142 <= ((8'hbe) ? wire135 : $unsigned(wire137));
        end
      reg143 <= $signed((&(-((reg142 > (8'hb8)) ?
          ((8'hbc) ? wire133 : wire133) : wire138))));
    end
  assign wire144 = reg142;
  assign wire145 = {(&wire139)};
  assign wire146 = $signed((&wire139));
  always
    @(posedge clk) begin
      reg147 <= reg143;
      reg148 <= ({$unsigned($signed(wire138[(1'h1):(1'h0)]))} > wire136[(1'h0):(1'h0)]);
      reg149 <= {wire146, (wire139 | $signed(wire144))};
      reg150 <= (wire134 ? {$signed((8'hae)), wire133} : reg148);
    end
  assign wire151 = (~wire134);
  assign wire152 = wire137[(3'h5):(3'h4)];
  assign wire153 = wire146[(3'h6):(2'h2)];
  assign wire154 = reg143[(1'h0):(1'h0)];
  assign wire155 = {reg141[(4'h9):(4'h9)], reg150[(1'h1):(1'h0)]};
  assign wire156 = ((8'hb5) ?
                       $signed((reg142 ?
                           ((!reg148) + $signed((8'hb8))) : $unsigned(reg142))) : (~|({reg147[(5'h11):(4'hb)]} ?
                           $unsigned(wire146[(4'ha):(3'h6)]) : wire136)));
  assign wire157 = (~^{(wire155[(5'h11):(4'h9)] ?
                           $unsigned((wire156 ?
                               wire152 : wire155)) : $signed((^wire135)))});
  assign wire158 = $unsigned({{{(~|(8'hb8)), $signed(wire135)},
                           wire146[(4'ha):(4'ha)]}});
  assign wire159 = wire154;
  assign wire160 = $unsigned((-wire133[(3'h5):(1'h1)]));
endmodule

module module86
#(parameter param128 = (-(({((8'hab) <<< (8'hb3))} ? (!{(8'hbf)}) : (~^(~&(8'haa)))) ? ({((8'hb9) ^~ (8'h9c)), (|(8'ha7))} ? {(!(8'haa)), ((8'hb4) + (8'ha6))} : (((8'haf) >> (7'h42)) ? (~^(8'hab)) : {(8'hb0), (8'hb2)})) : (^((+(8'ha0)) ^ (^(8'ha1)))))), 
parameter param129 = param128)
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire91;
  input wire signed [(5'h14):(1'h0)] wire90;
  input wire signed [(5'h10):(1'h0)] wire89;
  input wire signed [(5'h13):(1'h0)] wire88;
  input wire signed [(2'h2):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire120;
  wire [(3'h7):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire104;
  wire [(5'h11):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire115,
                 wire104,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 reg127,
                 reg126,
                 reg125,
                 reg117,
                 reg116,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire92 = {($signed((wire90 <= (8'haa))) ?
                          wire90 : $unsigned(((8'hb1) == {(8'hb4)})))};
  assign wire93 = $unsigned((~|wire88));
  assign wire94 = {wire90[(5'h10):(1'h1)]};
  assign wire95 = wire94[(2'h2):(1'h0)];
  assign wire96 = ($signed(wire93[(1'h0):(1'h0)]) ^~ wire89[(4'h9):(2'h3)]);
  assign wire97 = (^~(wire91[(5'h13):(1'h1)] + ($signed(wire87) != $signed({wire90}))));
  assign wire98 = $unsigned(($signed($unsigned($unsigned((8'hac)))) ^~ $unsigned(wire97)));
  assign wire99 = $unsigned(wire92);
  assign wire100 = $unsigned({$unsigned((wire93[(4'h8):(1'h1)] ?
                           (wire96 ? wire89 : wire94) : $unsigned(wire92)))});
  always
    @(posedge clk) begin
      reg101 <= $signed((!(($signed(wire99) ? (wire91 < wire87) : (&wire90)) ?
          ((wire91 ? wire88 : wire96) ?
              (wire88 & wire98) : $unsigned(wire95)) : $signed({wire97,
              wire94}))));
      reg102 <= wire94[(3'h4):(3'h4)];
      reg103 <= $signed(($signed($unsigned((wire87 ? wire100 : reg101))) ?
          {(+{wire93, wire87}),
              {$signed(wire87), $signed(reg101)}} : (((~wire97) ^~ (wire95 ?
                  wire87 : wire87)) ?
              $signed(wire92) : $signed((|(8'h9e))))));
    end
  assign wire104 = ($signed((^~((wire100 ? wire93 : wire92) ?
                       $unsigned(wire97) : (wire88 ?
                           (8'hbf) : reg101)))) | (wire89 ?
                       wire87[(2'h2):(2'h2)] : wire100));
  always
    @(posedge clk) begin
      if ((wire95 ?
          $unsigned((($signed(wire104) ?
              ((8'h9c) ? (8'had) : wire100) : (wire94 | (7'h44))) == (|(reg101 ?
              wire98 : wire98)))) : (wire100[(4'hf):(1'h0)] ?
              $signed((~|wire94[(4'ha):(3'h5)])) : (^~wire91[(2'h2):(1'h0)]))))
        begin
          if ($signed($signed(wire96[(3'h6):(1'h0)])))
            begin
              reg105 <= (((((wire98 && wire87) ~^ ((8'h9e) | wire100)) ?
                          (8'hbd) : $signed($signed(wire99))) ?
                      ($signed(wire91[(4'hd):(1'h0)]) * $unsigned((~&wire99))) : $unsigned($unsigned($signed(wire99)))) ?
                  wire92 : (-(~&(wire89[(4'h8):(3'h7)] >= reg102))));
              reg106 <= $unsigned(wire90);
              reg107 <= (~wire100);
            end
          else
            begin
              reg105 <= ($signed(wire90) ^~ (~reg106));
            end
          reg108 <= (|$signed(($signed($signed(wire99)) & $unsigned(wire95[(4'h8):(2'h3)]))));
          reg109 <= reg105;
          reg110 <= wire89;
          reg111 <= {(wire104[(1'h0):(1'h0)] <<< reg103[(2'h2):(1'h0)]),
              wire89[(4'hf):(4'hd)]};
        end
      else
        begin
          reg105 <= $unsigned($signed({((wire94 >> reg108) ?
                  ((7'h44) ? wire89 : reg107) : $signed(wire96)),
              wire104[(2'h3):(2'h3)]}));
          reg106 <= ($signed($signed($unsigned({reg109, wire100}))) ?
              (~|wire87) : $unsigned(reg107[(4'hf):(3'h5)]));
        end
      reg112 <= $signed((({$unsigned(reg111)} ?
              reg110 : (~|$unsigned((8'haa)))) ?
          {{$signed(reg101), $signed(wire99)},
              $unsigned($signed(reg110))} : (+((wire90 ?
              reg109 : wire104) << {wire94}))));
      reg113 <= {$signed($unsigned($unsigned((~^wire88))))};
      reg114 <= ($signed($unsigned(((&reg101) ?
          $unsigned(wire104) : $unsigned(reg106)))) || reg111[(2'h3):(2'h2)]);
    end
  assign wire115 = (({$unsigned((wire99 >>> reg106))} >>> (wire95[(2'h3):(2'h2)] ?
                       ($signed((8'hac)) >= $signed(reg107)) : wire95)) && {($signed(wire92[(3'h7):(1'h1)]) ?
                           (~|(|wire100)) : ((^reg103) && (reg114 << reg108)))});
  always
    @(posedge clk) begin
      reg116 <= reg109;
      reg117 <= (&(!wire91));
    end
  assign wire118 = reg110;
  assign wire119 = $signed($unsigned($signed((wire96[(4'ha):(3'h4)] ?
                       (-wire88) : ((8'haf) ? reg114 : wire100)))));
  assign wire120 = ($signed(((reg113 == (+wire98)) ?
                       ($unsigned(reg116) ?
                           ((8'ha4) ?
                               (8'hbc) : wire118) : reg101[(3'h6):(2'h3)]) : $unsigned({reg117,
                           (8'hac)}))) && (($signed($unsigned(reg113)) >= (-{reg116,
                       wire96})) * ($unsigned((wire100 >> (8'hbd))) ?
                       {reg117[(3'h5):(2'h2)]} : $unsigned(wire97[(1'h0):(1'h0)]))));
  assign wire121 = $signed(wire91[(5'h13):(3'h6)]);
  assign wire122 = wire96;
  assign wire123 = wire122;
  assign wire124 = (reg107 * ((($unsigned(wire90) ?
                           (reg103 >= wire121) : $unsigned((8'haa))) <<< (8'hb0)) ?
                       reg102[(4'h8):(3'h5)] : ((^~(wire94 ? wire95 : reg114)) ?
                           reg106[(2'h2):(2'h2)] : (reg101 == $unsigned(reg105)))));
  always
    @(posedge clk) begin
      reg125 <= reg110;
      reg126 <= (wire118 ?
          (~&reg117) : $unsigned($unsigned((~^(wire96 >>> reg125)))));
      reg127 <= reg103;
    end
endmodule
