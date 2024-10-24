module top
#(parameter param93 = {(!(((8'ha0) + (~|(8'hbd))) ? ((&(7'h41)) && ((8'hab) + (8'ha4))) : ((~^(8'hbb)) & (8'ha3)))), (~((~^(&(8'hb3))) < ((+(8'hb9)) <= (~&(8'haa)))))}, 
parameter param94 = {(^~(~^(|(+param93)))), param93})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire4;
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 wire4,
                 (1'h0)};
  assign wire4 = wire3;
  module5 #() modinst23 (.wire6(wire3), .clk(clk), .wire7(wire0), .wire9(wire1), .wire8(wire4), .y(wire22));
  assign wire24 = (!(((&$unsigned(wire0)) <<< wire4[(1'h0):(1'h0)]) ?
                      $signed((wire1 ? {wire22} : wire4)) : (8'hb7)));
  assign wire25 = $unsigned($signed($signed((wire4[(3'h4):(2'h3)] ?
                      {wire3, wire24} : (^wire3)))));
  assign wire26 = (wire24 & wire0[(4'h9):(2'h2)]);
  assign wire27 = $signed(wire4[(4'he):(3'h7)]);
  assign wire28 = {(wire1 ? (~wire22) : ({wire3[(2'h2):(1'h1)]} >> wire27))};
  assign wire29 = wire2;
  assign wire30 = ((7'h40) ?
                      ((^wire22) ?
                          $unsigned((8'hb3)) : (7'h43)) : $signed($signed(wire24[(4'ha):(2'h2)])));
  assign wire31 = $signed($unsigned(wire3));
  assign wire32 = (wire0[(3'h5):(2'h3)] && wire30[(1'h0):(1'h0)]);
  assign wire33 = wire32[(4'h9):(3'h7)];
  assign wire34 = wire4[(1'h1):(1'h1)];
  assign wire35 = ((wire27 ? wire24[(3'h5):(2'h3)] : {wire1[(2'h3):(1'h0)]}) ?
                      $unsigned({wire30[(3'h6):(1'h1)],
                          wire28}) : $unsigned((wire32[(3'h6):(3'h6)] >= wire3[(3'h4):(2'h3)])));
  assign wire36 = wire4;
  assign wire37 = wire36;
  assign wire38 = wire28;
  module39 #() modinst88 (wire87, clk, wire0, wire28, wire27, wire1);
  assign wire89 = {($signed($signed((wire0 != wire25))) ?
                          wire3[(2'h2):(1'h0)] : {(wire87[(1'h1):(1'h0)] <= $unsigned(wire87))}),
                      (($signed(wire1) >>> (wire3[(4'hc):(2'h3)] + wire29)) ~^ $signed($signed(wire3)))};
  assign wire90 = wire36;
  assign wire91 = {$signed(((8'ha6) ?
                          $signed((wire35 - wire35)) : $unsigned((wire24 ?
                              wire90 : wire0)))),
                      {$unsigned(wire31), {wire30}}};
  assign wire92 = (($signed((^~wire32[(2'h2):(1'h0)])) ?
                      ({wire31} ^ (wire35[(1'h0):(1'h0)] ?
                          $unsigned(wire22) : wire2)) : ($signed((wire28 ?
                          wire35 : wire32)) * (~|(wire4 ~^ wire28)))) | wire32);
endmodule

module module39
#(parameter param85 = ((~^({(8'ha4)} ? (^((8'hb0) <= (8'hbb))) : (((8'hbc) < (8'h9e)) ? {(8'hb2)} : (&(8'ha9))))) ? {(|(~^{(8'hb9)}))} : (8'hac)), 
parameter param86 = {(~param85)})
(y, clk, wire40, wire41, wire42, wire43);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire40;
  input wire signed [(5'h11):(1'h0)] wire41;
  input wire [(4'hf):(1'h0)] wire42;
  input wire [(5'h12):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire62;
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire62,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire44 = {{wire42, $signed($signed((8'hb9)))},
                      ($signed(wire42) & (^(-(~|wire41))))};
  assign wire45 = wire43;
  assign wire46 = ((-$signed($unsigned(((8'hb9) + wire45)))) < {{$unsigned(wire44),
                          $unsigned((8'hb6))}});
  assign wire47 = $unsigned((wire40 ? wire40 : {$signed($unsigned(wire43))}));
  module48 #() modinst63 (.wire53(wire42), .wire52(wire47), .y(wire62), .clk(clk), .wire49(wire43), .wire51(wire44), .wire50(wire45));
  assign wire64 = wire62;
  assign wire65 = {(({(~|wire41)} * wire47) >= ($unsigned((wire42 != wire41)) ?
                          $signed(((8'hba) ?
                              wire62 : wire44)) : wire45[(5'h13):(4'hd)]))};
  assign wire66 = $signed(wire65);
  assign wire67 = ($unsigned(wire43) ?
                      $unsigned(wire40) : (($signed(((8'haf) ?
                          wire46 : wire42)) * (~&(8'hb5))) >>> (wire66[(2'h3):(2'h2)] <<< (^(8'ha2)))));
  assign wire68 = wire64;
  assign wire69 = (((~|wire42) ?
                          $signed($signed($signed(wire40))) : $signed($unsigned((wire46 ?
                              wire46 : wire68)))) ?
                      $signed(wire47[(2'h2):(2'h2)]) : wire65[(4'hb):(4'ha)]);
  assign wire70 = $unsigned($unsigned($signed(((wire68 <<< (8'h9e)) ?
                      (8'hb1) : (wire45 ? wire42 : wire47)))));
  assign wire71 = wire40;
  assign wire72 = (wire46 && $unsigned({(~&{wire43}),
                      $signed($signed(wire70))}));
  always
    @(posedge clk) begin
      reg73 <= ((((-wire67[(1'h0):(1'h0)]) && wire69[(4'hc):(4'ha)]) ?
              wire68 : (($unsigned(wire44) ? $signed(wire69) : (^~wire47)) ?
                  (wire44[(3'h4):(2'h2)] ?
                      (+wire72) : wire40) : $signed((wire67 + wire43)))) ?
          wire43[(4'h8):(2'h2)] : (~^(&((wire72 - wire42) || $unsigned(wire45)))));
      if (((wire69[(4'hd):(3'h4)] >= wire68) + (^($unsigned($unsigned((8'had))) - (~^(8'ha3))))))
        begin
          reg74 <= (($unsigned(((wire46 <= wire71) | (wire42 + wire70))) ?
              {wire41} : wire40[(3'h4):(2'h2)]) || wire64);
          reg75 <= ((wire46 >> $unsigned(((wire43 - wire64) ?
              $unsigned((8'h9f)) : reg74))) == $signed((wire64 ?
              (wire68 ?
                  wire69[(1'h0):(1'h0)] : (^~(7'h40))) : ((~&wire67) > ((8'ha5) ^ wire41)))));
          if (wire66)
            begin
              reg76 <= wire46;
              reg77 <= $unsigned({{((wire68 & wire65) ?
                          (reg73 ? wire41 : wire68) : wire42[(4'hf):(3'h7)]),
                      wire64}});
            end
          else
            begin
              reg76 <= $unsigned(wire41[(3'h5):(3'h4)]);
            end
          reg78 <= ((~&wire72[(4'hd):(4'hb)]) ?
              (wire64 * wire69[(3'h6):(1'h0)]) : (+wire47));
        end
      else
        begin
          if ((^$unsigned(wire62[(3'h5):(3'h5)])))
            begin
              reg74 <= ({reg73} >= $unsigned((({(8'hb4), reg75} ?
                  reg76[(3'h6):(3'h5)] : wire70[(1'h1):(1'h0)]) == reg74)));
              reg75 <= wire65[(3'h5):(1'h0)];
              reg76 <= wire71[(3'h6):(3'h6)];
            end
          else
            begin
              reg74 <= wire67;
              reg75 <= wire45;
              reg76 <= (((reg76 || (wire67[(3'h5):(3'h5)] ?
                      wire40 : (wire65 == wire70))) != ({(wire62 * wire45)} ?
                      $signed($unsigned((8'ha4))) : ((8'hb4) <= wire68))) ?
                  $unsigned((^((~^reg73) == (wire44 < wire45)))) : reg74[(4'hc):(4'hc)]);
              reg77 <= ($signed((-reg76[(2'h2):(1'h0)])) ?
                  (reg77[(2'h2):(1'h0)] ?
                      wire68[(3'h7):(1'h1)] : ((-(wire40 ? reg75 : wire62)) ?
                          wire42[(4'hf):(4'h8)] : $signed($unsigned(wire62)))) : ((!$unsigned($signed(wire40))) ?
                      $signed(((wire66 ^ wire64) == $signed(wire40))) : wire69[(3'h5):(3'h4)]));
            end
          if ($unsigned($unsigned((reg73 ?
              $signed((&wire43)) : (wire67[(2'h2):(1'h0)] ?
                  (wire42 >= (8'haa)) : {wire62})))))
            begin
              reg78 <= (-reg77[(1'h1):(1'h0)]);
              reg79 <= wire69[(3'h4):(3'h4)];
            end
          else
            begin
              reg78 <= (~|{wire46});
              reg79 <= wire64[(1'h1):(1'h0)];
              reg80 <= ((^~$unsigned(((reg76 ^ reg79) | (~^wire69)))) ?
                  $unsigned($unsigned((^$signed(reg78)))) : (~&$signed($unsigned((reg76 == reg75)))));
            end
          reg81 <= (8'hbe);
        end
    end
  assign wire82 = ($unsigned($unsigned((^~reg76[(1'h0):(1'h0)]))) >= $unsigned(wire66));
  assign wire83 = (reg75 <= $unsigned(($unsigned((wire40 < reg80)) == ((wire42 ?
                      wire46 : wire64) ^ wire41[(4'h9):(3'h4)]))));
  assign wire84 = (($unsigned($signed($unsigned((7'h40)))) >= {{reg78[(3'h7):(2'h2)]},
                      $signed(((8'hb7) << (8'hbe)))}) << $signed((wire46[(3'h4):(3'h4)] ?
                      (~$unsigned(reg73)) : $signed(wire40[(1'h1):(1'h1)]))));
endmodule

module module5
#(parameter param20 = ((8'hbe) ? (((~^((8'h9c) ? (8'ha4) : (7'h44))) ? (8'haa) : (((8'hab) * (8'h9f)) ? ((8'hbe) ? (7'h44) : (8'hac)) : ((8'ha6) ? (8'h9d) : (8'h9e)))) == (8'ha3)) : ((^(~^((8'had) ? (8'hb7) : (8'hb8)))) - {((~(8'hbe)) ? (^(8'h9d)) : ((8'hb1) ? (8'had) : (8'hb3)))})), 
parameter param21 = (-(+param20)))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 reg13,
                 (1'h0)};
  assign wire10 = (-$signed($unsigned({(wire6 ? (8'hb6) : wire6), {wire7}})));
  assign wire11 = wire10[(3'h4):(2'h2)];
  assign wire12 = (((~^(wire11[(4'hb):(3'h4)] ?
                          wire8 : wire7[(2'h3):(2'h3)])) > $signed(($unsigned(wire11) ?
                          $signed(wire11) : wire11[(3'h6):(3'h6)]))) ?
                      (~^wire8) : wire9);
  always
    @(posedge clk) begin
      reg13 <= (|$signed((wire6[(4'hc):(3'h4)] ?
          wire8 : $unsigned((wire10 ? wire10 : wire12)))));
    end
  assign wire14 = (!((^~$signed((wire11 ?
                      wire7 : reg13))) || $signed(({wire10} && $unsigned(reg13)))));
  assign wire15 = $signed($unsigned($unsigned((8'ha8))));
  assign wire16 = reg13[(2'h3):(1'h1)];
  assign wire17 = wire12;
  assign wire18 = ($unsigned($signed(wire7)) ^ (-((^~(wire10 == (8'ha5))) + wire12[(3'h4):(2'h3)])));
  assign wire19 = $unsigned({(((+wire6) ?
                              $unsigned(wire16) : (wire14 ? (7'h44) : wire6)) ?
                          $unsigned((^wire11)) : ((~(8'hac)) > {wire8, wire9})),
                      (($signed(wire15) ?
                          $signed(wire12) : $signed(wire17)) <= wire15[(2'h2):(1'h0)])});
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire53;
  input wire [(3'h5):(1'h0)] wire52;
  input wire signed [(2'h3):(1'h0)] wire51;
  input wire [(5'h15):(1'h0)] wire50;
  input wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire54;
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire54,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire54 = $unsigned(wire49);
  always
    @(posedge clk) begin
      reg55 <= (-(($signed((wire54 == wire52)) + ($signed((8'hbc)) <= $unsigned(wire49))) - $unsigned(($signed(wire52) ?
          {(8'hac)} : {wire51}))));
      reg56 <= ((wire54[(1'h1):(1'h0)] ?
          {(wire54[(4'hf):(1'h1)] ? (~&wire49) : $unsigned(wire54)),
              $unsigned($signed(wire53))} : wire50) >>> (((-wire50[(4'h8):(3'h5)]) ?
          wire53[(4'hd):(1'h0)] : wire50) == (+wire49)));
    end
  assign wire57 = ((($unsigned(wire51) ^~ $signed(reg55)) + reg55[(3'h6):(3'h5)]) ?
                      $unsigned((({reg56} ?
                          {wire52} : reg55[(2'h2):(1'h1)]) >>> (~|(^~wire49)))) : $signed($unsigned(($signed(wire53) ?
                          (wire51 ?
                              wire50 : wire54) : wire54[(2'h3):(2'h2)]))));
  assign wire58 = $signed((wire49[(4'ha):(4'h8)] >> wire57));
  assign wire59 = wire51;
  assign wire60 = wire52[(1'h0):(1'h0)];
  assign wire61 = {$unsigned($unsigned($signed({wire49, wire58}))), wire57};
endmodule
