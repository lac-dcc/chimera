module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire132;
  wire signed [(4'hf):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire126;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire22;
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire126,
                 wire24,
                 wire22,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  module4 #() modinst23 (.wire7(wire2), .clk(clk), .y(wire22), .wire6(wire3), .wire9(wire0), .wire8(wire1), .wire5((8'hb6)));
  assign wire24 = (((8'h9e) ?
                      (wire3[(4'hb):(1'h0)] ?
                          wire0[(4'h9):(3'h5)] : ((wire3 >> wire2) ~^ wire3)) : wire3[(4'hd):(3'h7)]) * ((wire2[(5'h12):(5'h12)] * $signed((~^wire22))) < wire22[(4'h9):(3'h5)]));
  module25 #() modinst127 (wire126, clk, wire22, wire24, wire1, wire0);
  always
    @(posedge clk) begin
      reg128 <= (+wire0);
      reg129 <= wire24;
      reg130 <= $unsigned((wire2[(4'he):(4'he)] >> ($unsigned((~^wire3)) ?
          $unsigned($unsigned(wire1)) : $signed(wire22))));
    end
  assign wire131 = $unsigned({wire3});
  assign wire132 = $unsigned((wire22[(4'hb):(1'h1)] ?
                       (8'ha5) : ($signed(wire1[(4'hc):(4'h9)]) + wire1[(3'h6):(1'h1)])));
endmodule

module module25
#(parameter param125 = ((~&((((7'h41) == (8'ha1)) ^ ((8'hbe) ? (7'h43) : (8'ha8))) == (!{(8'hbf), (7'h42)}))) - ((((~|(7'h43)) ? (^(8'h9d)) : (&(8'h9d))) ? (|((8'haf) >>> (8'hb0))) : ((8'hb6) ^~ (!(8'ha5)))) < {(&(-(8'hbd)))})))
(y, clk, wire26, wire27, wire28, wire29);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire26;
  input wire [(4'hd):(1'h0)] wire27;
  input wire signed [(4'hd):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire122;
  wire [(3'h6):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire119;
  wire signed [(5'h11):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire116;
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire78,
                 wire80,
                 wire81,
                 wire116,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 (1'h0)};
  module30 #() modinst79 (.y(wire78), .wire31((8'had)), .wire33(wire28), .wire34(wire29), .wire35(wire27), .clk(clk), .wire32(wire26));
  assign wire80 = wire78;
  assign wire81 = (+((wire29 ?
                          ($unsigned(wire28) ~^ (&wire26)) : $signed($unsigned(wire27))) ?
                      wire80[(3'h6):(2'h3)] : wire27));
  always
    @(posedge clk) begin
      reg82 <= (~&{($unsigned($signed(wire27)) != $signed($unsigned(wire29)))});
      reg83 <= (~wire81);
    end
  always
    @(posedge clk) begin
      reg84 <= wire78;
    end
  always
    @(posedge clk) begin
      reg85 <= wire29;
    end
  always
    @(posedge clk) begin
      reg86 <= (~&$unsigned((((+(7'h40)) * $unsigned(wire78)) ?
          reg82[(5'h15):(5'h15)] : $unsigned(wire27[(3'h6):(3'h5)]))));
      reg87 <= $signed((~&wire81[(4'ha):(4'ha)]));
      reg88 <= wire27[(3'h6):(3'h4)];
      reg89 <= $signed(wire27);
      if (({(~|{$signed(wire27), $unsigned(wire28)}), (^~reg83)} ?
          $signed((wire81[(2'h3):(1'h1)] ?
              ((reg87 ? reg86 : wire26) >= ((8'h9c) ?
                  wire29 : reg82)) : $unsigned($signed(wire26)))) : reg87))
        begin
          reg90 <= wire27;
          reg91 <= ((!reg87) >>> ($unsigned((wire28 & wire80[(2'h2):(1'h1)])) ?
              ((^(reg86 ? wire28 : reg87)) ?
                  $signed({reg82}) : {$unsigned(wire29), (~&wire29)}) : reg85));
          reg92 <= {((~^($signed(reg84) || reg91[(2'h2):(1'h0)])) ?
                  $unsigned((wire28[(3'h4):(1'h0)] | reg88[(3'h4):(3'h4)])) : $signed($unsigned(wire28)))};
          reg93 <= (((~^{{reg88}, (reg90 < reg88)}) <<< {(8'ha0)}) ?
              ($unsigned(reg87) ?
                  reg87[(2'h2):(1'h1)] : ($unsigned((8'hb0)) | {(wire80 ?
                          (8'hb7) : wire80),
                      reg87})) : $unsigned($unsigned(reg85[(4'he):(1'h1)])));
        end
      else
        begin
          reg90 <= (7'h42);
          reg91 <= reg83[(5'h11):(4'hf)];
        end
    end
  module94 #() modinst117 (wire116, clk, reg90, reg83, reg82, wire80);
  assign wire118 = (wire116 ?
                       (((wire27 << (~^wire116)) ?
                               (8'hbf) : (~|(wire81 == reg92))) ?
                           (((reg82 ? wire81 : wire81) ^~ (wire27 >> wire81)) ?
                               ((reg83 ?
                                   wire26 : reg93) | (~wire116)) : {wire27[(1'h1):(1'h1)],
                                   reg89}) : {$signed(reg92)}) : (wire78 ?
                           (&(^$unsigned(reg93))) : ((~^(reg82 + reg83)) ^~ $unsigned($unsigned(reg85)))));
  assign wire119 = reg89[(4'hb):(2'h3)];
  assign wire120 = $unsigned({reg85[(2'h2):(2'h2)]});
  assign wire121 = ($signed((reg86[(1'h0):(1'h0)] - $signed(wire119))) ?
                       $unsigned((+(8'ha9))) : $signed((!$signed($signed(reg92)))));
  assign wire122 = reg89[(3'h4):(3'h4)];
  assign wire123 = $unsigned($signed(($signed($unsigned(reg88)) >> {$unsigned(reg87),
                       (+(7'h40))})));
  assign wire124 = ((!$unsigned((^~wire81))) <= $unsigned($signed(($unsigned((8'h9d)) ^ (8'hb1)))));
endmodule

module module4
#(parameter param21 = (&{(((+(8'ha1)) ^~ (&(8'hb7))) <<< (((8'ha0) ? (8'haa) : (8'hb5)) ? {(8'hbc)} : (~|(8'had))))}))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(2'h3):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire10;
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire16,
                 wire15,
                 wire14,
                 wire10,
                 reg18,
                 reg17,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = (~&$signed(wire6));
  always
    @(posedge clk) begin
      reg11 <= (|(8'hbb));
      reg12 <= wire8[(3'h4):(2'h3)];
      reg13 <= $unsigned($signed($signed(wire6[(2'h2):(1'h1)])));
    end
  assign wire14 = (-wire8);
  assign wire15 = wire8;
  assign wire16 = ({{wire7,
                          {(wire9 == wire5)}}} << ($unsigned(wire6[(2'h2):(1'h1)]) ~^ {wire10[(4'he):(4'hc)],
                      reg12[(5'h11):(4'he)]}));
  always
    @(posedge clk) begin
      reg17 <= $signed($signed(reg13[(4'h8):(3'h4)]));
      reg18 <= $unsigned(reg17);
    end
  assign wire19 = $signed(wire15);
  assign wire20 = $unsigned($signed(($unsigned(wire16[(3'h5):(3'h4)]) >= $signed(((8'hbc) ^ wire14)))));
endmodule

module module94  (y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire98;
  input wire signed [(4'he):(1'h0)] wire97;
  input wire signed [(5'h10):(1'h0)] wire96;
  input wire signed [(3'h6):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire99;
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 (1'h0)};
  assign wire99 = wire96;
  assign wire100 = $unsigned({wire96[(4'he):(3'h7)]});
  assign wire101 = wire100;
  assign wire102 = $unsigned(wire99[(2'h2):(2'h2)]);
  assign wire103 = (wire101 << wire98);
  assign wire104 = wire95[(2'h3):(2'h3)];
  assign wire105 = wire100;
  assign wire106 = $unsigned((wire95 ?
                       wire101[(2'h3):(2'h2)] : ({wire98} ?
                           (~(wire102 <<< wire100)) : (wire101 >> $signed(wire105)))));
  assign wire107 = (wire101 >> wire102);
  assign wire108 = $unsigned(wire103);
  assign wire109 = $signed($signed((^wire104)));
  assign wire110 = (((8'hbf) ?
                           $signed((+$signed((8'hb4)))) : ({$unsigned(wire104),
                                   wire107[(3'h6):(3'h6)]} ?
                               $signed(wire102) : $unsigned((wire97 ?
                                   wire104 : wire107)))) ?
                       $signed(wire95[(1'h0):(1'h0)]) : $signed(wire109[(4'hd):(3'h5)]));
  assign wire111 = {wire106};
  assign wire112 = (~|$signed((~^$unsigned(wire98))));
  assign wire113 = {$signed(wire96[(3'h5):(3'h4)])};
  assign wire114 = wire106[(4'h8):(3'h7)];
  assign wire115 = $unsigned(((8'hb4) >> wire96[(4'hb):(1'h0)]));
endmodule

module module30
#(parameter param76 = (~&(({((8'hbe) ? (8'hbf) : (8'hbb)), {(8'hb3), (7'h41)}} ? {((8'hac) >= (8'hac))} : (~&((8'ha3) > (8'ha3)))) || (&(&(7'h42))))), 
parameter param77 = param76)
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire35;
  input wire signed [(4'hf):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire33;
  input wire signed [(4'hc):(1'h0)] wire32;
  input wire [(4'he):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire36;
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire66,
                 wire65,
                 wire64,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire36,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
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
                 (1'h0)};
  assign wire36 = ({((8'hab) ?
                              $signed($unsigned((7'h40))) : $unsigned(((7'h44) << wire31))),
                          wire35[(4'ha):(4'h9)]} ?
                      (8'hbe) : (wire33 < wire31));
  always
    @(posedge clk) begin
      reg37 <= $signed($signed(((~|$unsigned(wire34)) ^~ (~wire33[(1'h1):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      if (($unsigned(($signed((|wire35)) ?
              $unsigned((wire33 ?
                  (8'hbb) : (8'hb9))) : $unsigned((~|wire31)))) ?
          wire36 : (reg37[(2'h2):(1'h0)] ?
              (!$signed((wire33 != wire32))) : ($signed((wire36 ?
                      wire31 : reg37)) ?
                  $unsigned(wire31[(3'h7):(1'h0)]) : $unsigned(wire32[(3'h7):(3'h4)])))))
        begin
          reg38 <= $unsigned(wire34[(3'h7):(3'h5)]);
          reg39 <= (^~wire34);
          if ({(^$signed((7'h43))), wire33[(1'h0):(1'h0)]})
            begin
              reg40 <= (wire33 <= ($unsigned((|wire33)) ^~ {$signed($signed(reg39)),
                  {(!wire31)}}));
            end
          else
            begin
              reg40 <= $unsigned($signed(($signed((reg38 >>> wire35)) ?
                  wire36 : (reg37[(1'h1):(1'h0)] & (wire36 <= wire33)))));
              reg41 <= $unsigned($signed(reg38));
              reg42 <= $signed(wire32[(4'hc):(4'ha)]);
            end
        end
      else
        begin
          reg38 <= $unsigned((-wire32));
          if ($unsigned((!(|$unsigned(wire32)))))
            begin
              reg39 <= (((wire35 << $unsigned($signed(reg39))) ?
                      wire31 : $unsigned((^reg38[(1'h1):(1'h1)]))) ?
                  (8'hba) : $unsigned({$signed(reg38), reg40}));
            end
          else
            begin
              reg39 <= {(~(^~((wire33 >= reg42) ?
                      $unsigned(wire31) : (wire31 < (8'hab)))))};
              reg40 <= $unsigned((reg40 ?
                  $signed(($unsigned(reg42) * (^reg37))) : $unsigned($unsigned((wire36 ?
                      reg38 : (8'hb1))))));
            end
          reg41 <= {wire35, $unsigned(reg41)};
          reg42 <= (|(-(wire31 ? reg40 : wire35)));
          if ({reg41[(4'hf):(4'he)]})
            begin
              reg43 <= ((8'h9c) >= wire35);
            end
          else
            begin
              reg43 <= reg41;
            end
        end
      reg44 <= reg42;
      reg45 <= $signed((8'hbd));
      reg46 <= (wire35 ?
          reg39[(3'h6):(3'h4)] : (~|(reg42[(2'h3):(2'h3)] << {$signed(wire36)})));
    end
  assign wire47 = ((8'ha6) ? $signed(reg46) : {reg38});
  assign wire48 = $unsigned({$unsigned(reg37[(2'h3):(1'h1)]),
                      ((^reg45) ?
                          (^~reg46) : ($signed(wire36) ^~ reg45[(2'h3):(1'h0)]))});
  assign wire49 = $unsigned(($unsigned(wire33[(2'h3):(2'h3)]) << reg45[(2'h3):(1'h0)]));
  assign wire50 = ({reg44[(4'hc):(1'h1)], reg39} ?
                      {(~^($signed((8'h9f)) ?
                              (~&reg44) : (-wire47)))} : $unsigned(($unsigned(wire34) ?
                          $unsigned(reg39) : $signed((~^wire47)))));
  assign wire51 = (+(($signed($unsigned(reg44)) >= (^(~reg46))) <<< (8'had)));
  assign wire52 = (((~(((8'h9e) ?
                          reg43 : wire33) > (wire48 ^ reg42))) ^~ $signed((8'hb2))) ?
                      $unsigned((reg45 ?
                          reg46[(1'h0):(1'h0)] : reg46)) : $unsigned(({(!wire48)} ?
                          (~$signed(reg45)) : (|(wire36 & wire33)))));
  assign wire53 = $unsigned(wire48[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg54 <= $signed($signed(($signed({(8'h9c)}) ^~ (reg38 ?
          $signed(reg40) : $signed(wire31)))));
    end
  always
    @(posedge clk) begin
      reg55 <= wire49;
      reg56 <= ($signed(((|reg44) ?
              (&(8'ha8)) : ($unsigned(wire47) ?
                  $unsigned(reg45) : $unsigned((8'hb1))))) ?
          (wire50 < $unsigned(((-wire50) < (wire33 < wire47)))) : (($unsigned(reg43) ^ $unsigned((wire36 ?
              reg46 : wire32))) > reg43));
      reg57 <= (({reg43[(1'h1):(1'h1)],
              wire53[(3'h7):(1'h1)]} < (^$unsigned((~wire48)))) ?
          {{(~^wire35)},
              ($unsigned(((8'h9f) && reg42)) ?
                  $unsigned((wire52 ?
                      wire48 : wire34)) : $signed(wire50))} : ((!(8'h9c)) >> $signed({(8'h9f),
              reg42})));
    end
  always
    @(posedge clk) begin
      reg58 <= (((!{(8'had),
          (reg38 ?
              reg40 : wire51)}) ^ $unsigned($signed((!reg41)))) <<< wire47);
      reg59 <= wire31[(3'h4):(3'h4)];
      if (wire32)
        begin
          reg60 <= reg54;
          reg61 <= {(~&(((+reg59) ? wire51[(3'h6):(2'h2)] : {reg40}) ?
                  (~|{wire33}) : reg42[(3'h4):(2'h3)]))};
          reg62 <= (8'hbf);
          reg63 <= $signed($unsigned(reg37[(1'h1):(1'h1)]));
        end
      else
        begin
          reg60 <= ((((~^{wire34, wire48}) <= $signed((reg57 ?
                  wire50 : reg38))) ^ ((^~(wire52 ? (8'hae) : wire52)) ?
                  ((wire34 ? wire48 : (8'ha6)) ?
                      (+reg54) : {reg46}) : (reg59 * (~&reg56)))) ?
              {{$signed((wire50 != reg37)), (8'h9c)},
                  $unsigned(reg55)} : $signed($signed(({wire33,
                  wire53} || (!wire34)))));
          reg61 <= wire52[(2'h3):(2'h3)];
        end
    end
  assign wire64 = (8'ha4);
  assign wire65 = (+{($unsigned($unsigned(wire53)) || wire32),
                      (~$unsigned(reg56[(3'h5):(2'h3)]))});
  assign wire66 = reg57[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg67 <= $signed((wire49 != $unsigned(wire33)));
      if ((!wire35))
        begin
          reg68 <= wire36[(3'h4):(2'h2)];
          reg69 <= $signed($unsigned((!wire52)));
          reg70 <= wire51[(2'h2):(1'h0)];
          reg71 <= $unsigned($signed(reg60));
        end
      else
        begin
          reg68 <= reg45[(2'h2):(2'h2)];
          reg69 <= (~|(~&reg63));
          reg70 <= (8'h9d);
          reg71 <= wire32[(4'hb):(1'h1)];
        end
      reg72 <= (8'haf);
      reg73 <= $signed((reg38[(5'h10):(3'h5)] > ((~wire32) ? reg61 : wire48)));
    end
  assign wire74 = (-reg63[(1'h1):(1'h1)]);
  assign wire75 = (reg68[(1'h1):(1'h1)] && (8'h9c));
endmodule
