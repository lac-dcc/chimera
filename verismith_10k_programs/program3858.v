module top
#(parameter param124 = (^~((({(8'ha5)} ? ((8'hb3) ? (8'ha3) : (8'h9d)) : ((8'h9f) ? (7'h41) : (8'h9c))) <<< ((~&(8'hbb)) ? (~&(8'hbe)) : {(8'ha7)})) & ({{(8'hb0), (8'ha4)}, ((8'hb9) <<< (7'h42))} ? {((8'hb3) ^~ (8'ha2)), (!(8'ha5))} : {(|(8'hb1))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire121;
  wire [(3'h5):(1'h0)] wire120;
  wire [(3'h7):(1'h0)] wire119;
  wire [(4'hf):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(3'h4):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire4;
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
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
                 wire102,
                 wire4,
                 (1'h0)};
  assign wire4 = (($signed($signed({wire1})) | $unsigned(wire0)) ?
                     ($unsigned((~&$signed(wire2))) ?
                         wire2 : wire0[(3'h4):(3'h4)]) : (7'h42));
  module5 #() modinst103 (.wire6(wire2), .wire8(wire4), .wire9(wire3), .clk(clk), .wire7(wire1), .y(wire102));
  assign wire104 = (&$unsigned($signed($unsigned(wire102[(1'h1):(1'h1)]))));
  assign wire105 = ($unsigned((wire4[(4'ha):(4'h8)] >> (wire3 ?
                           wire4[(4'h8):(2'h3)] : (wire102 < (8'ha1))))) ?
                       wire2[(3'h6):(1'h1)] : $signed(wire1));
  assign wire106 = $unsigned({{((+wire1) ? (-(8'hac)) : $signed(wire105)),
                           wire4[(4'ha):(1'h0)]},
                       $unsigned($signed(wire1[(5'h11):(4'h8)]))});
  assign wire107 = (|($signed($unsigned({wire1, wire105})) ?
                       $unsigned(wire2[(4'h8):(3'h6)]) : ((wire1[(2'h2):(1'h1)] ?
                           $signed(wire106) : (~wire105)) * wire4[(2'h2):(1'h1)])));
  assign wire108 = $unsigned($unsigned($signed((^~wire1))));
  assign wire109 = (+(8'hb6));
  assign wire110 = ((wire102[(4'h9):(3'h6)] ?
                       wire108[(2'h3):(1'h1)] : $unsigned(wire102[(3'h6):(2'h3)])) ^ $unsigned((8'ha1)));
  assign wire111 = $signed((~&wire110));
  assign wire112 = wire111[(3'h7):(1'h0)];
  assign wire113 = (+wire106);
  assign wire114 = ((wire107[(1'h1):(1'h1)] << wire107) ~^ wire3);
  assign wire115 = (~wire3[(5'h13):(4'hb)]);
  assign wire116 = (8'hb9);
  assign wire117 = ((wire107[(1'h0):(1'h0)] || (-(&(wire111 & wire4)))) ?
                       (~wire2[(5'h13):(4'hc)]) : (&wire106[(1'h1):(1'h1)]));
  assign wire118 = (wire116[(4'hc):(4'h8)] ? {(|wire105)} : wire4);
  assign wire119 = (({($signed(wire115) ? (7'h40) : wire113),
                               (|$unsigned(wire107))} ?
                           $signed((+(wire4 ? wire113 : wire108))) : (^wire0)) ?
                       wire111[(3'h5):(3'h4)] : $signed({wire105}));
  assign wire120 = (^~$unsigned(wire2));
  assign wire121 = wire102[(2'h2):(1'h0)];
  assign wire122 = $unsigned($unsigned($unsigned($signed(wire118))));
  assign wire123 = wire121[(2'h2):(1'h0)];
endmodule

module module5
#(parameter param100 = (7'h41), 
parameter param101 = (param100 ? (8'hae) : {({(param100 ? param100 : param100)} ? (^(param100 ? param100 : param100)) : (+(param100 && param100))), (~{(8'hb0), (param100 >>> param100)})}))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h25c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire30;
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  assign y = {wire99,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire60,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire30,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire10 = $signed($signed($unsigned(({wire8} || {wire6, wire6}))));
  assign wire11 = (wire9 ? {wire8} : wire10[(1'h0):(1'h0)]);
  assign wire12 = $unsigned((wire7[(4'hd):(1'h1)] >= (~&((wire6 | (8'hbf)) << wire7))));
  assign wire13 = {(+(^~(!(wire11 ? wire9 : wire8))))};
  assign wire14 = wire13[(4'h9):(1'h1)];
  assign wire15 = $unsigned($signed($unsigned(wire8)));
  assign wire16 = wire9[(3'h7):(2'h2)];
  module17 #() modinst31 (wire30, clk, wire16, wire15, wire8, wire12, wire11);
  module32 #() modinst61 (wire60, clk, wire14, wire30, wire15, wire9);
  always
    @(posedge clk) begin
      reg62 <= wire13[(4'ha):(4'ha)];
      reg63 <= (^(^$unsigned($signed($unsigned(wire6)))));
      reg64 <= $unsigned(wire9);
    end
  always
    @(posedge clk) begin
      reg65 <= ((8'ha2) ?
          reg63 : (^$signed((wire6 ?
              $signed(wire6) : (wire14 ? wire6 : (8'hb0))))));
      if ((reg62 ?
          (~|{reg63[(2'h2):(2'h2)],
              ((wire12 && reg63) ?
                  (reg63 ?
                      wire10 : (8'h9f)) : wire8)}) : wire12[(4'hd):(2'h2)]))
        begin
          reg66 <= {(^~(+wire8[(4'h8):(1'h1)])),
              (^(wire16[(1'h0):(1'h0)] <= $signed($unsigned(wire14))))};
          reg67 <= $signed((~&(^~($unsigned(wire8) >>> {wire12}))));
          reg68 <= {(reg67[(2'h2):(1'h0)] << (~$unsigned(wire13[(4'hc):(1'h0)]))),
              ($unsigned(((-reg62) * wire10)) <<< ((~&wire30) << {$unsigned(reg64)}))};
        end
      else
        begin
          if ($signed((+reg65[(1'h1):(1'h0)])))
            begin
              reg66 <= {$signed($signed($signed(((8'ha0) ?
                      (8'hae) : (8'ha7))))),
                  wire6};
              reg67 <= ($unsigned(((8'hbc) ?
                  wire16 : ($unsigned(wire7) ?
                      wire9[(2'h2):(1'h1)] : reg63))) > (8'hb9));
              reg68 <= (|(^wire60));
              reg69 <= $unsigned({$unsigned($unsigned({wire12})),
                  (({wire30, reg62} & {reg64}) ?
                      {reg65[(2'h3):(1'h0)]} : {wire10,
                          ((8'ha2) ? (7'h44) : wire7)})});
              reg70 <= $unsigned(reg69);
            end
          else
            begin
              reg66 <= ({$signed({$signed(reg66)})} >>> (reg63[(1'h1):(1'h0)] ?
                  $signed(wire10) : $signed({(reg70 == reg68), wire16})));
            end
          reg71 <= (!reg69[(2'h3):(2'h3)]);
          reg72 <= (^(+{wire11, (wire7[(3'h4):(1'h1)] > (wire10 ^~ (8'ha0)))}));
        end
      reg73 <= reg66;
      reg74 <= reg64;
      reg75 <= reg64;
    end
  assign wire76 = reg65;
  assign wire77 = ((($signed((reg72 ? reg66 : wire14)) != ((wire11 >> wire16) ?
                          (8'hb9) : $unsigned((7'h41)))) ?
                      $signed(((~^reg74) ?
                          $signed(wire6) : (8'h9d))) : $unsigned(reg69[(2'h3):(1'h0)])) || (wire7 > reg64[(4'h8):(1'h1)]));
  assign wire78 = $unsigned((|(8'hb8)));
  assign wire79 = ((($signed($unsigned(wire30)) ?
                              $signed($unsigned(wire8)) : $unsigned({reg69,
                                  reg74})) ?
                          wire78[(2'h3):(1'h0)] : $unsigned(wire15[(3'h4):(2'h3)])) ?
                      (&reg62[(2'h2):(1'h0)]) : ((&(~|(reg66 ?
                          wire14 : (8'ha2)))) << reg67[(3'h6):(3'h6)]));
  assign wire80 = $signed(({reg62[(3'h6):(3'h4)]} ?
                      {$signed({reg69,
                              wire10})} : $unsigned((((8'ha8) ^ (8'ha6)) ?
                          (wire10 ? wire79 : wire78) : (wire16 ~^ reg67)))));
  assign wire81 = $unsigned(($unsigned({(reg73 ? wire10 : wire79)}) ?
                      (reg70[(4'hf):(4'ha)] || ({wire12, wire10} ?
                          (~reg73) : wire30)) : ($unsigned((reg64 ?
                              reg67 : reg72)) ?
                          reg65 : wire8)));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire30[(3'h7):(2'h3)])))
        begin
          if ((($signed(($unsigned(wire15) ?
                  (^~reg62) : $unsigned(wire12))) <= reg74[(3'h6):(3'h4)]) ?
              $unsigned(reg63) : wire15))
            begin
              reg82 <= reg72[(2'h2):(1'h1)];
              reg83 <= wire10;
              reg84 <= $signed($signed((wire80 * (wire7 ?
                  wire81[(4'hc):(3'h6)] : wire30))));
              reg85 <= (8'hb2);
              reg86 <= reg67;
            end
          else
            begin
              reg82 <= $unsigned(wire9[(1'h0):(1'h0)]);
              reg83 <= reg86;
              reg84 <= reg72;
            end
        end
      else
        begin
          if ((wire6 ^~ wire9[(1'h1):(1'h1)]))
            begin
              reg82 <= ($unsigned($signed(wire30)) && (~^((((8'ha5) ?
                      wire80 : wire60) ?
                  (wire7 < wire76) : ((8'ha1) ^~ reg67)) | $signed((wire9 && (8'hbe))))));
              reg83 <= reg66;
              reg84 <= $signed(wire14[(2'h3):(1'h0)]);
              reg85 <= reg65;
              reg86 <= {$unsigned(wire8), wire6};
            end
          else
            begin
              reg82 <= reg86;
              reg83 <= {$signed((!wire79[(3'h4):(1'h0)])),
                  ($signed({$unsigned(wire16),
                      (wire78 | reg70)}) ^~ $unsigned((wire16 && $signed((8'hb5)))))};
            end
          if (((8'hb6) * $unsigned({{(8'hac), (wire11 <<< wire76)}})))
            begin
              reg87 <= $signed($signed((~|wire80)));
              reg88 <= (8'hbb);
              reg89 <= $signed(((^((reg70 ?
                      wire76 : wire7) + $signed((8'h9d)))) ?
                  $signed({((7'h43) ? wire12 : wire8)}) : $signed({{reg73}})));
            end
          else
            begin
              reg87 <= (^reg84);
              reg88 <= (~|wire60[(4'hf):(4'ha)]);
              reg89 <= $unsigned(reg66);
              reg90 <= reg63;
              reg91 <= ($unsigned(((&$signed(wire13)) ~^ $signed(reg73[(2'h3):(2'h3)]))) ?
                  $signed((!$unsigned(wire78[(4'hb):(2'h2)]))) : wire15);
            end
          reg92 <= reg71;
          reg93 <= $unsigned({reg89[(3'h5):(1'h0)]});
          reg94 <= $signed(wire8);
        end
      if (((~$unsigned(reg85)) ?
          {((~&reg91[(4'he):(4'hb)]) <<< reg67)} : {reg62[(3'h5):(3'h5)],
              $unsigned((7'h43))}))
        begin
          reg95 <= (8'ha3);
        end
      else
        begin
          reg95 <= ($unsigned($signed((+$unsigned(wire15)))) ?
              reg95 : $signed($signed(((wire12 ? wire78 : reg87) == (reg64 ?
                  reg64 : wire76)))));
          reg96 <= {$signed(reg88[(5'h12):(4'ha)]), reg95};
          reg97 <= (wire77[(1'h1):(1'h0)] ?
              (^~wire30[(3'h6):(2'h3)]) : ((^~wire7) ?
                  reg85 : (reg69[(4'hd):(4'h8)] ?
                      reg73[(4'hd):(3'h4)] : (8'hab))));
          reg98 <= ($unsigned(((wire9[(4'ha):(3'h7)] <<< $signed(reg86)) ?
              ($signed(reg87) >> $signed(wire13)) : $signed({reg68}))) || {(8'hb7),
              (-$unsigned(wire8))});
        end
    end
  assign wire99 = wire14[(3'h6):(2'h2)];
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire36;
  input wire signed [(3'h7):(1'h0)] wire35;
  input wire [(4'hc):(1'h0)] wire34;
  input wire [(5'h13):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire42,
                 wire38,
                 wire37,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire37 = (^wire36);
  assign wire38 = $unsigned({wire37[(3'h7):(1'h0)],
                      $unsigned((-(wire37 <= wire35)))});
  always
    @(posedge clk) begin
      reg39 <= wire34;
      reg40 <= $unsigned(wire36);
      reg41 <= reg40;
    end
  assign wire42 = $signed((!reg40));
  always
    @(posedge clk) begin
      if (reg41)
        begin
          reg43 <= reg39[(2'h2):(1'h0)];
          reg44 <= ($unsigned((-$unsigned((reg41 ? wire34 : wire33)))) ?
              $unsigned($unsigned(wire36[(2'h3):(2'h2)])) : (~^$signed(($unsigned(wire35) <<< wire37))));
        end
      else
        begin
          reg43 <= wire34[(2'h3):(1'h0)];
        end
      if (((($unsigned($unsigned(wire38)) ~^ $signed((wire38 ?
                  reg43 : wire37))) ?
              (wire34 != $unsigned(((7'h44) << wire33))) : (-wire33)) ?
          $signed(wire36[(1'h0):(1'h0)]) : wire34))
        begin
          reg45 <= $signed($unsigned(reg40));
          if (reg41)
            begin
              reg46 <= {reg43, (!(+(|wire34[(2'h3):(1'h0)])))};
              reg47 <= (8'ha0);
              reg48 <= (reg45 ?
                  $signed(((8'h9d) && (8'hb1))) : ((~$signed($unsigned(reg44))) ?
                      reg47 : $signed(($unsigned(wire42) >> reg46))));
              reg49 <= {(reg40 ?
                      $signed($unsigned(reg47)) : wire33[(5'h12):(3'h6)])};
              reg50 <= reg41;
            end
          else
            begin
              reg46 <= reg50[(1'h1):(1'h1)];
              reg47 <= $unsigned((~&$unsigned(($signed(wire34) ?
                  reg43 : (^reg50)))));
              reg48 <= (^~{$signed(reg44[(4'hb):(4'h9)]),
                  $unsigned(reg49[(3'h4):(2'h3)])});
              reg49 <= $unsigned((~$unsigned($unsigned((8'had)))));
              reg50 <= $signed((8'hb9));
            end
          reg51 <= (8'hb0);
        end
      else
        begin
          reg45 <= {$signed($signed(wire33[(4'hc):(1'h0)])),
              (~&$unsigned(wire37))};
          reg46 <= $unsigned((~&(wire42 < (reg39[(1'h0):(1'h0)] << ((8'hbb) && wire37)))));
          reg47 <= $unsigned(($unsigned(wire42[(1'h0):(1'h0)]) ?
              $signed(reg49) : $unsigned(wire37)));
        end
      reg52 <= ($unsigned(($unsigned(wire42) < {(8'ha4)})) | wire34[(1'h0):(1'h0)]);
    end
  assign wire53 = $signed(((&{wire38[(1'h0):(1'h0)]}) ?
                      (!($unsigned(wire37) ?
                          wire34[(4'h8):(3'h7)] : wire35[(2'h2):(1'h0)])) : (($signed(wire36) > {reg40}) < $signed(reg47))));
  assign wire54 = (|reg39);
  assign wire55 = reg49;
  assign wire56 = {{reg45}};
  assign wire57 = reg43[(1'h0):(1'h0)];
  assign wire58 = (((!(~((8'hbf) ?
                      wire33 : wire37))) != {$unsigned(reg40[(2'h2):(1'h1)])}) != $signed((8'haf)));
  assign wire59 = (8'hb9);
endmodule

module module17
#(parameter param29 = ((~((((8'h9c) ? (8'hb1) : (8'hb8)) ? (+(8'hb9)) : {(8'hb5)}) > ((^~(8'hbb)) << (&(8'hab))))) ? ({((~&(8'h9e)) > ((7'h42) ? (7'h42) : (8'hb8))), (((8'hbe) - (8'hb3)) * (8'hb6))} ? ({((7'h44) ? (8'hb9) : (8'hb2))} ? (^(!(8'hbe))) : (((8'hbf) * (8'hb3)) ? ((8'hb4) ? (8'hab) : (8'hbd)) : {(8'ha9), (8'ha2)})) : ((~(-(8'hbe))) <<< (((8'hae) * (8'hb4)) != (!(8'ha6))))) : {(({(8'h9f), (8'ha0)} + (!(8'hb4))) * (^((8'hb8) & (8'h9e)))), (|(((8'hb4) ? (8'ha9) : (8'hb1)) == {(8'hbd)}))}))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire22;
  input wire [(5'h14):(1'h0)] wire21;
  input wire signed [(2'h2):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  assign y = {wire28, wire27, wire26, wire25, wire24, wire23, (1'h0)};
  assign wire23 = $signed($signed((((~|wire22) ?
                      $signed(wire21) : $signed(wire22)) >> ({wire22} != (wire22 ?
                      wire22 : wire18)))));
  assign wire24 = wire20[(2'h2):(1'h1)];
  assign wire25 = (wire19 ?
                      $signed($unsigned((^$unsigned((8'hb8))))) : (^~wire23[(1'h0):(1'h0)]));
  assign wire26 = (~$signed((+wire21[(1'h1):(1'h1)])));
  assign wire27 = ((wire20 > wire21) > {(^((~wire25) == wire26)),
                      wire19[(4'h8):(3'h6)]});
  assign wire28 = {(&$unsigned(((wire25 ? wire25 : (8'hac)) ?
                          (~|wire26) : wire21[(4'hb):(2'h3)]))),
                      $unsigned((8'had))};
endmodule
