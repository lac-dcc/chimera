module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  wire signed [(3'h4):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire57;
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire93,
                 wire92,
                 wire80,
                 wire78,
                 wire4,
                 wire57,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 (1'h0)};
  assign wire4 = (!(~&((!(7'h40)) < $signed((8'h9c)))));
  module5 #() modinst58 (wire57, clk, wire1, wire0, wire4, wire2, wire3);
  module59 #() modinst79 (.wire62(wire2), .wire63(wire4), .clk(clk), .wire60(wire3), .y(wire78), .wire61(wire57));
  assign wire80 = $unsigned((&$signed($signed($unsigned((8'haf))))));
  always
    @(posedge clk) begin
      reg81 <= $unsigned(wire3[(4'hf):(3'h7)]);
      if ((8'ha8))
        begin
          reg82 <= ((~$unsigned({$signed(wire78),
              wire3[(4'ha):(2'h2)]})) >= ($unsigned($unsigned($unsigned(wire57))) ?
              ((wire57 ? $unsigned(wire0) : $signed(wire2)) ?
                  $signed((wire1 >>> wire80)) : $signed((wire1 ?
                      (8'hbb) : wire3))) : (-{(wire3 || wire4),
                  ((8'hb1) <<< wire0)})));
        end
      else
        begin
          reg82 <= wire57[(5'h12):(5'h10)];
          reg83 <= $unsigned(((8'hb7) ~^ (!$unsigned(wire80))));
          if ($signed(({$unsigned((wire2 ?
                  wire78 : wire3))} && ((reg82[(3'h4):(1'h1)] <= wire1[(1'h1):(1'h0)]) && $signed(reg81)))))
            begin
              reg84 <= (wire80 << (reg83[(4'hb):(3'h4)] & (^~$unsigned(wire2[(4'hc):(3'h4)]))));
              reg85 <= $signed(reg84);
              reg86 <= (^~(-wire3));
              reg87 <= (((reg81 ?
                  ((+reg82) && $unsigned(wire3)) : (-wire57)) - $unsigned(((reg86 ?
                      wire80 : wire80) ?
                  reg85 : $signed(reg83)))) ^ $unsigned({$signed(reg86[(3'h7):(1'h1)]),
                  (~|wire57[(3'h4):(3'h4)])}));
            end
          else
            begin
              reg84 <= (({$signed((reg83 ~^ wire2))} < ((wire80[(1'h0):(1'h0)] ?
                          wire0[(4'he):(3'h4)] : wire0) ?
                      ($unsigned(reg85) | (8'ha5)) : $unsigned(wire78[(4'h8):(2'h3)]))) ?
                  $signed({(!$signed(wire0))}) : $signed(($signed((^~wire0)) ?
                      $signed($signed(wire4)) : $signed((^wire80)))));
              reg85 <= $signed((^~(~^{reg87, (reg81 < wire4)})));
              reg86 <= ($unsigned($signed($unsigned((&wire1)))) - ($unsigned(reg86) ?
                  (~reg85) : (~&{(wire78 ? wire0 : reg81)})));
            end
          if ((wire4[(3'h6):(3'h4)] ?
              ((reg85 ^ $unsigned($signed(wire2))) ?
                  $unsigned({$unsigned(wire2),
                      (reg86 - wire78)}) : $unsigned(reg82[(2'h2):(1'h0)])) : wire78))
            begin
              reg88 <= (($unsigned(reg86) == $signed($signed((+wire2)))) ?
                  wire4[(4'hb):(4'h9)] : (~{(wire4 ?
                          ((8'hb9) | wire80) : wire1[(2'h3):(1'h1)]),
                      (wire78[(4'he):(3'h5)] ?
                          (-wire4) : (wire57 <<< reg85))}));
              reg89 <= $unsigned((wire3[(4'he):(4'ha)] ?
                  (wire2 > {reg85[(3'h5):(1'h1)], $unsigned(reg86)}) : wire0));
            end
          else
            begin
              reg88 <= {reg87};
            end
        end
    end
  always
    @(posedge clk) begin
      reg90 <= (reg89 | (~^{$unsigned(wire57[(3'h6):(3'h5)]),
          (+$unsigned(wire0))}));
      reg91 <= wire80[(2'h2):(1'h1)];
    end
  assign wire92 = ((|(-((wire3 ? wire80 : (8'ha9)) ^~ (~&wire57)))) << reg91);
  assign wire93 = $unsigned($unsigned($signed(((~reg83) ?
                      $signed(reg83) : $signed(reg88)))));
  always
    @(posedge clk) begin
      reg94 <= wire4;
      if ((8'ha4))
        begin
          reg95 <= ($signed((~^reg84)) ?
              $unsigned(($signed(wire2) < reg84)) : (~|($signed((reg84 ?
                  (8'hb0) : (8'hba))) << reg81[(4'he):(3'h5)])));
        end
      else
        begin
          reg95 <= $signed((~|$signed($signed((reg91 ~^ reg94)))));
          reg96 <= wire80[(1'h0):(1'h0)];
          reg97 <= ($unsigned((reg85[(3'h4):(2'h2)] ?
              $unsigned((reg96 ?
                  wire92 : wire80)) : wire3)) | ((^reg87[(4'ha):(3'h6)]) ?
              $unsigned(($unsigned(reg91) << (-wire92))) : (wire92[(3'h5):(2'h3)] < (8'ha6))));
        end
    end
  assign wire98 = $signed((((~&(wire78 ? reg90 : reg87)) ?
                      {(|wire78),
                          wire78} : (&$signed(wire1))) != ($signed(wire57[(3'h5):(3'h5)]) ?
                      $signed(wire0[(3'h5):(1'h1)]) : (reg87 >>> wire4[(1'h1):(1'h0)]))));
  assign wire99 = $unsigned($signed($unsigned(reg97[(1'h0):(1'h0)])));
  assign wire100 = (reg84[(3'h6):(3'h5)] >>> reg87);
  assign wire101 = (-$unsigned(wire78[(1'h1):(1'h1)]));
endmodule

module module59  (y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire63;
  input wire signed [(3'h4):(1'h0)] wire62;
  input wire signed [(4'ha):(1'h0)] wire61;
  input wire [(4'hb):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg70,
                 (1'h0)};
  assign wire64 = ($signed($signed(({wire61} == wire60))) ^~ wire63[(3'h7):(1'h1)]);
  assign wire65 = $signed((8'had));
  assign wire66 = (wire64 >>> ($unsigned(wire63) ?
                      (~^({(8'hb9), wire61} ?
                          (wire65 >>> (8'hbd)) : (+wire60))) : {$signed((+wire60)),
                          $signed(wire65[(2'h2):(1'h1)])}));
  assign wire67 = (~&(wire64 ?
                      ({wire65[(2'h3):(1'h1)]} ?
                          ((wire62 ? wire63 : wire66) ?
                              (8'hb3) : wire60) : wire61[(4'ha):(4'h8)]) : (((~&wire61) ^ (wire65 >> wire64)) && ($signed((8'hbd)) ?
                          $signed(wire66) : $signed(wire65)))));
  assign wire68 = ($unsigned($signed(wire62)) ?
                      ($signed($signed((~^wire60))) + (((|wire65) ^ $unsigned(wire66)) ?
                          $signed((wire61 ?
                              (8'ha8) : wire64)) : (-$unsigned(wire67)))) : {wire62[(2'h3):(1'h0)]});
  assign wire69 = $signed((7'h41));
  always
    @(posedge clk) begin
      reg70 <= (-wire63[(3'h7):(3'h4)]);
    end
  assign wire71 = wire64;
  assign wire72 = ($signed(wire69) << $unsigned(($unsigned($signed(wire69)) && {wire62[(3'h4):(3'h4)],
                      $unsigned((8'h9f))})));
  assign wire73 = $unsigned(wire67[(3'h7):(3'h7)]);
  assign wire74 = $unsigned((~|{wire64, $signed((wire64 ? wire63 : reg70))}));
  assign wire75 = $unsigned(wire60);
  assign wire76 = (~&$unsigned($signed($signed(wire66))));
  assign wire77 = (|$unsigned(wire62));
endmodule

module module5
#(parameter param55 = ((((((8'hb1) ? (8'ha0) : (7'h43)) ? (-(8'hb5)) : {(8'ha2)}) > {((7'h40) ? (8'h9c) : (8'hb6)), ((8'hba) == (8'h9d))}) * (((-(8'haa)) <= ((8'ha8) >> (8'hbd))) ? (((8'hb3) ? (8'hbb) : (8'h9c)) ~^ ((8'hb0) ? (8'had) : (8'h9d))) : (~|((8'hae) ? (8'haf) : (8'ha1))))) ? (({(&(7'h44))} ? (((8'hb9) ? (8'hbd) : (8'haf)) >= ((8'hae) ? (8'ha6) : (8'hbd))) : ({(8'hab)} ? (-(8'hab)) : ((8'ha7) ? (8'ha7) : (8'h9e)))) ? ((~|(~&(7'h41))) << (((8'hb8) == (8'hb7)) >>> ((8'ha6) ? (8'ha4) : (8'hbd)))) : {(8'hb0)}) : (((&((8'h9d) ? (8'hb6) : (7'h44))) | {((8'ha7) < (8'hae)), (~(8'hb0))}) ? ((^((8'hb8) * (7'h43))) ? (((8'hb7) ^ (8'hb4)) ? (~(7'h40)) : {(8'hb8), (7'h42)}) : ((~&(8'hbc)) >= (8'ha6))) : ((((8'hbd) ? (8'hb3) : (8'ha1)) ? (&(7'h44)) : (!(8'ha2))) > (^{(8'ha8)})))), 
parameter param56 = {(param55 ^~ (-((param55 + (8'ha1)) ? {param55, param55} : (param55 ? param55 : param55))))})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  assign y = {wire54, wire53, wire52, wire50, wire13, wire12, wire11, (1'h0)};
  assign wire11 = $signed(((~^$unsigned($signed(wire9))) + $signed((wire6 ?
                      (~|wire9) : (wire9 ? wire9 : wire6)))));
  assign wire12 = (^~(&(8'ha6)));
  assign wire13 = wire11;
  module14 #() modinst51 (wire50, clk, wire12, wire13, wire9, wire7);
  assign wire52 = ({$signed($unsigned($signed(wire9)))} ?
                      ((+wire8[(3'h4):(3'h4)]) != (wire11[(5'h15):(3'h7)] ?
                          ({wire8} == (~&wire9)) : wire10[(4'h8):(3'h7)])) : $signed((((wire9 ?
                                  wire6 : wire6) ?
                              (wire9 <= wire9) : $unsigned((8'ha0))) ?
                          ($signed(wire9) ?
                              $signed(wire7) : wire12[(3'h5):(1'h0)]) : wire8)));
  assign wire53 = ($unsigned($signed(wire10[(2'h3):(2'h2)])) ?
                      wire6[(4'h8):(3'h6)] : (|wire9[(5'h10):(4'h9)]));
  assign wire54 = wire50;
endmodule

module module14
#(parameter param49 = {((^~(((7'h43) ? (8'ha1) : (7'h43)) > ((8'hac) ? (8'had) : (8'hb7)))) ~^ (^(((8'h9e) ? (8'hb3) : (8'hba)) & (!(8'ha7)))))})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire [(4'h9):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire20,
                 wire19,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire19 = (wire17[(1'h1):(1'h1)] < ((-wire17) ?
                      $signed(((wire15 || wire15) ?
                          $unsigned(wire16) : (wire15 == wire15))) : wire18[(4'h9):(2'h2)]));
  assign wire20 = {$unsigned($signed(wire16[(2'h2):(2'h2)]))};
  always
    @(posedge clk) begin
      reg21 <= (wire20 * (|((|wire15[(3'h7):(1'h1)]) ?
          (^~wire16) : $signed(wire15[(1'h1):(1'h0)]))));
      reg22 <= (wire19 || (((8'ha3) + $unsigned(wire17[(3'h4):(2'h3)])) << wire17));
      if (wire18[(4'h8):(3'h7)])
        begin
          reg23 <= {(!$unsigned((^~((8'ha0) ? wire16 : reg22)))),
              $unsigned($signed(($signed(wire20) ?
                  (wire15 ? wire19 : (8'hb7)) : reg22)))};
          if ({({$signed((reg22 - wire18))} ?
                  reg21 : (wire19 ?
                      ((wire16 ? wire19 : (8'had)) ?
                          (wire19 ?
                              wire19 : wire18) : (reg22 && wire20)) : {$signed(wire17)}))})
            begin
              reg24 <= $unsigned((~|(($unsigned(wire16) << $unsigned((8'ha8))) ?
                  $signed(wire15[(3'h5):(3'h4)]) : $unsigned((wire16 ?
                      wire19 : reg22)))));
              reg25 <= ($signed(({(&(8'hb3))} && (~(reg21 ?
                  wire19 : wire16)))) - $unsigned((^~wire20)));
              reg26 <= reg21;
            end
          else
            begin
              reg24 <= $unsigned({((reg24[(3'h5):(3'h5)] == (reg24 ?
                          wire18 : reg21)) ?
                      ((reg26 ? wire19 : reg23) ?
                          (reg24 || reg23) : $unsigned(wire19)) : wire17)});
              reg25 <= reg22;
              reg26 <= reg23;
              reg27 <= reg22;
            end
          if (reg22)
            begin
              reg28 <= wire18;
            end
          else
            begin
              reg28 <= (!$unsigned((~&$signed({wire17}))));
              reg29 <= (8'h9c);
              reg30 <= $unsigned((!{$unsigned($unsigned(wire20))}));
              reg31 <= (&(wire15 != (^~(~^(reg24 ? reg28 : (8'hbb))))));
              reg32 <= (((($signed(wire20) + (reg28 ?
                          reg30 : (8'hae))) | wire16) ?
                      $signed($signed($unsigned(reg30))) : $signed((|$unsigned(reg29)))) ?
                  (($unsigned(((8'h9e) > reg21)) * $signed((wire20 ?
                      reg28 : (8'h9e)))) ^ $signed({{(8'ha5)},
                      wire19})) : ((reg26[(3'h4):(3'h4)] ?
                      $signed($unsigned((8'hbf))) : reg22[(2'h2):(1'h0)]) & $signed(reg27[(2'h2):(2'h2)])));
            end
        end
      else
        begin
          reg23 <= wire16;
        end
      if ($signed(reg22))
        begin
          reg33 <= wire20[(4'hb):(3'h5)];
          reg34 <= ((((reg26[(3'h5):(2'h2)] ?
                      (reg28 ? reg24 : reg30) : (reg22 <<< wire19)) ?
                  (wire20[(3'h7):(3'h4)] == reg24[(4'h8):(3'h5)]) : reg21[(3'h6):(1'h1)]) ?
              (reg31[(1'h0):(1'h0)] >> $signed((^reg30))) : $unsigned($signed(reg21[(5'h11):(4'h8)]))) != ((~((reg25 ?
              (8'h9e) : wire17) <= (8'haf))) << $signed(reg28)));
          reg35 <= $signed(reg30);
          reg36 <= reg32;
        end
      else
        begin
          reg33 <= (~^$unsigned($signed((reg30 ?
              $signed(wire15) : $unsigned(reg23)))));
          if (reg33[(4'ha):(2'h3)])
            begin
              reg34 <= ($signed((((|reg31) >> $unsigned(reg29)) - $unsigned((reg34 ?
                      (8'hba) : (8'hb5))))) ?
                  (~$unsigned((~&$signed(wire15)))) : $signed($unsigned(((reg21 & reg21) == reg35))));
            end
          else
            begin
              reg34 <= (-wire15);
              reg35 <= {(&(&$unsigned({(8'hb8)}))), reg23[(4'h8):(1'h0)]};
              reg36 <= (!wire19);
            end
          reg37 <= $signed(reg36);
          if (reg32[(4'hc):(4'hc)])
            begin
              reg38 <= wire16;
              reg39 <= $unsigned($signed($unsigned((&(wire18 ^~ reg36)))));
              reg40 <= (^~((~&$unsigned(reg34[(3'h5):(3'h4)])) ?
                  reg31 : (&({(8'h9e), reg24} * (reg24 - reg29)))));
            end
          else
            begin
              reg38 <= reg27;
              reg39 <= {$unsigned($unsigned((reg22[(1'h1):(1'h1)] ?
                      (wire18 ? reg39 : reg33) : (reg31 && (8'hb9)))))};
            end
          if ((~&(($unsigned(reg40) ? {{reg33}} : reg32[(5'h12):(4'hf)]) ?
              $unsigned({reg32}) : reg31)))
            begin
              reg41 <= {(~&$unsigned((((8'hb4) || reg28) ?
                      $unsigned(wire16) : (+(8'hba))))),
                  $signed($unsigned((^~$signed(reg31))))};
            end
          else
            begin
              reg41 <= {reg32};
            end
        end
    end
  assign wire42 = {{reg41[(4'ha):(1'h0)]}, (7'h40)};
  assign wire43 = wire16[(4'h8):(3'h4)];
  assign wire44 = {(($unsigned((^(7'h44))) >= $signed(reg26[(4'ha):(1'h0)])) - (({wire20} > $signed(reg23)) - wire20[(4'hf):(2'h2)])),
                      $unsigned((&wire15))};
  assign wire45 = (|wire20);
  assign wire46 = reg24;
  assign wire47 = reg33[(3'h4):(2'h2)];
  assign wire48 = wire15[(4'h8):(3'h5)];
endmodule
