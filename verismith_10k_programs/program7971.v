module top
#(parameter param131 = ((!{({(8'ha6)} >>> {(8'ha4)})}) < (({(8'h9f), {(8'hbb), (8'hb4)}} ? ((!(8'haf)) || ((8'ha2) ? (8'hb9) : (8'hbe))) : ({(8'ha3)} ? ((8'had) > (8'hba)) : (~(8'ha8)))) ? {((8'ha0) ? (^~(8'hbf)) : (-(7'h44))), ({(8'hba)} ? (|(8'had)) : (~^(8'hb8)))} : (+(-((8'hae) ? (8'h9c) : (8'ha2)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire112;
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  assign y = {wire128,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire112,
                 reg130,
                 reg129,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire4 = wire1[(3'h4):(2'h3)];
  assign wire5 = (wire3[(3'h5):(1'h1)] ?
                     (-$unsigned((wire1[(2'h3):(1'h0)] ?
                         (wire2 >>> wire4) : (wire3 || (8'ha4))))) : (~&(|((8'haa) ?
                         (wire3 ? (8'h9d) : wire1) : wire1[(3'h5):(2'h2)]))));
  assign wire6 = wire4[(4'ha):(1'h0)];
  assign wire7 = $signed((7'h43));
  module8 #() modinst113 (.wire11(wire4), .wire12(wire5), .wire13(wire3), .y(wire112), .clk(clk), .wire9(wire1), .wire10(wire7));
  assign wire114 = (wire112 ~^ wire112);
  assign wire115 = wire5[(4'h9):(3'h4)];
  assign wire116 = wire1;
  assign wire117 = ($unsigned(($signed($signed(wire0)) ?
                           $unsigned(wire2[(4'he):(4'h9)]) : $unsigned(wire7))) ?
                       {wire4[(4'h8):(2'h2)],
                           $signed((8'hab))} : $unsigned(wire4[(4'he):(2'h3)]));
  always
    @(posedge clk) begin
      reg118 <= ($signed((~^$signed($signed(wire5)))) ^ ((($signed(wire2) ^~ wire1) | (wire5 ?
              (-wire1) : (~wire116))) ?
          wire2[(3'h4):(2'h3)] : $signed(($unsigned((8'hbb)) >> (8'ha0)))));
      if (wire115[(1'h1):(1'h1)])
        begin
          reg119 <= (8'hae);
          if ({($unsigned(wire115) | (^($unsigned(wire0) <= (-wire2)))),
              ($unsigned($unsigned(wire0[(1'h1):(1'h0)])) ^ $unsigned($unsigned($unsigned(wire2))))})
            begin
              reg120 <= wire0[(3'h4):(2'h2)];
            end
          else
            begin
              reg120 <= (reg120[(4'hc):(4'h8)] >= wire3[(1'h0):(1'h0)]);
              reg121 <= wire0;
              reg122 <= $unsigned(($signed((-wire4[(3'h5):(3'h5)])) & wire1));
              reg123 <= $signed(wire3);
            end
          reg124 <= (({wire4} * $unsigned($signed(wire117[(5'h12):(5'h12)]))) * reg120[(4'hc):(4'hc)]);
          reg125 <= wire5;
        end
      else
        begin
          reg119 <= $signed(((!(~^reg122)) & $signed(((wire115 >>> wire4) >= $unsigned(wire115)))));
          reg120 <= (!($unsigned(((wire6 ?
                  wire116 : reg125) ^ (reg125 * reg120))) ?
              (~&(reg124[(4'h8):(3'h7)] ?
                  {(8'ha8)} : $signed(reg120))) : $signed((^~$signed(wire0)))));
          if ((~|($signed($signed(reg119)) >>> ($signed($unsigned(wire3)) & $unsigned((reg122 ^ reg118))))))
            begin
              reg121 <= $signed(reg119[(1'h1):(1'h1)]);
              reg122 <= reg119[(2'h2):(1'h1)];
              reg123 <= {{(($unsigned(reg118) <<< {reg119}) ?
                          $signed($signed(reg123)) : ((reg120 < reg120) ?
                              $unsigned(wire3) : (8'ha8)))},
                  {reg118[(2'h3):(1'h0)]}};
            end
          else
            begin
              reg121 <= (reg124[(2'h2):(1'h1)] && reg124[(4'h9):(3'h7)]);
              reg122 <= wire6[(3'h4):(2'h3)];
              reg123 <= ((8'ha6) && ((~&wire1) ?
                  (^$unsigned(wire5)) : (8'hb6)));
              reg124 <= $signed((^~$signed(wire7)));
              reg125 <= $signed(wire117);
            end
          reg126 <= (reg125[(1'h1):(1'h0)] ?
              ($unsigned(wire0) ?
                  $unsigned($unsigned(wire1[(2'h2):(2'h2)])) : $unsigned($unsigned((wire6 ?
                      (8'hb2) : (8'had))))) : ((8'hb1) ?
                  wire5[(5'h13):(5'h10)] : (wire7[(3'h4):(2'h2)] ?
                      (~|$unsigned((8'hb1))) : reg125[(2'h2):(2'h2)])));
          reg127 <= ({(!reg120), wire112[(2'h2):(2'h2)]} ?
              ($unsigned($unsigned((reg119 ? reg119 : reg120))) ~^ ((8'hab) ?
                  $signed($unsigned(wire114)) : {reg122})) : ($unsigned((wire5[(3'h6):(2'h3)] || (wire6 ~^ wire5))) != ($unsigned(((8'hbc) ?
                  wire6 : reg118)) > $unsigned((wire5 << wire114)))));
        end
    end
  assign wire128 = ((^$unsigned(reg121)) ~^ reg118);
  always
    @(posedge clk) begin
      reg129 <= $signed(($signed({(~^wire1)}) ?
          reg123[(1'h0):(1'h0)] : ($signed((^~reg123)) <= $unsigned((8'hbf)))));
      reg130 <= $signed($signed((wire6 ^~ ($unsigned(reg121) ?
          $signed(wire1) : wire0))));
    end
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h1e9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire100,
                 wire75,
                 wire70,
                 wire43,
                 wire42,
                 wire37,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg74,
                 reg73,
                 reg72,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  assign wire14 = (+{(~^wire11[(1'h1):(1'h0)])});
  assign wire15 = ($signed(($unsigned((wire13 ? wire12 : (8'had))) ?
                      (~^wire10[(1'h0):(1'h0)]) : (&(^wire9)))) & $signed((|$signed(wire11[(1'h1):(1'h1)]))));
  assign wire16 = wire9;
  assign wire17 = (-wire9[(3'h4):(1'h1)]);
  module18 #() modinst38 (wire37, clk, wire16, wire10, wire14, wire9);
  always
    @(posedge clk) begin
      reg39 <= $unsigned((^($unsigned(wire37) && (!wire37))));
      reg40 <= (&(~&{((wire13 ? wire11 : (8'hb5)) || $unsigned((8'hbd))),
          $signed((wire16 ? wire37 : wire11))}));
      reg41 <= {reg40, (|$signed($signed(((8'hb3) << wire10))))};
    end
  assign wire42 = (+wire16[(3'h7):(1'h1)]);
  assign wire43 = $unsigned($unsigned({reg40[(1'h1):(1'h1)],
                      reg41[(1'h1):(1'h1)]}));
  module44 #() modinst71 (wire70, clk, wire10, wire16, wire14, reg40, wire42);
  always
    @(posedge clk) begin
      reg72 <= (8'haa);
      reg73 <= wire9[(3'h7):(3'h4)];
      reg74 <= (reg40 ?
          (|(((wire16 ? wire37 : reg41) ?
              wire12[(2'h3):(2'h2)] : wire15) >> wire14)) : $unsigned(((wire12 || (!reg41)) ?
              reg39 : reg41[(3'h4):(2'h2)])));
    end
  assign wire75 = $unsigned((wire16[(4'hb):(3'h4)] ?
                      wire17 : ((((8'ha0) + reg39) ?
                          reg72[(1'h1):(1'h1)] : (~&wire43)) * ($signed((8'hb8)) ~^ (wire70 ?
                          wire9 : (7'h44))))));
  always
    @(posedge clk) begin
      if ((^~{wire43, $unsigned(wire13[(2'h2):(1'h1)])}))
        begin
          reg76 <= (^wire9[(3'h6):(1'h1)]);
        end
      else
        begin
          reg76 <= {((wire37 > (+wire15)) + wire43),
              $signed(($unsigned(reg76) ?
                  reg73 : (reg72 ? $signed((8'hbb)) : (^~wire75))))};
        end
      if (reg72[(3'h4):(2'h2)])
        begin
          reg77 <= $signed(wire42[(4'hd):(4'h8)]);
          reg78 <= (8'ha7);
          reg79 <= $signed((8'hbe));
        end
      else
        begin
          reg77 <= wire16[(2'h2):(1'h1)];
          if (reg79[(1'h0):(1'h0)])
            begin
              reg78 <= ($signed($signed(reg41[(2'h3):(1'h1)])) ?
                  (-wire10) : ((~|reg76[(2'h3):(1'h1)]) && {({wire16} ?
                          (wire11 ? reg74 : (8'hba)) : reg77[(4'ha):(1'h1)])}));
              reg79 <= wire16;
              reg80 <= ((!{$signed((wire13 ? (8'h9f) : wire42))}) ?
                  $signed(((~^(wire10 < reg39)) - wire10[(3'h5):(1'h1)])) : $unsigned((^$signed($signed(wire15)))));
              reg81 <= $signed((($signed(reg78[(3'h6):(3'h6)]) ?
                      wire11 : {$unsigned(wire12), (reg41 ? reg41 : wire9)}) ?
                  $unsigned(wire11) : (&reg77)));
              reg82 <= $signed((|wire16));
            end
          else
            begin
              reg78 <= (~^$unsigned((~((!reg74) ?
                  reg74[(4'he):(3'h4)] : {reg78, reg82}))));
              reg79 <= {wire9[(4'hd):(4'ha)]};
              reg80 <= (~|reg39);
              reg81 <= $signed(reg82);
              reg82 <= $unsigned($unsigned(reg77));
            end
          reg83 <= (^~reg77[(4'h8):(2'h3)]);
          reg84 <= $unsigned(reg39);
          if (wire37)
            begin
              reg85 <= (8'ha0);
              reg86 <= (reg80 ?
                  $signed(reg83[(2'h3):(1'h0)]) : $signed(wire43));
            end
          else
            begin
              reg85 <= $unsigned(((^~reg72) ?
                  (~$signed((~&(7'h41)))) : {wire10[(4'h8):(1'h1)]}));
            end
        end
      reg87 <= (8'ha7);
    end
  module88 #() modinst101 (.wire90(reg84), .wire89(wire15), .y(wire100), .wire92(wire75), .wire91(reg83), .clk(clk));
  always
    @(posedge clk) begin
      if ((-$unsigned(reg40)))
        begin
          reg102 <= $signed(reg83[(2'h2):(1'h1)]);
          reg103 <= (!$signed((reg85[(4'hb):(2'h3)] & reg78[(2'h3):(2'h3)])));
          reg104 <= $unsigned($unsigned({(~|$unsigned(reg40))}));
        end
      else
        begin
          reg102 <= reg79;
          reg103 <= reg84;
          reg104 <= $signed(({$signed((8'hbe)), (&wire9[(2'h3):(1'h0)])} ?
              $signed((!$signed((8'h9e)))) : (reg87[(4'he):(4'ha)] ?
                  $signed(reg84[(4'h8):(3'h5)]) : ($unsigned(wire37) != wire9))));
          reg105 <= (wire10 && ((((wire100 ?
                      reg87 : reg86) >>> $unsigned(reg78)) ?
                  wire42 : $signed(wire15)) ?
              wire9 : $signed($signed($signed(reg74)))));
          reg106 <= reg80;
        end
      reg107 <= $signed((!(reg77[(3'h7):(3'h7)] >= $signed(((8'hac) >>> wire100)))));
      reg108 <= (~&reg86);
      reg109 <= ((((^~(^~wire11)) == ({wire12} & wire37[(2'h2):(2'h2)])) & reg72) >> wire11[(3'h5):(2'h3)]);
    end
  assign wire110 = wire13;
  assign wire111 = wire15[(2'h3):(1'h0)];
endmodule

module module88  (y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire92;
  input wire [(2'h2):(1'h0)] wire91;
  input wire [(3'h7):(1'h0)] wire90;
  input wire [(2'h2):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire93;
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  assign y = {wire99, wire95, wire94, wire93, reg98, reg97, reg96, (1'h0)};
  assign wire93 = (wire91[(1'h0):(1'h0)] ?
                      wire90 : $signed($signed(((-wire89) >> (wire90 ?
                          (8'ha2) : (8'h9d))))));
  assign wire94 = $unsigned(($unsigned(wire93[(3'h4):(1'h0)]) ?
                      {(wire89[(2'h2):(1'h0)] >>> $signed(wire93)),
                          wire93} : $unsigned(((wire92 == (8'haf)) * wire93))));
  assign wire95 = ({$unsigned(wire92),
                          {$signed(wire90[(3'h5):(1'h0)]),
                              $unsigned((wire91 ? (7'h40) : wire94))}} ?
                      wire94[(4'hc):(4'hc)] : wire89[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg96 <= (!$signed($signed((^~$signed(wire95)))));
      reg97 <= wire89[(1'h1):(1'h1)];
      reg98 <= ({$unsigned(wire89[(1'h1):(1'h1)]), wire92} ?
          {(((reg96 | reg97) && wire94) ?
                  $unsigned($signed(wire91)) : $unsigned((wire95 ?
                      wire93 : wire90))),
              reg97} : $unsigned(((~|{(8'hb6)}) ?
              ({wire93,
                  (8'ha6)} <= $unsigned(wire95)) : wire94[(4'ha):(4'h8)])));
    end
  assign wire99 = wire89[(2'h2):(1'h1)];
endmodule

module module44
#(parameter param68 = (({(((8'hbf) ? (8'hae) : (8'hb3)) ? ((7'h40) ? (8'ha1) : (8'ha5)) : ((7'h44) ? (8'hae) : (8'h9c)))} >> (~(^{(8'hae), (8'hbc)}))) << ((~&{((8'ha3) | (8'hb1)), ((8'hbf) <= (8'hb3))}) | ({((7'h41) ? (8'hb1) : (8'ha0)), (!(8'hae))} >> (~{(8'h9e)})))), 
parameter param69 = param68)
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire49;
  input wire [(3'h5):(1'h0)] wire48;
  input wire [(3'h5):(1'h0)] wire47;
  input wire signed [(4'hf):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire signed [(4'ha):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire51,
                 wire50,
                 reg67,
                 reg66,
                 reg65,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire50 = ($signed(wire45[(3'h7):(3'h5)]) ?
                      (&$unsigned(wire48)) : {wire46});
  assign wire51 = wire45;
  always
    @(posedge clk) begin
      reg52 <= ({$signed(($signed((7'h42)) >>> $signed(wire46))), wire50} ?
          (~^$unsigned($unsigned($signed(wire51)))) : wire48[(3'h5):(3'h5)]);
      reg53 <= (($signed($unsigned((wire49 ^ wire48))) && (|{wire47[(2'h3):(2'h2)],
          wire51[(3'h5):(1'h1)]})) + $signed(wire47));
      reg54 <= wire50[(3'h6):(2'h3)];
      reg55 <= reg52[(2'h2):(1'h1)];
    end
  assign wire56 = ($signed(reg53[(3'h7):(1'h0)]) ?
                      $unsigned(($unsigned((7'h41)) ?
                          reg54[(1'h0):(1'h0)] : ({(8'hae)} ^ wire48[(1'h1):(1'h0)]))) : {wire48[(1'h1):(1'h1)],
                          ((^~$signed(reg53)) < $unsigned($signed(wire51)))});
  assign wire57 = $unsigned(((^~$unsigned({reg55, (8'ha8)})) > (!(&reg54))));
  assign wire58 = ((-((((8'hbf) ?
                          (8'h9d) : reg52) + $signed(wire46)) < {$signed(wire48)})) ?
                      wire46 : (8'h9d));
  assign wire59 = ((8'hb7) || ((reg53[(3'h4):(1'h0)] ?
                          (|$signed(wire49)) : {((7'h43) ? wire47 : reg54),
                              wire50}) ?
                      $signed(wire48) : wire57));
  assign wire60 = (~wire58);
  assign wire61 = ($unsigned(($unsigned((~reg55)) * $unsigned(wire49))) <= {(($unsigned(wire50) || wire49) ?
                          $signed((wire51 ?
                              wire49 : wire57)) : (reg54[(4'he):(4'h8)] - wire51[(2'h3):(1'h1)])),
                      (reg52 ? ({wire60} & wire56[(4'hd):(4'ha)]) : wire60)});
  assign wire62 = reg54;
  assign wire63 = reg52[(2'h3):(1'h1)];
  assign wire64 = $signed($unsigned({(8'hb0)}));
  always
    @(posedge clk) begin
      reg65 <= (-$unsigned($signed((~^(wire46 ? wire50 : wire56)))));
      reg66 <= {$signed(wire49)};
      reg67 <= (~|(~&($signed(wire45) ?
          $signed(((8'had) - (8'hb4))) : ($signed(wire59) ?
              (wire58 ? wire63 : (7'h41)) : wire63))));
    end
endmodule

module module18
#(parameter param35 = {((8'h9f) >= ((((8'hab) ? (8'hb4) : (8'h9d)) < {(8'haa), (8'ha6)}) >= {((8'hb5) - (8'hb1))})), (7'h44)}, 
parameter param36 = (((~|param35) ? param35 : (((~|param35) ? param35 : (+(8'h9d))) ? (~|param35) : (|(param35 - param35)))) ~^ param35))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire22;
  input wire [(4'h9):(1'h0)] wire21;
  input wire [(2'h3):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire28,
                 wire27,
                 wire24,
                 wire23,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire23 = $unsigned($unsigned(({{(8'hae), (8'hb0)},
                      $unsigned(wire21)} * ({wire22, wire19} >> {wire19,
                      wire20}))));
  assign wire24 = ((!{(!wire23)}) ?
                      (($signed((!wire21)) ?
                          wire19 : ((wire21 ? wire20 : wire20) ?
                              (wire22 ?
                                  wire22 : (8'ha1)) : $signed(wire20))) >>> (wire23 && (^$unsigned(wire19)))) : ($unsigned(((wire19 ?
                              wire20 : wire22) ^~ (~&wire21))) ?
                          (~|$signed($signed(wire19))) : wire22));
  always
    @(posedge clk) begin
      reg25 <= {($signed({{wire19, wire24}, $signed(wire19)}) ?
              (8'hbb) : wire24[(4'ha):(4'h9)]),
          wire21[(1'h1):(1'h1)]};
      reg26 <= (^$signed((-$unsigned(((8'had) || wire22)))));
    end
  assign wire27 = ((+(wire19 << wire22)) ?
                      $unsigned(((^wire19) ?
                          wire24[(3'h7):(3'h5)] : reg26[(1'h1):(1'h1)])) : (wire22[(4'h8):(1'h0)] >>> ((reg25 ?
                          (^(8'hae)) : (8'hb5)) < ((~|wire20) > wire23))));
  assign wire28 = ((!(((~wire20) <<< (wire27 && wire27)) ?
                      $unsigned(wire27) : wire20)) >= $signed(wire23));
  always
    @(posedge clk) begin
      reg29 <= ($signed({wire22[(2'h3):(2'h2)]}) ?
          $unsigned((!(wire23 ^~ $unsigned(reg26)))) : (8'hae));
      reg30 <= {$unsigned($signed($unsigned(wire28[(4'h9):(1'h0)])))};
    end
  assign wire31 = (wire20 | (($unsigned((wire22 ? wire21 : reg30)) ?
                          $unsigned((reg25 ~^ reg25)) : $unsigned((reg26 ?
                              reg29 : wire22))) ?
                      ((~|$signed((8'ha9))) ^ reg26[(3'h5):(3'h4)]) : (8'ha9)));
  assign wire32 = $unsigned(reg29[(5'h12):(3'h5)]);
  assign wire33 = ((wire22 ?
                          (wire21 ?
                              (((8'hbd) != wire19) & $signed((8'hab))) : reg29[(4'ha):(2'h3)]) : wire21) ?
                      (wire27[(4'hd):(1'h1)] ?
                          (~&((^~wire23) ?
                              (wire28 ? wire20 : reg30) : (wire22 ?
                                  wire22 : wire24))) : wire31[(5'h14):(5'h10)]) : wire21[(3'h4):(2'h3)]);
  assign wire34 = wire31[(4'hf):(4'h9)];
endmodule
