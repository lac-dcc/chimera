module top
#(parameter param109 = {(^((~&((8'ha7) >>> (8'ha1))) || ({(8'hbb)} ? (-(7'h40)) : ((8'ha7) ? (8'ha9) : (8'hbc)))))}, 
parameter param110 = param109)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire5,
                 wire4,
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
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire4 = {$unsigned($signed(((!wire0) ~^ $unsigned(wire0)))), wire2};
  assign wire5 = (|$signed(wire4[(4'h8):(3'h5)]));
  module6 #() modinst86 (.y(wire85), .wire7(wire1), .wire8(wire5), .clk(clk), .wire9(wire0), .wire10(wire4));
  assign wire87 = (~^($unsigned((7'h41)) != ((~|$signed(wire5)) == {wire85[(4'hb):(3'h5)]})));
  assign wire88 = $unsigned(wire2);
  assign wire89 = wire0;
  assign wire90 = ($unsigned(wire2[(3'h4):(2'h2)]) ?
                      ($unsigned($signed($unsigned(wire3))) ?
                          (|wire88) : $unsigned($unsigned({wire1,
                              wire5}))) : wire0[(5'h10):(4'hc)]);
  assign wire91 = (8'ha9);
  assign wire92 = (-({wire85[(3'h4):(2'h2)],
                      {$signed(wire85)}} | (((~&(8'had)) ~^ ((8'ha9) ?
                      wire3 : wire88)) <<< ((|wire1) ?
                      (wire85 ? wire89 : wire5) : (wire1 >> wire3)))));
  always
    @(posedge clk) begin
      reg93 <= (|wire91[(2'h3):(1'h1)]);
      if ((!((!(8'hb8)) & (wire87[(3'h6):(1'h0)] ?
          ((8'ha0) << (wire4 ?
              (8'hb1) : wire4)) : ($signed(wire90) < (wire1 > wire90))))))
        begin
          if ((^~$signed((!$signed(wire0)))))
            begin
              reg94 <= $signed(reg93);
            end
          else
            begin
              reg94 <= $signed(wire2[(1'h0):(1'h0)]);
              reg95 <= wire0[(5'h13):(4'he)];
            end
          if ($unsigned((((wire91[(1'h0):(1'h0)] >= ((8'hbd) ?
                  wire89 : (8'ha2))) & $signed((wire89 > wire5))) ?
              $unsigned($unsigned({wire0})) : (!(~^$unsigned(wire89))))))
            begin
              reg96 <= (^~wire0);
            end
          else
            begin
              reg96 <= (&$signed((wire90[(4'he):(3'h4)] || ((8'hb0) ?
                  wire0[(5'h12):(1'h1)] : wire0[(3'h4):(2'h3)]))));
              reg97 <= {{$signed((~&(-wire89))),
                      ({$unsigned(wire88), reg94} ?
                          {(wire0 - wire90), wire90} : reg93)},
                  ($unsigned((~&reg96)) == $unsigned((wire90[(3'h5):(1'h0)] ?
                      (reg95 - wire4) : {wire91, wire0})))};
              reg98 <= ((^$signed((~^wire87))) ?
                  wire88 : $signed(reg95[(5'h15):(5'h15)]));
              reg99 <= (({$signed((wire88 ~^ reg98))} - ((+(-wire87)) ~^ wire3[(2'h3):(2'h3)])) > (8'ha6));
            end
          reg100 <= ($unsigned((|((8'h9d) ?
                  $signed(wire85) : $unsigned((8'hba))))) ?
              wire89[(1'h0):(1'h0)] : ((reg95[(4'hb):(4'hb)] ^ ((wire4 >> (8'hbf)) ?
                      $unsigned(wire87) : (8'hab))) ?
                  $signed($signed($signed(wire88))) : reg96[(2'h2):(1'h0)]));
          if (reg97[(3'h7):(3'h7)])
            begin
              reg101 <= wire4[(4'hf):(4'hb)];
              reg102 <= $unsigned((!wire4[(3'h4):(2'h3)]));
            end
          else
            begin
              reg101 <= ($unsigned(($signed(reg93[(4'hd):(4'ha)]) >= $signed((8'hb3)))) ?
                  wire85[(4'hf):(3'h6)] : $unsigned($signed($unsigned($unsigned(wire92)))));
              reg102 <= wire4;
              reg103 <= (|(^~reg97));
              reg104 <= wire5;
              reg105 <= $signed((((wire89 + ((8'ha9) ? (8'hb4) : wire88)) ?
                      ((8'h9f) - wire0[(1'h1):(1'h1)]) : reg96) ?
                  wire2 : $signed((reg94[(3'h5):(2'h2)] ?
                      wire88[(4'ha):(4'h8)] : reg95))));
            end
          reg106 <= wire1[(2'h2):(1'h0)];
        end
      else
        begin
          reg94 <= (({{{reg93}, (reg97 ? (8'h9e) : reg104)}} ?
              wire92[(2'h3):(2'h3)] : (+wire85[(5'h10):(4'hb)])) || ($unsigned($unsigned(reg105[(3'h5):(2'h3)])) >> reg103[(4'h8):(2'h3)]));
          if (reg96[(2'h2):(1'h1)])
            begin
              reg95 <= (reg101 ?
                  (((+$unsigned(wire85)) & ($unsigned(reg100) ?
                      wire0 : $unsigned(reg93))) || $unsigned({wire90[(2'h3):(2'h3)]})) : (reg105[(5'h13):(1'h1)] ?
                      ({(reg98 ? wire4 : reg98),
                          (reg104 - wire92)} & (8'h9c)) : reg99[(4'h9):(3'h7)]));
              reg96 <= wire89[(3'h6):(3'h5)];
              reg97 <= $signed(wire5);
            end
          else
            begin
              reg95 <= (-reg100);
            end
        end
      reg107 <= wire1[(2'h3):(1'h1)];
      reg108 <= wire85[(4'he):(4'ha)];
    end
endmodule

module module6
#(parameter param83 = {(|(-(~{(8'h9f), (8'ha7)}))), (^((((8'ha3) & (7'h40)) ? ((8'ha5) * (8'ha1)) : ((8'hbe) ? (8'hb3) : (7'h43))) <<< {(&(8'hb8))}))}, 
parameter param84 = (&(param83 ? ((|param83) ? ((param83 | param83) ? ((7'h43) ? param83 : param83) : (param83 < param83)) : (-((8'hab) + param83))) : ({param83, (^~param83)} ? (param83 ? param83 : ((8'ha8) & param83)) : ({param83, param83} - (param83 && param83))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire80;
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  assign y = {wire82,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire24,
                 wire40,
                 wire42,
                 wire43,
                 wire80,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire11 = (wire10[(4'h8):(3'h6)] ?
                      ($unsigned($unsigned($signed(wire8))) ?
                          wire7[(3'h5):(3'h4)] : wire8) : (^~(wire10[(2'h2):(2'h2)] ?
                          $unsigned($unsigned((8'haf))) : {$unsigned(wire9),
                              wire9})));
  assign wire12 = (!{(($unsigned(wire9) + wire7) ^ {$signed(wire9), (+wire11)}),
                      (({wire10} ? wire9 : wire10) ?
                          wire10 : ((~^wire7) != $unsigned(wire7)))});
  assign wire13 = $unsigned({wire11[(5'h14):(5'h10)], wire8[(4'h9):(2'h2)]});
  assign wire14 = ($unsigned($unsigned((wire11 * wire7[(2'h2):(1'h1)]))) >> wire12[(3'h5):(3'h4)]);
  assign wire15 = $signed($signed($signed(wire14[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg16 <= $signed((!(8'hac)));
      if ((8'hb6))
        begin
          reg17 <= {(wire12[(4'hc):(4'hc)] & wire12)};
          if ({wire13, wire11[(4'hc):(4'hc)]})
            begin
              reg18 <= (^~$unsigned((((wire11 || (8'hbc)) ?
                  wire15 : {wire9}) ^ ($signed((8'hbc)) ?
                  wire15 : $unsigned(wire14)))));
              reg19 <= $unsigned(wire7);
              reg20 <= wire8[(4'ha):(4'h9)];
              reg21 <= (-(~{$signed(wire10[(1'h1):(1'h0)]),
                  ((wire11 + reg19) && (wire13 & reg16))}));
              reg22 <= (^($signed(((^(8'h9d)) ?
                  wire14 : ((8'h9f) >= wire14))) ^~ ((wire8[(4'hf):(4'hb)] != $unsigned(wire13)) ?
                  $signed((wire13 ^~ wire13)) : $unsigned(reg19))));
            end
          else
            begin
              reg18 <= {$unsigned(wire12)};
              reg19 <= (-$unsigned({$signed((reg21 ? reg21 : reg17))}));
              reg20 <= reg22;
              reg21 <= reg20[(2'h3):(1'h1)];
            end
          reg23 <= (8'ha0);
        end
      else
        begin
          if (wire13)
            begin
              reg17 <= wire14;
              reg18 <= (|reg20[(1'h1):(1'h0)]);
              reg19 <= (~|(~&reg16));
              reg20 <= $signed(((~^(((7'h41) >>> (8'hb0)) ?
                      $signed(wire13) : wire7)) ?
                  $signed($signed(wire8)) : (~&wire7[(3'h5):(2'h3)])));
              reg21 <= (({$unsigned($signed(reg18))} != ($unsigned(reg21[(1'h0):(1'h0)]) ?
                      ($unsigned(reg18) << $unsigned(wire8)) : reg17)) ?
                  $signed(((reg16 ? (wire12 ^~ reg20) : {wire7, (8'hae)}) ?
                      reg19 : reg16[(4'hc):(3'h6)])) : ($unsigned((reg23 + wire15)) ?
                      (($unsigned(wire14) ?
                          (reg16 | wire7) : (+reg16)) < ($unsigned(wire10) ^~ (wire8 > reg16))) : reg21));
            end
          else
            begin
              reg17 <= $unsigned($unsigned((8'ha1)));
              reg18 <= reg21[(4'hd):(3'h7)];
            end
        end
    end
  assign wire24 = ($signed((wire9[(3'h4):(3'h4)] ?
                      wire13[(2'h3):(1'h0)] : (~(reg19 + wire8)))) - (reg23 >>> (8'hbd)));
  module25 #() modinst41 (wire40, clk, reg18, reg22, wire8, wire10);
  assign wire42 = $unsigned(wire10);
  assign wire43 = ((wire13[(2'h2):(1'h1)] ^~ $unsigned(((reg17 | reg18) == $signed(wire8)))) & ($signed(wire9[(2'h3):(2'h2)]) || reg18[(1'h0):(1'h0)]));
  module44 #() modinst81 (.wire49(wire9), .wire46(reg23), .y(wire80), .wire45(reg21), .clk(clk), .wire47(wire14), .wire48(wire11));
  assign wire82 = $signed((^~{(wire11[(2'h3):(2'h3)] && (reg17 ~^ wire9))}));
endmodule

module module44
#(parameter param78 = ({{(^{(8'h9f)})}} ^~ ((~|(((8'h9f) ? (8'ha4) : (8'haa)) | ((8'ha3) ? (8'hb4) : (7'h41)))) ? {((~^(8'ha2)) >>> (|(8'hb7))), (!(~(7'h41)))} : {({(8'ha7)} && (|(8'ha6)))})), 
parameter param79 = param78)
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire49;
  input wire signed [(3'h4):(1'h0)] wire48;
  input wire [(3'h6):(1'h0)] wire47;
  input wire [(4'hf):(1'h0)] wire46;
  input wire signed [(4'he):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire52,
                 wire51,
                 wire50,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire50 = wire47;
  assign wire51 = $signed({wire46[(4'hb):(2'h2)]});
  assign wire52 = wire48[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg53 <= ({wire47, wire48} ?
          {(^($unsigned(wire45) ? $signed(wire50) : {wire52, wire48})),
              wire46[(4'hd):(4'hb)]} : (|((~^(|wire46)) ?
              ($unsigned(wire51) * wire49) : (wire51[(4'ha):(4'h8)] ?
                  (wire51 ? wire50 : wire45) : (wire47 < wire48)))));
      reg54 <= (^~wire45[(4'hd):(4'h9)]);
      reg55 <= (reg53[(4'h8):(3'h7)] ?
          $signed((~^wire51)) : $unsigned((((wire46 ?
              reg53 : reg54) == $signed((8'h9f))) && {(wire48 ?
                  reg54 : wire47)})));
      reg56 <= {$unsigned($signed($signed(wire52[(3'h6):(2'h3)])))};
      reg57 <= ($unsigned($unsigned($signed($unsigned(wire52)))) > $signed(wire48));
    end
  assign wire58 = wire48[(1'h1):(1'h1)];
  assign wire59 = (wire50 <= {wire46[(4'he):(3'h6)]});
  assign wire60 = (8'ha2);
  assign wire61 = (wire45[(2'h3):(2'h2)] ^ wire58);
  always
    @(posedge clk) begin
      reg62 <= $signed(wire60[(4'hf):(3'h6)]);
      reg63 <= (-reg56[(5'h11):(5'h10)]);
      reg64 <= wire49;
      reg65 <= reg62;
    end
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned(($unsigned((8'hb0)) & (~reg62))))))
        begin
          reg66 <= ((~^((reg53 * wire49[(3'h7):(2'h2)]) ?
              (~|(|reg53)) : (^~(reg54 ? wire61 : wire51)))) + (^wire49));
          reg67 <= ((~($unsigned((^~reg53)) ^~ $unsigned(wire61[(4'h9):(4'h8)]))) - $unsigned(({(+wire58),
              wire47[(2'h2):(1'h0)]} | reg66)));
          reg68 <= $unsigned(reg53[(4'h9):(4'h9)]);
          reg69 <= $unsigned((8'hb8));
          reg70 <= {wire49};
        end
      else
        begin
          reg66 <= (reg55 >= (~&$unsigned((^{wire58}))));
        end
      reg71 <= reg53[(4'hd):(1'h1)];
      reg72 <= (~^$unsigned((-{$signed(wire61)})));
    end
  assign wire73 = ({$signed(($unsigned((8'h9d)) ?
                          wire51[(4'ha):(2'h2)] : (wire50 ? wire45 : reg69))),
                      $signed((((8'hbb) - (8'ha6)) - $unsigned(wire46)))} * wire59[(3'h5):(3'h4)]);
  assign wire74 = $unsigned((^(wire47[(2'h2):(2'h2)] >>> $unsigned((reg57 >= (7'h43))))));
  assign wire75 = $unsigned($signed(($signed(reg64) ^~ ((|(8'hb0)) <<< (8'hbb)))));
  assign wire76 = $unsigned($signed($signed((^~(~&reg66)))));
  assign wire77 = reg69[(3'h4):(2'h2)];
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  input wire [(5'h11):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  assign y = {wire39,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire30 = (^$unsigned(wire29[(4'ha):(4'h9)]));
  assign wire31 = $unsigned($unsigned($signed($signed($signed(wire30)))));
  assign wire32 = (~(({(wire30 < wire31), (wire28 ^~ wire26)} ?
                      $signed((+wire30)) : (8'hb7)) << (wire27 || $unsigned($unsigned(wire31)))));
  assign wire33 = $unsigned({wire26,
                      $signed(((^~wire26) + $unsigned(wire30)))});
  always
    @(posedge clk) begin
      reg34 <= (wire29[(4'h9):(3'h5)] & wire30[(2'h3):(1'h0)]);
      reg35 <= ((wire29 ?
              wire28[(5'h13):(3'h5)] : $signed($unsigned($signed(wire32)))) ?
          {(^((wire30 != (8'h9e)) ~^ (+wire33)))} : reg34);
    end
  assign wire36 = (&{wire27});
  always
    @(posedge clk) begin
      reg37 <= (7'h40);
      reg38 <= (+(^~wire28[(1'h1):(1'h1)]));
    end
  assign wire39 = (wire36 | {((~|wire27[(1'h0):(1'h0)]) ?
                          ($unsigned(reg34) ?
                              (wire28 & (8'haa)) : $signed(wire33)) : ($signed(reg38) >= (wire33 ?
                              wire29 : wire28)))});
endmodule
