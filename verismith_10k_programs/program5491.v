module top
#(parameter param113 = {(^((((7'h42) - (8'h9d)) ? (-(8'ha4)) : (~^(8'hba))) > (~^((8'ha1) <= (8'hb4)))))}, 
parameter param114 = {((-(~param113)) || {{(8'ha0), (param113 ? param113 : param113)}}), param113})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire [(4'hc):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire23;
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire97,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire25,
                 wire4,
                 wire23,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire4 = wire2;
  module5 #() modinst24 (wire23, clk, wire3, wire0, wire2, wire1, wire4);
  assign wire25 = (|{wire3});
  always
    @(posedge clk) begin
      reg26 <= {(8'haf)};
      reg27 <= ($unsigned(($signed({wire23}) ^~ ((+(8'hbe)) == (-wire0)))) <<< wire1);
    end
  assign wire28 = (~|((wire4[(3'h5):(3'h4)] != (!$unsigned(wire0))) < {$unsigned(reg27),
                      wire3}));
  assign wire29 = {($signed(($signed(wire4) < (wire25 ? wire0 : wire23))) ?
                          ($unsigned($unsigned(reg26)) <<< {((8'haf) ?
                                  wire3 : wire28),
                              (~&reg26)}) : (($unsigned(wire4) ?
                              reg26[(2'h2):(2'h2)] : {wire3,
                                  (8'hb1)}) * reg27[(2'h3):(2'h3)])),
                      {(^~{(wire0 ? wire25 : reg27)})}};
  assign wire30 = wire3[(3'h7):(2'h3)];
  assign wire31 = wire4;
  assign wire32 = {$unsigned(($signed(wire2) | {(~wire30)}))};
  module33 #() modinst98 (wire97, clk, wire23, wire30, wire1, wire2);
  always
    @(posedge clk) begin
      if (wire97[(3'h4):(2'h2)])
        begin
          if (reg26)
            begin
              reg99 <= wire4[(4'hb):(4'h8)];
              reg100 <= $unsigned((({wire29[(3'h4):(1'h1)]} | ($signed(wire29) ?
                      {reg26} : (wire25 == wire0))) ?
                  reg26[(5'h10):(4'hd)] : $unsigned(wire3[(2'h3):(1'h1)])));
              reg101 <= (8'ha7);
              reg102 <= $signed({{{reg100[(3'h7):(3'h7)]}}});
            end
          else
            begin
              reg99 <= $unsigned((reg99 ?
                  ($unsigned(wire28[(2'h2):(2'h2)]) ?
                      ((reg102 ? wire3 : wire30) ^~ ((8'h9f) ?
                          reg102 : wire28)) : $signed(reg101[(3'h5):(3'h5)])) : (~^((wire2 < wire28) ?
                      wire23 : (wire1 ? wire97 : reg99)))));
              reg100 <= reg100;
              reg101 <= {wire2, $signed((reg99[(1'h1):(1'h1)] - (|(!wire30))))};
            end
          reg103 <= wire1;
          reg104 <= {(~^{reg99}),
              $unsigned(({((8'hb0) ^ wire97), (reg103 <= wire25)} ?
                  wire31 : ((reg100 ? wire32 : reg100) >= (reg100 ?
                      reg100 : wire29))))};
          reg105 <= $unsigned((-$signed($signed($signed(wire1)))));
        end
      else
        begin
          reg99 <= $unsigned(($unsigned($unsigned(reg99[(2'h2):(1'h1)])) | ((+((8'hb8) ?
              wire30 : reg105)) >= wire3)));
        end
      reg106 <= (wire29[(3'h5):(3'h5)] ~^ $signed($unsigned(wire30[(2'h2):(1'h0)])));
      reg107 <= ($unsigned($signed((7'h41))) <<< $unsigned($signed(wire0)));
      reg108 <= $unsigned((reg102 || ($signed(reg100) ?
          $unsigned(((8'h9c) ^ reg99)) : (+{wire2, reg107}))));
      reg109 <= reg105;
    end
  assign wire110 = (wire2[(4'hd):(4'hd)] ?
                       (^(reg109[(4'h8):(2'h2)] << wire23)) : (|$unsigned({(reg104 ^ reg100),
                           (reg106 + wire30)})));
  assign wire111 = wire3[(1'h0):(1'h0)];
  assign wire112 = wire31;
endmodule

module module33
#(parameter param95 = (8'hb7), 
parameter param96 = ((^(-param95)) * param95))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire37;
  input wire signed [(4'hb):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  input wire signed [(4'hf):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire91;
  wire signed [(4'ha):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire67,
                 wire66,
                 wire64,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 (1'h0)};
  assign wire38 = (~^$unsigned((($signed(wire35) <<< (^wire36)) - wire37)));
  assign wire39 = (wire37 && $signed(wire34[(3'h6):(2'h2)]));
  assign wire40 = (+wire34);
  assign wire41 = (+wire35);
  assign wire42 = ((-(-{$unsigned((8'had))})) + ($unsigned(wire40) ?
                      wire36[(3'h7):(1'h0)] : $unsigned(wire37[(2'h3):(1'h0)])));
  module43 #() modinst65 (wire64, clk, wire37, wire36, wire42, wire34);
  assign wire66 = $signed(wire37);
  assign wire67 = $signed(wire39);
  module68 #() modinst88 (.clk(clk), .wire69(wire64), .y(wire87), .wire72(wire37), .wire71(wire34), .wire70(wire41));
  assign wire89 = wire41;
  assign wire90 = (-{wire37});
  assign wire91 = (^~wire37);
  assign wire92 = (wire91[(3'h5):(2'h3)] ?
                      $signed({(wire42 != $unsigned(wire64)),
                          {$unsigned(wire66),
                              (~&wire41)}}) : wire67[(1'h1):(1'h0)]);
  assign wire93 = wire40[(4'h8):(1'h1)];
  assign wire94 = wire93[(3'h4):(1'h1)];
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire11;
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  assign y = {wire22,
                 wire20,
                 wire11,
                 reg21,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = ({wire10} ~^ wire6);
  always
    @(posedge clk) begin
      reg12 <= {(wire11[(2'h2):(1'h1)] ?
              wire10[(1'h0):(1'h0)] : $signed(wire10[(2'h3):(2'h3)])),
          $signed({$unsigned(wire11[(2'h3):(1'h1)])})};
      if ((wire7[(1'h0):(1'h0)] ^ $signed($signed((-$unsigned(wire6))))))
        begin
          if ((wire10 <= $unsigned((-$signed((~wire6))))))
            begin
              reg13 <= wire6;
              reg14 <= {(wire11 ?
                      (wire6 < $signed($signed(wire7))) : wire10[(2'h2):(1'h1)]),
                  ($unsigned({$unsigned(wire7), (|wire8)}) ?
                      (wire6 || {$signed(wire9)}) : reg13[(2'h2):(1'h0)])};
              reg15 <= wire6[(1'h0):(1'h0)];
              reg16 <= reg14[(3'h4):(2'h2)];
            end
          else
            begin
              reg13 <= $unsigned((-$signed({(wire11 ? reg15 : wire11),
                  wire10})));
              reg14 <= (|reg15);
              reg15 <= (8'ha4);
              reg16 <= $signed({$signed(($unsigned(reg15) < (+wire6)))});
              reg17 <= $signed((({$signed(wire8)} ?
                      (7'h41) : ($unsigned(wire11) ?
                          $signed(reg14) : (|wire8))) ?
                  {(reg15[(4'hb):(4'ha)] ~^ reg12[(4'hd):(3'h5)])} : $signed(((~^wire11) ~^ $unsigned((8'had))))));
            end
        end
      else
        begin
          reg13 <= {{reg12[(4'hd):(2'h3)],
                  $unsigned({(|wire6), (reg15 || reg13)})}};
          reg14 <= wire10[(1'h0):(1'h0)];
        end
      reg18 <= $signed($signed($signed($unsigned((reg15 & reg15)))));
      reg19 <= (&$signed({(reg16 ~^ reg16), (^~(reg14 ? wire7 : reg14))}));
    end
  assign wire20 = (wire10[(1'h1):(1'h1)] < reg13);
  always
    @(posedge clk) begin
      reg21 <= $unsigned(reg18);
    end
  assign wire22 = (wire9 ^~ ((^~$unsigned(reg12[(3'h5):(1'h0)])) ^ (^~((~(8'ha0)) ?
                      $unsigned(reg14) : $unsigned(wire6)))));
endmodule

module module68
#(parameter param86 = {(~&((((8'hb1) <= (8'haf)) ? (&(8'haf)) : {(8'ha3)}) ^~ (((8'hb1) & (8'hb1)) ? ((8'hb3) ? (8'hb1) : (8'hb1)) : ((8'hb8) && (8'ha8)))))})
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire72;
  input wire signed [(4'hf):(1'h0)] wire71;
  input wire signed [(5'h15):(1'h0)] wire70;
  input wire signed [(3'h7):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(3'h7):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  assign y = {wire85,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire73 = ($signed(wire69[(1'h0):(1'h0)]) ?
                      ({(~&wire72[(1'h1):(1'h0)])} - (wire69 ?
                          {wire70, (wire71 << wire69)} : wire72)) : (~^wire72));
  assign wire74 = (wire69[(3'h4):(2'h3)] >>> $unsigned(wire72[(3'h7):(2'h2)]));
  assign wire75 = wire72;
  assign wire76 = ((^($signed($signed(wire75)) ?
                          ({wire71, wire72} ?
                              $signed(wire69) : wire72[(4'hf):(2'h2)]) : ((~&(8'ha9)) ?
                              wire73[(1'h1):(1'h1)] : $unsigned((8'haa))))) ?
                      (((wire71 & {wire71}) ?
                          (((8'ha7) - (7'h40)) < $signed(wire70)) : wire70) & wire73) : (($signed((wire72 ?
                              wire72 : wire73)) ?
                          wire75 : wire71) ~^ (~^$signed((~^wire74)))));
  assign wire77 = ($signed(($unsigned($signed(wire75)) && wire75)) ?
                      (wire69 | (&{$signed(wire71),
                          $signed((8'ha8))})) : $signed(($unsigned((|(7'h43))) ?
                          (^$signed(wire70)) : $unsigned((wire76 ?
                              wire71 : wire76)))));
  assign wire78 = (&wire73[(4'hb):(4'hb)]);
  assign wire79 = wire72;
  assign wire80 = (^$unsigned((|((wire69 ? wire70 : wire78) * wire76))));
  assign wire81 = {((-wire73[(3'h5):(1'h1)]) << ($signed($unsigned(wire79)) ?
                          {wire79} : ((wire73 ? wire76 : (8'hac)) ^ wire71)))};
  always
    @(posedge clk) begin
      reg82 <= ((~^(~^{$signed(wire81)})) <<< (!((~&wire74[(4'hd):(4'hd)]) ?
          (-wire72[(4'h9):(4'h9)]) : $signed((wire77 ^ wire79)))));
      reg83 <= (+wire74[(5'h14):(4'hc)]);
      reg84 <= wire72;
    end
  assign wire85 = $signed($unsigned((8'hb3)));
endmodule

module module43
#(parameter param63 = (~|(-((-((8'hb8) ? (8'hb6) : (8'ha3))) ? (^((8'had) | (8'hbc))) : ({(8'ha1), (8'hbf)} < (&(8'h9c)))))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  input wire [(4'h8):(1'h0)] wire45;
  input wire [(4'h8):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 (1'h0)};
  assign wire48 = $unsigned($signed(({$unsigned(wire47), {wire44, wire46}} ?
                      ($unsigned((7'h43)) <= $unsigned(wire46)) : wire47[(1'h1):(1'h1)])));
  assign wire49 = $signed((&$signed($unsigned((-wire48)))));
  assign wire50 = $unsigned($unsigned({{$unsigned(wire47),
                          $unsigned(wire46)}}));
  assign wire51 = wire50[(2'h3):(1'h0)];
  assign wire52 = (^$unsigned((($signed((8'ha0)) & (wire50 ? wire50 : wire46)) ?
                      ($signed(wire50) ?
                          wire48 : (~&wire49)) : ({wire48} + wire47[(1'h1):(1'h0)]))));
  assign wire53 = {wire44[(2'h3):(1'h1)],
                      ((wire47 ? $unsigned(wire46) : wire45) >> wire47)};
  assign wire54 = wire52;
  assign wire55 = wire54;
  assign wire56 = wire52;
  assign wire57 = ((((wire45 ? {(7'h41)} : (wire47 ? wire48 : wire46)) ?
                      wire46 : $signed((wire51 > wire54))) <<< (((wire47 <<< wire46) ?
                      (wire45 ?
                          wire47 : (8'ha1)) : $signed(wire50)) | {(|wire44),
                      wire46})) == $signed(wire45[(2'h2):(1'h0)]));
  assign wire58 = {(wire49 ?
                          (wire51 ?
                              (~wire50[(3'h5):(2'h2)]) : $signed(wire55)) : {(-wire44)}),
                      (|(wire53 * wire53))};
  assign wire59 = {(~&$signed(({wire51, (8'hb8)} ?
                          wire47[(2'h2):(2'h2)] : wire57)))};
  assign wire60 = {$signed(({$unsigned(wire51)} >= (8'ha3)))};
  assign wire61 = {wire58[(2'h3):(2'h2)]};
  assign wire62 = wire44;
endmodule
