module top
#(parameter param107 = (^~((({(8'hb3)} < {(7'h43)}) ? ((+(8'ha9)) ? ((8'h9f) ? (8'hba) : (7'h41)) : (~(8'hb2))) : {((8'h9f) ? (8'ha6) : (8'ha4)), ((8'haf) || (7'h40))}) * {(~|((8'hbf) - (8'hab))), ({(8'hb7), (8'hbf)} && {(8'hbb)})})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire87;
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire5,
                 wire87,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg89,
                 (1'h0)};
  assign wire5 = wire4;
  module6 #() modinst88 (.wire9(wire0), .clk(clk), .wire11(wire3), .wire8(wire2), .wire10(wire1), .y(wire87), .wire7(wire4));
  always
    @(posedge clk) begin
      reg89 <= ($unsigned((wire0 == wire5[(4'hd):(3'h5)])) ?
          wire1 : wire2[(4'hb):(2'h3)]);
    end
  assign wire90 = (8'ha0);
  assign wire91 = (+$unsigned(({$signed(wire0)} ?
                      $unsigned($signed(reg89)) : (^~(wire2 && reg89)))));
  assign wire92 = (8'ha8);
  assign wire93 = $signed({$signed($signed($unsigned(wire87))),
                      $unsigned({wire91, (~wire1)})});
  assign wire94 = (($unsigned((!$signed(wire4))) < $signed(wire92[(3'h6):(1'h0)])) * wire92[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg95 <= ($unsigned(wire3) ?
          {(8'hae)} : $unsigned(($unsigned(wire92[(1'h0):(1'h0)]) ~^ wire91[(4'h8):(3'h4)])));
      reg96 <= $unsigned($unsigned(({(wire90 ? wire93 : wire5),
          (wire5 ? wire87 : wire1)} ^ ($signed(wire4) <= wire94))));
      reg97 <= wire92;
      reg98 <= $unsigned((({wire1[(4'hb):(1'h1)]} ?
              $unsigned($signed((8'ha8))) : ((wire92 ?
                  wire87 : wire94) ~^ $signed(reg97))) ?
          (8'ha1) : wire93[(4'h8):(2'h2)]));
    end
  assign wire99 = (reg97[(2'h3):(2'h3)] << $signed($signed($unsigned((+reg98)))));
  assign wire100 = wire94[(4'hf):(4'h9)];
  assign wire101 = wire4;
  assign wire102 = (reg89[(4'he):(2'h3)] == {((wire1[(4'h8):(3'h4)] <= (wire3 >= wire0)) ?
                           ((wire91 ?
                               reg96 : wire94) << wire87[(1'h1):(1'h1)]) : $unsigned((wire92 && reg97)))});
  assign wire103 = $unsigned($signed((wire94 < $unsigned((|(8'haf))))));
  assign wire104 = ((wire90[(3'h6):(2'h3)] ?
                           (^~($signed(wire2) ?
                               $signed(wire2) : wire91[(4'hb):(3'h4)])) : $signed($unsigned($unsigned(wire0)))) ?
                       ($signed((~wire0[(4'h8):(3'h5)])) * reg89[(3'h7):(3'h6)]) : ($signed($signed($signed(wire93))) <<< $signed($unsigned((|(8'hae))))));
  assign wire105 = ((7'h41) && $signed(wire87));
  assign wire106 = ((({$signed(reg97), $signed(wire3)} ?
                       wire99[(5'h11):(4'h8)] : {$unsigned((8'ha4))}) << (($unsigned((8'ha7)) - (wire103 ^ wire104)) & (^~(reg98 ?
                       reg97 : wire91)))) ^ wire5);
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire84;
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  assign y = {wire86,
                 wire47,
                 wire12,
                 wire49,
                 wire56,
                 wire57,
                 wire84,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire12 = ({wire8} >>> ((|$signed({wire8, wire8})) || wire10));
  module13 #() modinst48 (wire47, clk, wire9, wire10, wire7, wire11, wire12);
  assign wire49 = wire10[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if ($signed(((~|wire47[(5'h10):(4'ha)]) ?
          wire9[(3'h4):(2'h3)] : $unsigned(((^wire12) ?
              ((8'hb6) ^ wire12) : {wire12})))))
        begin
          reg50 <= $unsigned((wire47 <= (wire49 >> wire49)));
          reg51 <= $unsigned(wire7[(4'h9):(1'h1)]);
          reg52 <= $unsigned($unsigned((8'hb3)));
        end
      else
        begin
          reg50 <= $signed(wire47[(1'h0):(1'h0)]);
          reg51 <= $signed(($signed({wire9[(4'h8):(3'h5)],
              $unsigned((8'hbc))}) >>> $signed((~^$signed(reg50)))));
        end
      reg53 <= (($signed(((8'ha9) & ((8'ha1) ? wire47 : wire10))) ?
          wire49[(1'h1):(1'h0)] : (^((wire11 ? wire49 : wire8) < {wire10,
              reg52}))) << (wire11[(1'h1):(1'h1)] && $unsigned(((wire10 || wire47) ~^ (~|wire11)))));
      reg54 <= (wire11 <= {$signed($unsigned(wire11)), wire9[(3'h6):(3'h6)]});
      reg55 <= (reg53[(1'h0):(1'h0)] >= wire10[(2'h3):(2'h2)]);
    end
  assign wire56 = {reg54[(3'h6):(1'h1)], $unsigned({wire49})};
  assign wire57 = (8'h9e);
  module58 #() modinst85 (.wire62(reg51), .wire59(wire49), .wire61(reg50), .y(wire84), .wire60(wire10), .wire63(wire57), .clk(clk));
  assign wire86 = (~|$signed((~&$unsigned((wire7 == reg50)))));
endmodule

module module58
#(parameter param82 = {(({(|(8'ha4))} << (-{(8'hb6)})) ? (^~({(8'hbf)} ? ((7'h42) >>> (8'hbe)) : (!(8'haa)))) : (((|(8'ha9)) ^ (+(8'h9c))) ? ((~^(7'h40)) ? ((8'hbe) > (8'hb3)) : {(8'ha2)}) : (+((8'h9f) == (8'ha3)))))}, 
parameter param83 = (param82 >> (~^(param82 ? {param82, (param82 ? (8'hbd) : param82)} : (^~(8'hbc))))))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire63;
  input wire signed [(4'ha):(1'h0)] wire62;
  input wire [(4'hc):(1'h0)] wire61;
  input wire signed [(2'h2):(1'h0)] wire60;
  input wire [(3'h4):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire69,
                 wire68,
                 wire66,
                 wire65,
                 wire64,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg67,
                 (1'h0)};
  assign wire64 = (&{($unsigned(wire62[(2'h2):(1'h0)]) ?
                          (&(wire61 ?
                              wire62 : wire62)) : $signed($unsigned((8'hae)))),
                      (8'hbd)});
  assign wire65 = (+wire62[(2'h2):(1'h1)]);
  assign wire66 = ($signed((($unsigned(wire64) <= (wire59 || (7'h43))) ?
                          $unsigned($unsigned(wire63)) : $unsigned($unsigned(wire64)))) ?
                      (~$signed($signed($signed(wire59)))) : (&(~^(^(^wire62)))));
  always
    @(posedge clk) begin
      reg67 <= wire60[(1'h1):(1'h0)];
    end
  assign wire68 = (^~(wire63[(4'h8):(2'h2)] >>> {$signed($unsigned(wire60)),
                      {(^~(8'ha4)), wire66[(1'h0):(1'h0)]}}));
  assign wire69 = $unsigned({((wire59[(2'h2):(1'h1)] == $signed((7'h44))) ?
                          wire61[(4'hc):(4'ha)] : ((wire63 ^ wire64) <<< (wire63 | wire60)))});
  always
    @(posedge clk) begin
      reg70 <= wire68;
      reg71 <= $signed(($signed(wire59[(1'h1):(1'h1)]) <<< wire63));
      reg72 <= (8'h9d);
      reg73 <= wire65;
    end
  assign wire74 = {wire61[(3'h7):(2'h3)], wire68[(4'he):(4'hd)]};
  assign wire75 = ($signed((~$signed(wire63[(3'h7):(3'h6)]))) && reg67);
  assign wire76 = $unsigned(({(~(^~wire62)), (|(~|wire62))} ?
                      $signed(wire62) : (~|({wire59, wire61} * (reg72 ?
                          wire61 : reg70)))));
  assign wire77 = {$unsigned((&(reg72[(3'h5):(3'h4)] ?
                          (wire65 | wire59) : (wire65 ? (8'haa) : wire61))))};
  assign wire78 = wire61[(1'h1):(1'h0)];
  assign wire79 = (wire65 ?
                      wire60 : $signed($signed($signed((wire60 ?
                          reg71 : wire62)))));
  assign wire80 = wire62[(2'h3):(2'h2)];
  assign wire81 = $unsigned($signed($unsigned(((wire76 ? reg71 : (8'hb7)) ?
                      $unsigned((7'h42)) : wire60))));
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  input wire signed [(3'h7):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
                 (1'h0)};
  assign wire19 = $signed((($signed(wire17[(4'ha):(3'h4)]) ?
                          {$unsigned(wire15),
                              (8'hac)} : wire16[(5'h13):(4'hd)]) ?
                      (wire17[(4'ha):(2'h2)] ?
                          wire14[(3'h6):(1'h0)] : wire18) : wire18[(3'h7):(3'h7)]));
  assign wire20 = (-((-((^~wire19) ?
                      $unsigned(wire19) : (wire15 ?
                          wire19 : wire17))) + ($unsigned($signed((8'hb3))) ?
                      (wire17 ^ wire16) : $signed({wire17}))));
  assign wire21 = (^(&wire15[(3'h6):(3'h4)]));
  assign wire22 = $signed($unsigned((8'h9c)));
  assign wire23 = {$unsigned($signed($signed((+wire22)))),
                      $unsigned((~&(7'h43)))};
  assign wire24 = (wire14[(1'h0):(1'h0)] && {(^~((8'hac) ?
                          (wire22 ? (8'ha3) : wire19) : (wire14 + wire16)))});
  assign wire25 = $signed(wire14[(3'h6):(3'h4)]);
  assign wire26 = wire22;
  always
    @(posedge clk) begin
      if ((wire25[(2'h3):(1'h1)] ? (8'h9e) : $signed(wire24[(3'h6):(3'h5)])))
        begin
          if (((wire24[(3'h5):(2'h3)] ?
                  (^{$unsigned(wire20)}) : wire25[(3'h5):(3'h4)]) ?
              (~&$signed(($signed(wire18) ~^ (wire19 ?
                  wire26 : wire21)))) : wire19))
            begin
              reg27 <= $unsigned($signed(($signed({wire22}) ?
                  wire25 : wire21)));
            end
          else
            begin
              reg27 <= wire16[(1'h0):(1'h0)];
              reg28 <= $signed((wire23 ?
                  (-$signed(wire15[(3'h5):(1'h0)])) : (wire14 ?
                      ((wire18 ?
                          wire19 : wire16) << (wire24 + wire23)) : ((~&(8'had)) ?
                          wire26 : (wire24 ? wire23 : wire18)))));
              reg29 <= ((reg27 != {(^$unsigned(wire24))}) ~^ ({$unsigned($signed(wire18))} & (8'hba)));
              reg30 <= $unsigned(wire15);
              reg31 <= (wire24 << {(($unsigned(wire25) && (+wire25)) ?
                      wire16 : $unsigned((wire21 ? (8'hb1) : wire20))),
                  (wire23 ? $signed($unsigned(wire18)) : (^wire19))});
            end
        end
      else
        begin
          reg27 <= reg31[(4'hf):(4'hb)];
          if (($unsigned((((8'hb6) ?
                      (wire15 || wire17) : wire19[(3'h5):(2'h3)]) ?
                  {((8'hb8) ? wire24 : reg28), {wire21}} : reg28)) ?
              ((~^((^(7'h40)) <= (wire14 <<< wire14))) < (wire20 ?
                  reg28 : (reg31[(3'h4):(3'h4)] ?
                      reg29 : (wire22 >= reg28)))) : (($signed((wire26 > wire20)) ?
                  $signed(wire20[(4'h9):(2'h2)]) : (!wire15[(3'h4):(2'h2)])) - wire16[(4'hb):(4'ha)])))
            begin
              reg28 <= wire22;
              reg29 <= ((($unsigned(reg30) ?
                          reg30 : $signed($unsigned(wire15))) ?
                      $unsigned({(wire17 ?
                              wire24 : wire23)}) : $signed((!((8'ha0) ?
                          (8'h9e) : wire20)))) ?
                  {{reg29,
                          ((wire17 || wire24) ?
                              $signed(reg29) : (wire24 ? wire22 : wire19))},
                      ({{(8'hb6)}} ?
                          (8'hb1) : wire26[(4'hc):(3'h6)])} : (~^($signed((reg28 ?
                          reg31 : wire24)) ?
                      $unsigned((wire14 ?
                          (8'hb4) : wire23)) : reg30[(5'h10):(5'h10)])));
              reg30 <= {(~^(wire17 ?
                      {(|reg31),
                          (wire20 < wire18)} : ((~&wire14) || wire16[(5'h15):(5'h12)])))};
              reg31 <= reg30[(1'h1):(1'h0)];
            end
          else
            begin
              reg28 <= reg29;
              reg29 <= $signed($unsigned(($signed($signed(reg27)) ?
                  wire16 : (!{wire20}))));
              reg30 <= ($unsigned(wire24[(3'h5):(2'h3)]) ?
                  reg28[(2'h2):(1'h1)] : ((wire18[(1'h1):(1'h1)] + {$signed((8'ha1)),
                          {wire25, wire19}}) ?
                      wire17[(4'h9):(3'h4)] : ((~|$unsigned(reg30)) ?
                          ((wire25 ? reg31 : (7'h41)) ?
                              $unsigned(wire20) : (wire26 ?
                                  wire23 : wire21)) : $unsigned((wire14 ?
                              wire14 : wire24)))));
              reg31 <= wire26;
              reg32 <= $unsigned({{((wire15 ? wire20 : reg30) ?
                          (reg29 | reg29) : $signed(wire24))}});
            end
          reg33 <= ((($unsigned({reg30, wire24}) ^~ {{wire21, wire19}}) ?
                  wire17[(4'ha):(3'h6)] : (&$unsigned((8'hbe)))) ?
              ({$unsigned(((8'hbf) - reg27)),
                      {(|wire15), (reg30 ? wire20 : wire21)}} ?
                  $signed(reg31) : ({wire24[(3'h6):(1'h0)]} ^ wire23)) : $signed($unsigned(($signed(wire20) >>> (!(8'ha4))))));
          reg34 <= ((((+$unsigned(reg29)) | ((reg30 >>> reg27) ?
                      wire18 : (reg29 ? (8'hab) : wire19))) ?
                  wire19 : (!($signed(wire26) ?
                      (wire23 ? wire18 : wire17) : reg28))) ?
              (~(reg28 + $signed(wire24))) : (~^(((+reg30) ?
                  wire22[(5'h11):(5'h10)] : $signed((8'h9e))) | wire14[(3'h6):(3'h6)])));
        end
      if ((reg34[(4'ha):(2'h2)] | (reg28 ?
          reg33 : ($signed((wire15 <= wire16)) ?
              ($unsigned(reg32) * (&wire20)) : reg31[(5'h14):(4'h9)]))))
        begin
          if (reg33)
            begin
              reg35 <= reg31[(4'h8):(4'h8)];
            end
          else
            begin
              reg35 <= wire14;
              reg36 <= $signed(((wire22 ?
                  reg35[(3'h4):(1'h0)] : reg32) && (^~($signed(wire19) ?
                  $unsigned(wire26) : (8'ha4)))));
              reg37 <= ((($unsigned(wire17) && ((reg28 >> (7'h43)) ?
                          (-(8'hb1)) : {reg32, wire17})) ?
                      wire19[(2'h2):(1'h1)] : $signed($signed($unsigned(wire19)))) ?
                  wire21[(1'h0):(1'h0)] : $unsigned((~wire25[(1'h0):(1'h0)])));
              reg38 <= $unsigned((((+(8'hb1)) ?
                  reg33[(5'h11):(5'h10)] : reg34[(2'h3):(2'h3)]) + wire26));
              reg39 <= reg32;
            end
        end
      else
        begin
          reg35 <= $signed(((~&$signed((!wire23))) ?
              wire22[(5'h10):(5'h10)] : reg29));
          reg36 <= (-$unsigned(reg38));
          reg37 <= $unsigned($signed($unsigned(((^reg37) ?
              $signed(reg33) : $unsigned((8'ha0))))));
          reg38 <= (|(~reg35));
        end
      reg40 <= reg28[(2'h2):(1'h1)];
    end
  assign wire41 = ($unsigned((reg31[(5'h12):(4'he)] ?
                          ({reg34} ?
                              reg28 : $unsigned(wire23)) : wire16[(4'hd):(4'h8)])) ?
                      ($unsigned((~&(~^reg29))) ?
                          {(&$signed(reg28)),
                              ($signed(wire14) ?
                                  $unsigned(wire20) : reg27[(4'hd):(3'h6)])} : (~|((reg27 ?
                                  reg27 : wire19) ?
                              (!wire22) : $signed(reg35)))) : $unsigned($unsigned((((8'hb8) ^ wire19) ?
                          wire22[(4'hf):(4'hb)] : $signed(reg40)))));
  assign wire42 = (8'had);
  assign wire43 = ((((~{wire21, wire16}) <<< reg31) ?
                          ({{wire26}} ~^ ((&reg27) ?
                              (reg32 ?
                                  reg37 : reg33) : wire17)) : (~($unsigned(reg40) ?
                              (wire15 <= wire15) : $signed((7'h44))))) ?
                      (8'ha3) : wire15[(1'h0):(1'h0)]);
  assign wire44 = reg27;
  assign wire45 = (reg32[(3'h6):(1'h0)] ?
                      $unsigned(reg33) : (~$unsigned(reg29[(4'h9):(3'h6)])));
  assign wire46 = (wire21[(1'h1):(1'h0)] <= (wire43 ?
                      {$signed($signed(reg29))} : $unsigned(wire16[(3'h6):(3'h4)])));
endmodule
