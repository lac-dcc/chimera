module top
#(parameter param140 = (((!((8'ha7) ? (~|(7'h43)) : {(8'hbb), (8'h9d)})) != (((^(8'hba)) ? ((8'haa) >>> (8'ha0)) : (~&(8'hb1))) * ({(8'ha6), (7'h44)} ~^ ((8'hbb) ^ (7'h44))))) - (~|((((8'h9d) == (8'ha9)) >= ((7'h42) <= (8'ha1))) && ((~&(8'hbe)) ? {(8'hb4)} : {(8'hb4), (8'hb7)})))), 
parameter param141 = (((((~|param140) <= (8'hb0)) == param140) * param140) ? param140 : param140))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire118;
  wire [(5'h15):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire120;
  wire signed [(4'ha):(1'h0)] wire138;
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire115,
                 wire117,
                 wire118,
                 wire119,
                 wire120,
                 wire138,
                 (1'h0)};
  assign wire5 = $unsigned({(wire4[(4'hf):(3'h4)] < ((wire1 ? wire3 : wire3) ?
                         $signed(wire1) : (+wire4)))});
  assign wire6 = wire0[(2'h3):(1'h1)];
  assign wire7 = $signed({(~$unsigned($unsigned(wire6)))});
  module8 #() modinst116 (wire115, clk, wire6, wire5, wire0, wire2);
  assign wire117 = wire4[(4'hd):(4'ha)];
  assign wire118 = (~^{((~&wire3) ?
                           (~|(wire1 <<< wire3)) : $unsigned($signed(wire7)))});
  assign wire119 = {wire3[(3'h4):(2'h2)]};
  assign wire120 = wire5;
  module121 #() modinst139 (wire138, clk, wire119, wire1, wire7, wire5, wire2);
endmodule

module module121  (y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire126;
  input wire [(2'h3):(1'h0)] wire125;
  input wire signed [(5'h10):(1'h0)] wire124;
  input wire [(4'ha):(1'h0)] wire123;
  input wire signed [(4'hc):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire137;
  wire [(4'hf):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire127;
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 reg135,
                 (1'h0)};
  assign wire127 = {$unsigned(($unsigned($signed(wire122)) ^~ wire124)),
                       {$signed(wire122),
                           (wire123[(4'ha):(3'h6)] ?
                               ((wire123 ?
                                   wire126 : wire124) ^ wire126[(4'hd):(4'h9)]) : (8'hb6))}};
  assign wire128 = {wire124};
  assign wire129 = (~($unsigned($signed((~wire127))) || (((-wire125) ^~ (wire124 <= wire125)) ^ $signed((7'h42)))));
  assign wire130 = (8'had);
  assign wire131 = wire130;
  assign wire132 = wire122;
  assign wire133 = (^$unsigned((((wire130 <<< (8'hbe)) ?
                           wire128 : $unsigned(wire125)) ?
                       ({wire125,
                           wire122} + wire130[(1'h0):(1'h0)]) : {(wire127 < wire124),
                           {wire125, wire123}})));
  assign wire134 = wire132;
  always
    @(posedge clk) begin
      reg135 <= wire126[(3'h5):(1'h0)];
    end
  assign wire136 = wire131[(2'h3):(1'h0)];
  assign wire137 = (reg135[(2'h2):(1'h0)] ?
                       ((+(-wire132)) ?
                           wire127[(4'hb):(3'h6)] : $unsigned(wire136[(4'h8):(1'h0)])) : wire134);
endmodule

module module8
#(parameter param113 = (((~^(|{(8'ha5)})) ? ((&((7'h43) ? (8'hab) : (8'h9f))) != (&(8'hbd))) : ((((8'hbe) ? (8'hb1) : (8'hb5)) ? ((8'ha5) != (8'h9d)) : (~|(8'ha5))) || (-((7'h42) ? (8'ha5) : (8'hbe))))) ? (-(&((^~(8'hb8)) ? (|(8'ha0)) : {(8'had), (8'ha8)}))) : ((~^(((8'ha2) ? (7'h42) : (8'hae)) - (~^(8'hb5)))) ? (((^(8'ha0)) << ((7'h40) ? (8'ha2) : (8'hb8))) < (((8'hbf) + (8'hb9)) - (-(8'ha9)))) : (7'h42))), 
parameter param114 = ({((8'ha4) ? (^param113) : ((param113 <= param113) ^ (param113 <<< param113))), (((param113 >= param113) ? param113 : (param113 ? param113 : param113)) ? (~^param113) : (^param113))} ? ((~|param113) ? ({(param113 && param113), ((8'hab) || (8'hb7))} ? param113 : param113) : ({(|param113), (~&param113)} ? ((param113 ? (8'ha5) : param113) >>> (~|(8'hb0))) : (7'h42))) : param113))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire12;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire35;
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  assign y = {wire111,
                 wire79,
                 wire76,
                 wire75,
                 wire73,
                 wire38,
                 wire37,
                 wire35,
                 reg77,
                 reg78,
                 (1'h0)};
  module13 #() modinst36 (wire35, clk, wire9, wire12, wire10, wire11);
  assign wire37 = wire35[(2'h3):(1'h1)];
  assign wire38 = wire35[(3'h6):(2'h3)];
  module39 #() modinst74 (.wire40(wire37), .wire41(wire12), .clk(clk), .wire43(wire9), .wire42(wire38), .y(wire73));
  assign wire75 = (8'ha7);
  assign wire76 = ((wire10[(4'hf):(3'h7)] ?
                          (8'haa) : (+((wire73 & (8'ha6)) ?
                              (|wire38) : wire9))) ?
                      (8'had) : ($signed((wire75[(4'h9):(3'h4)] ?
                              wire12 : (wire75 ? wire38 : wire73))) ?
                          (-wire75[(1'h1):(1'h1)]) : $signed(({(8'hb7),
                              wire35} ~^ wire11[(3'h4):(2'h3)]))));
  always
    @(posedge clk) begin
      reg77 <= wire37[(3'h4):(1'h1)];
      reg78 <= $unsigned({{wire10[(4'ha):(3'h4)]}});
    end
  assign wire79 = ($unsigned(reg77[(4'h8):(3'h6)]) ?
                      $unsigned($unsigned($unsigned((wire10 * wire76)))) : (wire37[(3'h4):(1'h1)] ~^ (wire10 || $unsigned((reg78 ^ wire76)))));
  module80 #() modinst112 (.wire81(reg78), .wire82(wire37), .clk(clk), .wire83(wire75), .wire85(wire35), .y(wire111), .wire84(wire38));
endmodule

module module80
#(parameter param110 = ((~((((8'hae) ? (8'h9f) : (8'hb4)) ? ((8'hac) ^ (8'hb5)) : ((8'hb1) ? (8'h9d) : (8'ha2))) << (~|(8'hab)))) ^~ (8'haa)))
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire85;
  input wire [(5'h10):(1'h0)] wire84;
  input wire signed [(4'he):(1'h0)] wire83;
  input wire signed [(4'h8):(1'h0)] wire82;
  input wire [(4'hc):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire signed [(4'hf):(1'h0)] wire107;
  wire [(4'h9):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(4'h9):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire87;
  wire signed [(5'h12):(1'h0)] wire86;
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire86 = (((((~&(8'hb7)) <<< wire85[(2'h3):(2'h2)]) ?
                      wire83 : ($signed(wire82) ?
                          {(8'hbb)} : (~&wire85))) << (~^wire82[(2'h3):(1'h1)])) >= $unsigned(($unsigned($unsigned((8'ha3))) ?
                      wire81[(4'hc):(3'h4)] : wire85)));
  assign wire87 = $unsigned(wire83[(1'h1):(1'h1)]);
  assign wire88 = wire84;
  assign wire89 = (|wire82);
  assign wire90 = $unsigned(wire87[(3'h7):(3'h5)]);
  assign wire91 = (wire90[(3'h4):(1'h1)] | wire90);
  assign wire92 = ((8'hb7) || wire89[(1'h0):(1'h0)]);
  assign wire93 = (~^($unsigned(wire90[(2'h3):(1'h0)]) > $unsigned($signed((wire81 >> wire90)))));
  assign wire94 = $signed((|$unsigned(wire83)));
  assign wire95 = (wire92 ~^ $signed((~&wire83)));
  assign wire96 = $unsigned({$unsigned($unsigned(((8'hac) ? wire82 : wire88))),
                      (wire87[(4'h8):(3'h7)] << (^(wire89 ?
                          (8'h9e) : wire91)))});
  always
    @(posedge clk) begin
      reg97 <= wire84[(2'h2):(1'h1)];
      reg98 <= wire88[(4'ha):(3'h4)];
      reg99 <= $signed((wire89[(3'h7):(3'h7)] - wire85[(3'h4):(2'h3)]));
      reg100 <= wire85[(1'h0):(1'h0)];
      if ((~&(~|$unsigned(((~reg98) <<< (reg99 ? wire93 : reg97))))))
        begin
          reg101 <= {(wire96[(4'hb):(3'h4)] ? wire96 : (8'ha5))};
          if ($unsigned({$signed($unsigned((reg97 ? wire89 : wire84))),
              (~|(&$signed(wire92)))}))
            begin
              reg102 <= ((&wire87) | wire88);
            end
          else
            begin
              reg102 <= ((-wire84[(4'hf):(1'h0)]) >>> ($signed(((wire87 ?
                          wire90 : wire92) ?
                      wire84 : $unsigned((8'hbd)))) ?
                  {$unsigned({wire85, wire90})} : ($unsigned((~|wire88)) ?
                      $unsigned(wire88) : (+wire96))));
            end
          reg103 <= wire81[(4'hb):(3'h4)];
          reg104 <= $unsigned($unsigned(wire87[(4'h9):(2'h2)]));
          reg105 <= $unsigned({(reg102 >= {wire86[(1'h0):(1'h0)]}),
              wire83[(3'h7):(1'h0)]});
        end
      else
        begin
          if ($unsigned($signed($unsigned({(reg105 ? reg103 : reg97)}))))
            begin
              reg101 <= wire89[(3'h7):(1'h0)];
              reg102 <= ($signed(wire87) ?
                  ($unsigned($unsigned((wire82 ?
                      wire93 : reg102))) <<< $signed(((wire86 ?
                          wire89 : wire87) ?
                      wire92[(3'h5):(1'h1)] : $unsigned(wire93)))) : wire87[(2'h2):(1'h0)]);
              reg103 <= (+reg103);
              reg104 <= ($signed((wire85 ?
                  (~|wire94[(2'h2):(2'h2)]) : {(-wire95)})) >> {$unsigned(wire85),
                  reg100});
            end
          else
            begin
              reg101 <= {wire81};
              reg102 <= $unsigned((reg97[(4'hc):(4'h9)] | $signed(reg100[(3'h4):(1'h1)])));
              reg103 <= {wire85, wire88};
              reg104 <= $signed(wire81);
              reg105 <= $unsigned(($signed((wire88 ?
                      {wire94, wire88} : (|reg102))) ?
                  (($unsigned(wire96) << {wire86, (8'ha0)}) ?
                      $signed(((8'h9c) ~^ (8'hab))) : ($signed(reg97) ?
                          wire81[(3'h4):(2'h2)] : wire90[(2'h2):(1'h1)])) : $signed((wire89[(3'h7):(2'h2)] ?
                      (wire82 ? wire84 : wire81) : reg99[(5'h10):(4'h8)]))));
            end
        end
    end
  assign wire106 = ($signed(wire95) >> (+reg104));
  assign wire107 = reg100;
  assign wire108 = (!((^~{$unsigned(reg101), wire89}) ?
                       $signed($unsigned((reg100 >> wire84))) : (wire89[(4'h8):(2'h3)] <<< ($signed(reg100) ?
                           (wire92 + (8'hbc)) : (wire94 << reg97)))));
  assign wire109 = $unsigned(((wire90[(1'h0):(1'h0)] | $unsigned(reg104)) * $signed($signed({reg100,
                       wire90}))));
endmodule

module module39
#(parameter param71 = (((~|(((8'hae) ? (8'hb8) : (8'ha4)) >>> (8'hb3))) <= (8'hab)) ? ((((7'h40) && (8'hb8)) ^~ {((7'h44) << (7'h40))}) <<< (8'hb5)) : (~((8'hb2) - (((8'had) ? (8'hb1) : (8'hbc)) ? ((8'ha4) ? (8'hb4) : (8'had)) : {(8'hb5)})))), 
parameter param72 = ({(^~(+(param71 << param71)))} ? {param71, {(|(param71 ? param71 : param71)), {((8'ha7) >> param71), (param71 ? param71 : param71)}}} : (param71 <<< (((^~(8'ha2)) ~^ (-param71)) ^ (!(param71 ? param71 : (8'hb8)))))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire43;
  input wire [(5'h11):(1'h0)] wire42;
  input wire signed [(3'h7):(1'h0)] wire41;
  input wire [(3'h6):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire59,
                 wire58,
                 wire57,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire44 = wire43[(2'h2):(1'h1)];
  assign wire45 = (+(((8'h9d) ^ wire42[(4'h8):(2'h3)]) ?
                      wire42[(2'h2):(1'h0)] : ((wire41 > wire43) << wire42[(4'hd):(4'hc)])));
  assign wire46 = wire45[(4'hb):(2'h3)];
  assign wire47 = $unsigned(wire40[(3'h6):(1'h0)]);
  assign wire48 = wire44;
  assign wire49 = wire41[(3'h5):(3'h4)];
  assign wire50 = wire48[(2'h3):(2'h2)];
  assign wire51 = ({(({wire48} ? (+wire48) : ((8'hb7) - wire47)) ?
                          wire47[(3'h4):(3'h4)] : {wire43[(3'h4):(1'h1)]})} ~^ {$signed($unsigned((^wire42)))});
  assign wire52 = $signed(wire44[(3'h7):(3'h6)]);
  always
    @(posedge clk) begin
      reg53 <= wire42[(5'h10):(3'h7)];
      reg54 <= ($unsigned($unsigned(wire43)) && wire46[(1'h0):(1'h0)]);
      reg55 <= (!wire49);
      reg56 <= $unsigned(($signed(((wire44 ? reg54 : wire46) || {wire52,
          wire51})) <<< ($signed({wire43}) ^ $signed(wire40))));
    end
  assign wire57 = ((!wire43[(2'h2):(1'h0)]) - ($signed({(~|reg54),
                      ((8'hbf) >>> wire43)}) + wire49[(4'hb):(2'h3)]));
  assign wire58 = ((($unsigned($signed(reg55)) * reg55) >> (~&wire51[(3'h5):(1'h1)])) ?
                      (wire57[(4'hc):(4'hb)] < (wire49 > {wire42[(4'ha):(3'h4)]})) : (~^(wire52 & reg54)));
  assign wire59 = wire52[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg60 <= reg55;
      reg61 <= $signed($signed((8'hac)));
      reg62 <= reg61[(3'h6):(2'h3)];
      if ($signed(wire57[(1'h1):(1'h0)]))
        begin
          if ((reg56[(5'h10):(2'h2)] >= $unsigned(($signed($unsigned(wire49)) | $signed(wire44)))))
            begin
              reg63 <= (~|(+$unsigned((^$unsigned(reg55)))));
              reg64 <= $unsigned(reg55[(2'h2):(1'h0)]);
            end
          else
            begin
              reg63 <= $unsigned({reg63});
              reg64 <= (reg56[(2'h3):(2'h3)] ^ wire40[(2'h3):(1'h0)]);
              reg65 <= reg62[(4'hc):(4'ha)];
              reg66 <= ((!reg62[(2'h2):(1'h1)]) * $signed((!{(&reg55)})));
              reg67 <= (|($signed(((|(8'ha4)) ?
                      $unsigned(wire47) : (reg66 ? wire46 : wire45))) ?
                  (wire58[(4'h8):(3'h4)] ?
                      (wire50[(1'h0):(1'h0)] >= $unsigned(wire52)) : (|$signed(reg56))) : wire51));
            end
        end
      else
        begin
          reg63 <= wire42;
          reg64 <= wire58[(4'h9):(3'h6)];
          reg65 <= wire48;
          reg66 <= reg62[(3'h7):(2'h2)];
        end
    end
  assign wire68 = $signed((($unsigned(wire41[(2'h2):(2'h2)]) ?
                          ({wire41} ? (|wire42) : $signed(wire57)) : reg56) ?
                      wire50[(2'h2):(2'h2)] : reg53));
  assign wire69 = (+reg67[(3'h4):(1'h0)]);
  assign wire70 = $signed(reg54);
endmodule

module module13
#(parameter param34 = (+(((+((8'hbb) ? (8'had) : (8'had))) ? {((8'ha8) + (8'haa))} : ({(8'ha4)} ? (8'hb1) : (-(8'hae)))) + {((~&(8'ha7)) ? ((8'had) ? (8'ha9) : (8'hb0)) : {(8'hb1)}), ({(8'ha0)} ^~ ((8'haf) & (8'haa)))})))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire signed [(4'he):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  assign y = {wire33,
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
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire18 = {((8'hb9) ?
                          $unsigned((&$signed((8'hae)))) : $unsigned($unsigned(wire15))),
                      $unsigned(wire17[(2'h2):(1'h1)])};
  assign wire19 = $signed({$unsigned((wire18 * $unsigned(wire17))),
                      $unsigned((^~(8'hb8)))});
  assign wire20 = $signed(wire18);
  assign wire21 = $signed(wire16);
  assign wire22 = wire20;
  assign wire23 = wire17[(2'h2):(1'h0)];
  assign wire24 = wire21;
  assign wire25 = $signed((|$signed(wire18[(1'h1):(1'h0)])));
  assign wire26 = $unsigned((wire17 ^ $unsigned($signed({(8'hbe), (8'hbc)}))));
  assign wire27 = (~^$unsigned(wire14[(3'h7):(3'h5)]));
  assign wire28 = ({(({wire19} ^~ (8'haa)) ?
                          ((~|wire19) ?
                              wire27[(1'h0):(1'h0)] : {wire27}) : wire22),
                      wire21[(2'h3):(2'h2)]} || (wire15[(1'h1):(1'h0)] ?
                      {$signed((|wire15)),
                          $signed((wire16 ?
                              wire24 : (7'h41)))} : (($unsigned(wire18) >> (wire14 ?
                          wire15 : wire21)) - $signed(wire14))));
  assign wire29 = ($unsigned((~&$unsigned((^wire25)))) >= $unsigned($unsigned($unsigned($signed(wire18)))));
  assign wire30 = (8'hb0);
  always
    @(posedge clk) begin
      reg31 <= wire25;
      reg32 <= (((|wire20[(4'hf):(2'h3)]) ?
          ({(wire26 == wire29), wire14} ?
              (wire30 <= (wire18 ^~ wire14)) : (8'hb3)) : (~{((8'hbf) != wire29),
              $unsigned(reg31)})) ^~ wire25);
    end
  assign wire33 = ((wire27[(5'h12):(4'hc)] + ((-(wire29 * wire16)) == (~(wire27 < wire22)))) * {($signed(wire20[(1'h1):(1'h1)]) * ((wire26 << wire18) ^ (-wire30)))});
endmodule
