module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h246):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire15;
  reg [(4'hc):(1'h0)] reg4 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire101,
                 wire75,
                 wire74,
                 wire72,
                 wire51,
                 wire49,
                 wire36,
                 wire35,
                 wire34,
                 wire15,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
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
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~^$unsigned($signed($signed((wire2 + wire1)))));
      if (wire2[(5'h12):(3'h6)])
        begin
          reg5 <= $signed(({wire1[(1'h1):(1'h1)]} ?
              wire2[(5'h11):(1'h1)] : $signed($unsigned($signed(wire2)))));
          if ({wire1, {(^$unsigned((wire0 ? reg4 : reg4)))}})
            begin
              reg6 <= (~&(~|wire3));
              reg7 <= $unsigned($unsigned((&reg6[(3'h4):(1'h1)])));
              reg8 <= $signed($unsigned((^~reg7[(2'h2):(1'h1)])));
            end
          else
            begin
              reg6 <= ((reg7[(1'h0):(1'h0)] ?
                      (($signed((7'h43)) >>> wire0) != ((reg7 > wire0) ^~ (reg4 <<< reg4))) : ((8'hb4) | ((reg7 ?
                          reg7 : reg8) <= (8'h9d)))) ?
                  $unsigned((^((reg8 ?
                      reg7 : (8'ha8)) <<< reg8))) : $unsigned((reg5 ?
                      reg5[(4'hf):(4'he)] : reg6[(2'h3):(1'h0)])));
              reg7 <= {((reg6[(1'h1):(1'h1)] | $signed($signed(reg6))) ?
                      wire1 : $signed(reg4[(4'ha):(3'h4)]))};
              reg8 <= reg5;
            end
          reg9 <= $signed((8'ha8));
          if (($unsigned(wire0[(3'h6):(2'h2)]) ~^ (8'ha4)))
            begin
              reg10 <= $unsigned($unsigned(reg7));
              reg11 <= {wire3};
              reg12 <= (wire1 >> reg4[(3'h5):(2'h3)]);
              reg13 <= $signed($signed(wire1));
            end
          else
            begin
              reg10 <= wire0;
              reg11 <= wire1;
              reg12 <= {((8'hbd) ?
                      $signed(wire1) : ($unsigned((&reg5)) ^ reg5[(3'h5):(2'h3)]))};
              reg13 <= (^~$signed($signed({(~^reg13)})));
              reg14 <= reg8;
            end
        end
      else
        begin
          reg5 <= (reg9[(2'h3):(2'h2)] >> reg6);
          reg6 <= $unsigned(reg8);
          reg7 <= ((($signed(reg12[(4'h8):(4'h8)]) - ((~reg9) > (^~wire1))) & ($unsigned((reg6 >>> reg9)) ?
                  ((reg6 ? reg5 : wire1) ?
                      $signed(reg12) : wire2[(4'hb):(2'h3)]) : (reg11[(4'ha):(1'h0)] ?
                      $unsigned(reg4) : (wire1 ? reg4 : wire0)))) ?
              $signed({reg12}) : reg4[(4'hc):(3'h6)]);
          reg8 <= (-{wire3});
        end
    end
  assign wire15 = (+(8'hb4));
  always
    @(posedge clk) begin
      if ($signed({($unsigned(reg10[(5'h12):(5'h12)]) ?
              (~|wire2[(4'hd):(2'h2)]) : {$unsigned(reg4)})}))
        begin
          reg16 <= reg9[(2'h2):(1'h1)];
          reg17 <= ((($signed((reg10 + reg10)) ?
                  $signed($signed(wire3)) : {reg9[(3'h5):(3'h4)]}) > reg8[(1'h0):(1'h0)]) ?
              $signed($unsigned({$signed(wire1)})) : {(+(~^(~^(8'hba))))});
          if (reg10)
            begin
              reg18 <= (!(~^wire15));
              reg19 <= $unsigned($unsigned(reg17));
              reg20 <= (reg9 ^~ ($unsigned({reg19, {(8'haf), wire15}}) > reg8));
              reg21 <= reg9;
              reg22 <= $signed(wire1[(2'h2):(1'h1)]);
            end
          else
            begin
              reg18 <= reg6[(3'h4):(1'h0)];
              reg19 <= ($signed({$signed($signed((8'hb6))), reg11}) ?
                  reg16[(4'hd):(4'hc)] : {$unsigned($signed((+(8'hb8)))),
                      {{reg7[(2'h3):(2'h2)], (|wire15)},
                          ((-reg6) - (reg22 ? reg19 : reg21))}});
              reg20 <= ((&(|$signed($signed(wire2)))) ?
                  $signed($signed((^~{reg19}))) : reg22);
              reg21 <= (reg12[(3'h7):(3'h7)] || $signed({($signed((8'hbd)) >= (!reg22))}));
            end
        end
      else
        begin
          if ((reg22 ?
              ($signed($unsigned({wire2,
                  reg22})) <= reg16) : $signed((((reg5 > reg9) < reg8) <= $unsigned($unsigned(reg10))))))
            begin
              reg16 <= $signed(((($signed(wire15) ?
                      (~^reg8) : ((7'h43) ?
                          reg7 : reg17)) < $unsigned($signed(reg21))) ?
                  (~|(&wire15)) : {(+(wire0 ? reg21 : reg14)),
                      reg17[(2'h2):(1'h1)]}));
              reg17 <= $signed((-$unsigned({(^reg12), $signed(reg5)})));
              reg18 <= ((reg17[(3'h7):(1'h0)] ?
                      reg19 : (~^($unsigned(wire2) ?
                          $unsigned((8'hb7)) : $unsigned((8'haa))))) ?
                  $unsigned({($unsigned((8'h9c)) ?
                          $unsigned(reg12) : reg8)}) : wire0[(2'h3):(1'h1)]);
              reg19 <= ($unsigned((wire0[(1'h0):(1'h0)] ?
                      {(reg21 <<< reg18)} : $signed({reg21}))) ?
                  ($signed((^wire0)) ?
                      $signed((|(reg10 ^ wire2))) : $unsigned({((8'had) ?
                              reg5 : reg6)})) : ((!($signed(reg22) > reg14)) >>> (((wire2 ?
                          wire0 : wire1) <<< (|reg6)) ?
                      (7'h43) : {(reg20 ? (8'hb9) : wire1)})));
            end
          else
            begin
              reg16 <= (&$unsigned((-((reg9 ? reg16 : reg14) * ((8'ha6) ?
                  wire15 : (8'hb6))))));
            end
          reg20 <= $unsigned($signed(($signed((^~reg6)) ?
              $signed((reg16 ? reg9 : (8'hbd))) : $unsigned(wire3))));
          reg21 <= ({(8'haa),
                  ((~$unsigned(reg5)) || {(wire2 ? reg4 : reg16)})} ?
              $unsigned((~^$signed({(8'ha0), reg19}))) : $signed({reg5}));
          if ($signed(reg20[(1'h1):(1'h1)]))
            begin
              reg22 <= ((!wire0) ?
                  $unsigned(reg22[(4'he):(4'hc)]) : $unsigned((|({reg4,
                      reg12} || reg11[(3'h5):(1'h0)]))));
              reg23 <= ($unsigned((-($unsigned(reg11) <<< (reg12 ^~ wire1)))) ?
                  $signed(($signed(reg17) ?
                      reg13 : (8'ha3))) : ((($signed(wire1) ?
                              (reg19 ? reg13 : wire0) : wire2) ?
                          (wire3[(2'h2):(1'h1)] ?
                              $signed(reg8) : $unsigned(reg22)) : $unsigned(reg20)) ?
                      ((~^$unsigned((8'hb2))) >> ($signed(reg16) > $signed(reg5))) : $unsigned($unsigned((8'h9c)))));
            end
          else
            begin
              reg22 <= (reg11[(1'h0):(1'h0)] + reg21);
              reg23 <= reg18[(1'h0):(1'h0)];
            end
          reg24 <= (reg23[(5'h11):(4'h9)] ~^ (~^(8'hab)));
        end
      reg25 <= ((reg4 ?
          (~|(((7'h42) ? reg4 : (8'hb0)) ? $unsigned(reg19) : reg6)) : (reg18 ?
              $unsigned($unsigned(reg13)) : $signed($signed(reg13)))) || reg19[(4'ha):(3'h6)]);
      reg26 <= (reg24 ?
          (($unsigned((reg10 ?
              wire15 : (8'h9d))) ~^ $signed($signed(reg18))) ^~ (((wire15 == reg24) > (reg10 <= reg16)) ?
              reg20 : ($signed(reg24) ?
                  reg11[(1'h1):(1'h0)] : $unsigned(reg14)))) : ({wire3[(1'h0):(1'h0)]} < reg23));
    end
  always
    @(posedge clk) begin
      if (((~&$signed(wire15[(3'h4):(2'h3)])) ?
          reg8 : (($signed($signed(reg14)) ~^ (~|(~reg16))) && (~&$unsigned((reg18 - (8'hbf)))))))
        begin
          reg27 <= (+$signed($unsigned(($signed(reg19) + $unsigned(reg6)))));
          reg28 <= $signed($signed(($signed(((8'haf) ?
              reg8 : reg24)) <= reg4[(3'h5):(3'h4)])));
          reg29 <= {reg7};
          reg30 <= (($signed(reg19) >>> reg10[(1'h0):(1'h0)]) ^~ (~|$signed(((wire2 ?
                  (8'ha2) : wire1) ?
              {(8'h9d)} : (-reg13)))));
        end
      else
        begin
          reg27 <= {($signed(reg14[(1'h1):(1'h0)]) << reg12),
              $unsigned($signed((~reg21[(2'h2):(1'h1)])))};
          if ($signed(reg9[(4'hd):(3'h5)]))
            begin
              reg28 <= $signed($unsigned($unsigned({$signed(reg17)})));
              reg29 <= (!{(($unsigned((8'had)) ? reg26 : $unsigned(reg23)) ?
                      {(^reg26), reg14[(2'h2):(1'h1)]} : wire15)});
              reg30 <= wire0;
              reg31 <= (8'hb1);
            end
          else
            begin
              reg28 <= {(-({$unsigned(reg11)} | (8'hbe))),
                  (^($signed({reg16,
                      reg22}) <= $unsigned(wire0[(3'h6):(2'h2)])))};
              reg29 <= ($unsigned(reg8[(4'ha):(1'h1)]) ?
                  $signed((^reg26[(4'ha):(2'h3)])) : reg7[(4'h8):(3'h5)]);
              reg30 <= reg21;
              reg31 <= reg26[(4'h9):(2'h3)];
            end
          reg32 <= $signed(((reg27[(2'h3):(1'h0)] ?
              $signed($unsigned((8'hb3))) : reg16[(4'hd):(4'h8)]) | (((wire15 || reg28) <<< $unsigned(wire15)) - $unsigned($unsigned((8'hbc))))));
        end
      reg33 <= ({(($unsigned(reg19) >>> $unsigned((8'ha8))) < $signed($signed(reg17))),
          ($unsigned($signed(wire3)) ?
              ((+(8'hb4)) ?
                  {wire0, reg30} : $unsigned(reg12)) : ({reg13} > {reg7,
                  wire1}))} == ($signed(((~^reg13) - (wire15 ?
              reg27 : reg20))) ?
          reg10 : $unsigned({reg12})));
    end
  assign wire34 = (^reg18);
  assign wire35 = reg18;
  assign wire36 = {(($unsigned(wire34) ? ($signed(reg23) != reg4) : reg4) ?
                          (8'ha0) : reg19[(4'he):(4'ha)])};
  module37 #() modinst50 (wire49, clk, reg14, reg28, reg11, reg31);
  assign wire51 = {reg20, reg16[(5'h12):(3'h6)]};
  module52 #() modinst73 (wire72, clk, reg22, reg9, reg16, reg17);
  assign wire74 = $unsigned(reg29);
  assign wire75 = reg8[(3'h7):(1'h0)];
  module76 #() modinst102 (.wire81(reg14), .y(wire101), .wire80(reg20), .wire78(reg33), .wire79(reg16), .wire77(reg32), .clk(clk));
  assign wire103 = {$unsigned({((&(7'h44)) && reg17)})};
  assign wire104 = reg31;
  assign wire105 = $signed((!$unsigned((8'hb3))));
  assign wire106 = $unsigned(reg4);
  assign wire107 = (+(((^~reg32[(1'h0):(1'h0)]) ?
                       $unsigned($unsigned(reg24)) : ((|(8'h9d)) < $unsigned(wire74))) <<< (reg5 ?
                       wire105[(1'h1):(1'h0)] : wire104[(3'h7):(3'h5)])));
  assign wire108 = (8'h9e);
endmodule

module module76
#(parameter param99 = (({({(7'h43), (8'had)} ^~ ((8'hb1) + (8'hb6)))} ? (~|(((7'h41) ? (8'hbf) : (8'h9e)) ? (+(8'had)) : ((7'h43) ? (8'hbe) : (7'h41)))) : (-(~&(^~(8'ha5))))) - (((^~(+(8'h9d))) ? (((8'hac) | (8'hb1)) ? ((8'hab) <<< (8'h9d)) : ((8'hb6) ? (8'ha1) : (7'h42))) : ((-(8'h9e)) ? {(8'hb0), (8'h9e)} : (~^(8'ha4)))) << (^~(((8'hb7) ? (8'hbc) : (8'ha0)) ? {(7'h40), (8'ha6)} : ((8'ha6) - (7'h42)))))), 
parameter param100 = (^({param99} ? ({((8'hb8) * param99)} + (param99 ? (-(8'hbe)) : param99)) : (param99 * ((param99 ? (8'hb8) : param99) >>> ((8'hb2) & param99))))))
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire81;
  input wire [(5'h14):(1'h0)] wire80;
  input wire [(4'hc):(1'h0)] wire79;
  input wire signed [(2'h2):(1'h0)] wire78;
  input wire signed [(4'h8):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire82;
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire82,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire82 = (~wire77);
  always
    @(posedge clk) begin
      if ($signed((wire80 ?
          {wire79,
              ((wire80 >>> wire79) ? $unsigned(wire80) : (-wire80))} : {wire81,
              ($signed(wire80) >>> (wire82 ? wire81 : wire78))})))
        begin
          reg83 <= (($unsigned(wire82[(2'h2):(1'h0)]) ?
              (wire79 | {(~|wire79)}) : wire77) || wire77[(3'h7):(2'h2)]);
          reg84 <= {(8'ha8)};
          reg85 <= ((((~^wire80) ^~ wire81[(4'hc):(2'h2)]) + $signed(wire79[(3'h7):(3'h6)])) & $unsigned(wire80[(1'h0):(1'h0)]));
          reg86 <= $signed($unsigned((((~wire80) ?
                  (&(7'h44)) : {wire77, reg85}) ?
              $unsigned((8'hba)) : {(7'h43), reg85[(1'h0):(1'h0)]})));
        end
      else
        begin
          reg83 <= (8'hbe);
          reg84 <= wire79;
          if (($signed(((^~$signed(reg85)) ?
                  (8'hb3) : {(wire80 - reg86), $signed(wire77)})) ?
              ((((wire77 - wire80) ? (^~(8'hb6)) : reg86) ?
                  (~&$signed((8'hac))) : wire80) | $signed({wire77})) : $signed(reg85[(3'h4):(2'h3)])))
            begin
              reg85 <= ($unsigned($unsigned(({wire81} ?
                  (|wire78) : (^~reg84)))) || reg86);
            end
          else
            begin
              reg85 <= (~|$signed($signed(reg84[(1'h1):(1'h1)])));
              reg86 <= {$unsigned(wire78),
                  ((&((wire77 | reg86) > (wire77 ^ reg84))) ^ {{(~reg86),
                          $unsigned(wire80)},
                      (((8'h9c) <<< wire77) ?
                          (wire81 ^ wire79) : $unsigned((8'hb9)))})};
              reg87 <= $unsigned($unsigned((^~$unsigned(wire79))));
              reg88 <= (((-reg86) - $unsigned($unsigned((reg83 ?
                      (8'hb1) : (8'hb4))))) ?
                  $signed($signed(wire82[(1'h0):(1'h0)])) : $signed(((^~((8'hb9) - wire77)) ~^ {reg87[(1'h1):(1'h1)]})));
            end
        end
      if ((($unsigned(($unsigned(reg84) <<< $signed(reg87))) ?
          wire77[(1'h0):(1'h0)] : (((wire79 + reg87) ?
                  (wire82 ^~ reg85) : (^~(8'hb5))) ?
              $signed($signed(wire79)) : $unsigned($unsigned(wire82)))) ^~ (reg87[(3'h6):(1'h0)] ~^ (8'hbe))))
        begin
          reg89 <= (~(7'h41));
          reg90 <= reg84;
        end
      else
        begin
          reg89 <= (~&({(~&(reg85 ? reg85 : reg83)), (~|$unsigned((7'h42)))} ?
              wire80[(5'h13):(4'he)] : (-(&$signed(reg88)))));
        end
    end
  assign wire91 = {$signed(((~$unsigned(reg83)) || $signed(wire78[(1'h0):(1'h0)]))),
                      (+wire81)};
  assign wire92 = (^~(reg89 || ($unsigned((&(7'h43))) < (-reg88))));
  assign wire93 = (wire81[(5'h11):(2'h2)] | wire78[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg94 <= (^~($unsigned(reg90) ?
          (-$unsigned((wire93 ?
              reg86 : (7'h42)))) : (|$unsigned($signed(reg86)))));
      reg95 <= (reg88 ?
          $unsigned((wire79[(1'h1):(1'h1)] << ((wire92 ? wire92 : (8'hba)) ?
              {(8'hb5),
                  reg94} : wire82[(2'h3):(2'h3)]))) : $signed(($signed($unsigned(wire80)) ?
              wire78 : $signed((|wire78)))));
      reg96 <= wire81[(3'h7):(3'h7)];
      reg97 <= wire79[(2'h3):(2'h3)];
      reg98 <= $signed($signed(wire81));
    end
endmodule

module module52
#(parameter param71 = {(!(~({(8'h9c)} ? (^~(8'h9e)) : (~|(8'ha4)))))})
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire56;
  input wire [(4'hb):(1'h0)] wire55;
  input wire [(3'h4):(1'h0)] wire54;
  input wire [(4'hf):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire58,
                 wire57,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire57 = (~^wire54);
  assign wire58 = (~(8'hb9));
  always
    @(posedge clk) begin
      if ($signed((wire58 ?
          (~&((wire57 ?
              (8'haf) : wire56) << $unsigned(wire53))) : (^((wire56 << (8'hb0)) + wire58[(1'h0):(1'h0)])))))
        begin
          if (wire56)
            begin
              reg59 <= (!wire57);
              reg60 <= wire56[(1'h1):(1'h1)];
              reg61 <= $unsigned($signed(($signed((wire58 ?
                  wire55 : reg60)) << (~|(wire58 && wire58)))));
            end
          else
            begin
              reg59 <= (^$signed(wire56[(3'h4):(3'h4)]));
              reg60 <= (((~&$unsigned(reg60)) & $unsigned($signed($unsigned(reg61)))) ?
                  ($signed(($signed(wire58) ?
                          ((8'ha8) ^~ reg60) : $signed(reg61))) ?
                      $unsigned((-$unsigned((8'hbf)))) : $signed({wire54,
                          (wire56 ~^ reg61)})) : wire55[(1'h1):(1'h0)]);
            end
          reg62 <= (wire56 ? wire57 : (~|wire55));
          reg63 <= (~^wire54);
        end
      else
        begin
          reg59 <= wire56[(3'h6):(3'h5)];
        end
      reg64 <= reg62;
      reg65 <= $signed(((&wire56) > $signed(($signed(reg64) ?
          (wire55 ? wire58 : wire58) : (reg63 ? reg64 : reg60)))));
      reg66 <= reg63;
    end
  assign wire67 = $signed({$signed(($unsigned((8'hab)) <<< (8'ha4)))});
  assign wire68 = reg64;
  assign wire69 = (|$unsigned(reg62));
  assign wire70 = $unsigned(($signed($signed((reg59 ?
                      reg59 : reg59))) >>> wire53));
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire41;
  input wire [(3'h6):(1'h0)] wire40;
  input wire signed [(2'h3):(1'h0)] wire39;
  input wire signed [(3'h6):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  assign y = {wire48, wire47, wire45, wire44, wire43, wire42, reg46, (1'h0)};
  assign wire42 = $unsigned({wire39[(1'h0):(1'h0)],
                      (~&$signed((wire38 ? wire39 : wire39)))});
  assign wire43 = $signed(wire41[(1'h1):(1'h1)]);
  assign wire44 = $signed({$signed(((wire41 ?
                          (8'hab) : wire42) >>> $unsigned(wire38))),
                      (~|wire40[(3'h5):(1'h1)])});
  assign wire45 = $signed({wire39, (-(+(8'haa)))});
  always
    @(posedge clk) begin
      reg46 <= $signed(wire43[(1'h1):(1'h0)]);
    end
  assign wire47 = wire45[(4'hb):(4'h9)];
  assign wire48 = $unsigned({$unsigned(wire38[(2'h3):(1'h1)]),
                      $signed($signed((wire43 ? wire40 : wire39)))});
endmodule
