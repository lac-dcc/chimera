module top
#(parameter param113 = (-(((((7'h42) ? (8'ha4) : (8'haa)) ? (+(8'ha6)) : ((8'ha4) ? (7'h41) : (8'ha9))) + ((8'hba) ? (8'hae) : {(8'ha4), (7'h40)})) ? (^~(((8'had) ? (8'h9d) : (8'hb6)) ? {(8'ha3)} : {(8'hba), (8'hb6)})) : (^~(((8'haf) << (8'hbe)) << (~|(8'hb0)))))), 
parameter param114 = param113)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire111;
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  assign y = {wire5,
                 wire36,
                 wire38,
                 wire39,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire46,
                 wire111,
                 reg40,
                 reg45,
                 (1'h0)};
  assign wire5 = $signed(wire4);
  module6 #() modinst37 (wire36, clk, wire1, wire0, wire4, wire3);
  assign wire38 = (8'ha5);
  assign wire39 = $signed(wire3[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg40 <= wire36;
    end
  assign wire41 = ($unsigned(({(wire2 ? (8'haf) : wire38)} || ((wire1 ?
                      wire2 : wire1) * wire4[(2'h2):(2'h2)]))) >= $signed(($signed(wire0) < {wire39})));
  assign wire42 = $signed(wire2[(3'h6):(3'h4)]);
  assign wire43 = wire5[(3'h6):(3'h5)];
  assign wire44 = (wire0[(3'h7):(3'h4)] & wire3);
  always
    @(posedge clk) begin
      reg45 <= {$unsigned((+$unsigned((wire0 * wire0))))};
    end
  assign wire46 = wire39;
  module47 #() modinst112 (.wire50(reg45), .y(wire111), .wire49(wire5), .wire48(wire1), .wire51(wire36), .clk(clk));
endmodule

module module47  (y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire51;
  input wire signed [(4'h8):(1'h0)] wire50;
  input wire [(3'h4):(1'h0)] wire49;
  input wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire77;
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire92,
                 wire80,
                 wire79,
                 wire77,
                 reg110,
                 reg109,
                 reg108,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
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
  module52 #() modinst78 (wire77, clk, wire50, wire48, wire51, wire49, (8'hae));
  assign wire79 = ($unsigned(((|(wire48 || wire48)) - (8'hbe))) ?
                      $unsigned(((^~wire51[(1'h1):(1'h1)]) < (wire77[(2'h2):(2'h2)] || $signed((8'h9f))))) : {wire48[(4'hd):(4'hb)],
                          {wire51[(5'h12):(5'h12)]}});
  assign wire80 = (+$unsigned($unsigned($unsigned($unsigned(wire51)))));
  always
    @(posedge clk) begin
      if ((wire48[(4'h8):(3'h5)] ?
          wire49[(1'h0):(1'h0)] : (~|(+wire51[(5'h11):(4'hb)]))))
        begin
          reg81 <= $signed(wire77[(3'h5):(3'h4)]);
          if ({((($unsigned((8'hb1)) >>> $signed(wire80)) ?
                  wire51[(4'hf):(3'h6)] : ($signed(wire79) ?
                      {wire79, wire51} : $unsigned(wire80))) <= reg81),
              ((!(~&$signed(wire50))) ~^ $signed((&wire49)))})
            begin
              reg82 <= (((|wire51) ?
                  $unsigned(((wire50 | wire77) ?
                      (wire49 ?
                          wire51 : wire77) : $unsigned(wire49))) : (wire77[(5'h11):(5'h11)] ?
                      $signed((wire51 == wire50)) : $unsigned($unsigned(wire80)))) >>> (|(~(wire49[(1'h0):(1'h0)] == ((8'hb9) ?
                  wire51 : wire80)))));
              reg83 <= $unsigned($unsigned((!$signed({wire80}))));
              reg84 <= $unsigned((wire80 << $unsigned(((&(8'ha5)) >>> (wire51 << wire80)))));
              reg85 <= $signed((wire49 ?
                  {{reg82[(2'h3):(1'h0)]}} : wire48[(4'ha):(3'h5)]));
              reg86 <= ($unsigned((reg83[(4'h9):(2'h2)] ?
                  {((8'hbb) ?
                          wire80 : wire80)} : reg84[(4'ha):(1'h0)])) && $unsigned($signed(((^~reg82) ?
                  $unsigned(reg82) : (~|wire51)))));
            end
          else
            begin
              reg82 <= ({(-($unsigned(wire80) ?
                      ((8'hbe) > reg85) : wire49[(3'h4):(1'h1)]))} && wire80);
              reg83 <= $unsigned({(reg84[(3'h6):(2'h3)] < wire50[(3'h6):(3'h6)])});
              reg84 <= $signed((wire48[(4'hf):(1'h0)] ?
                  (reg81[(1'h0):(1'h0)] ?
                      wire49[(2'h3):(2'h2)] : $unsigned(reg84[(1'h1):(1'h1)])) : wire79[(2'h3):(2'h2)]));
              reg85 <= (($unsigned($signed($signed(reg86))) && wire80) ?
                  reg85[(2'h3):(2'h2)] : {(reg81[(1'h0):(1'h0)] ?
                          $signed((wire48 ?
                              wire80 : reg83)) : (-$signed(reg81))),
                      ({$unsigned(wire80), $signed(reg85)} ?
                          wire48 : $signed((wire48 != reg82)))});
              reg86 <= wire79[(3'h4):(2'h2)];
            end
          if ($signed(reg86))
            begin
              reg87 <= (reg82[(4'ha):(3'h6)] && (({$unsigned(reg84)} ?
                  (~^wire50[(2'h2):(2'h2)]) : {$signed(reg83),
                      $signed(reg83)}) >= wire51));
              reg88 <= wire50;
            end
          else
            begin
              reg87 <= {$signed(reg83)};
              reg88 <= wire50[(3'h6):(3'h5)];
            end
          reg89 <= reg84[(4'ha):(4'ha)];
        end
      else
        begin
          reg81 <= (wire51 > $signed(wire50[(3'h4):(2'h2)]));
          reg82 <= reg84;
          reg83 <= $unsigned((wire51 ?
              $unsigned($signed($signed((7'h44)))) : $signed(wire80)));
          reg84 <= wire77;
        end
      reg90 <= wire50;
      reg91 <= reg86[(2'h3):(1'h1)];
    end
  assign wire92 = $unsigned($unsigned($signed(($unsigned(wire49) ?
                      (reg85 ~^ reg90) : (reg91 | wire51)))));
  always
    @(posedge clk) begin
      reg93 <= (wire51 ?
          reg85 : ($signed(wire80[(3'h7):(1'h1)]) ?
              (((^~reg91) ? wire79 : (wire80 != (8'h9d))) * {(wire49 ?
                      (8'hb5) : reg81),
                  $unsigned(reg83)}) : (~&($unsigned(reg84) >> (reg91 ?
                  reg84 : wire51)))));
      reg94 <= reg81;
      reg95 <= {($unsigned((|wire77[(1'h1):(1'h0)])) ?
              (wire49[(2'h2):(2'h2)] ?
                  wire80[(4'hf):(4'hd)] : $signed($unsigned(reg86))) : ($signed($signed(reg93)) >> {{reg86}})),
          {((wire50 ? $unsigned(reg90) : (~&wire49)) ?
                  ((~&reg88) <= (reg89 & reg91)) : {(wire51 ?
                          (8'ha9) : reg93)})}};
      if (wire48)
        begin
          if (reg85[(3'h5):(3'h4)])
            begin
              reg96 <= $signed((^~$unsigned({reg94[(1'h1):(1'h1)]})));
              reg97 <= $unsigned(reg82);
              reg98 <= wire49[(1'h0):(1'h0)];
            end
          else
            begin
              reg96 <= (~|reg84[(2'h2):(1'h1)]);
              reg97 <= $signed($unsigned(($unsigned(wire50) ?
                  $unsigned($signed(wire51)) : $signed($unsigned(reg97)))));
            end
          reg99 <= $signed($unsigned({(&wire80), {wire50[(3'h4):(2'h2)]}}));
        end
      else
        begin
          reg96 <= $unsigned($signed(wire48[(4'h9):(3'h7)]));
          reg97 <= {((|(7'h41)) ~^ ((~&reg89[(5'h11):(4'hd)]) >= reg93)),
              reg90};
        end
      reg100 <= ($unsigned((^~(wire79[(1'h1):(1'h0)] ^~ $signed(reg97)))) == wire79[(2'h3):(2'h3)]);
    end
  assign wire101 = $unsigned(reg81[(1'h1):(1'h0)]);
  assign wire102 = reg100;
  assign wire103 = ($unsigned($unsigned({$unsigned((7'h42))})) * (~reg93));
  assign wire104 = $signed(($signed(reg86) ?
                       $signed((-(wire48 == reg84))) : {$unsigned(((7'h44) ?
                               wire102 : reg81)),
                           reg84}));
  assign wire105 = ((reg85[(4'h8):(1'h0)] >> $signed((((8'hb0) ?
                       (7'h44) : reg93) <= (8'h9c)))) ^~ ($signed($signed({(8'ha7)})) ?
                       reg86[(3'h4):(2'h3)] : (((8'h9d) ?
                               $unsigned(wire50) : (reg86 | reg84)) ?
                           (wire77 <<< reg94[(4'h8):(1'h1)]) : {wire49})));
  assign wire106 = (reg95 == (wire104 ? reg91 : wire102));
  assign wire107 = (^~wire92);
  always
    @(posedge clk) begin
      reg108 <= reg98[(2'h2):(1'h1)];
      reg109 <= ($unsigned(wire50[(2'h2):(1'h0)]) ?
          (($unsigned((-reg91)) >>> wire50) ?
              $unsigned({$unsigned(reg96),
                  (wire104 * reg91)}) : reg88[(3'h5):(2'h2)]) : (wire77[(4'hb):(3'h6)] > (+((8'had) >> wire102[(1'h1):(1'h1)]))));
      reg110 <= (-wire80);
    end
endmodule

module module6
#(parameter param35 = (~((~^(8'hba)) ^~ {(+(&(8'h9c))), (((8'ha5) ? (8'hbb) : (8'ha8)) ? ((8'hba) >= (8'hbf)) : ((8'h9c) ? (8'hbf) : (8'hb9)))})))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire12,
                 wire11,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = ($unsigned(wire8[(1'h1):(1'h1)]) ?
                      ($signed((^{wire8})) ?
                          (~^(8'hab)) : $unsigned(wire7[(2'h2):(2'h2)])) : ($signed(wire8) >> (~|$unsigned((wire10 ?
                          wire10 : (7'h42))))));
  assign wire12 = $signed((+$signed((&$signed(wire7)))));
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned($unsigned((^~wire11))) == wire7)))
        begin
          reg13 <= wire7[(3'h7):(1'h0)];
          reg14 <= $signed({reg13});
        end
      else
        begin
          reg13 <= $signed($unsigned((($unsigned(wire12) + (wire7 ?
              wire11 : reg14)) == ({wire9} ^ (reg13 ? reg13 : reg13)))));
          reg14 <= $unsigned(wire8);
          if ($unsigned({wire11}))
            begin
              reg15 <= (reg13[(4'hc):(4'h8)] ?
                  $unsigned(($signed((^reg13)) ?
                      {(reg14 ? wire7 : wire8)} : ($signed(wire11) ?
                          $signed(wire7) : (wire8 ?
                              wire8 : wire8)))) : wire10[(4'h8):(1'h0)]);
              reg16 <= (~$signed(wire7[(4'hc):(2'h2)]));
              reg17 <= (wire9 != (^~$unsigned((~^(&wire12)))));
            end
          else
            begin
              reg15 <= reg17;
              reg16 <= $unsigned($signed((~|$signed(wire11[(2'h2):(2'h2)]))));
            end
        end
      reg18 <= $unsigned({wire9, reg15});
    end
  assign wire19 = (8'h9f);
  assign wire20 = $unsigned($unsigned($unsigned((|reg17))));
  always
    @(posedge clk) begin
      if ({$unsigned((^~$unsigned(reg13[(2'h3):(2'h3)])))})
        begin
          reg21 <= wire10;
          if ((~&$signed(((~(~|reg16)) ? wire19 : (^$unsigned(reg16))))))
            begin
              reg22 <= $signed(reg15);
              reg23 <= (((^(-(-reg15))) ?
                  wire19[(2'h2):(1'h1)] : (((8'ha0) ?
                          (wire8 == (8'hbd)) : (reg18 ? wire12 : reg17)) ?
                      $signed(reg18) : (+(reg13 <<< reg22)))) >> (8'hb2));
              reg24 <= $signed(wire12);
              reg25 <= reg13;
            end
          else
            begin
              reg22 <= reg18;
              reg23 <= reg16;
              reg24 <= (8'h9f);
            end
          if ((~^reg18))
            begin
              reg26 <= $signed(($signed(reg21[(4'ha):(1'h1)]) ?
                  $unsigned(((reg13 >>> reg23) && wire19)) : $unsigned(((reg24 ?
                          wire9 : reg14) ?
                      (wire10 ? reg18 : reg25) : {reg24}))));
              reg27 <= $signed(reg21);
              reg28 <= reg13[(4'hc):(3'h7)];
            end
          else
            begin
              reg26 <= reg16;
              reg27 <= (((+reg13[(2'h3):(1'h1)]) ^ wire20) ?
                  {wire8[(3'h5):(1'h0)]} : (reg26[(3'h6):(3'h6)] ?
                      ({reg26[(2'h3):(2'h3)]} ?
                          $signed($signed((8'hac))) : (|$signed(reg17))) : {wire8,
                          $unsigned($signed(reg24))}));
              reg28 <= $unsigned($unsigned($unsigned(reg16)));
              reg29 <= wire19[(2'h3):(1'h0)];
              reg30 <= (~reg16[(3'h5):(2'h3)]);
            end
          reg31 <= reg29[(3'h5):(2'h3)];
          reg32 <= reg15[(1'h1):(1'h1)];
        end
      else
        begin
          reg21 <= $unsigned(($unsigned((reg24 ?
                  (reg28 && reg23) : ((8'hb5) ? (8'ha6) : (8'haf)))) ?
              $unsigned(((wire7 ? reg22 : wire8) < (^wire10))) : (7'h44)));
          reg22 <= reg29;
        end
      reg33 <= reg28[(1'h1):(1'h1)];
      reg34 <= ((-(({reg23} >= (+reg24)) ?
          wire12 : wire8[(2'h2):(1'h1)])) >> (reg23 ?
          reg31 : ($unsigned((reg13 + reg29)) ?
              $unsigned((reg22 ? reg28 : reg18)) : ((reg14 ? reg15 : (8'haa)) ?
                  reg31[(4'h9):(3'h6)] : (reg13 ? wire9 : reg21)))));
    end
endmodule

module module52
#(parameter param76 = {((&((-(8'hba)) >= ((8'h9d) & (8'had)))) ? ((((8'ha5) ? (8'ha5) : (8'ha0)) ? {(8'hbe), (8'had)} : (!(7'h42))) ? ((&(8'ha2)) ? ((8'hbe) ? (8'ha6) : (8'ha0)) : (-(8'hba))) : {((7'h42) ? (8'hb6) : (8'haa))}) : (&({(8'hbf), (7'h40)} != ((8'hbf) & (7'h43))))), {{(((8'hb0) ? (7'h43) : (8'had)) > ((8'hbc) == (8'hae))), ({(8'h9c)} >> (+(8'ha1)))}}})
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire57;
  input wire signed [(5'h10):(1'h0)] wire56;
  input wire [(3'h5):(1'h0)] wire55;
  input wire [(3'h4):(1'h0)] wire54;
  input wire [(4'hc):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire58 = $unsigned((({$signed(wire53),
                          {wire55}} >>> ($unsigned((8'hb1)) ?
                          wire53 : $signed((8'had)))) ?
                      $unsigned(wire53) : (($signed(wire56) == (-wire57)) && {$unsigned(wire55)})));
  assign wire59 = ($unsigned({(~&$unsigned(wire56)),
                      wire53}) ~^ ($unsigned(((wire58 <= (8'hbd)) ?
                      $signed(wire58) : wire54[(3'h4):(1'h0)])) < $signed($signed(wire57[(1'h1):(1'h1)]))));
  assign wire60 = wire54[(2'h2):(1'h1)];
  assign wire61 = (wire56 ?
                      (-(({wire59} ?
                          (wire57 ? wire56 : wire58) : (wire54 ?
                              wire55 : wire55)) == wire53)) : wire56[(4'ha):(1'h1)]);
  assign wire62 = ({wire59,
                      ((~^$unsigned(wire58)) ?
                          wire61 : wire56)} != (!{$unsigned(wire58[(5'h15):(4'hc)])}));
  always
    @(posedge clk) begin
      reg63 <= wire57;
      reg64 <= (+(wire54[(1'h0):(1'h0)] * $signed(((wire53 << reg63) >> (reg63 >= wire62)))));
      if ((wire58 ?
          $unsigned(wire53[(4'h8):(1'h1)]) : ((&wire55[(1'h1):(1'h0)]) ?
              ((^$unsigned(wire60)) ?
                  wire62 : {$signed(wire61),
                      (~&wire57)}) : (wire54 != ((8'hac) ?
                  (reg64 ~^ reg64) : wire60)))))
        begin
          reg65 <= $unsigned($signed(wire53));
          reg66 <= wire58[(3'h5):(1'h1)];
          reg67 <= (~($unsigned(reg66[(3'h6):(2'h3)]) - $signed($signed(reg63))));
        end
      else
        begin
          reg65 <= ($signed((8'hb2)) ?
              (($signed($signed(wire53)) ^ wire60[(4'hc):(3'h4)]) - {(-wire62[(4'ha):(3'h7)])}) : {{$signed($signed(reg65)),
                      (wire56[(1'h0):(1'h0)] - wire62)},
                  $signed({wire59[(1'h0):(1'h0)], {(8'hb6), reg64}})});
          reg66 <= $signed((^~(&wire62)));
          reg67 <= ((+wire54[(1'h0):(1'h0)]) | ({$unsigned(reg64)} ?
              (reg67[(2'h2):(1'h1)] - (&(reg63 ? reg64 : wire58))) : ({(wire53 ?
                      wire62 : (8'had))} + $signed(reg64[(3'h4):(1'h1)]))));
          reg68 <= wire54;
          reg69 <= (~^(($unsigned((~^wire58)) * (^((8'hbd) + reg65))) && (8'ha2)));
        end
      reg70 <= {(~&(((wire58 ?
              (8'ha9) : (8'hba)) > reg65[(2'h3):(2'h2)]) || $unsigned(wire59[(3'h5):(1'h1)]))),
          $signed({reg68[(5'h10):(5'h10)], wire54[(2'h2):(1'h0)]})};
    end
  assign wire71 = wire58[(2'h2):(1'h1)];
  assign wire72 = ($unsigned(reg65) >>> wire71);
  assign wire73 = ((((wire53[(3'h6):(3'h6)] ?
                              (reg64 ?
                                  wire56 : (8'h9d)) : wire53) + $signed((|wire58))) ?
                          wire56 : wire60[(3'h6):(3'h5)]) ?
                      (wire60 <= $unsigned(((reg67 != reg70) ?
                          $unsigned(wire61) : (reg69 ?
                              wire72 : wire55)))) : $unsigned(({{wire58},
                          $signed(wire72)} ^ ((wire53 >>> (8'ha1)) ?
                          (reg66 < wire62) : $signed(wire57)))));
  assign wire74 = {((reg70[(2'h2):(1'h1)] ^ $unsigned((-wire55))) ?
                          $signed($unsigned((~|wire60))) : $unsigned($signed({wire58})))};
  assign wire75 = {$signed((+reg65))};
endmodule
