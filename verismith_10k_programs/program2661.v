module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire167;
  wire signed [(5'h15):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire165;
  wire [(3'h7):(1'h0)] wire164;
  wire signed [(3'h7):(1'h0)] wire160;
  wire signed [(3'h5):(1'h0)] wire159;
  wire signed [(4'he):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire156;
  wire [(4'hc):(1'h0)] wire155;
  wire [(4'h9):(1'h0)] wire147;
  wire signed [(4'h9):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire145;
  wire [(3'h7):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire140;
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(3'h7):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(5'h15):(1'h0)] reg142 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire160,
                 wire159,
                 wire158,
                 wire156,
                 wire155,
                 wire147,
                 wire146,
                 wire145,
                 wire80,
                 wire4,
                 wire140,
                 reg163,
                 reg162,
                 reg161,
                 reg157,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  assign wire4 = wire0[(2'h2):(1'h0)];
  module5 #() modinst81 (wire80, clk, wire3, wire0, wire4, wire1, wire2);
  module82 #() modinst141 (wire140, clk, wire1, wire3, wire4, wire80, wire0);
  always
    @(posedge clk) begin
      reg142 <= $unsigned(wire1[(3'h7):(3'h7)]);
    end
  always
    @(posedge clk) begin
      reg143 <= {(({$signed(wire3),
              reg142[(4'hc):(3'h4)]} + (wire2[(3'h7):(3'h7)] ^ (wire2 ?
              reg142 : wire4))) - wire4[(2'h3):(1'h0)]),
          wire1[(4'hf):(2'h3)]};
      reg144 <= {$unsigned((+(-$unsigned(wire2)))),
          (reg142 ?
              (wire3[(3'h5):(1'h0)] - {(~|wire140),
                  $signed((7'h44))}) : wire2[(1'h1):(1'h0)])};
    end
  assign wire145 = wire0;
  assign wire146 = $signed((wire0[(3'h5):(2'h3)] - (((~^wire3) ^ wire2) * reg143[(3'h5):(2'h2)])));
  assign wire147 = (wire146[(3'h6):(1'h1)] ~^ reg142[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg148 <= wire0;
      reg149 <= (~wire80);
      reg150 <= (reg149[(2'h3):(1'h1)] ?
          $signed(((!(~^wire3)) ^~ (((8'ha1) * (8'ha4)) ?
              wire3[(4'hf):(4'h9)] : wire1[(2'h2):(1'h1)]))) : (((wire4[(3'h5):(3'h5)] <= $signed(wire1)) > {wire3[(3'h7):(2'h2)],
              $signed(wire145)}) << wire4));
      if (wire146[(3'h7):(3'h7)])
        begin
          reg151 <= $unsigned($unsigned({(&(reg148 ? reg148 : (8'hb8)))}));
          reg152 <= $signed((!($signed($signed((8'hbd))) ^~ $unsigned(wire3))));
          reg153 <= (^reg152[(3'h6):(3'h4)]);
        end
      else
        begin
          reg151 <= wire145;
        end
    end
  always
    @(posedge clk) begin
      reg154 <= {wire1};
    end
  assign wire155 = $unsigned(wire140[(4'h9):(2'h2)]);
  assign wire156 = wire155;
  always
    @(posedge clk) begin
      reg157 <= {((wire2[(5'h10):(4'he)] ?
                  ($signed(wire80) ?
                      $signed(wire80) : (reg151 ? wire145 : wire2)) : wire145) ?
              (wire3[(4'hb):(3'h5)] ?
                  (wire1[(2'h2):(1'h0)] ^~ reg144) : $signed((reg151 ?
                      (8'ha0) : (8'hb9)))) : $unsigned(wire156))};
    end
  assign wire158 = wire147;
  assign wire159 = (wire158 ?
                       wire0[(4'he):(1'h1)] : $unsigned($unsigned((8'ha4))));
  assign wire160 = $signed(reg150[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      reg161 <= (~^{(8'hb7)});
      reg162 <= $signed((wire4 >> $signed((&{(8'haa)}))));
      reg163 <= ((&$unsigned((|wire3[(4'hc):(4'h9)]))) ~^ wire145[(3'h7):(1'h0)]);
    end
  assign wire164 = $unsigned(($signed(($unsigned(wire1) || $signed(wire146))) > (((~|reg157) ?
                           (reg161 ? (8'ha5) : reg162) : ((8'h9f) ?
                               reg161 : reg153)) ?
                       (-$signed(reg154)) : (!(reg149 <= wire80)))));
  assign wire165 = (^~$signed((|((wire147 * (8'h9c)) ?
                       (reg152 <<< (8'hbe)) : $signed(wire159)))));
  assign wire166 = (~&reg163[(4'h8):(3'h7)]);
  assign wire167 = ((!wire145[(1'h1):(1'h1)]) ?
                       ((~^(+(|(8'hbe)))) ?
                           ({{wire159}} ?
                               $signed((!reg148)) : ((^~reg151) ?
                                   reg143 : ((7'h41) && wire164))) : {((!wire146) ?
                                   (~|reg142) : $unsigned((8'ha3)))}) : $signed($signed((|(reg143 ?
                           reg150 : (7'h41))))));
endmodule

module module82
#(parameter param138 = ({{(((8'hb1) >> (8'haa)) > ((8'hb8) ? (8'ha9) : (8'hb2)))}} * ((~^(((8'hb4) ? (8'hb9) : (7'h40)) > ((8'hae) && (8'ha4)))) ? ({((7'h41) << (8'hb0))} ? (8'haa) : ({(8'h9f)} + {(7'h44)})) : ((-((8'hb9) ^~ (8'haa))) ~^ (((7'h42) ^~ (8'hb9)) ? ((8'hb5) < (8'ha9)) : (^~(8'h9c)))))), 
parameter param139 = param138)
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire87;
  input wire signed [(5'h11):(1'h0)] wire86;
  input wire [(3'h5):(1'h0)] wire85;
  input wire signed [(3'h5):(1'h0)] wire84;
  input wire signed [(5'h12):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire137;
  wire [(2'h2):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  reg signed [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire134,
                 wire105,
                 wire104,
                 wire103,
                 wire90,
                 wire89,
                 wire88,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire88 = $signed((wire83[(1'h0):(1'h0)] >= (-wire86[(2'h3):(2'h3)])));
  assign wire89 = (~&$signed({$signed($unsigned(wire86)),
                      {$unsigned(wire85), $signed((7'h43))}}));
  assign wire90 = wire84[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      if ((wire84[(3'h5):(1'h1)] ^~ (wire84 - (-wire90))))
        begin
          if (((((wire88 ? $unsigned(wire86) : (|wire83)) ?
              (~^$unsigned(wire89)) : wire83[(4'hd):(4'hc)]) * $unsigned(wire84)) * $unsigned((-$signed((wire86 ?
              wire90 : wire86))))))
            begin
              reg91 <= $unsigned(((+((8'hb2) << (!wire83))) ?
                  ($signed((^~wire89)) <= (8'ha8)) : ($signed((wire83 + (8'had))) ?
                      {(wire89 ?
                              wire85 : (8'had))} : $unsigned($unsigned(wire89)))));
              reg92 <= $unsigned($signed(wire83));
              reg93 <= $signed((($unsigned(((7'h40) + wire87)) < $signed(wire90[(2'h2):(1'h0)])) > (reg92 ?
                  (wire87[(2'h2):(2'h2)] ?
                      wire87[(3'h6):(3'h6)] : $unsigned(wire84)) : wire85)));
              reg94 <= $signed($unsigned($signed($unsigned((wire85 & (8'hb3))))));
            end
          else
            begin
              reg91 <= ((~|$unsigned(wire88[(3'h7):(1'h0)])) ?
                  reg93[(3'h4):(3'h4)] : wire87);
              reg92 <= (-$unsigned((($signed(wire88) <<< (reg93 ~^ wire85)) ?
                  $unsigned(reg91[(4'hf):(3'h7)]) : ((reg93 != wire84) > (reg91 == reg94)))));
              reg93 <= (8'hbc);
              reg94 <= (($signed(wire86) ?
                  $signed({(wire88 + wire86),
                      (8'hbc)}) : ((wire89 ^ $signed(wire88)) ?
                      wire88[(1'h1):(1'h1)] : wire83[(1'h0):(1'h0)])) ^~ $signed(reg93));
              reg95 <= ($unsigned((~wire83)) >= (~|wire85[(2'h2):(1'h1)]));
            end
        end
      else
        begin
          reg91 <= (($signed($unsigned((&wire85))) << reg95[(3'h6):(2'h3)]) ^ $unsigned($unsigned((reg93 && (wire86 ~^ wire86)))));
          reg92 <= wire87[(3'h4):(1'h1)];
          reg93 <= wire86[(4'hd):(3'h5)];
          reg94 <= ((wire89[(3'h5):(2'h3)] ?
                  wire87 : (^$unsigned($unsigned(wire83)))) ?
              {$unsigned($unsigned((reg95 ? wire83 : wire83))),
                  (^~(reg92 && $unsigned(wire88)))} : (8'h9d));
          reg95 <= $signed(wire87);
        end
      reg96 <= ($unsigned((^~($signed(wire86) | wire90))) ?
          reg94 : reg95[(2'h3):(2'h2)]);
      reg97 <= (reg95 > (reg96[(1'h1):(1'h0)] >>> wire89));
      if ((^(+(-(!$signed(reg93))))))
        begin
          reg98 <= $signed($signed($signed(reg93[(4'hc):(3'h7)])));
          if ((^~$unsigned(($signed((~|reg92)) ?
              reg93 : $unsigned(reg92[(2'h3):(1'h0)])))))
            begin
              reg99 <= $signed((({{wire87, reg96}} ?
                      $signed((|wire87)) : $signed((reg96 ?
                          wire90 : (8'hba)))) ?
                  $unsigned(wire87) : (wire85[(1'h0):(1'h0)] << (+$signed((8'hb9))))));
              reg100 <= ((!(reg91 ?
                  $unsigned((~&reg94)) : (wire88[(3'h5):(1'h1)] ?
                      (wire88 > reg91) : $signed(reg92)))) < wire90);
              reg101 <= (+(~|reg93));
            end
          else
            begin
              reg99 <= $unsigned(wire88);
              reg100 <= ($unsigned($signed({((8'hbf) < reg94), (-reg92)})) ?
                  (wire86 ?
                      wire89[(3'h6):(2'h2)] : (($signed(wire86) ?
                              $signed(wire89) : reg98) ?
                          ($signed(wire90) != $unsigned(wire85)) : {$unsigned(reg101),
                              (reg101 == reg100)})) : ((({reg97, reg95} ?
                          (-reg92) : {reg101}) ^ $signed((reg93 ?
                          wire87 : reg94))) ?
                      wire88[(4'hb):(1'h0)] : $signed(wire86)));
            end
          reg102 <= ((((wire88 & (8'ha8)) <= (~|(reg92 != reg96))) && (wire84[(2'h2):(1'h0)] ?
                  (^$unsigned(reg96)) : (8'h9d))) ?
              ($unsigned($signed($unsigned((8'h9d)))) <<< (wire90[(3'h5):(3'h4)] ?
                  wire88 : (~^$unsigned(reg93)))) : {$signed(reg94),
                  (reg92[(4'hf):(1'h1)] ?
                      (wire84 == $unsigned((7'h44))) : wire89)});
        end
      else
        begin
          reg98 <= wire89;
          reg99 <= wire85[(2'h2):(1'h0)];
          reg100 <= ((~^(((wire89 ? reg100 : reg98) ?
                  $unsigned(reg94) : (~^reg100)) << $unsigned($unsigned(reg98)))) ?
              (8'ha4) : $signed(wire85));
        end
    end
  assign wire103 = reg98;
  assign wire104 = reg100;
  assign wire105 = $unsigned($unsigned((8'hac)));
  always
    @(posedge clk) begin
      if ((!(~$unsigned(wire83))))
        begin
          reg106 <= (~&(8'hb8));
          reg107 <= wire89;
        end
      else
        begin
          reg106 <= ((reg106[(2'h2):(2'h2)] ? wire89 : {reg96[(2'h2):(1'h0)]}) ?
              $unsigned($unsigned((wire85 + $unsigned(wire88)))) : wire105[(5'h13):(4'hc)]);
          if (wire105)
            begin
              reg107 <= (($signed($signed({wire89, wire105})) ?
                      (&({reg101,
                          reg97} <<< (reg98 < reg107))) : {(+(reg101 <= reg101))}) ?
                  $signed((!wire86)) : $unsigned((~|$signed(reg102[(1'h0):(1'h0)]))));
              reg108 <= {{((+(8'hb7)) ? wire104 : wire88[(1'h1):(1'h0)])}};
            end
          else
            begin
              reg107 <= wire85[(3'h4):(3'h4)];
            end
        end
      reg109 <= reg106[(4'h9):(3'h4)];
      reg110 <= {$signed(((+wire105) ? reg101 : ({wire103} ~^ reg99))), wire84};
      reg111 <= (($unsigned(((wire105 ? reg98 : (8'hbd)) <<< $signed(reg94))) ?
              $unsigned(($signed(wire103) <<< (reg95 ?
                  wire85 : reg102))) : $signed($unsigned($signed((7'h42))))) ?
          reg91[(4'he):(1'h1)] : (~^reg97[(1'h1):(1'h0)]));
    end
  module112 #() modinst135 (.wire115(reg102), .wire114(reg101), .wire113(reg94), .y(wire134), .clk(clk), .wire116(reg93));
  assign wire136 = {$signed($signed({(+wire134)}))};
  assign wire137 = wire87[(2'h3):(2'h2)];
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire77;
  assign y = {wire79, wire37, wire39, wire40, wire41, wire42, wire77, (1'h0)};
  module11 #() modinst38 (.wire13(wire7), .wire14(wire10), .clk(clk), .wire15(wire8), .y(wire37), .wire12(wire9));
  assign wire39 = (wire9 * {$signed({{wire7}, $signed(wire9)})});
  assign wire40 = wire9[(1'h1):(1'h1)];
  assign wire41 = $signed((~&$signed(wire8)));
  assign wire42 = {(|$unsigned(((wire41 > (8'hac)) ?
                          (wire8 != wire41) : wire39[(1'h0):(1'h0)])))};
  module43 #() modinst78 (.wire47(wire37), .wire46(wire42), .y(wire77), .wire44(wire39), .wire45(wire7), .clk(clk), .wire48(wire41));
  assign wire79 = (+wire37[(5'h11):(5'h10)]);
endmodule

module module43
#(parameter param75 = ((8'haf) ? (((((8'hbd) >= (8'haf)) << ((7'h40) ? (8'hbd) : (8'ha7))) ~^ ({(8'h9f)} ? {(8'hb0)} : ((8'hbe) && (7'h43)))) * ({(~(7'h43))} ^~ (((8'hb7) != (7'h44)) ? {(8'hb1)} : (8'had)))) : (((((7'h43) > (8'hb5)) >> ((8'ha2) ? (8'hb3) : (8'ha4))) != {(~&(8'ha0))}) << (~&((~(8'hbb)) != {(8'hb7)})))), 
parameter param76 = (-param75))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire signed [(4'hf):(1'h0)] wire46;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire signed [(3'h5):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire70,
                 wire69,
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
                 reg72,
                 reg71,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire49 = wire47;
  assign wire50 = $signed($signed(wire49));
  assign wire51 = $signed({wire47[(4'h8):(1'h1)]});
  assign wire52 = wire46;
  assign wire53 = {wire46[(4'he):(3'h5)]};
  assign wire54 = $signed((-wire51));
  assign wire55 = (wire45[(1'h0):(1'h0)] == (&((-$signed(wire53)) ?
                      $signed($unsigned(wire45)) : wire53)));
  assign wire56 = wire45[(3'h5):(3'h4)];
  assign wire57 = $signed(wire52);
  assign wire58 = {$unsigned($unsigned(($signed(wire51) ?
                          wire51[(5'h13):(3'h4)] : wire44[(3'h5):(1'h0)]))),
                      (^$signed($signed($signed((8'ha7)))))};
  assign wire59 = (-$unsigned((($signed(wire58) | (8'ha4)) <= ($signed(wire46) ?
                      (wire44 ? wire45 : wire46) : $unsigned(wire45)))));
  always
    @(posedge clk) begin
      if (((8'hbd) + (&{$unsigned($unsigned(wire46)),
          $signed($signed((8'hb2)))})))
        begin
          reg60 <= $unsigned(wire49[(3'h4):(1'h1)]);
          reg61 <= $unsigned((|(((wire51 ? reg60 : wire53) >> (wire53 ?
              wire59 : reg60)) - $signed({wire54, wire58}))));
          reg62 <= wire56;
        end
      else
        begin
          if (((wire54 ~^ wire56[(4'hb):(1'h0)]) && (~^$unsigned((~^(wire45 ?
              reg61 : wire51))))))
            begin
              reg60 <= (reg60 ?
                  ((|$unsigned($unsigned(wire45))) >> (~(^$signed(wire50)))) : wire47[(4'ha):(3'h6)]);
              reg61 <= (wire59[(2'h3):(2'h3)] != (^$signed($signed(reg60))));
              reg62 <= $signed((&$signed((-$unsigned(reg61)))));
              reg63 <= (wire54 ?
                  (wire44[(2'h3):(2'h2)] ?
                      (-((wire45 ? wire55 : wire53) ?
                          ((7'h41) ?
                              wire58 : wire44) : (wire52 >> (8'ha5)))) : ((-$unsigned(wire54)) >= ((wire56 & wire44) >= (8'ha7)))) : wire49);
              reg64 <= (~^{((wire49 < (+wire45)) == (wire57 >>> $signed(reg62)))});
            end
          else
            begin
              reg60 <= (-$unsigned(reg61[(4'he):(1'h1)]));
              reg61 <= (~&$unsigned($unsigned(wire57)));
              reg62 <= {(reg60 * (~$unsigned((wire59 & wire59)))),
                  $unsigned((({wire45} ?
                          wire55[(1'h0):(1'h0)] : (wire57 ? wire48 : (8'h9f))) ?
                      wire59[(1'h0):(1'h0)] : wire46))};
              reg63 <= $unsigned((wire49 > (|$signed((reg60 <<< wire47)))));
              reg64 <= (wire52 * $unsigned(wire46[(4'hf):(3'h7)]));
            end
          reg65 <= reg64;
          reg66 <= $signed($unsigned($signed((8'ha3))));
        end
      reg67 <= $unsigned({(^~$signed($signed(reg64))),
          $unsigned(wire50[(3'h6):(1'h1)])});
      reg68 <= (|(((~wire44[(1'h1):(1'h1)]) >>> wire48) ?
          (~&(~^reg67[(5'h12):(5'h10)])) : (($unsigned(reg67) ~^ $signed(wire59)) || wire47)));
    end
  assign wire69 = (-($signed(((wire46 ? wire44 : wire48) ?
                          $signed(wire53) : reg60)) ?
                      (reg63 ?
                          wire50 : $unsigned(wire45)) : reg61[(5'h13):(4'he)]));
  assign wire70 = wire56[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg71 <= wire53;
      reg72 <= {(|(~&wire50)), reg62};
    end
  assign wire73 = wire58[(4'h8):(3'h6)];
  assign wire74 = wire73[(2'h3):(2'h2)];
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
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
                 (1'h0)};
  assign wire16 = (~|$signed({(-$unsigned((8'ha2))), wire12}));
  assign wire17 = $signed(wire15);
  assign wire18 = wire12;
  assign wire19 = wire12[(2'h3):(1'h0)];
  assign wire20 = {wire13[(2'h3):(2'h3)]};
  assign wire21 = $unsigned(wire12);
  assign wire22 = (-$unsigned((|(-wire20))));
  always
    @(posedge clk) begin
      reg23 <= $signed(wire12);
      reg24 <= $signed((((-(^~wire22)) ?
          (~|(wire15 ?
              (8'ha0) : wire19)) : (wire12 + wire19)) > wire13[(1'h0):(1'h0)]));
      if (((~&$unsigned($unsigned((wire13 == wire12)))) * $unsigned((&((wire19 ?
          wire18 : wire20) >> $unsigned(wire17))))))
        begin
          reg25 <= (~&wire18[(4'hb):(3'h6)]);
        end
      else
        begin
          reg25 <= {$unsigned((^~reg25)), {reg23[(3'h4):(1'h1)]}};
          reg26 <= (~&wire13[(3'h5):(2'h3)]);
          if (((|wire16) ?
              (~^reg24[(3'h6):(2'h2)]) : ($unsigned((+(wire22 >> reg24))) ?
                  ($unsigned({wire20}) ?
                      $unsigned(reg23[(2'h2):(2'h2)]) : wire22) : ($signed($unsigned((8'ha5))) & ((wire13 ?
                      reg23 : wire18) * (wire20 ? wire15 : wire20))))))
            begin
              reg27 <= wire18[(4'hd):(1'h0)];
              reg28 <= wire17[(3'h5):(1'h1)];
              reg29 <= {(~(wire20 ?
                      $signed($unsigned(reg25)) : (wire16 ?
                          reg27[(1'h0):(1'h0)] : $unsigned(wire14)))),
                  wire20[(1'h0):(1'h0)]};
              reg30 <= (wire14 ^ (reg27[(2'h3):(2'h2)] ?
                  reg23 : reg27[(1'h1):(1'h1)]));
              reg31 <= (reg29[(4'hc):(3'h5)] ?
                  {$signed(((wire17 ?
                          reg30 : (8'hbb)) >= $unsigned(wire17)))} : ((wire21 - $signed(reg24[(4'hc):(1'h0)])) == ((|{reg25}) ?
                      $unsigned($unsigned(reg26)) : wire14)));
            end
          else
            begin
              reg27 <= wire12[(3'h4):(2'h3)];
              reg28 <= $signed($signed($unsigned((~^$unsigned(reg28)))));
              reg29 <= (reg27[(2'h3):(1'h1)] ?
                  (-{(8'ha4), wire15}) : ((((wire13 || wire15) && (wire21 ?
                          wire13 : reg26)) <= reg25) ?
                      ((~&wire13) <<< {(reg30 ? reg29 : reg28)}) : (8'ha6)));
            end
        end
      reg32 <= wire13[(3'h4):(1'h1)];
      reg33 <= reg26[(1'h0):(1'h0)];
    end
  assign wire34 = ({(reg31 ?
                              ((-wire17) >= wire13[(2'h2):(2'h2)]) : $unsigned($unsigned(reg31))),
                          wire17[(4'he):(1'h0)]} ?
                      (8'hab) : reg28[(4'he):(2'h3)]);
  assign wire35 = ((reg29 ? reg28[(1'h0):(1'h0)] : wire15) + (wire22 ?
                      (|reg24) : $signed($unsigned(wire22))));
  assign wire36 = (8'ha5);
endmodule

module module112  (y, clk, wire116, wire115, wire114, wire113);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire116;
  input wire signed [(3'h6):(1'h0)] wire115;
  input wire [(5'h12):(1'h0)] wire114;
  input wire signed [(4'hb):(1'h0)] wire113;
  wire signed [(5'h13):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire127;
  wire signed [(3'h6):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire121;
  wire signed [(3'h7):(1'h0)] wire120;
  wire [(4'hf):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire117;
  reg [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  assign y = {wire133,
                 wire127,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire117 = ({(~&wire113), wire114} ?
                       $signed((~&($unsigned(wire116) ^ (wire114 ?
                           wire116 : wire116)))) : (wire113[(3'h5):(2'h2)] + $signed(wire115[(1'h1):(1'h0)])));
  assign wire118 = wire115[(2'h3):(1'h1)];
  assign wire119 = $unsigned(wire115[(3'h5):(3'h5)]);
  assign wire120 = $signed(wire114);
  assign wire121 = {($signed(wire116[(3'h4):(3'h4)]) ? wire120 : wire116)};
  assign wire122 = wire114;
  always
    @(posedge clk) begin
      reg123 <= {$unsigned((!($unsigned(wire120) && (~^wire120)))),
          $unsigned((wire122 ?
              wire117[(5'h14):(3'h5)] : wire116[(2'h2):(2'h2)]))};
      reg124 <= (wire117 ?
          wire122[(1'h0):(1'h0)] : {$signed((wire119[(1'h1):(1'h0)] ^~ (!wire121)))});
    end
  always
    @(posedge clk) begin
      reg125 <= $unsigned((8'haa));
      reg126 <= wire115[(3'h5):(1'h0)];
    end
  assign wire127 = $unsigned(reg126);
  always
    @(posedge clk) begin
      reg128 <= (+{wire113,
          ($signed(wire117) ?
              (wire115[(2'h2):(2'h2)] ?
                  {reg123,
                      (7'h41)} : $signed(wire122)) : $signed($unsigned(wire119)))});
      reg129 <= ((wire117[(4'hc):(3'h4)] ?
          reg125 : ($signed(wire122) ^ (8'hba))) != ((~|$unsigned($signed((8'hbe)))) <<< (+(+$signed(wire113)))));
      reg130 <= $signed($unsigned(wire117[(2'h3):(1'h0)]));
      reg131 <= ({$signed((reg125 << reg128[(3'h6):(3'h5)]))} ?
          $unsigned((wire122 && ((~^wire122) ?
              ((8'hb7) ?
                  reg125 : wire114) : wire118))) : $unsigned($unsigned(($unsigned(wire118) ?
              (wire121 | wire118) : wire119))));
      reg132 <= ((wire120[(1'h1):(1'h1)] && (($unsigned(wire116) ?
          $signed(wire113) : (+reg126)) != $unsigned((~|wire116)))) && $signed(reg123[(1'h1):(1'h0)]));
    end
  assign wire133 = (8'hba);
endmodule
