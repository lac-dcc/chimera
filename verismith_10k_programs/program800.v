module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(4'hb):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire116;
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire128,
                 wire127,
                 wire126,
                 wire4,
                 wire8,
                 wire9,
                 wire10,
                 wire116,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg5,
                 reg6,
                 reg7,
                 (1'h0)};
  assign wire4 = (($signed($signed((wire0 < wire0))) > wire0) ?
                     $signed($unsigned($unsigned($unsigned(wire0)))) : $unsigned($signed((wire1[(3'h5):(2'h2)] ?
                         wire0 : wire3[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg5 <= (~$signed(((wire3 << $unsigned(wire3)) << $signed(wire0[(3'h6):(2'h2)]))));
      reg6 <= wire4[(1'h0):(1'h0)];
      reg7 <= ((($unsigned(wire4[(4'h8):(1'h1)]) ?
                  (~|$signed(wire1)) : ((~^wire3) - $signed(reg5))) ?
              $unsigned($unsigned(reg5[(5'h10):(4'hd)])) : wire2[(5'h12):(5'h12)]) ?
          ((($signed((8'hbf)) & reg6) ?
              wire1[(4'ha):(3'h5)] : (~^wire1[(4'h8):(1'h0)])) < reg5) : $unsigned($signed((^~(wire0 ?
              wire4 : reg5)))));
    end
  assign wire8 = wire0[(4'h9):(2'h2)];
  assign wire9 = $signed($unsigned($signed({(wire8 - reg5)})));
  assign wire10 = ((~|wire4) ?
                      reg7[(5'h14):(4'h8)] : $unsigned(wire8[(5'h10):(3'h6)]));
  module11 #() modinst117 (wire116, clk, wire0, wire1, wire9, reg5);
  always
    @(posedge clk) begin
      if (wire1[(4'hb):(2'h2)])
        begin
          reg118 <= {wire9, (8'hb5)};
          reg119 <= $signed({wire8, reg6});
        end
      else
        begin
          reg118 <= reg6;
        end
      if ($unsigned((wire10 <= wire4[(2'h2):(1'h0)])))
        begin
          reg120 <= (reg7[(4'hd):(2'h3)] - wire1);
          reg121 <= $signed($unsigned(((^(|(8'hac))) == wire10[(3'h7):(3'h4)])));
          reg122 <= $signed($signed(((~reg5[(4'hd):(3'h4)]) > {wire9[(2'h3):(2'h3)]})));
          reg123 <= (((((~reg7) ? $unsigned(wire9) : reg5) ?
                  reg120 : $unsigned((-(8'h9d)))) > wire116) ?
              (-(-$signed(reg5))) : $signed(($signed((^wire0)) ?
                  $signed($unsigned((8'had))) : reg6[(1'h0):(1'h0)])));
        end
      else
        begin
          reg120 <= {reg119, $signed($signed(wire8))};
        end
      reg124 <= $signed({$unsigned(wire2)});
      reg125 <= wire9;
    end
  assign wire126 = $signed(($unsigned(wire1[(3'h5):(3'h4)]) != (|$unsigned($unsigned(wire3)))));
  assign wire127 = (reg123 ?
                       $unsigned($signed(reg125[(2'h3):(1'h1)])) : {(wire8[(3'h5):(1'h0)] ?
                               (~&{wire2}) : ((~wire2) >= $signed(reg121)))});
  assign wire128 = $unsigned($unsigned(((+wire116[(2'h2):(1'h0)]) ~^ reg7[(4'hc):(3'h6)])));
  always
    @(posedge clk) begin
      reg129 <= $unsigned(wire2[(1'h0):(1'h0)]);
      reg130 <= (wire0[(4'hc):(4'h9)] ?
          ($unsigned({wire2[(3'h5):(3'h5)]}) >>> wire8) : $unsigned($signed(($unsigned(wire2) ?
              $signed(wire126) : reg7))));
      reg131 <= $unsigned(($unsigned($unsigned((-reg118))) ?
          ({(reg122 & wire0)} ?
              {$signed(reg119)} : {{reg122, reg7}}) : $unsigned(reg129)));
      reg132 <= ($unsigned($unsigned((|(reg124 ? wire1 : reg5)))) ?
          wire128[(5'h10):(4'h8)] : (8'hb3));
    end
  always
    @(posedge clk) begin
      reg133 <= (~^(reg7[(1'h1):(1'h1)] ?
          (^~{$signed(wire3)}) : (wire10 ?
              (reg130 | reg122[(4'hf):(1'h0)]) : {(reg118 >>> (8'hbb)),
                  $signed(reg122)})));
    end
  assign wire134 = reg132[(1'h0):(1'h0)];
  assign wire135 = $signed(($unsigned(((reg6 ?
                       reg119 : wire1) < $unsigned((8'haa)))) <= (^{$signed(wire0),
                       wire2[(5'h12):(4'hf)]})));
endmodule

module module11
#(parameter param115 = ({{({(8'ha7)} ? ((8'hac) - (7'h42)) : (|(7'h41))), (((8'ha5) ? (8'hbd) : (8'hb6)) ? ((8'ha3) ? (8'hbb) : (8'hb0)) : ((8'hb7) >> (7'h42)))}, ((^{(8'ha8)}) ? ({(8'hbd), (8'hb4)} ~^ (!(8'ha6))) : ((&(8'ha2)) ? {(8'hb1)} : ((8'ha1) & (8'haa))))} ? (~|(((|(8'hb1)) ? ((8'hb1) ? (8'h9f) : (8'ha8)) : {(8'h9d)}) ? (((7'h41) ? (7'h44) : (8'hb5)) ? ((8'hac) ? (8'ha4) : (8'hbd)) : {(8'ha1)}) : (((8'ha9) ? (8'h9c) : (8'h9f)) ? ((8'hbd) | (8'ha5)) : ((8'hb2) & (8'hb4))))) : (^{((&(8'ha6)) ? {(8'hb6)} : ((8'hbe) & (8'ha5)))})))
(y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire111;
  wire signed [(4'hf):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire38;
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire111,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire38,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire16 = (^wire15);
  assign wire17 = ((wire14[(1'h0):(1'h0)] ^ ((8'hba) ^~ wire14[(1'h1):(1'h0)])) ?
                      ({(~^(wire14 ? wire16 : wire15))} ?
                          ($unsigned(((8'hae) ? (8'hb8) : wire13)) ?
                              wire15[(2'h3):(1'h0)] : $unsigned(wire14)) : (wire12[(1'h1):(1'h0)] ?
                              ((wire14 ?
                                  wire15 : wire12) + wire15) : {$unsigned(wire16)})) : (wire13 ?
                          wire14 : $unsigned(($signed((8'h9c)) ^ {wire13}))));
  assign wire18 = (((8'hba) ?
                          ((~|(wire15 | wire13)) ^ wire12) : $signed(wire12)) ?
                      ((((+(7'h44)) ? wire15[(3'h4):(2'h3)] : (|(8'hb8))) ?
                          (|wire15) : (wire13 ?
                              $signed(wire12) : (-wire15))) << wire13[(1'h1):(1'h1)]) : wire17[(4'h9):(3'h5)]);
  assign wire19 = wire14[(1'h1):(1'h1)];
  assign wire20 = (8'h9f);
  assign wire21 = {(8'h9e)};
  assign wire22 = ({$unsigned({(8'hba), $signed((8'had))}),
                      $signed({(wire17 ^~ wire18),
                          (wire14 ? wire17 : wire14)})} <<< wire20);
  always
    @(posedge clk) begin
      reg23 <= $signed(((({wire12, wire19} | (wire14 ?
              wire21 : wire19)) ^~ (~&(wire17 * wire15))) ?
          $unsigned($signed($signed(wire19))) : {(wire21 && ((8'ha3) ^ (8'ha0)))}));
      reg24 <= wire14;
      reg25 <= wire17;
    end
  module26 #() modinst39 (.wire29(reg24), .y(wire38), .wire28(wire12), .wire30(wire22), .wire27(wire15), .clk(clk));
  assign wire40 = (^~(~&$unsigned(reg23)));
  assign wire41 = $signed((wire18[(4'h9):(1'h0)] ?
                      (({reg25, wire14} ?
                          $signed(wire22) : reg25[(1'h0):(1'h0)]) - reg23) : wire18[(5'h11):(3'h7)]));
  assign wire42 = ((^~(($signed(wire16) - (wire12 & wire17)) ?
                          (wire17[(2'h2):(2'h2)] != $signed(wire38)) : (~|$unsigned(wire14)))) ?
                      (8'ha2) : $signed(wire22[(5'h10):(3'h5)]));
  assign wire43 = $unsigned($unsigned((^(^(wire21 == wire14)))));
  module44 #() modinst112 (.wire47(wire43), .wire48(reg25), .y(wire111), .wire46(wire12), .wire45(wire41), .clk(clk), .wire49(wire40));
  assign wire113 = (({$signed(wire111)} ?
                       $signed(wire14[(2'h2):(1'h1)]) : wire40[(3'h5):(3'h5)]) || $unsigned($signed((wire38[(1'h0):(1'h0)] ?
                       {reg23, wire14} : (wire41 ^ (8'h9d))))));
  assign wire114 = $unsigned((!$unsigned(((8'hbd) >>> wire42))));
endmodule

module module44
#(parameter param109 = (!(|({((8'haa) ? (8'hb6) : (8'hac)), (+(8'hb6))} | {(|(7'h43))}))), 
parameter param110 = (param109 ? (-param109) : {{((param109 ? param109 : param109) ? (param109 ? param109 : param109) : (|param109)), (^~param109)}}))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h29a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire49;
  input wire signed [(4'hb):(1'h0)] wire48;
  input wire [(4'hf):(1'h0)] wire47;
  input wire [(4'he):(1'h0)] wire46;
  input wire [(5'h11):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire50;
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire92,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire50,
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
                 reg91,
                 reg90,
                 reg89,
                 reg88,
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
                 reg64,
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
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire50 = wire46[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg51 <= wire47;
      reg52 <= {$signed(($unsigned(((8'ha0) ?
              wire46 : wire50)) ^~ $signed($signed(wire45)))),
          reg51[(3'h6):(3'h5)]};
    end
  always
    @(posedge clk) begin
      reg53 <= ((reg51 | wire45[(5'h11):(5'h11)]) ?
          $signed((8'had)) : {$unsigned(wire47[(4'hc):(4'hb)])});
      reg54 <= wire49;
      reg55 <= (($unsigned($unsigned((~&reg54))) != wire45[(2'h2):(2'h2)]) ?
          $signed((&(-reg51))) : (^(($signed(wire47) == (reg54 - reg52)) ?
              wire47[(4'hb):(4'h8)] : ((&reg53) ? wire48 : $signed(wire49)))));
      reg56 <= (~&reg52[(5'h12):(4'hf)]);
    end
  always
    @(posedge clk) begin
      reg57 <= {$signed(((wire46[(4'hd):(4'h8)] & reg55[(2'h2):(2'h2)]) ?
              reg52 : $signed((^~wire46))))};
      if ({(((|{reg57}) && ($unsigned(wire50) ?
              reg56 : reg57)) >> (^~((!reg56) ^ (reg56 <<< reg53)))),
          ($signed($signed($signed(reg54))) ?
              $signed((^~wire49)) : $unsigned({$unsigned(wire50)}))})
        begin
          reg58 <= {reg54, $unsigned((~^$signed((wire49 ? wire49 : reg53))))};
          reg59 <= reg56;
          reg60 <= (wire48 ?
              $signed($signed(($unsigned((8'hba)) ?
                  (~|reg51) : $unsigned(wire48)))) : {$signed($signed((wire47 <= reg59))),
                  {(((8'hb7) > reg54) ? reg51[(1'h0):(1'h0)] : $signed(reg54)),
                      ((reg53 ? reg59 : (8'ha0)) >>> wire49)}});
          reg61 <= $signed({(reg58 * ((+reg53) && $signed(reg58)))});
        end
      else
        begin
          reg58 <= (|(8'hac));
          if (($unsigned($unsigned($signed((~^reg56)))) ?
              $unsigned((($unsigned(reg60) <<< (reg59 >= reg54)) ?
                  $unsigned((~wire47)) : ($unsigned(reg58) | reg60[(3'h4):(2'h2)]))) : reg53[(3'h4):(1'h1)]))
            begin
              reg59 <= {reg55[(3'h5):(3'h5)], $signed(reg52[(5'h10):(4'hc)])};
              reg60 <= reg53;
              reg61 <= $unsigned((wire45[(4'h9):(1'h0)] == $unsigned((~|((8'ha6) >= (8'ha0))))));
              reg62 <= {(((reg59[(4'h8):(3'h7)] ?
                          (reg58 <<< wire50) : (~reg52)) ?
                      $signed((reg61 ?
                          wire49 : wire47)) : (reg54 >= (reg58 >> (8'ha5)))) << wire46),
                  ((|$signed((wire50 <<< wire50))) ?
                      $unsigned((reg56 ?
                          reg57 : (reg51 & (8'hbc)))) : reg60[(2'h2):(1'h1)])};
              reg63 <= (reg59[(4'h8):(3'h4)] ?
                  ($signed({(+reg57)}) | $unsigned(reg52[(5'h10):(3'h5)])) : (&$signed(wire46)));
            end
          else
            begin
              reg59 <= {(~wire50[(3'h5):(1'h1)])};
              reg60 <= (wire47[(4'hf):(3'h6)] <= reg61);
            end
          reg64 <= ((~((~&{reg54,
              reg59}) != (^~reg62[(3'h4):(1'h0)]))) > ($unsigned(wire45) * ($signed({wire49}) && $signed(reg53[(3'h4):(1'h0)]))));
        end
      if ({(8'had)})
        begin
          reg65 <= $unsigned(reg53);
          if (reg59)
            begin
              reg66 <= $signed($signed((~&(-(reg52 ? reg55 : reg58)))));
              reg67 <= (wire47[(3'h4):(1'h1)] ?
                  ((($unsigned(reg66) > $signed(reg52)) ?
                      (|$unsigned((7'h43))) : $signed(wire49[(4'ha):(4'ha)])) | (^~$unsigned(reg66[(2'h3):(2'h2)]))) : {((^~(8'had)) ?
                          (-(-reg52)) : reg54[(2'h2):(2'h2)])});
              reg68 <= $unsigned({$signed($signed({reg59, reg65})), (8'ha3)});
              reg69 <= reg61;
            end
          else
            begin
              reg66 <= reg68[(3'h6):(3'h4)];
              reg67 <= (wire48[(2'h2):(2'h2)] >>> ((({reg64, reg58} ?
                          (reg62 ? reg61 : reg64) : $signed(reg55)) ?
                      $signed($signed(reg65)) : wire48) ?
                  (((reg56 >> reg66) > ((8'ha6) ?
                      wire46 : (7'h40))) <= ({(8'hbb)} >>> {reg65,
                      wire50})) : reg54));
              reg68 <= $unsigned($signed($signed((^wire50))));
              reg69 <= wire48;
              reg70 <= reg55[(3'h5):(2'h3)];
            end
          if ($signed($signed((~reg53))))
            begin
              reg71 <= $unsigned(reg67);
            end
          else
            begin
              reg71 <= $unsigned(reg67[(2'h2):(1'h1)]);
              reg72 <= (((~^{reg68[(4'hc):(4'h9)]}) >> $unsigned({reg55[(4'hc):(4'h8)],
                      {(8'hab), wire50}})) ?
                  ((~&(-{reg60, reg59})) ?
                      wire45 : (~({reg68} ~^ (~|(8'hb1))))) : reg56);
              reg73 <= $unsigned((~^(((reg66 <<< reg64) == (^(8'h9d))) >= ((reg53 ^~ wire46) + (^reg53)))));
            end
          reg74 <= $signed(((~|reg65) ? reg53 : (~|(^~(^reg51)))));
        end
      else
        begin
          if (reg60)
            begin
              reg65 <= (^~($signed($unsigned((reg64 + reg59))) ?
                  $unsigned(((reg61 <= (8'hb5)) >> $unsigned(wire46))) : $unsigned($signed(reg59))));
              reg66 <= (8'h9f);
              reg67 <= (&$unsigned($unsigned((-$signed(reg69)))));
              reg68 <= ($unsigned((reg70 ?
                      (~|$unsigned(reg61)) : {reg61[(2'h3):(1'h1)],
                          $unsigned(reg65)})) ?
                  $unsigned((($signed(reg52) && $unsigned(reg61)) ?
                      reg60 : $signed((|reg73)))) : (reg61[(2'h3):(2'h2)] >>> reg62));
            end
          else
            begin
              reg65 <= $signed({$signed(wire49[(4'hd):(2'h3)])});
              reg66 <= ((reg72[(2'h3):(2'h2)] ?
                      (wire47[(2'h3):(2'h2)] != (~(+reg71))) : (~|(~reg60))) ?
                  (~(~&reg65)) : $unsigned(wire49[(2'h2):(2'h2)]));
              reg67 <= $unsigned($signed({reg56, reg69}));
              reg68 <= wire49[(3'h4):(2'h2)];
              reg69 <= reg71;
            end
        end
      if (reg59)
        begin
          reg75 <= {(^((8'h9c) < reg55))};
          reg76 <= (reg63 >> {{((-reg56) ~^ $signed(reg51))},
              (reg70[(4'h9):(2'h2)] ? (!$signed(reg64)) : wire46)});
        end
      else
        begin
          reg75 <= ($unsigned(($unsigned({wire49, reg66}) != (reg65 >>> (reg52 ?
                  reg70 : wire49)))) ?
              $signed((reg66[(2'h3):(1'h1)] ?
                  $unsigned($unsigned((8'haf))) : $signed($signed(reg55)))) : $signed($unsigned($unsigned((!reg60)))));
          reg76 <= $signed($signed($signed((8'ha1))));
          reg77 <= $unsigned(reg60);
        end
      reg78 <= ((~|(-((wire45 ?
          reg51 : reg53) | $signed(reg73)))) && $unsigned({((reg69 | reg71) || (+reg54)),
          $signed($unsigned(reg51))}));
    end
  assign wire79 = {$signed((((reg65 ? reg65 : reg73) != {reg60}) ?
                          ((|reg64) >= (^reg74)) : {$unsigned(reg61)})),
                      wire49[(4'hc):(3'h6)]};
  assign wire80 = reg63;
  assign wire81 = {$unsigned(((^wire79[(1'h0):(1'h0)]) < (!(reg62 ?
                          reg73 : reg73))))};
  assign wire82 = reg68;
  assign wire83 = $unsigned($unsigned((wire45 ?
                      ((8'hbb) << reg73) : (wire80 ?
                          $signed(wire47) : $unsigned(reg74)))));
  assign wire84 = $signed(((^$unsigned(reg66)) ? $unsigned(wire50) : (8'hbb)));
  assign wire85 = $signed(((|reg64[(2'h3):(1'h0)]) ?
                      $signed(reg68) : (^~wire84)));
  assign wire86 = ($unsigned(($signed(wire46[(2'h3):(1'h1)]) ?
                          ($unsigned(reg52) << reg78) : (8'h9f))) ?
                      ($unsigned((!reg54)) + ({$signed(wire50)} ?
                          (~^$unsigned(reg71)) : $unsigned(wire46))) : reg76[(4'ha):(3'h6)]);
  assign wire87 = $unsigned((wire84[(4'hd):(3'h5)] && $unsigned($unsigned({reg61,
                      wire49}))));
  always
    @(posedge clk) begin
      reg88 <= reg56;
      reg89 <= $signed($unsigned((reg59[(2'h3):(2'h2)] > reg69[(4'h8):(1'h1)])));
      reg90 <= ($unsigned((!$unsigned(((8'hae) ? reg73 : reg65)))) ?
          reg89[(1'h0):(1'h0)] : {reg60[(3'h7):(3'h4)]});
      reg91 <= (-reg54);
    end
  assign wire92 = ((({reg63[(4'h8):(3'h6)],
                          reg89[(3'h7):(2'h3)]} | wire87[(4'hc):(4'h9)]) ?
                      reg56 : (((reg59 != reg75) && $signed(reg51)) < reg77)) + ((^~((reg64 * reg53) >= (8'hbb))) * wire50));
  always
    @(posedge clk) begin
      reg93 <= wire49;
      reg94 <= reg75;
      reg95 <= reg66;
      if (($unsigned($unsigned((wire84 ?
          ((8'haa) ? reg51 : reg76) : (~^reg60)))) & $unsigned(wire83)))
        begin
          reg96 <= ((wire50[(1'h0):(1'h0)] ?
                  $unsigned($unsigned({wire87})) : wire81[(1'h0):(1'h0)]) ?
              $signed(reg58) : wire48);
          reg97 <= reg61;
          reg98 <= ((~&$signed($unsigned(reg54))) - (~^(~&$signed(wire81[(2'h3):(2'h3)]))));
          if ($signed($unsigned((+((wire83 != reg97) ? (!(8'hbb)) : reg75)))))
            begin
              reg99 <= $signed($unsigned($signed($unsigned(((8'haf) >>> reg61)))));
              reg100 <= {$signed($signed(((reg91 == reg55) << $unsigned((7'h40)))))};
            end
          else
            begin
              reg99 <= {(reg53 ?
                      {reg94, $unsigned(reg91)} : (wire79 ?
                          $unsigned(wire83) : (8'hba)))};
              reg100 <= (+$signed({(^~((8'hac) * (8'hb5))),
                  reg64[(3'h6):(3'h4)]}));
              reg101 <= reg63[(3'h5):(3'h5)];
            end
          reg102 <= $unsigned(((wire92[(1'h1):(1'h0)] - (~&reg69)) ?
              (($signed(wire50) ?
                  (+reg53) : (8'ha4)) <<< $unsigned(wire79)) : $signed($signed({reg70,
                  (8'haf)}))));
        end
      else
        begin
          reg96 <= $unsigned(reg77);
        end
      reg103 <= (wire49[(4'h8):(3'h7)] ?
          ((~^wire48) ?
              ($unsigned({(8'ha8)}) <= (^$unsigned(reg57))) : reg72) : reg101[(2'h3):(2'h3)]);
    end
  assign wire104 = $signed(({reg74, $unsigned(((7'h40) <<< reg72))} ?
                       $unsigned(wire45) : {{wire81, (+wire47)},
                           {(reg57 & reg52)}}));
  assign wire105 = $signed($unsigned((($unsigned(wire84) ?
                       $unsigned((8'ha4)) : (^reg73)) * $unsigned({reg56}))));
  assign wire106 = reg61[(1'h0):(1'h0)];
  assign wire107 = $unsigned((((~|$unsigned((8'hb8))) != $signed({reg88})) ?
                       $unsigned(((~(8'haa)) ?
                           (reg73 + wire85) : (reg96 ?
                               reg63 : reg67))) : reg69));
  assign wire108 = reg93;
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  assign y = {wire37, wire36, wire35, wire33, wire32, wire31, reg34, (1'h0)};
  assign wire31 = $signed($signed(wire29[(1'h0):(1'h0)]));
  assign wire32 = ({$unsigned(($signed(wire29) != wire29[(4'hd):(1'h1)])),
                          wire29} ?
                      (~$unsigned({(7'h43)})) : $unsigned((wire31 >= $unsigned($signed(wire28)))));
  assign wire33 = $signed($signed($unsigned(wire27[(3'h6):(3'h5)])));
  always
    @(posedge clk) begin
      reg34 <= $unsigned(($signed(($signed(wire31) ?
              ((7'h41) << wire33) : $signed((8'h9f)))) ?
          ((-(~&wire33)) >> wire28) : wire30));
    end
  assign wire35 = $signed(wire31[(2'h2):(2'h2)]);
  assign wire36 = $unsigned(wire32[(1'h1):(1'h1)]);
  assign wire37 = (^~wire35[(4'ha):(1'h1)]);
endmodule
