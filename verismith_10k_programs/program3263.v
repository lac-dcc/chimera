module top
#(parameter param211 = ((8'ha7) <<< (^~((((8'hbb) ? (8'h9e) : (8'hb8)) ~^ ((7'h44) <<< (8'had))) ? (((8'ha8) ~^ (8'hb6)) ? (!(8'hab)) : ((8'hbe) ? (8'ha0) : (8'hb1))) : (8'ha4)))), 
parameter param212 = param211)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire208;
  wire signed [(4'hb):(1'h0)] wire206;
  wire [(5'h12):(1'h0)] wire155;
  wire [(4'hc):(1'h0)] wire153;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg210 = (1'h0);
  reg [(4'hc):(1'h0)] reg209 = (1'h0);
  assign y = {wire208,
                 wire206,
                 wire155,
                 wire153,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg210,
                 reg209,
                 (1'h0)};
  assign wire4 = $signed(wire2[(4'h9):(4'h8)]);
  assign wire5 = (((($unsigned(wire3) ^ wire0) ?
                         (~|$unsigned(wire2)) : {(^wire3), $unsigned(wire3)}) ?
                     wire1 : wire0) ^~ wire4[(1'h0):(1'h0)]);
  assign wire6 = (^wire4);
  assign wire7 = ($signed((~^{$unsigned(wire3),
                     wire1[(2'h2):(1'h0)]})) && (wire4 << (^~($signed(wire3) ?
                     (~wire3) : $signed(wire5)))));
  assign wire8 = ($signed({$unsigned((!wire5)), (8'hbd)}) > wire6);
  assign wire9 = {($unsigned((~|wire0[(4'hf):(4'h9)])) ?
                         (($unsigned((8'h9d)) + (wire4 & wire7)) * wire5) : $unsigned((^(wire5 ?
                             wire5 : wire2)))),
                     ((^~(wire5 ?
                         (!wire6) : (wire2 ?
                             wire0 : wire8))) >= $signed((!(wire7 >> wire0))))};
  module10 #() modinst154 (.wire14(wire1), .wire11(wire7), .clk(clk), .wire13(wire8), .wire12(wire3), .y(wire153));
  assign wire155 = wire153[(2'h3):(2'h3)];
  module156 #() modinst207 (.wire157(wire155), .wire158(wire153), .y(wire206), .wire160(wire7), .wire159(wire2), .clk(clk));
  assign wire208 = ({wire206[(2'h2):(2'h2)], wire5[(3'h7):(3'h5)]} ?
                       (~^(7'h40)) : $signed(wire8[(4'h8):(2'h2)]));
  always
    @(posedge clk) begin
      reg209 <= wire206;
    end
  always
    @(posedge clk) begin
      reg210 <= {$signed(wire206[(4'h8):(2'h3)])};
    end
endmodule

module module156  (y, clk, wire160, wire159, wire158, wire157);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire160;
  input wire [(4'hd):(1'h0)] wire159;
  input wire signed [(2'h3):(1'h0)] wire158;
  input wire [(4'hd):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire205;
  wire [(3'h6):(1'h0)] wire204;
  wire signed [(5'h11):(1'h0)] wire203;
  wire [(4'ha):(1'h0)] wire201;
  wire signed [(3'h5):(1'h0)] wire162;
  wire signed [(4'ha):(1'h0)] wire161;
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg [(5'h12):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg174 = (1'h0);
  reg [(5'h11):(1'h0)] reg173 = (1'h0);
  reg [(4'hd):(1'h0)] reg172 = (1'h0);
  reg [(5'h12):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(4'hd):(1'h0)] reg164 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire201,
                 wire162,
                 wire161,
                 reg176,
                 reg175,
                 reg174,
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
                 reg163,
                 (1'h0)};
  assign wire161 = (((wire159 && (wire158[(2'h2):(1'h1)] * wire160[(3'h6):(2'h3)])) ?
                           wire160[(1'h0):(1'h0)] : (+wire158[(1'h0):(1'h0)])) ?
                       wire159 : wire160[(3'h5):(1'h1)]);
  assign wire162 = (wire158 << $signed(($unsigned((wire159 ?
                       wire159 : (8'hbb))) & wire157[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg163 <= $signed(wire159[(1'h1):(1'h1)]);
      if ($unsigned($unsigned((((~wire158) ?
              $signed(wire157) : (wire162 ? wire161 : reg163)) ?
          $unsigned(wire158[(2'h3):(2'h3)]) : ({wire162} ?
              (wire159 >= wire162) : (wire157 - wire158))))))
        begin
          if ($signed(((~^wire161) ?
              $unsigned($signed($unsigned(wire157))) : $unsigned(((wire157 >>> wire159) && (wire162 < reg163))))))
            begin
              reg164 <= {{$unsigned(($unsigned(wire157) ?
                          (!wire162) : wire162))}};
              reg165 <= (wire157 ?
                  $signed($signed($unsigned((wire157 ?
                      reg164 : wire160)))) : $unsigned((|$signed((8'ha9)))));
              reg166 <= {wire161};
              reg167 <= ((+$unsigned((|(wire157 ? wire161 : reg163)))) ?
                  wire162 : ($unsigned((wire158 <<< wire161[(4'h9):(4'h9)])) ~^ (((~^wire158) * wire162) < ((^wire159) ?
                      (8'h9c) : (+reg164)))));
            end
          else
            begin
              reg164 <= $unsigned(reg163[(2'h2):(2'h2)]);
              reg165 <= $unsigned((reg166 | (($signed(wire157) ~^ $signed((8'haa))) ?
                  (wire161 < wire162[(1'h1):(1'h1)]) : $unsigned($signed(reg164)))));
              reg166 <= wire158[(2'h3):(2'h2)];
              reg167 <= (8'hb2);
              reg168 <= $unsigned((~&($signed($unsigned(reg163)) == ({wire161} ?
                  $unsigned(reg166) : {(8'hae)}))));
            end
        end
      else
        begin
          if ($signed($unsigned($signed($signed(reg165[(2'h3):(1'h1)])))))
            begin
              reg164 <= ($unsigned(wire159[(4'hb):(2'h3)]) ?
                  wire157 : ((8'hae) ?
                      ($unsigned((&(8'h9d))) ?
                          wire157[(1'h0):(1'h0)] : $signed(wire160)) : reg166[(2'h3):(2'h3)]));
              reg165 <= (reg168 ?
                  ((^(^~reg164)) ?
                      $signed({reg165}) : reg165[(3'h4):(2'h3)]) : reg168[(4'hb):(4'h8)]);
              reg166 <= (((8'haa) < (reg167[(1'h1):(1'h1)] ?
                  $unsigned(wire161[(4'h9):(3'h6)]) : (|{(8'ha3)}))) && (~&reg167[(2'h2):(1'h1)]));
            end
          else
            begin
              reg164 <= reg164;
              reg165 <= $signed({wire162, $unsigned(wire157)});
              reg166 <= (($signed((7'h43)) << (reg163 >= ({reg165} ?
                      $signed(wire162) : (reg164 ? reg165 : reg163)))) ?
                  (reg168 <<< {$unsigned((~|reg164)),
                      (^(wire157 >>> (7'h44)))}) : {wire157});
              reg167 <= ($unsigned($signed($signed((reg163 != reg165)))) ?
                  reg164 : ((reg165[(2'h2):(2'h2)] ?
                      $unsigned((+reg163)) : reg167) <= reg165[(3'h6):(2'h2)]));
              reg168 <= {{$signed(reg168), (reg165[(3'h4):(1'h1)] << reg165)}};
            end
          if ((($unsigned($signed((reg164 << wire160))) ?
                  reg165[(1'h0):(1'h0)] : $signed((~|$unsigned(reg163)))) ?
              (|$unsigned($unsigned((wire160 ? reg163 : reg168)))) : wire162))
            begin
              reg169 <= wire160;
              reg170 <= $unsigned((&(wire157[(3'h7):(1'h0)] ?
                  {(~&reg167)} : $signed({wire157, reg166}))));
              reg171 <= (wire162 ?
                  $signed($unsigned(wire157[(3'h5):(2'h2)])) : $signed({wire162}));
            end
          else
            begin
              reg169 <= reg169;
            end
        end
      if ($signed($unsigned({$unsigned(wire157)})))
        begin
          reg172 <= reg167[(1'h0):(1'h0)];
          reg173 <= $signed(($unsigned(wire162) >> $signed({{reg167, reg170},
              {(8'h9f), (8'hae)}})));
        end
      else
        begin
          if ((reg171[(3'h4):(2'h3)] >= (|($signed(((8'hb9) == (8'had))) ^ $signed(reg168)))))
            begin
              reg172 <= (({reg163[(3'h5):(3'h5)],
                  wire159[(3'h7):(3'h4)]} <= $unsigned(reg165[(2'h3):(1'h1)])) >> reg164[(4'h8):(1'h1)]);
              reg173 <= ({{$signed((reg171 << reg173)),
                          $unsigned((wire157 ? reg168 : (8'haa)))}} ?
                  wire162[(3'h4):(1'h0)] : (reg173[(3'h6):(3'h4)] ?
                      $signed(reg167) : (+reg164[(3'h6):(2'h3)])));
            end
          else
            begin
              reg172 <= (~^$signed(wire159[(4'h8):(1'h1)]));
            end
          reg174 <= {wire159};
          reg175 <= $unsigned((((reg165[(3'h6):(2'h3)] - reg165[(3'h4):(1'h1)]) ?
              $signed({reg167,
                  reg165}) : ((~reg170) ~^ $unsigned((8'h9f)))) >> reg172));
          reg176 <= (^(reg173[(2'h2):(1'h1)] ^ $unsigned(($unsigned(reg164) ?
              $signed(reg169) : $signed((7'h41))))));
        end
    end
  module177 #() modinst202 (.wire178(wire157), .y(wire201), .wire179(wire159), .wire180(reg169), .clk(clk), .wire181(reg173));
  assign wire203 = $unsigned((($unsigned((8'haa)) ?
                       (8'ha9) : wire162[(2'h3):(1'h1)]) * (~&((!reg164) == reg168[(3'h5):(3'h4)]))));
  assign wire204 = $unsigned({wire158[(2'h2):(1'h0)],
                       $signed(reg171[(4'hb):(4'h8)])});
  assign wire205 = wire203[(4'hc):(2'h2)];
endmodule

module module10
#(parameter param151 = (7'h44), 
parameter param152 = param151)
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h200):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire [(3'h6):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire150;
  wire signed [(4'h8):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire146;
  wire signed [(4'h8):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire146,
                 wire104,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire73,
                 wire35,
                 wire19,
                 wire18,
                 wire17,
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
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg16,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= ((~^(!(-(~wire14)))) >= ((wire11[(2'h2):(1'h1)] ?
              $unsigned((8'h9e)) : wire11) ?
          $unsigned(wire12[(4'hc):(3'h5)]) : $unsigned({(wire11 + wire14)})));
      reg16 <= (($unsigned(reg15[(1'h0):(1'h0)]) ?
          reg15[(2'h3):(2'h3)] : (((reg15 ? wire14 : wire12) ?
              (|(8'ha2)) : (wire12 > wire12)) ~^ wire11[(3'h7):(2'h2)])) & wire12[(2'h2):(1'h1)]);
    end
  assign wire17 = (reg15[(1'h1):(1'h1)] || reg16[(2'h2):(1'h1)]);
  assign wire18 = $unsigned($unsigned($unsigned((((8'hb9) >= reg16) & $unsigned(wire17)))));
  assign wire19 = ((&wire17[(3'h6):(3'h5)]) >= reg15);
  module20 #() modinst36 (.y(wire35), .wire24(wire19), .wire22(wire12), .clk(clk), .wire23(wire18), .wire21(wire14));
  module37 #() modinst74 (wire73, clk, wire12, wire11, wire19, wire18);
  assign wire75 = (({$signed((wire11 <<< (8'ha4)))} << $unsigned(((wire35 >>> wire35) ?
                          $signed(wire17) : wire11))) ?
                      {$signed(wire11[(2'h2):(1'h0)])} : $signed((!wire18)));
  assign wire76 = $unsigned($unsigned((&wire73[(2'h3):(2'h3)])));
  assign wire77 = (+wire73);
  assign wire78 = wire17[(4'ha):(3'h6)];
  assign wire79 = $unsigned({(-reg16), $unsigned($signed(wire19))});
  assign wire80 = wire18;
  always
    @(posedge clk) begin
      reg81 <= $signed((~&(8'hb4)));
      if ({(wire13[(2'h3):(1'h1)] ^~ wire13[(3'h5):(3'h4)])})
        begin
          reg82 <= (~^((wire75[(3'h4):(2'h3)] ?
              (^(wire12 >= (7'h40))) : (wire80 <= $unsigned(wire77))) | $signed({wire12[(4'h8):(1'h0)],
              (8'ha4)})));
          reg83 <= ($signed(wire12[(3'h4):(3'h4)]) ?
              $signed(wire76) : (reg15[(2'h3):(1'h0)] ?
                  (wire19[(1'h0):(1'h0)] & ($signed(reg15) && $signed(wire79))) : reg82[(4'hc):(2'h3)]));
        end
      else
        begin
          reg82 <= ($unsigned((!{(+wire76), wire80})) ?
              wire19 : $signed({$unsigned((~^wire78))}));
          if ((((reg81[(4'h9):(1'h0)] + $signed((wire77 ?
                  wire17 : wire73))) >>> wire17[(2'h2):(1'h0)]) ?
              ((wire17[(4'hc):(4'ha)] <= {$signed(wire77), (~^reg83)}) ?
                  $signed($signed((^wire35))) : (~^$unsigned({reg15,
                      (8'hbc)}))) : $signed({(-$unsigned(wire13)),
                  (wire76[(1'h0):(1'h0)] ?
                      $unsigned(reg83) : $signed((8'hbd)))})))
            begin
              reg83 <= reg16[(4'h8):(3'h4)];
            end
          else
            begin
              reg83 <= reg82;
            end
          reg84 <= (~&$signed(reg15[(2'h3):(1'h0)]));
          reg85 <= (|$unsigned(($signed(reg16[(3'h7):(3'h7)]) | ((reg15 ?
              (8'hb8) : wire13) <<< (wire17 ? wire14 : wire73)))));
        end
    end
  always
    @(posedge clk) begin
      reg86 <= $unsigned((^~(!((~wire11) | (^wire73)))));
      if ($unsigned(reg16))
        begin
          reg87 <= $unsigned($unsigned(($signed((reg85 ?
              wire35 : reg84)) * $signed($signed(wire12)))));
          reg88 <= (wire12 ? $unsigned($unsigned(wire35)) : {(8'h9f)});
          if (reg84)
            begin
              reg89 <= wire13[(2'h2):(2'h2)];
              reg90 <= $unsigned(wire73);
              reg91 <= ($signed({reg84[(4'hc):(4'hc)], reg16}) ?
                  (reg81[(3'h4):(1'h1)] != (($unsigned(wire78) - wire76[(2'h2):(2'h2)]) ?
                      ((~|reg90) ?
                          (~reg87) : reg86[(2'h2):(1'h0)]) : $signed(wire78))) : ((wire17 ?
                          ({reg85} ?
                              wire11[(2'h2):(2'h2)] : wire73[(5'h10):(4'hc)]) : reg88) ?
                      wire12 : ({(^wire79)} ?
                          $signed(wire11) : ({(8'hb7), reg87} ?
                              (reg85 ? reg89 : (8'haa)) : (wire78 ?
                                  reg88 : reg86)))));
            end
          else
            begin
              reg89 <= ((8'h9d) >>> ((((8'hb8) | reg84) <<< (wire17 ?
                  {reg90} : (~^wire78))) ^~ reg86[(2'h3):(2'h3)]));
              reg90 <= (~^$unsigned($signed($unsigned(reg89[(3'h6):(1'h1)]))));
              reg91 <= $unsigned(reg83[(2'h3):(1'h0)]);
              reg92 <= (((!{wire12}) ^~ (wire12 <= ((wire14 ?
                  wire14 : (8'hb5)) < wire76))) ~^ $signed({($unsigned(reg86) >> $unsigned(reg15))}));
            end
        end
      else
        begin
          reg87 <= reg81;
          if (((($unsigned($unsigned(reg90)) ?
                  (~&$unsigned(wire77)) : $signed(wire73)) << $unsigned(reg86[(2'h2):(2'h2)])) ?
              wire19[(1'h0):(1'h0)] : $signed(reg88)))
            begin
              reg88 <= reg91[(4'hf):(4'hd)];
              reg89 <= (8'h9f);
              reg90 <= $unsigned(wire19[(4'h9):(4'h8)]);
              reg91 <= $unsigned((^~(8'hb0)));
            end
          else
            begin
              reg88 <= reg86;
              reg89 <= reg90;
              reg90 <= wire17[(4'ha):(2'h3)];
              reg91 <= wire18[(3'h4):(1'h0)];
              reg92 <= {(~|$signed({(reg85 + (8'hb4))}))};
            end
        end
      if ($signed({({$signed(wire78)} ?
              ((wire35 ^~ reg89) ?
                  {reg16, reg86} : $unsigned(wire18)) : {wire78})}))
        begin
          if (reg81[(2'h2):(1'h1)])
            begin
              reg93 <= ($unsigned({($signed(wire18) * $signed(reg92)),
                      $signed(wire17)}) ?
                  wire35 : ((reg83 >> ($unsigned(reg81) ?
                      (wire76 + wire75) : wire76)) <<< $unsigned((reg86 >>> $unsigned(reg16)))));
              reg94 <= $unsigned($unsigned(reg89));
            end
          else
            begin
              reg93 <= wire11;
              reg94 <= ((|wire80[(4'h8):(1'h0)]) >>> wire35[(3'h7):(3'h4)]);
            end
          if ($signed(({($signed(reg91) ? wire35[(3'h7):(3'h4)] : wire35),
              reg82[(5'h13):(2'h3)]} == ((reg16[(4'h9):(4'h9)] ?
                  $signed(wire75) : (reg93 != (8'haf))) ?
              ($signed((8'hb2)) ?
                  ((8'ha4) ? reg86 : (8'hb7)) : $unsigned((8'ha3))) : reg93))))
            begin
              reg95 <= $unsigned($signed(((reg16 ?
                  $signed(wire73) : (+wire76)) <<< (reg94 ?
                  ((7'h42) ? (8'hb0) : wire35) : {wire78}))));
              reg96 <= reg86[(2'h2):(2'h2)];
            end
          else
            begin
              reg95 <= ($signed($signed((|((8'ha2) ?
                  reg91 : reg16)))) > (~(wire11 ?
                  (reg81 < $signed(wire14)) : ($signed(reg83) ?
                      $unsigned(wire73) : ((8'hb2) ? reg84 : wire79)))));
              reg96 <= (^~(~|{($unsigned((8'hb6)) ?
                      reg16[(4'ha):(4'h9)] : (8'ha6)),
                  $unsigned((+reg89))}));
              reg97 <= $signed((+$unsigned($unsigned(((8'hb1) ?
                  reg91 : wire79)))));
              reg98 <= ((wire76[(1'h1):(1'h0)] ?
                      $unsigned(({(8'hab), wire80} ?
                          (reg95 ?
                              wire77 : reg82) : $signed(wire79))) : reg91[(2'h2):(1'h0)]) ?
                  ((-((reg87 ? reg97 : wire76) ?
                      ((8'hac) ?
                          reg90 : wire11) : (wire77 & reg82))) || (reg83 ?
                      ({(8'hb0)} && $signed(reg96)) : $signed(wire18[(1'h0):(1'h0)]))) : ($unsigned(((wire78 ?
                          reg96 : wire17) ?
                      $signed((8'ha4)) : ((8'h9f) ?
                          wire75 : reg89))) > (^((wire77 ? wire18 : (8'haf)) ?
                      $signed(wire78) : $unsigned(wire17)))));
              reg99 <= reg96;
            end
          reg100 <= $unsigned(wire17[(3'h7):(3'h6)]);
          reg101 <= (reg84[(4'hc):(1'h0)] ?
              reg83[(2'h2):(1'h1)] : $signed((~^({reg95, reg88} ?
                  $unsigned(wire80) : (wire76 || wire80)))));
        end
      else
        begin
          reg93 <= reg94[(4'he):(4'h8)];
          if ($signed($signed($unsigned((wire13 ?
              $signed(reg15) : ((8'hb4) - reg99))))))
            begin
              reg94 <= reg88;
            end
          else
            begin
              reg94 <= $signed((wire76 - {wire18,
                  $signed(reg100[(1'h0):(1'h0)])}));
              reg95 <= {reg88[(2'h3):(1'h1)], {$signed($unsigned((8'ha8)))}};
            end
          if (reg93[(2'h3):(2'h3)])
            begin
              reg96 <= wire19[(4'hb):(3'h5)];
              reg97 <= ((!$signed(reg83[(2'h2):(1'h1)])) ?
                  reg15 : ($unsigned(($signed(wire80) <= (8'hbb))) ?
                      {(^$unsigned(reg82))} : $signed(({reg92,
                          reg86} | {reg15}))));
              reg98 <= (wire12[(4'hd):(3'h6)] & (reg98[(1'h0):(1'h0)] ?
                  ($signed({reg84}) < (+(~(8'hbe)))) : reg15[(3'h5):(1'h0)]));
            end
          else
            begin
              reg96 <= {reg88};
              reg97 <= $signed($signed($unsigned(reg85[(5'h13):(3'h7)])));
            end
          if (reg93[(2'h3):(1'h0)])
            begin
              reg99 <= reg86[(2'h3):(2'h3)];
            end
          else
            begin
              reg99 <= reg89;
              reg100 <= $signed($unsigned(reg89[(2'h3):(1'h1)]));
              reg101 <= $signed($unsigned(reg92[(2'h3):(1'h1)]));
            end
          reg102 <= $signed(($signed($signed((+reg96))) ?
              $unsigned($signed(wire14)) : (+reg83[(2'h3):(1'h1)])));
        end
      reg103 <= {(reg81 ? reg16 : {reg90[(3'h5):(2'h3)]})};
    end
  assign wire104 = reg84;
  module105 #() modinst147 (wire146, clk, reg96, wire73, reg89, wire11);
  assign wire148 = (reg98 >>> $signed((reg94 ?
                       (~&(reg82 ? reg95 : wire12)) : $signed((reg100 ?
                           reg90 : reg100)))));
  assign wire149 = reg97;
  assign wire150 = wire12[(5'h12):(1'h0)];
endmodule

module module105
#(parameter param145 = {({((~&(8'hbe)) || ((8'hae) ? (8'h9d) : (8'ha2))), (8'ha0)} || ((~^((8'haf) || (8'ha9))) > (8'hba)))})
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire109;
  input wire signed [(2'h2):(1'h0)] wire108;
  input wire [(4'hb):(1'h0)] wire107;
  input wire signed [(4'hb):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire130;
  wire signed [(4'hc):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(2'h3):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire124;
  wire [(5'h12):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire122;
  wire [(3'h6):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire116;
  wire [(4'hb):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire114;
  wire [(4'hc):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  reg [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg141 = (1'h0);
  reg [(3'h4):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
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
                 wire111,
                 wire110,
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
                 (1'h0)};
  assign wire110 = wire107;
  assign wire111 = (wire110[(3'h4):(3'h4)] < (^wire106[(1'h1):(1'h0)]));
  assign wire112 = (wire109[(2'h2):(1'h1)] > wire111);
  assign wire113 = (wire106[(2'h3):(2'h2)] >>> ($signed($unsigned((~^wire107))) <<< $unsigned(((^wire106) ?
                       wire110[(2'h3):(1'h1)] : (wire109 == (8'hab))))));
  assign wire114 = $signed(wire112[(2'h3):(1'h0)]);
  assign wire115 = $signed((+$unsigned(($signed(wire107) ?
                       wire109 : (wire107 > wire106)))));
  assign wire116 = wire111[(3'h7):(3'h5)];
  assign wire117 = {(8'hbd)};
  assign wire118 = $unsigned(($unsigned($signed($unsigned(wire108))) ?
                       (wire106 < ((wire111 <<< wire107) ?
                           (wire109 ? wire109 : wire106) : (wire115 ?
                               wire116 : wire107))) : ($unsigned(wire113) ^~ $unsigned((wire107 ^ wire110)))));
  assign wire119 = ($signed((wire107[(2'h3):(1'h1)] ?
                       wire113[(3'h7):(3'h6)] : $unsigned(wire116[(3'h5):(2'h3)]))) > $signed($unsigned($signed($signed(wire109)))));
  assign wire120 = wire115[(4'ha):(4'h8)];
  assign wire121 = (~wire120);
  assign wire122 = wire116;
  assign wire123 = wire107;
  assign wire124 = (~^{((wire122 ?
                           wire120[(1'h0):(1'h0)] : wire115[(4'h9):(1'h1)]) > $unsigned((wire107 ?
                           wire122 : wire116))),
                       ((7'h44) ?
                           (8'ha4) : ((~^wire111) ?
                               (wire120 & wire120) : (-wire107)))});
  assign wire125 = ({$unsigned((~$unsigned(wire123)))} ?
                       $signed(wire109[(1'h0):(1'h0)]) : wire122);
  assign wire126 = wire123[(1'h1):(1'h0)];
  assign wire127 = (((wire115 && wire113[(3'h5):(2'h2)]) | ($signed($signed(wire119)) ?
                       wire126 : ($signed(wire123) == wire112))) ^~ (wire117 ^~ $unsigned(wire113[(3'h4):(1'h1)])));
  assign wire128 = {(~&$signed(wire109[(1'h1):(1'h1)])),
                       (&wire109[(1'h0):(1'h0)])};
  assign wire129 = ($unsigned($unsigned(({wire117, (8'hb7)} ?
                           (wire114 <= wire121) : (8'hae)))) ?
                       $signed(({wire119[(3'h6):(2'h2)]} ?
                           ({wire112} ?
                               {wire123,
                                   wire111} : wire124) : wire121[(3'h5):(1'h0)])) : wire109[(1'h1):(1'h0)]);
  assign wire130 = ($unsigned(wire126) ?
                       (wire113[(3'h7):(2'h3)] ?
                           ($unsigned($signed(wire125)) ?
                               ($unsigned((8'h9d)) ?
                                   wire127[(2'h2):(2'h2)] : {wire107}) : {((8'h9e) <= wire110)}) : wire118[(3'h4):(2'h2)]) : wire124);
  assign wire131 = $signed({(($unsigned((8'haf)) ?
                           wire111 : ((7'h40) ?
                               (8'ha6) : wire115)) >> $signed((8'h9f)))});
  always
    @(posedge clk) begin
      reg132 <= wire129;
      reg133 <= (wire122[(4'hf):(2'h3)] != ($unsigned((wire126[(3'h4):(2'h3)] >>> (wire129 ?
              wire112 : (8'ha6)))) ?
          $signed(((wire128 ? wire111 : wire118) ?
              wire127[(1'h1):(1'h0)] : ((8'ha9) < wire108))) : (wire113 >>> $signed($signed(wire112)))));
      reg134 <= $signed(($unsigned({$signed(wire127), reg132}) ?
          wire112 : (((^wire130) & (~&wire120)) ?
              {((8'hb8) ? wire106 : reg133)} : (+{(8'ha9)}))));
      if (wire120[(4'hc):(3'h7)])
        begin
          reg135 <= (!(wire129[(3'h7):(2'h3)] > (wire110[(3'h4):(1'h1)] ?
              $unsigned($unsigned(reg132)) : wire125)));
          reg136 <= (~&(~&$unsigned(wire125[(3'h5):(3'h5)])));
          reg137 <= {((8'hbd) && (((wire107 ? wire124 : wire128) <<< (wire124 ?
                      wire125 : (8'hb0))) ?
                  {{(8'ha2)}} : wire116)),
              (((wire124[(1'h1):(1'h1)] ? (-wire121) : wire125) ?
                  (~|(wire126 ? wire115 : wire117)) : $unsigned((reg133 ?
                      wire120 : wire121))) && (^~((wire119 ? reg132 : wire128) ?
                  (wire117 + wire128) : (wire127 ? wire128 : (8'ha9)))))};
          reg138 <= wire113[(4'hc):(1'h0)];
        end
      else
        begin
          if (($unsigned((wire113 <<< ((wire124 <<< reg136) ^ (wire131 > reg133)))) == wire127))
            begin
              reg135 <= wire114;
              reg136 <= (($unsigned((+$unsigned(wire131))) ?
                      (({wire108, reg136} ?
                          $unsigned(reg136) : $signed(wire128)) <<< (wire109 & $unsigned((8'hac)))) : ({(~|wire108)} >= {(-(8'hac)),
                          (~&wire109)})) ?
                  wire106 : (-$unsigned(wire113)));
              reg137 <= wire126[(2'h3):(1'h1)];
              reg138 <= $signed((8'hbc));
              reg139 <= reg135[(2'h3):(1'h1)];
            end
          else
            begin
              reg135 <= {$unsigned((($unsigned(wire125) ?
                      $unsigned(wire109) : $signed(reg132)) << wire122)),
                  wire107};
              reg136 <= wire120;
              reg137 <= $signed(wire116[(2'h2):(1'h1)]);
              reg138 <= $signed(((wire106 || $signed(wire110[(2'h2):(1'h0)])) ?
                  (8'hbc) : $signed(wire120[(3'h5):(2'h3)])));
              reg139 <= $unsigned(wire120);
            end
          if ($signed((~&(8'hb0))))
            begin
              reg140 <= wire124[(1'h1):(1'h1)];
              reg141 <= reg137[(1'h1):(1'h1)];
            end
          else
            begin
              reg140 <= (wire112[(4'h9):(2'h3)] <= (wire116[(3'h7):(2'h2)] ?
                  wire126 : {reg138[(1'h1):(1'h1)]}));
              reg141 <= ((($unsigned(((8'hb4) ?
                      wire122 : wire112)) >= {$unsigned(reg140),
                      $signed((8'h9d))}) * (~$signed($unsigned(wire109)))) ?
                  (($unsigned((wire108 ? wire125 : wire113)) ?
                      {wire115[(1'h1):(1'h0)]} : $signed((wire127 ^~ wire125))) && $unsigned($unsigned(wire122))) : ((wire111 >> ((^wire117) ?
                      wire122 : wire127[(2'h3):(2'h2)])) ^ (wire107[(1'h1):(1'h0)] - (8'ha8))));
            end
          reg142 <= wire131;
          reg143 <= $signed((~reg139));
        end
      reg144 <= $unsigned(({reg137} ?
          $signed((wire126 ?
              (8'hb1) : (wire120 ?
                  wire107 : wire128))) : ({$signed(wire129)} == wire106[(4'h8):(3'h6)])));
    end
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h16e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire41;
  input wire signed [(4'ha):(1'h0)] wire40;
  input wire [(5'h11):(1'h0)] wire39;
  input wire [(4'hc):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  assign y = {wire72,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire46,
                 wire43,
                 wire42,
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
                 reg48,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire42 = (!((({wire38} & wire40) >> ((+wire39) || wire40[(2'h3):(2'h3)])) ?
                      (-wire40) : $unsigned(((^~(8'hb8)) == $unsigned(wire39)))));
  assign wire43 = (~^wire40[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      reg44 <= $signed($unsigned(((^(8'hba)) < {$unsigned(wire42),
          wire40[(4'ha):(1'h0)]})));
      reg45 <= reg44[(4'he):(2'h3)];
    end
  assign wire46 = {(|$unsigned((^wire43))), wire41[(1'h0):(1'h0)]};
  assign wire47 = (($signed($unsigned($signed(wire42))) < reg45) && {wire41[(4'h9):(3'h4)]});
  always
    @(posedge clk) begin
      reg48 <= wire47[(4'ha):(3'h5)];
    end
  assign wire49 = ((~&$unsigned($signed((wire46 <= wire41)))) ^ $signed(wire47[(2'h2):(2'h2)]));
  assign wire50 = wire38[(3'h7):(3'h4)];
  assign wire51 = (&$unsigned((~^{$signed(wire47), ((8'hb8) << wire40)})));
  assign wire52 = (~^(wire50 ? wire43 : ((-wire50) - wire43[(4'hc):(3'h4)])));
  assign wire53 = $unsigned($unsigned(wire46));
  assign wire54 = (&wire52);
  assign wire55 = $signed((wire40[(1'h0):(1'h0)] ?
                      ($signed(wire52[(1'h1):(1'h1)]) ?
                          $signed($unsigned((8'hae))) : ((~(8'hb4)) ~^ (~wire50))) : (+(^wire54[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg56 <= $signed(wire47);
      reg57 <= wire54[(5'h12):(1'h0)];
      if ($signed((-wire52[(2'h2):(2'h2)])))
        begin
          reg58 <= ($unsigned($unsigned((&(^reg44)))) ?
              $unsigned({{(+wire38)}, wire40}) : reg45);
        end
      else
        begin
          if ((+{$unsigned(wire53)}))
            begin
              reg58 <= (wire38 ? wire52 : reg48);
              reg59 <= {reg58};
              reg60 <= $signed($signed((^~$signed(((8'hb3) | wire41)))));
              reg61 <= $signed(wire40[(1'h1):(1'h0)]);
            end
          else
            begin
              reg58 <= (reg59 ? $unsigned((8'haf)) : (~^$unsigned(wire38)));
              reg59 <= (wire47 <<< wire42[(2'h2):(1'h0)]);
              reg60 <= (~|((-$signed($signed(wire39))) + (!{reg61,
                  (~&wire53)})));
              reg61 <= (($signed((-wire51[(3'h4):(1'h1)])) ?
                  reg60[(1'h1):(1'h0)] : ($signed((wire52 <<< wire43)) << (~&(~&wire46)))) == ((&$unsigned({reg48})) ?
                  ($signed($signed(wire55)) >= $signed($unsigned(wire41))) : $unsigned($signed((+reg56)))));
              reg62 <= wire42[(2'h2):(2'h2)];
            end
          reg63 <= {(~&$unsigned(($unsigned(reg61) ?
                  (~^wire39) : reg56[(1'h1):(1'h0)])))};
          reg64 <= $unsigned((8'ha6));
          reg65 <= ((wire47 + wire43) ? (8'h9f) : reg45[(2'h2):(2'h2)]);
          reg66 <= wire50[(1'h1):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg67 <= wire38[(2'h3):(1'h0)];
      reg68 <= $signed($signed((-(wire50 ?
          ((7'h42) << wire49) : (reg59 ? reg57 : reg60)))));
      reg69 <= {$signed(($signed((!reg65)) && $signed(wire50[(1'h0):(1'h0)]))),
          reg68[(1'h0):(1'h0)]};
      reg70 <= reg44[(4'h8):(3'h6)];
      reg71 <= (({$signed({reg64}),
              $signed((reg64 ? wire39 : reg58))} || reg56[(3'h7):(3'h6)]) ?
          ((~(~^(wire54 ? reg60 : (7'h42)))) ?
              reg44 : (~|($unsigned(wire49) << (wire53 | reg57)))) : wire42);
    end
  assign wire72 = ($signed(reg56) && $unsigned(reg45[(3'h4):(1'h0)]));
endmodule

module module20
#(parameter param33 = (((((&(8'h9e)) ? ((8'had) > (7'h41)) : (8'hbc)) ? (^((8'ha6) != (8'hb5))) : ((&(8'hab)) ? ((7'h42) >>> (8'ha7)) : ((7'h41) - (8'hb4)))) ? (7'h42) : {(((8'ha4) ? (7'h43) : (8'ha1)) ? {(7'h43), (7'h44)} : ((8'ha0) << (8'hb5)))}) - ((+((~^(8'ha0)) ? (~|(8'h9f)) : ((8'hb4) && (8'ha8)))) ^ ({((8'hbb) + (8'hb0)), (|(7'h44))} & (^~((8'hab) ? (7'h42) : (8'hb2)))))), 
parameter param34 = param33)
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire signed [(2'h3):(1'h0)] wire23;
  input wire signed [(3'h5):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  assign y = {wire32,
                 wire26,
                 wire25,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire25 = ($signed(wire24) ? $unsigned(wire23) : wire24[(1'h0):(1'h0)]);
  assign wire26 = (wire25 ? $signed(wire25) : (8'hb7));
  always
    @(posedge clk) begin
      if (wire24[(3'h7):(3'h6)])
        begin
          reg27 <= wire22;
          reg28 <= {wire26};
          reg29 <= ($unsigned($signed(reg28[(1'h1):(1'h0)])) ?
              $unsigned($unsigned($unsigned({wire23,
                  wire23}))) : ((wire21[(4'hc):(3'h5)] ?
                      (^(~wire22)) : (wire22[(2'h3):(2'h2)] || $signed(reg28))) ?
                  (|$signed(wire22)) : wire26));
        end
      else
        begin
          reg27 <= ((wire21 != $signed(($unsigned((8'ha6)) ?
                  wire25[(2'h3):(2'h2)] : wire24[(1'h0):(1'h0)]))) ?
              $unsigned((reg29[(1'h0):(1'h0)] ^~ wire22)) : (7'h41));
          reg28 <= (~|$unsigned((-((wire26 ? wire25 : wire23) ?
              reg29 : {wire25}))));
          reg29 <= $unsigned(reg28[(1'h0):(1'h0)]);
          reg30 <= wire24;
        end
      reg31 <= ($signed({(wire23[(1'h0):(1'h0)] || reg28),
          wire26}) <<< (!(8'ha2)));
    end
  assign wire32 = $unsigned(wire21);
endmodule

module module177  (y, clk, wire181, wire180, wire179, wire178);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire181;
  input wire signed [(4'hf):(1'h0)] wire180;
  input wire [(3'h7):(1'h0)] wire179;
  input wire signed [(4'hd):(1'h0)] wire178;
  wire [(3'h4):(1'h0)] wire200;
  wire signed [(2'h2):(1'h0)] wire199;
  wire signed [(4'hc):(1'h0)] wire198;
  wire [(4'h8):(1'h0)] wire197;
  wire [(4'h8):(1'h0)] wire196;
  wire signed [(3'h5):(1'h0)] wire195;
  wire signed [(4'hc):(1'h0)] wire184;
  wire [(5'h11):(1'h0)] wire183;
  wire signed [(5'h13):(1'h0)] wire182;
  reg signed [(4'hb):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg193 = (1'h0);
  reg [(4'hb):(1'h0)] reg192 = (1'h0);
  reg [(3'h6):(1'h0)] reg191 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg189 = (1'h0);
  reg [(3'h5):(1'h0)] reg188 = (1'h0);
  reg [(3'h4):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg185 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire184,
                 wire183,
                 wire182,
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
                 (1'h0)};
  assign wire182 = $unsigned(($signed(wire181) >> $unsigned(wire180)));
  assign wire183 = wire182;
  assign wire184 = ((wire183[(4'he):(4'h9)] ?
                           $unsigned(wire180) : wire183[(3'h6):(1'h0)]) ?
                       $signed((wire183[(4'hd):(2'h3)] <<< wire178)) : $unsigned(wire178[(4'hc):(3'h4)]));
  always
    @(posedge clk) begin
      if (wire180[(4'he):(2'h2)])
        begin
          reg185 <= {((wire181 ?
                  wire183[(4'hc):(1'h1)] : wire182) <= ($signed(wire180) > $unsigned((^wire183)))),
              $signed(wire184[(2'h3):(1'h1)])};
          if (wire179[(3'h5):(2'h3)])
            begin
              reg186 <= (-((((wire182 ? wire180 : wire183) - (reg185 ?
                  wire179 : wire180)) ^~ (7'h42)) * $unsigned($signed($signed((8'hab))))));
            end
          else
            begin
              reg186 <= ($signed(reg185) ?
                  $unsigned($signed(wire180[(2'h2):(2'h2)])) : ($signed(((wire183 || (8'hab)) ~^ wire180[(3'h7):(1'h1)])) ?
                      ((8'hbc) <<< reg185[(1'h0):(1'h0)]) : (|$signed($unsigned(wire178)))));
            end
          if (wire184)
            begin
              reg187 <= ($unsigned(wire182[(3'h4):(2'h3)]) ?
                  ($signed($signed({(8'h9c)})) & ($unsigned((wire183 > wire182)) ?
                      (((8'ha1) ? wire184 : wire184) ?
                          $unsigned(wire183) : (reg185 ?
                              wire184 : reg185)) : ({(8'hba),
                          (8'hba)} <= (wire181 ^~ wire181)))) : wire181);
              reg188 <= (((~|wire183) ?
                      (-wire182[(4'hf):(2'h3)]) : $signed($signed($unsigned(wire180)))) ?
                  (~(8'hb2)) : wire179);
              reg189 <= (&(&$unsigned({$unsigned((8'hb2)), wire178})));
              reg190 <= ((+(wire184[(2'h3):(2'h2)] ?
                      reg187[(1'h0):(1'h0)] : (!wire183[(4'hb):(3'h4)]))) ?
                  (~&(wire182 ?
                      $signed(wire183[(3'h4):(2'h2)]) : ((wire183 ?
                              reg186 : reg189) ?
                          wire183 : {wire182}))) : $signed(wire184[(2'h3):(1'h0)]));
              reg191 <= $unsigned(($signed($signed($unsigned(wire184))) > (~^{(wire184 ?
                      wire178 : reg187)})));
            end
          else
            begin
              reg187 <= $unsigned($unsigned(($signed(wire178) ^ (~&$unsigned(reg188)))));
              reg188 <= $signed($signed((+$signed({reg191}))));
              reg189 <= (8'hb8);
              reg190 <= (+reg185);
              reg191 <= {(~|$signed($unsigned($unsigned(reg186)))), reg188};
            end
          reg192 <= (-((wire181[(5'h10):(4'hf)] ?
              wire179[(2'h3):(1'h1)] : $unsigned($signed(reg187))) == wire183));
        end
      else
        begin
          reg185 <= wire182[(5'h10):(4'hf)];
          reg186 <= (|((8'h9e) >> ($signed(((7'h41) << wire178)) < (reg192 ?
              reg187 : ((8'hab) ? wire178 : reg190)))));
          reg187 <= $signed(wire182);
        end
      reg193 <= $signed(reg185[(2'h3):(1'h1)]);
      reg194 <= $signed(wire182[(4'hf):(3'h7)]);
    end
  assign wire195 = ((^~$signed((&reg191))) >>> wire181[(4'h8):(1'h1)]);
  assign wire196 = $signed($signed((~|$unsigned({reg190, wire178}))));
  assign wire197 = ((~$unsigned((~^$unsigned(reg187)))) ~^ $signed($signed($signed($unsigned(reg192)))));
  assign wire198 = (7'h41);
  assign wire199 = {($unsigned(wire198[(2'h3):(2'h2)]) ^~ wire198[(1'h0):(1'h0)])};
  assign wire200 = (!(((~&(reg187 + reg190)) <= reg194[(3'h5):(3'h4)]) <<< $unsigned((+{wire195,
                       wire178}))));
endmodule
