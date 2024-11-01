module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire106;
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  assign y = {wire108,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire106,
                 reg5,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (&wire3);
    end
  assign wire6 = wire4[(1'h1):(1'h1)];
  assign wire7 = (7'h43);
  assign wire8 = (wire7 ? (7'h41) : (~(8'hbd)));
  assign wire9 = wire0;
  assign wire10 = (~|$signed(wire4[(1'h1):(1'h1)]));
  assign wire11 = (reg5[(4'hc):(4'h8)] * (((-$signed(wire8)) ?
                      ((~&wire9) ?
                          {wire0} : wire2) : (8'haa)) >= ($unsigned((wire1 ~^ wire1)) <= wire6)));
  assign wire12 = $signed(wire1[(3'h4):(1'h1)]);
  assign wire13 = $signed(wire0);
  assign wire14 = wire9[(4'hd):(4'ha)];
  assign wire15 = $unsigned(((({wire7} ? $signed(wire7) : {wire4}) ?
                          ({wire14} ? (+wire7) : reg5) : (wire2 ?
                              $signed(wire7) : $unsigned(wire3))) ?
                      $signed(wire8[(3'h6):(2'h3)]) : reg5[(4'h9):(3'h4)]));
  assign wire16 = ((($signed((^wire1)) ?
                      wire14 : wire15) >= $signed($signed(((8'hbb) < (8'hb3))))) == (+wire11));
  assign wire17 = wire16;
  assign wire18 = wire16;
  assign wire19 = $unsigned(($unsigned({wire14[(1'h1):(1'h0)]}) ?
                      $unsigned((wire4[(1'h1):(1'h1)] ?
                          {wire7, wire0} : wire3[(4'he):(4'hd)])) : wire11));
  assign wire20 = {(({(!wire4)} ?
                              wire17 : ($signed(wire19) ?
                                  wire10 : (wire1 ? wire16 : wire9))) ?
                          {$signed($unsigned((8'had)))} : wire17)};
  always
    @(posedge clk) begin
      if ($signed(wire16[(1'h0):(1'h0)]))
        begin
          reg21 <= {{((~^(7'h43)) * $unsigned((!wire1)))}};
          reg22 <= wire20;
          if ((8'haa))
            begin
              reg23 <= (-(~^reg5[(3'h7):(1'h1)]));
              reg24 <= ($unsigned($unsigned($unsigned((wire2 ?
                      wire20 : reg23)))) ?
                  (~|(8'hbd)) : $signed(wire9[(1'h1):(1'h0)]));
            end
          else
            begin
              reg23 <= reg21;
              reg24 <= ((wire7[(2'h2):(2'h2)] ?
                  (wire18 <<< reg23[(4'hc):(1'h0)]) : {$signed((reg23 <<< wire18))}) - (($unsigned($unsigned(wire6)) + wire20[(3'h7):(1'h1)]) ?
                  (reg5 <= ($unsigned(reg5) ?
                      (reg24 ?
                          wire3 : wire4) : $signed(reg21))) : wire15[(2'h3):(2'h3)]));
              reg25 <= ((((wire7 >= reg23) ?
                  $unsigned({wire16,
                      wire17}) : ($signed((7'h44)) <= wire8)) <<< $signed(wire11)) << ($unsigned((~{wire4,
                  wire9})) ^ (~wire17)));
            end
          reg26 <= wire19[(2'h3):(2'h3)];
        end
      else
        begin
          reg21 <= $unsigned((wire7[(2'h2):(1'h1)] - $signed((wire13[(4'h9):(4'h9)] >> wire2))));
        end
    end
  assign wire27 = {$unsigned(wire6[(3'h4):(1'h1)])};
  assign wire28 = {(&wire8)};
  assign wire29 = (({wire20} ^~ reg24[(2'h3):(2'h2)]) ?
                      (8'hb3) : (~^$signed(wire10[(3'h6):(3'h5)])));
  assign wire30 = $signed(reg24[(3'h7):(3'h4)]);
  module31 #() modinst107 (.wire33(wire7), .clk(clk), .wire32(wire18), .wire35(reg21), .wire34(wire8), .y(wire106));
  assign wire108 = (($unsigned((!$unsigned(wire1))) >= {($unsigned(wire1) ?
                               (wire10 >> wire106) : reg23)}) ?
                       (+$unsigned(wire7)) : $signed((~((wire29 ?
                               (8'ha3) : wire3) ?
                           (+wire20) : reg5[(5'h11):(4'hb)]))));
endmodule

module module31
#(parameter param105 = (~^((^((~(8'haf)) ? {(8'hb0)} : {(8'h9e)})) ~^ (((7'h42) ? ((8'hb3) ? (8'ha8) : (8'hae)) : {(7'h43)}) < (+((8'ha8) >> (8'haf)))))))
(y, clk, wire32, wire33, wire34, wire35);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire [(3'h7):(1'h0)] wire33;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire signed [(5'h13):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire102;
  assign y = {wire104,
                 wire61,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire102,
                 (1'h0)};
  module36 #() modinst62 (wire61, clk, wire34, wire32, wire33, wire35, (8'hbd));
  assign wire63 = $unsigned($signed($signed((&(wire34 ? (7'h42) : wire32)))));
  assign wire64 = (~|($unsigned((+(wire33 ? wire32 : wire35))) ?
                      (|($signed(wire61) <<< $signed((8'hbf)))) : (~|(wire32[(4'h9):(3'h5)] * wire61[(2'h3):(2'h3)]))));
  assign wire65 = wire35;
  assign wire66 = (wire32 ?
                      wire33[(3'h5):(3'h4)] : {(~&$unsigned((wire34 >= wire35))),
                          (8'hb2)});
  assign wire67 = ({wire64} ? $unsigned(wire66[(4'h9):(4'h9)]) : wire32);
  assign wire68 = $unsigned($unsigned(wire61));
  module69 #() modinst103 (.wire74(wire65), .clk(clk), .wire72(wire32), .wire70(wire64), .y(wire102), .wire73(wire66), .wire71(wire67));
  assign wire104 = $signed(wire65);
endmodule

module module69
#(parameter param101 = (!((+(~^((7'h43) ? (8'ha4) : (8'h9d)))) || (|({(8'ha9)} ^~ ((8'hb1) == (8'hb3)))))))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire74;
  input wire signed [(3'h6):(1'h0)] wire73;
  input wire signed [(4'hf):(1'h0)] wire72;
  input wire signed [(4'hc):(1'h0)] wire71;
  input wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire75;
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire75 = (($unsigned(wire73[(2'h3):(2'h2)]) ?
                      $signed(((wire71 ? wire72 : wire71) ?
                          $unsigned((8'had)) : (~wire72))) : $signed({$unsigned(wire70),
                          wire74[(1'h1):(1'h1)]})) - $unsigned($unsigned(($unsigned(wire73) || $signed(wire70)))));
  assign wire76 = $unsigned($signed(($signed(wire70) + wire75[(1'h1):(1'h1)])));
  assign wire77 = $signed(($signed(($unsigned(wire72) ?
                          (8'hb2) : wire75[(1'h0):(1'h0)])) ?
                      wire72 : (^~wire71[(4'ha):(1'h1)])));
  assign wire78 = $unsigned($unsigned($unsigned(({wire72,
                      wire71} << (~wire71)))));
  assign wire79 = wire71;
  assign wire80 = (8'hb3);
  assign wire81 = $signed(wire76);
  assign wire82 = $unsigned((wire79 ?
                      ({wire81,
                          wire79[(2'h2):(1'h1)]} >>> wire77) : (~$signed(wire74))));
  assign wire83 = wire78;
  assign wire84 = ({((wire79[(2'h2):(1'h0)] && $signed(wire79)) ?
                          wire78[(1'h1):(1'h0)] : $unsigned($signed(wire73))),
                      wire77[(2'h2):(1'h1)]} ~^ (~((8'ha2) ?
                      wire77 : (8'ha3))));
  assign wire85 = (&{(8'hb0), $signed($unsigned(wire74))});
  assign wire86 = ((~&$signed(((|(8'hb9)) ? wire82 : wire72[(4'hb):(4'ha)]))) ?
                      (~&{wire74}) : $signed($unsigned(((|wire73) > (&wire77)))));
  assign wire87 = (wire81 ?
                      wire70[(4'he):(4'ha)] : $signed((&$unsigned((^(8'ha0))))));
  always
    @(posedge clk) begin
      if ((^~$signed($signed(wire77))))
        begin
          reg88 <= wire82[(5'h15):(5'h13)];
        end
      else
        begin
          reg88 <= (~(8'hba));
          if ($signed(wire74[(1'h0):(1'h0)]))
            begin
              reg89 <= (8'ha3);
              reg90 <= (^(((wire83[(4'h8):(2'h3)] ?
                      (wire85 >> wire72) : {wire71,
                          wire77}) == $signed((-(7'h44)))) ?
                  ($signed(wire85) != reg89[(3'h7):(1'h0)]) : $unsigned($unsigned({wire85,
                      wire87}))));
            end
          else
            begin
              reg89 <= ({(wire83[(3'h4):(1'h1)] && wire79),
                  ((8'hb5) ?
                      (~^$signed((8'hb7))) : ($unsigned(wire87) << (wire85 + wire85)))} > ((|((wire74 > (8'haa)) ^ wire78)) ?
                  ($signed($signed(wire78)) != $signed($unsigned(wire82))) : wire81));
              reg90 <= (~&(^(wire74 >> wire83)));
            end
          reg91 <= $unsigned((((8'hbe) ?
              $unsigned(wire80[(4'hd):(2'h3)]) : {(reg89 ?
                      wire80 : wire70)}) ^ reg89));
          reg92 <= {((^{(wire86 ? wire77 : wire84),
                  (reg88 <= wire70)}) != wire85)};
          reg93 <= (((wire70[(4'h9):(1'h0)] >> ((~|wire78) != (wire73 || (8'ha8)))) > (~|$unsigned((reg92 && reg88)))) ?
              (~|$signed(wire81[(4'h9):(3'h6)])) : wire81[(3'h6):(1'h1)]);
        end
      reg94 <= (^wire85);
      reg95 <= (8'ha4);
      reg96 <= (|($signed(wire79) | $signed($signed((wire70 ?
          reg92 : wire77)))));
    end
  assign wire97 = ((wire86[(3'h4):(2'h2)] ?
                      wire77 : (!(reg94 <<< (+wire86)))) != {$unsigned({reg93[(3'h7):(2'h3)]})});
  assign wire98 = ($unsigned(wire70) ? {reg94} : {wire75});
  assign wire99 = {wire80[(1'h1):(1'h0)],
                      $signed(($signed($signed(reg91)) ?
                          $unsigned(wire72[(4'h9):(1'h1)]) : wire83))};
  assign wire100 = $signed(($unsigned({wire77,
                       (wire99 ? wire98 : wire99)}) <= wire99[(2'h3):(2'h2)]));
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire41;
  input wire [(5'h15):(1'h0)] wire40;
  input wire [(3'h5):(1'h0)] wire39;
  input wire signed [(3'h7):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire42;
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 reg56,
                 reg43,
                 (1'h0)};
  assign wire42 = wire41[(4'hc):(3'h6)];
  always
    @(posedge clk) begin
      if (($signed((wire40[(4'ha):(4'h9)] ?
          (~(wire39 ~^ (7'h42))) : $signed((-wire41)))) + ($unsigned($signed((wire38 ?
          wire38 : wire38))) ~^ (((&(8'hb7)) == $signed(wire41)) <<< $signed(wire40[(1'h0):(1'h0)])))))
        begin
          reg43 <= (!(|(~^(!wire42[(4'h9):(3'h7)]))));
        end
      else
        begin
          reg43 <= wire37;
        end
    end
  assign wire44 = (wire37[(3'h4):(2'h3)] >= {reg43[(1'h1):(1'h0)]});
  assign wire45 = ((!(wire39[(3'h5):(1'h1)] <= (7'h44))) * $signed((^~wire40[(3'h5):(2'h2)])));
  assign wire46 = wire45;
  assign wire47 = ($unsigned($unsigned(((wire42 ? wire41 : wire40) ?
                          ((7'h40) ? wire44 : wire42) : wire38))) ?
                      wire44 : (wire42 ? wire41 : wire41));
  assign wire48 = ((|(((wire39 ? (8'hb5) : wire44) | (wire39 ?
                              wire37 : wire47)) ?
                          wire40[(4'hf):(4'hd)] : $signed(wire42[(3'h7):(3'h7)]))) ?
                      ($signed($signed((wire47 ~^ wire46))) ?
                          $signed(wire44) : wire38[(2'h3):(2'h2)]) : ($unsigned((^wire46)) ?
                          wire46 : $signed(wire47)));
  assign wire49 = (wire45 ?
                      {(~|(~|$signed(wire39))),
                          ($signed($signed(wire47)) << (^$signed(wire42)))} : {wire42[(3'h4):(3'h4)],
                          ((~|{(8'hb4)}) ?
                              $signed({wire41}) : (+wire41[(3'h6):(1'h0)]))});
  assign wire50 = $unsigned((^wire42));
  assign wire51 = $unsigned(wire49);
  assign wire52 = (((((~&(8'haf)) <<< $unsigned(wire42)) == $unsigned((7'h40))) >>> wire48) <<< wire49[(4'h9):(4'h8)]);
  assign wire53 = wire52;
  assign wire54 = wire40[(5'h12):(3'h7)];
  assign wire55 = $unsigned(((($signed(wire37) ?
                          (wire53 ?
                              wire49 : (8'ha3)) : wire42) + $signed($signed((8'ha0)))) ?
                      wire37[(4'h8):(1'h1)] : (($signed(wire46) ?
                          (wire42 && wire42) : {wire44}) << ((-wire37) && ((7'h44) || wire48)))));
  always
    @(posedge clk) begin
      reg56 <= (~|(wire52 && (^({wire50} == wire37[(4'hc):(1'h1)]))));
    end
  assign wire57 = {$unsigned(($unsigned((wire47 ~^ wire49)) ?
                          wire41 : (!wire49)))};
  assign wire58 = (~&(wire50[(3'h6):(1'h1)] && $signed(wire44[(3'h4):(2'h3)])));
  assign wire59 = wire44[(1'h1):(1'h1)];
  assign wire60 = $signed((!(+$unsigned((wire44 ? wire40 : (8'hb0))))));
endmodule
