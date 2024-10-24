module top
#(parameter param108 = (((~|(((8'ha2) < (8'haa)) ~^ ((7'h41) ? (8'h9d) : (8'hac)))) ? ((~^(~^(8'hb5))) || (((8'hba) >>> (8'ha6)) * {(8'ha5), (7'h40)})) : ((((8'h9d) & (8'hbd)) ? ((7'h43) ? (8'hb1) : (8'hb2)) : {(8'hbe)}) ? {(^~(7'h43))} : {{(8'hbe)}, {(8'ha6), (8'hb9)}})) >> ((~(^((8'ha9) ? (8'ha0) : (8'hb7)))) ^ (~&(((7'h42) ? (8'hab) : (7'h40)) ? ((8'ha6) >> (8'ha4)) : ((8'ha0) < (8'ha7)))))), 
parameter param109 = ((param108 + (8'ha6)) ? (!param108) : {((param108 ? param108 : (param108 ? param108 : param108)) < (+(!param108)))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire97;
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire5,
                 wire7,
                 wire97,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed((-wire1[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg6 <= (wire2 - ({(wire3 ^ {wire2, wire0})} ?
          wire0 : $signed({{wire5}})));
    end
  assign wire7 = (&wire4[(2'h2):(2'h2)]);
  module8 #() modinst98 (wire97, clk, wire5, wire1, wire0, reg6);
  always
    @(posedge clk) begin
      reg99 <= $unsigned($unsigned(wire3));
      reg100 <= {((($unsigned(wire7) >>> (|wire7)) || $unsigned(wire4[(3'h4):(3'h4)])) ?
              (8'hb3) : (wire0 != ($signed(wire3) ?
                  wire7[(4'ha):(2'h3)] : (wire3 ? (8'ha0) : wire7)))),
          ($signed($signed({wire5, reg6})) ?
              wire2 : ((reg6[(4'hd):(4'h8)] >= $unsigned(reg6)) ?
                  $unsigned(wire0[(5'h10):(4'hf)]) : wire4[(4'h8):(3'h6)]))};
      if ($unsigned($unsigned(reg99)))
        begin
          reg101 <= wire7;
          reg102 <= $signed((8'hb4));
          reg103 <= {(~|reg99[(3'h5):(3'h4)]),
              $signed($signed($signed((+wire7))))};
        end
      else
        begin
          reg101 <= ($unsigned($unsigned(({reg99, reg103} ?
              reg99 : (~|wire2)))) < wire97);
          reg102 <= {$signed($unsigned((reg6 ?
                  (wire3 != (8'had)) : $unsigned(reg100)))),
              wire2[(2'h3):(1'h0)]};
        end
      if (wire4)
        begin
          if ((reg6[(4'h8):(4'h8)] << {wire5[(4'hc):(4'h8)],
              ((&reg103) ? (~wire2[(4'h9):(2'h2)]) : $signed({wire4}))}))
            begin
              reg104 <= (wire97 ?
                  (~$unsigned((!((7'h40) ?
                      (8'ha5) : reg103)))) : ((!{reg100[(1'h1):(1'h0)]}) ?
                      wire1[(1'h0):(1'h0)] : (((reg99 | (8'ha9)) || {(8'ha0)}) && $signed((wire0 >> reg100)))));
              reg105 <= (({wire2[(1'h0):(1'h0)]} - ((~^{reg102,
                      wire4}) ^~ wire3[(2'h2):(2'h2)])) ?
                  (wire2[(1'h0):(1'h0)] ?
                      $signed(reg99) : (+(~^(reg99 * reg102)))) : $unsigned(reg102[(2'h2):(1'h0)]));
              reg106 <= $unsigned(((8'hb0) >= $unsigned(($unsigned(reg104) ?
                  reg100[(2'h2):(2'h2)] : wire1))));
              reg107 <= wire3;
            end
          else
            begin
              reg104 <= (~^(wire0 ^ (wire7 ? wire1[(4'hb):(1'h1)] : reg105)));
            end
        end
      else
        begin
          reg104 <= reg99[(1'h1):(1'h1)];
          reg105 <= $signed($unsigned((~^wire0[(1'h1):(1'h1)])));
          reg106 <= (|reg105);
        end
    end
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(4'ha):(1'h0)] wire93;
  wire [(3'h6):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire36;
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire85,
                 wire39,
                 wire38,
                 wire13,
                 wire36,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire13 = ((!{$signed($unsigned(wire10)),
                      (-(wire11 || wire10))}) ^ (wire11 ?
                      $signed(((wire12 != wire10) && (+wire9))) : ({$signed(wire10)} ?
                          ($unsigned(wire12) ^~ wire10[(4'hb):(3'h5)]) : $signed(wire10[(3'h6):(2'h3)]))));
  module14 #() modinst37 (.y(wire36), .wire19(wire10), .wire16(wire13), .wire15(wire9), .clk(clk), .wire18(wire12), .wire17(wire11));
  assign wire38 = wire36[(3'h5):(3'h5)];
  assign wire39 = $unsigned((^(((wire38 - wire13) ^~ (8'ha5)) ?
                      $unsigned($unsigned(wire36)) : (&wire13[(5'h10):(4'hd)]))));
  module40 #() modinst86 (.wire43(wire38), .wire42(wire10), .y(wire85), .wire44(wire36), .clk(clk), .wire41(wire11));
  always
    @(posedge clk) begin
      reg87 <= ((($unsigned(wire85) ? wire39 : wire39[(5'h12):(4'hd)]) ?
          {$unsigned($signed((8'had)))} : ($unsigned(wire12[(5'h10):(4'hb)]) + wire10)) + ((8'had) ?
          $unsigned(wire38[(3'h4):(1'h1)]) : wire9[(3'h4):(1'h1)]));
      reg88 <= $unsigned((^{($signed(wire85) ?
              $unsigned(wire12) : ((8'hb0) ? wire9 : wire39)),
          wire12}));
      if (((~^(~|reg87[(1'h1):(1'h1)])) ?
          reg88 : $signed((((wire36 == wire85) ? $signed(wire13) : {wire12}) ?
              (~^$unsigned(wire10)) : (+wire39[(1'h0):(1'h0)])))))
        begin
          reg89 <= (8'ha4);
          reg90 <= (wire10[(3'h6):(2'h2)] <= $signed(($signed((7'h41)) ?
              wire10[(4'hb):(3'h7)] : (~^wire9))));
        end
      else
        begin
          reg89 <= ($signed(wire9[(4'he):(4'hd)]) >> wire12);
        end
      reg91 <= ((-$signed(((+wire11) ?
          wire36[(4'hb):(1'h0)] : {wire36, wire36}))) || (~&(^~(-((8'hb3) ?
          wire12 : reg90)))));
      reg92 <= (~|($unsigned($signed((|(8'hbb)))) ?
          wire38 : (!(reg91[(3'h7):(1'h1)] ? (^reg89) : wire39))));
    end
  assign wire93 = wire11;
  assign wire94 = wire11[(1'h1):(1'h1)];
  assign wire95 = (((((wire94 | reg91) ? wire39[(3'h7):(3'h7)] : reg87) ?
                              ($unsigned(wire39) ~^ (+wire12)) : {reg92}) ?
                          {wire11,
                              $signed((reg87 ?
                                  wire11 : wire11))} : (reg92[(4'hd):(1'h1)] ~^ reg87)) ?
                      reg92[(5'h12):(2'h2)] : (-(((-wire36) ?
                          (!wire11) : wire93) ^ $unsigned(wire38[(4'hc):(4'h8)]))));
  assign wire96 = ($unsigned((wire10 ?
                          reg87[(2'h3):(2'h2)] : reg88[(1'h0):(1'h0)])) ?
                      (|($signed({wire13,
                          wire94}) >>> reg89[(1'h0):(1'h0)])) : (8'h9f));
endmodule

module module40
#(parameter param83 = ((-(~^{{(8'hb6)}, (^~(8'hab))})) - (((((8'hb7) ? (8'hb5) : (8'ha3)) ? ((8'hab) ? (8'hae) : (8'ha9)) : {(8'hbc)}) ? (8'hb4) : {((8'ha4) ^~ (8'hb1))}) ? {(((8'hab) ? (8'hb4) : (8'hb1)) >> ((8'had) << (8'ha6)))} : (|(!(+(8'ha7)))))), 
parameter param84 = ((+param83) ? {param83} : ((~param83) >> (|{(~param83)}))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire44;
  input wire signed [(5'h12):(1'h0)] wire43;
  input wire signed [(5'h13):(1'h0)] wire42;
  input wire [(3'h4):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire64,
                 wire63,
                 wire62,
                 wire58,
                 wire57,
                 wire56,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 reg82,
                 reg81,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg61,
                 reg60,
                 reg59,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire45 = wire41[(2'h3):(2'h2)];
  assign wire46 = {((wire45 ?
                          $signed({wire42,
                              wire43}) : (-(~|wire44))) >>> $unsigned(wire43)),
                      wire43[(1'h1):(1'h1)]};
  assign wire47 = $signed(((~|((wire44 <= wire41) >= $unsigned(wire45))) != ($unsigned((wire44 >= wire46)) ?
                      $unsigned((wire43 ?
                          wire42 : wire45)) : $signed({wire46}))));
  assign wire48 = wire41;
  assign wire49 = $unsigned($signed(((8'hb8) && $signed({wire41, wire43}))));
  always
    @(posedge clk) begin
      if (wire47[(4'he):(4'hc)])
        begin
          reg50 <= ({$unsigned($unsigned({wire46, wire45})),
              (8'ha8)} ^~ (wire48 >> wire45));
          reg51 <= (~&($unsigned((^~$unsigned(wire43))) << $unsigned(wire42[(3'h4):(1'h1)])));
          reg52 <= wire44;
          reg53 <= {({($unsigned(wire45) ? reg51 : wire43),
                      ((wire41 ? reg52 : wire43) | (wire43 + wire45))} ?
                  (wire48 < wire41[(2'h2):(2'h2)]) : reg52)};
        end
      else
        begin
          reg50 <= (8'hae);
          reg51 <= {((~&$signed((wire47 && reg51))) > wire47)};
          reg52 <= ($signed($unsigned({$signed(wire47), {wire46}})) ?
              wire49 : wire44);
          reg53 <= wire41[(2'h3):(2'h3)];
          reg54 <= wire48;
        end
      reg55 <= wire49[(3'h5):(3'h4)];
    end
  assign wire56 = wire47[(5'h12):(5'h12)];
  assign wire57 = (7'h43);
  assign wire58 = (^(~(wire44 ?
                      (~^(reg52 + wire47)) : $signed((wire45 << reg54)))));
  always
    @(posedge clk) begin
      reg59 <= $signed({(8'hba), reg50});
      reg60 <= ($signed($unsigned(($unsigned(wire58) >> (8'ha5)))) != wire56[(2'h2):(1'h1)]);
      reg61 <= {(wire49[(1'h0):(1'h0)] ?
              (((reg53 ? reg54 : reg54) ?
                  (-wire42) : (reg52 ^ (8'hbd))) ^~ (8'h9e)) : $unsigned($unsigned(wire46)))};
    end
  assign wire62 = reg50;
  assign wire63 = {(-(8'hbc))};
  assign wire64 = wire41[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned(({wire57,
          reg54} >> reg55[(2'h2):(1'h1)])))))
        begin
          if ($unsigned(($unsigned(wire44[(2'h3):(2'h3)]) ?
              (wire47 >>> reg50) : reg51[(3'h5):(2'h3)])))
            begin
              reg65 <= ((wire41[(2'h3):(2'h3)] * wire42[(2'h2):(1'h0)]) ?
                  (8'hb7) : wire42[(5'h12):(4'hf)]);
              reg66 <= $signed(({((wire62 <<< reg53) != (8'hbc))} ?
                  ($unsigned((reg60 ? wire48 : wire49)) ?
                      $signed(reg61[(2'h2):(1'h1)]) : $unsigned($unsigned(wire57))) : ($unsigned($signed(wire49)) < $unsigned(wire48))));
              reg67 <= $unsigned($unsigned($signed({(wire48 <<< reg60),
                  ((8'hbb) ? reg65 : (8'ha1))})));
              reg68 <= ((({(wire57 ?
                              reg59 : wire63)} >>> $signed((reg66 && reg53))) ?
                      $unsigned(((~|wire57) ?
                          (|wire64) : $unsigned(reg60))) : ({{reg59, wire49}} ?
                          $unsigned(reg59[(2'h3):(1'h0)]) : (wire44[(3'h5):(2'h2)] ?
                              (wire41 << wire42) : wire43[(3'h5):(1'h0)]))) ?
                  reg52[(2'h2):(2'h2)] : (!reg51[(3'h6):(1'h1)]));
              reg69 <= reg50;
            end
          else
            begin
              reg65 <= $unsigned($signed(wire57));
              reg66 <= ($signed($signed(reg66[(2'h2):(1'h0)])) == (reg60 <<< $signed((~|(wire45 ?
                  wire43 : reg54)))));
              reg67 <= (~|{reg51[(3'h5):(3'h4)]});
              reg68 <= {reg52,
                  ($unsigned((&reg60)) ?
                      wire64[(4'h8):(2'h2)] : $unsigned($unsigned((reg54 ?
                          wire62 : wire47))))};
            end
          if ((8'ha5))
            begin
              reg70 <= ((reg53[(2'h2):(1'h0)] << $unsigned($signed((wire48 ~^ wire43)))) ~^ reg53);
              reg71 <= wire44[(2'h2):(1'h1)];
              reg72 <= $signed(wire62);
              reg73 <= ((8'hb9) ?
                  (^~wire63) : (($unsigned((^wire42)) >> wire41) ?
                      (wire49[(3'h4):(3'h4)] ?
                          (^~(~&(8'hb0))) : {(8'hae)}) : (~^$signed((wire57 > reg51)))));
              reg74 <= ($unsigned($signed(reg73)) == ($signed(reg73) | {(+wire62)}));
            end
          else
            begin
              reg70 <= $signed(($unsigned(reg72[(4'hc):(2'h3)]) >= (~&((^~wire45) ?
                  $unsigned(wire41) : (wire58 ? (8'hbf) : wire47)))));
              reg71 <= reg67[(2'h2):(2'h2)];
              reg72 <= ((^$unsigned($signed($signed(reg70)))) == reg71[(1'h1):(1'h1)]);
            end
          reg75 <= $unsigned({($signed((reg55 ? reg70 : (8'hb1))) ?
                  reg65[(4'h8):(2'h2)] : (-$unsigned(reg72))),
              ($signed((reg59 ? reg70 : reg54)) == wire58[(1'h1):(1'h0)])});
        end
      else
        begin
          reg65 <= reg50;
          reg66 <= wire49[(3'h6):(3'h5)];
        end
      if (({$signed($signed($signed(reg52))),
          $signed(reg68)} ^~ $unsigned(($unsigned($unsigned((8'haf))) ?
          $signed($signed(wire43)) : ((reg68 ? reg53 : wire41) ?
              wire45 : (wire58 ? wire64 : wire46))))))
        begin
          reg76 <= (~|($signed(({reg55, (7'h44)} & $signed(reg68))) ?
              ($signed($unsigned(reg67)) ^ reg59[(2'h2):(1'h0)]) : $signed($unsigned(((8'ha3) ~^ reg74)))));
        end
      else
        begin
          reg76 <= $signed((reg70[(2'h2):(2'h2)] || reg65));
        end
      reg77 <= $unsigned($signed($signed(reg75)));
      if ((!reg59[(1'h0):(1'h0)]))
        begin
          reg78 <= $signed((wire42 ^ reg61));
        end
      else
        begin
          reg78 <= (($signed(((wire46 ? reg67 : reg65) ?
                      wire46 : {reg68, reg61})) ?
                  (~^(&$signed(wire62))) : {{(reg77 & wire62)}, reg78}) ?
              (~&{$signed((reg66 ? wire64 : reg59))}) : reg61);
        end
    end
  assign wire79 = (reg76[(1'h0):(1'h0)] ^~ $unsigned($unsigned((~^$unsigned((8'ha5))))));
  assign wire80 = ((+wire79[(4'h8):(3'h6)]) ?
                      {(((reg51 ? reg74 : wire44) > $signed(reg59)) ?
                              $unsigned((wire62 ? reg74 : reg60)) : {{reg67,
                                      wire45}})} : ({(-((8'hae) ?
                                  reg67 : wire43))} ?
                          wire49 : (~&(|(~wire41)))));
  always
    @(posedge clk) begin
      reg81 <= $unsigned(($signed($unsigned((wire79 | (8'hbc)))) ~^ ($unsigned((reg77 ?
          reg59 : reg73)) && reg51)));
      reg82 <= (^$unsigned(wire45[(2'h2):(1'h0)]));
    end
endmodule

module module14
#(parameter param34 = ((((((8'h9e) ? (8'hb2) : (8'hb5)) >= (^~(8'ha2))) + (&(^(8'hbe)))) ? ((|((8'hac) <= (8'hb8))) ? (!(^(8'hbf))) : {((8'h9f) >> (7'h40))}) : (~&{((8'had) << (8'hb4))})) ? ({{((8'h9c) < (8'hbc)), ((8'h9d) ? (8'haa) : (8'h9d))}, {((8'ha1) ~^ (7'h43)), ((8'hae) ? (8'hae) : (8'ha6))}} ~^ (^(&((7'h43) ? (8'hb2) : (8'hb6))))) : ((((~|(8'hbb)) ? ((8'hb3) ? (8'hb7) : (8'hbf)) : (~^(8'hb9))) <<< (8'hb0)) ? ((~|{(8'haa)}) != (((8'hac) ? (8'hae) : (8'ha2)) & ((8'hb5) * (8'hba)))) : {{((8'ha7) ? (8'ha9) : (7'h40)), (-(8'hbb))}, {((8'had) < (8'hb0))}})), 
parameter param35 = ((!param34) * {{(!(param34 >> param34)), ((param34 ~^ param34) ? (param34 ? (8'hb7) : param34) : {param34, param34})}, (((param34 ? param34 : param34) ? ((8'hb2) ~^ param34) : ((8'hbf) == param34)) >= (param34 <<< (7'h43)))}))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire20;
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire20,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = wire18;
  always
    @(posedge clk) begin
      reg21 <= wire17;
      reg22 <= $signed($unsigned((wire18[(1'h0):(1'h0)] != (8'haf))));
      reg23 <= wire15[(3'h7):(2'h3)];
      reg24 <= reg22;
      if ($signed($unsigned((~|(|(8'ha5))))))
        begin
          if ((wire20[(1'h0):(1'h0)] ?
              ((^$signed(((8'hb9) ?
                  reg21 : reg21))) >> $signed($unsigned((~^wire17)))) : $unsigned(((8'hb6) ?
                  wire16 : (~|reg21)))))
            begin
              reg25 <= $unsigned($unsigned(({(|reg21)} > wire18[(5'h14):(5'h10)])));
            end
          else
            begin
              reg25 <= wire15[(2'h2):(1'h0)];
            end
          reg26 <= {(($signed((wire19 ?
                  wire20 : reg23)) <<< {{reg24}}) ^ wire16[(4'hc):(4'hc)])};
          reg27 <= $unsigned((8'hb5));
        end
      else
        begin
          reg25 <= (((wire20 ? (7'h44) : $signed((reg22 ~^ reg22))) ?
                  $unsigned((reg22[(3'h6):(1'h0)] ?
                      wire19[(1'h1):(1'h0)] : (8'h9e))) : $unsigned(((wire15 <= (8'hab)) != (reg25 ?
                      (8'haa) : wire20)))) ?
              $signed(($unsigned((+reg22)) ?
                  reg23 : $unsigned($unsigned(wire16)))) : $signed($signed((|$signed(wire20)))));
          reg26 <= $unsigned((!wire15));
          reg27 <= {$unsigned((wire20[(1'h1):(1'h0)] ? reg24 : wire20))};
        end
    end
  assign wire28 = reg25[(1'h0):(1'h0)];
  assign wire29 = (~|((&$signed({wire19})) == reg26[(4'he):(3'h7)]));
  assign wire30 = ((|reg23[(5'h10):(4'hd)]) ?
                      wire29[(5'h10):(4'hd)] : $unsigned((reg25 + $unsigned((reg22 ?
                          wire16 : reg22)))));
  assign wire31 = wire29[(4'h8):(3'h6)];
  assign wire32 = {$unsigned($unsigned((^~reg27))),
                      (~(($signed(wire31) == {wire17}) ?
                          ($signed(reg26) ?
                              (wire16 ^~ wire29) : wire31[(1'h1):(1'h0)]) : $signed((&wire15))))};
  assign wire33 = ({$signed($signed((reg27 >= reg23))), (8'h9e)} ?
                      ($unsigned(($unsigned(reg26) * $signed(wire18))) * (-((reg22 >= (8'hb6)) >>> {reg22,
                          wire17}))) : (reg23[(3'h5):(1'h1)] ?
                          wire18 : $unsigned((wire31 ?
                              (reg22 + wire20) : wire18[(2'h2):(1'h1)]))));
endmodule
