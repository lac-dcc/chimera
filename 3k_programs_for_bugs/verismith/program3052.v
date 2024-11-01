module top
#(parameter param103 = (^~((-(~&(~&(8'hb2)))) ? ((-((8'ha2) & (8'h9f))) >= ((~|(7'h42)) ? ((8'hab) ? (8'hbb) : (8'hb1)) : (~&(8'ha6)))) : ((((8'hb6) >= (8'h9e)) ? {(8'h9d), (8'ha0)} : ((8'ha3) ? (8'ha7) : (8'ha9))) + {(^(8'h9c)), ((8'had) ? (8'had) : (8'ha3))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1e9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire signed [(3'h4):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire72;
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire91,
                 wire79,
                 wire74,
                 wire5,
                 wire6,
                 wire7,
                 wire15,
                 wire72,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = $unsigned($signed($signed($signed((~|wire3)))));
  assign wire6 = $unsigned(wire2[(3'h6):(2'h3)]);
  assign wire7 = $unsigned(wire3[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if (($signed(wire7) ?
          ($unsigned(($unsigned(wire7) ^~ {wire3, wire5})) ?
              (wire7[(2'h3):(2'h2)] ?
                  $unsigned($unsigned(wire4)) : {wire2,
                      ((8'ha6) ?
                          wire5 : (8'hba))}) : $unsigned(($unsigned(wire1) ?
                  (~wire7) : $signed(wire5)))) : $signed((($signed(wire3) ?
                  wire2 : {wire2, wire3}) ?
              (|{wire3}) : $unsigned(wire6)))))
        begin
          if ((+$unsigned($unsigned($signed({wire7, wire3})))))
            begin
              reg8 <= wire0[(1'h0):(1'h0)];
              reg9 <= $unsigned(wire6);
            end
          else
            begin
              reg8 <= $signed($signed($unsigned(($signed(wire0) ?
                  wire4 : $unsigned(wire1)))));
              reg9 <= $signed(wire1);
              reg10 <= {$signed(reg8), wire2};
              reg11 <= (|{(reg8[(3'h4):(3'h4)] ?
                      ($signed(wire3) ?
                          $unsigned(wire3) : $signed(reg9)) : $signed($signed((8'ha3)))),
                  $signed((~&wire7))});
              reg12 <= $signed((~&(~|(reg11 ? {wire3, wire7} : reg10))));
            end
          reg13 <= wire5[(1'h0):(1'h0)];
        end
      else
        begin
          reg8 <= (&((^wire5[(3'h7):(3'h5)]) ?
              $unsigned(wire4[(1'h0):(1'h0)]) : wire6[(4'h8):(3'h6)]));
        end
      reg14 <= $unsigned($unsigned((($signed(wire3) ?
              (wire3 ? wire0 : wire1) : (reg10 ? reg12 : wire3)) ?
          wire5 : wire1[(5'h13):(5'h10)])));
    end
  assign wire15 = {(~^(-(wire5 << $unsigned(reg14))))};
  module16 #() modinst73 (.wire18(reg10), .wire17(wire6), .wire20(reg8), .wire21(wire5), .y(wire72), .clk(clk), .wire19(wire2));
  assign wire74 = ((wire4 ? reg9 : (!wire72[(3'h7):(3'h6)])) ? reg13 : (7'h40));
  always
    @(posedge clk) begin
      reg75 <= reg12;
      reg76 <= $unsigned(wire0);
      reg77 <= (+((8'ha5) ? (+$signed($unsigned(wire74))) : (|wire4)));
      reg78 <= ($signed($signed((~^$signed((8'h9f))))) ?
          ($signed(($unsigned((8'hb3)) * $signed(wire7))) ?
              ($signed((wire2 >> wire1)) ?
                  (~reg77[(3'h5):(2'h2)]) : {$signed(wire4),
                      (wire1 ? wire3 : reg9)}) : (wire4 ?
                  $signed($signed(reg8)) : $unsigned((^(8'ha5))))) : ((($signed(reg13) - reg76[(4'hc):(3'h4)]) || {(8'hbb)}) ?
              ((((8'hb4) ?
                  wire15 : (8'ha1)) & $unsigned(reg76)) - wire74[(4'hc):(3'h4)]) : $signed(reg10[(1'h0):(1'h0)])));
    end
  assign wire79 = (8'ha1);
  always
    @(posedge clk) begin
      if ((wire4 - (7'h43)))
        begin
          reg80 <= ((~$unsigned(((wire74 ? wire1 : reg13) ?
              wire5[(4'h9):(3'h7)] : wire2[(5'h10):(5'h10)]))) >= (wire5 ?
              reg76[(2'h3):(2'h2)] : reg78));
          reg81 <= $signed(wire6[(4'he):(4'hb)]);
          reg82 <= (wire15 <= (wire74 >>> (~wire1[(3'h7):(3'h6)])));
          if (((~&(wire3 ?
                  ((8'hb5) ?
                      $unsigned(wire2) : {reg9, reg75}) : ((wire4 == (8'hb7)) ?
                      wire7 : wire5[(4'h9):(1'h1)]))) ?
              ($unsigned(reg81) & (^(8'h9f))) : ($signed(reg9) ?
                  $signed((wire72 ?
                      (!wire7) : reg80)) : (wire7[(1'h0):(1'h0)] < {(7'h41)}))))
            begin
              reg83 <= (+reg78[(1'h1):(1'h0)]);
              reg84 <= ((($signed(wire0[(1'h1):(1'h0)]) ?
                          wire79 : $signed((reg80 ? wire74 : reg8))) ?
                      (^~($signed(reg78) < {wire2})) : wire3) ?
                  $unsigned(wire1) : $signed((wire2[(4'hb):(2'h3)] ?
                      $signed((wire4 ^ reg13)) : (8'h9f))));
              reg85 <= (^(~{reg8[(2'h3):(2'h3)],
                  ((reg76 ? reg78 : reg80) ? (+reg82) : {wire79, reg78})}));
            end
          else
            begin
              reg83 <= reg11[(1'h0):(1'h0)];
              reg84 <= wire0[(1'h1):(1'h0)];
              reg85 <= reg80[(2'h2):(1'h1)];
              reg86 <= $unsigned((reg84 >>> wire15[(2'h3):(1'h0)]));
              reg87 <= $unsigned((|(-$signed((wire0 - reg86)))));
            end
          if (reg78[(2'h2):(1'h0)])
            begin
              reg88 <= (^~$unsigned(($unsigned(reg86) ?
                  $unsigned($signed(reg82)) : {(~|wire72), reg77})));
              reg89 <= reg83;
              reg90 <= wire6[(1'h1):(1'h0)];
            end
          else
            begin
              reg88 <= (~|reg83[(1'h1):(1'h1)]);
              reg89 <= ($unsigned($signed((^wire72))) <<< (wire4[(2'h3):(1'h1)] >>> (((reg11 ?
                          wire4 : (8'h9e)) ?
                      (8'haa) : wire15[(1'h0):(1'h0)]) ?
                  $signed(reg78) : wire3)));
            end
        end
      else
        begin
          if ($signed({$unsigned((~reg77[(3'h6):(3'h6)])),
              reg75[(4'hb):(2'h2)]}))
            begin
              reg80 <= $signed((~^(-((reg76 <= reg75) ?
                  (~wire0) : (^~(8'haa))))));
            end
          else
            begin
              reg80 <= {{($unsigned($signed(wire2)) ?
                          $unsigned($unsigned(wire74)) : ($unsigned(reg78) >> (wire15 ?
                              wire1 : reg83))),
                      $signed((&(reg14 <<< reg75)))},
                  ((-$signed(reg86)) ?
                      $unsigned($signed((+reg11))) : $signed((&$signed(wire1))))};
              reg81 <= reg86;
              reg82 <= (~^(((8'hb0) <<< ({reg84, reg13} ?
                      (~&wire79) : reg76[(3'h6):(2'h2)])) ?
                  $unsigned(reg8) : (($unsigned(reg8) ?
                          $signed(reg75) : wire4[(2'h3):(2'h3)]) ?
                      wire5 : wire4)));
            end
          reg83 <= reg87;
          if (reg88)
            begin
              reg84 <= (&wire0);
              reg85 <= reg11;
            end
          else
            begin
              reg84 <= {(wire2[(3'h4):(2'h3)] ?
                      (^~reg77) : $unsigned((&$signed((8'hbf))))),
                  (8'hb2)};
              reg85 <= $signed(((wire5 ?
                      {$unsigned(reg9),
                          $signed(wire7)} : wire74[(3'h7):(3'h6)]) ?
                  wire1[(4'h9):(3'h4)] : (($signed((8'ha2)) ?
                          {wire7, (8'h9f)} : (reg82 ~^ (8'hb0))) ?
                      $signed($signed(reg78)) : {{reg85, wire2}})));
            end
          reg86 <= ($signed(($unsigned((wire5 ? wire6 : reg14)) & (~&(reg78 ?
              (8'hb0) : wire72)))) & (reg76 != reg90));
          reg87 <= ($signed((&($unsigned(reg84) && (~|reg14)))) ?
              {$unsigned($signed(reg90))} : (-(((~wire7) ?
                  $unsigned(reg80) : $signed(reg84)) >= wire79)));
        end
    end
  assign wire91 = $signed((~{$unsigned((reg77 >>> wire0)),
                      $signed((reg88 ? (8'hb6) : reg13))}));
  always
    @(posedge clk) begin
      reg92 <= ($unsigned((((wire1 ?
          (8'ha4) : wire3) >>> {wire79}) < $unsigned((^~reg76)))) <= $signed((-$signed($unsigned(wire3)))));
      if ((~^wire4[(1'h1):(1'h1)]))
        begin
          reg93 <= wire0;
          if ((-$unsigned((8'haa))))
            begin
              reg94 <= wire5[(4'h8):(3'h5)];
              reg95 <= reg76[(4'he):(2'h2)];
            end
          else
            begin
              reg94 <= $unsigned((reg94[(4'hd):(3'h5)] + $unsigned((reg11 >>> reg75[(3'h7):(1'h1)]))));
              reg95 <= $signed((^$unsigned(($unsigned(wire3) ?
                  $unsigned(wire5) : reg11[(1'h1):(1'h1)]))));
            end
          reg96 <= (~|$signed(reg8[(4'he):(4'h9)]));
          reg97 <= reg87;
        end
      else
        begin
          if ($unsigned((-wire7)))
            begin
              reg93 <= ((&($signed(reg82) ?
                  $signed(reg75[(4'hd):(3'h7)]) : (&reg10))) != reg77);
            end
          else
            begin
              reg93 <= $signed(wire6[(4'hb):(3'h7)]);
              reg94 <= (!reg83);
              reg95 <= (~^$unsigned((8'ha6)));
              reg96 <= (~|wire2);
            end
        end
      reg98 <= reg92;
    end
  always
    @(posedge clk) begin
      reg99 <= ($unsigned(($unsigned($signed((8'hb9))) << (reg83 & reg77[(3'h7):(3'h7)]))) ?
          (+(($unsigned(reg85) ?
              (reg89 ^~ wire5) : $unsigned(reg97)) >>> (reg83 ?
              (reg84 ? reg89 : reg90) : ((8'hb4) ^ reg94)))) : ((8'hac) ?
              reg87 : {reg86[(3'h6):(2'h2)]}));
    end
  assign wire100 = (~^reg81[(3'h6):(3'h5)]);
  assign wire101 = $signed((!reg85[(4'hc):(2'h3)]));
  assign wire102 = {{wire91[(1'h1):(1'h0)]}};
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 (1'h0)};
  assign wire22 = wire17;
  assign wire23 = (-$signed((|$unsigned(((8'ha2) < wire19)))));
  assign wire24 = (wire20 << (&$unsigned(({wire23, (7'h40)} && wire23))));
  assign wire25 = (wire20[(2'h3):(2'h2)] && {($unsigned($signed(wire17)) != wire18),
                      wire20});
  module26 #() modinst65 (wire64, clk, wire25, wire22, wire17, wire24);
  assign wire66 = wire25;
  assign wire67 = $unsigned($signed(($signed($signed(wire18)) - $signed($unsigned((8'h9d))))));
  assign wire68 = (|((((^(8'hbf)) >= wire66[(4'hf):(4'h9)]) ?
                          {wire25[(4'hc):(3'h4)]} : wire23[(1'h0):(1'h0)]) ?
                      (wire21 <<< $unsigned($signed(wire64))) : ($signed($unsigned((8'had))) ?
                          wire24 : $unsigned(wire23))));
  assign wire69 = wire17;
  assign wire70 = ((!wire21) ?
                      (wire21[(3'h5):(1'h0)] ?
                          wire17[(3'h5):(2'h2)] : wire66[(3'h5):(2'h2)]) : (8'hb7));
  assign wire71 = (($signed((-$signed(wire18))) ?
                          ($signed(wire23[(4'h9):(4'h8)]) ?
                              (!wire25[(1'h1):(1'h0)]) : wire17) : wire22) ?
                      wire25[(1'h0):(1'h0)] : wire18[(3'h6):(2'h3)]);
endmodule

module module26
#(parameter param62 = (~^(((~^((8'ha9) ? (7'h42) : (8'hb5))) ~^ (((8'hbe) ~^ (8'hbd)) ? (~^(8'hb9)) : ((8'h9f) || (8'hb3)))) & ((((8'ha6) ? (8'ha1) : (8'hb7)) ^ (!(8'ha2))) ? (((8'hbf) < (8'hb7)) < {(8'ha2)}) : {(!(8'ha2)), (+(7'h43))}))), 
parameter param63 = param62)
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire30;
  input wire signed [(4'he):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire28;
  input wire [(3'h5):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire31;
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire46,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire31,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire31 = {(|(wire28 ?
                          ({wire29} >= wire28[(4'hf):(4'h8)]) : wire28[(5'h14):(4'h9)]))};
  always
    @(posedge clk) begin
      reg32 <= wire29;
    end
  always
    @(posedge clk) begin
      reg33 <= $signed(((({wire28, reg32} ? reg32 : wire29) ?
          (~&wire27[(2'h3):(1'h0)]) : {(wire29 != wire28)}) == (reg32 ?
          wire30 : $unsigned(wire27[(2'h3):(2'h3)]))));
    end
  assign wire34 = reg32;
  assign wire35 = (!(!{(((8'hb5) ? (8'ha7) : wire28) || (-reg32)), wire28}));
  assign wire36 = reg33;
  assign wire37 = (~$signed(((^(wire27 != wire35)) << $signed($signed(wire34)))));
  assign wire38 = $signed(wire27[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg39 <= ({{(~^{wire27}), reg32},
              $unsigned($signed(wire29[(1'h0):(1'h0)]))} ?
          (reg32[(4'h8):(2'h2)] ?
              reg32 : (wire34[(4'h8):(2'h3)] ?
                  wire36[(2'h3):(1'h0)] : $signed($signed(wire36)))) : (wire35[(3'h5):(3'h5)] ?
              $signed($unsigned($signed(reg33))) : wire28));
      if (({reg33[(3'h6):(1'h1)], (-wire35[(3'h6):(3'h4)])} ?
          ($signed(wire38) | wire27[(3'h4):(1'h1)]) : wire37))
        begin
          reg40 <= (~|$unsigned({((wire35 < (8'haa)) - $unsigned((8'ha9))),
              $unsigned((wire36 > wire27))}));
          reg41 <= $unsigned((8'hb7));
          reg42 <= ((-{($unsigned(wire36) ? (~^(8'h9f)) : {(8'haf)}),
              (!(wire27 ? (8'had) : wire29))}) && ({$unsigned((&reg41)),
              ((wire29 != wire30) ?
                  ((8'hb5) + (8'ha5)) : {(8'hba)})} <= wire29[(4'ha):(4'ha)]));
          reg43 <= $unsigned(wire29);
          reg44 <= ((($signed((reg41 >> reg32)) ?
                  wire37[(2'h2):(1'h0)] : wire28[(1'h0):(1'h0)]) ?
              (wire30[(3'h6):(2'h2)] ?
                  $signed(reg32) : $signed($signed(reg41))) : (~^$signed(wire27[(1'h0):(1'h0)]))) <= wire35[(1'h0):(1'h0)]);
        end
      else
        begin
          reg40 <= wire35;
          reg41 <= $signed(reg32);
          reg42 <= $signed($signed(reg43[(1'h0):(1'h0)]));
        end
    end
  always
    @(posedge clk) begin
      reg45 <= reg39;
    end
  assign wire46 = (8'h9d);
  always
    @(posedge clk) begin
      reg47 <= $signed($unsigned($signed($unsigned(wire46[(1'h1):(1'h1)]))));
      if ($signed($unsigned(((~|(wire36 != reg32)) ?
          wire29[(4'h9):(3'h6)] : reg41))))
        begin
          if (wire29[(4'ha):(4'h8)])
            begin
              reg48 <= $signed((+reg45[(1'h1):(1'h1)]));
              reg49 <= $unsigned($unsigned(reg41[(1'h0):(1'h0)]));
              reg50 <= reg42;
            end
          else
            begin
              reg48 <= (!$signed(reg47[(3'h6):(2'h2)]));
              reg49 <= wire38[(3'h6):(3'h5)];
              reg50 <= (7'h43);
              reg51 <= reg32[(4'ha):(3'h4)];
            end
        end
      else
        begin
          reg48 <= (^~$unsigned(wire46));
          reg49 <= (((wire38[(1'h1):(1'h0)] == $unsigned(reg43)) < (wire31[(3'h5):(1'h0)] >>> (|reg51[(1'h1):(1'h1)]))) ^ ({$signed((^~wire31)),
                  $unsigned((~&wire36))} ?
              $unsigned(((reg50 ? reg44 : reg50) ?
                  wire37 : wire37[(3'h4):(3'h4)])) : wire35[(1'h0):(1'h0)]));
          if (($unsigned((^$signed((~&(8'hab))))) * (wire29[(4'hc):(3'h4)] != {$signed($signed(reg50)),
              wire31[(4'hc):(1'h0)]})))
            begin
              reg50 <= (reg43[(3'h4):(1'h1)] || $signed((~$signed((~|reg44)))));
              reg51 <= reg47[(1'h0):(1'h0)];
            end
          else
            begin
              reg50 <= (!$unsigned($signed($signed($unsigned(wire29)))));
            end
          reg52 <= (wire46[(3'h5):(2'h3)] ?
              $unsigned($unsigned(wire36[(1'h0):(1'h0)])) : wire36);
        end
    end
  always
    @(posedge clk) begin
      reg53 <= {$unsigned($unsigned($unsigned((8'hae)))), reg51};
    end
  assign wire54 = (wire30[(4'h8):(3'h5)] + {(-$unsigned((8'hb8))),
                      ($signed($signed(reg41)) ?
                          $signed({reg53, (8'hbf)}) : (reg47 ?
                              (reg53 != reg41) : wire29[(4'hd):(4'ha)]))});
  assign wire55 = ($signed({{$unsigned(wire28)}, (+{(8'h9d), wire54})}) ?
                      (($signed(reg40[(4'hd):(2'h2)]) == (~&wire29[(4'he):(3'h7)])) ?
                          (reg39[(4'h9):(3'h7)] ?
                              ((wire54 ? reg41 : wire38) ?
                                  wire37[(1'h0):(1'h0)] : (reg33 | (8'ha1))) : ($unsigned(reg53) ?
                                  (reg52 ?
                                      wire35 : reg47) : reg50)) : (reg44 < (reg52[(4'ha):(4'ha)] ?
                              reg52 : (reg39 ? wire54 : wire28)))) : reg50);
  assign wire56 = (^((reg51[(3'h6):(1'h0)] ?
                          $signed((~^reg49)) : wire29[(4'hd):(3'h7)]) ?
                      $signed(wire29) : reg39[(4'ha):(4'h8)]));
  assign wire57 = ($unsigned(wire28) ?
                      (~|reg52[(4'ha):(4'h9)]) : $unsigned(((|$signed(reg39)) ?
                          (~^wire28[(4'ha):(2'h2)]) : ((wire38 ?
                              wire37 : reg45) && {wire38}))));
  assign wire58 = (reg51 ?
                      $signed($signed(($signed(reg42) >> (~|wire56)))) : (reg49 ?
                          {{reg39}} : {((8'ha5) > reg40[(4'hd):(3'h4)]),
                              wire27}));
  assign wire59 = {{(wire57 && (reg32[(4'h9):(1'h1)] ?
                              (~^wire30) : (wire34 > reg33))),
                          $signed((wire29[(3'h7):(2'h3)] < (+wire56)))},
                      (($signed({(8'h9e), (8'ha7)}) ?
                              $signed((^~wire46)) : $signed(((7'h40) >> reg39))) ?
                          $unsigned(reg33) : wire57[(3'h7):(1'h1)])};
  assign wire60 = wire36[(2'h3):(1'h0)];
  assign wire61 = reg33;
endmodule
