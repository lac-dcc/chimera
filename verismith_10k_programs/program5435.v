module top
#(parameter param232 = (~(~^((((7'h44) ? (8'hbc) : (7'h40)) >= (+(8'ha4))) ? (((8'ha1) | (8'hb7)) ? ((8'hb1) & (8'hbd)) : (+(8'hb9))) : (-((8'ha7) | (8'hac)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire231;
  wire signed [(2'h2):(1'h0)] wire230;
  wire [(5'h14):(1'h0)] wire228;
  wire [(5'h12):(1'h0)] wire227;
  wire [(3'h6):(1'h0)] wire222;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire220;
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg223 = (1'h0);
  reg [(5'h13):(1'h0)] reg224 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg225 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg226 = (1'h0);
  assign y = {wire231,
                 wire230,
                 wire228,
                 wire227,
                 wire222,
                 wire4,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire59,
                 wire61,
                 wire62,
                 wire84,
                 wire220,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg223,
                 reg224,
                 reg225,
                 reg226,
                 (1'h0)};
  assign wire4 = wire1;
  always
    @(posedge clk) begin
      reg5 <= $signed((wire4[(4'h9):(3'h5)] < wire4));
      reg6 <= reg5[(4'hf):(4'h9)];
      reg7 <= wire2;
      reg8 <= $signed($unsigned((((|wire3) ?
          (7'h44) : $unsigned(reg7)) >> wire4)));
      reg9 <= ((-$signed($signed((|reg6)))) <<< {((reg6 ^ (wire4 != wire4)) > (8'h9f))});
    end
  assign wire10 = {{$signed($unsigned($signed((8'ha7)))),
                          ($unsigned($unsigned(reg9)) || $unsigned(reg6))},
                      (+((~(reg7 ? wire4 : (8'hbf))) << wire0))};
  assign wire11 = {reg5[(4'h9):(2'h3)]};
  assign wire12 = wire1[(4'ha):(3'h5)];
  assign wire13 = $unsigned(reg9);
  assign wire14 = {((8'hb7) ?
                          $unsigned($unsigned(wire10[(1'h1):(1'h1)])) : (reg5 ?
                              wire12[(1'h0):(1'h0)] : wire12))};
  assign wire15 = (&$unsigned(wire13[(1'h1):(1'h0)]));
  module16 #() modinst60 (.wire19(wire12), .wire21(wire4), .wire18(wire10), .y(wire59), .wire17(reg9), .clk(clk), .wire20(wire0));
  assign wire61 = $signed(reg9[(4'hb):(4'ha)]);
  assign wire62 = wire1;
  module63 #() modinst85 (wire84, clk, wire61, reg7, wire0, wire4, wire12);
  module86 #() modinst221 (.wire91(wire13), .clk(clk), .wire89(wire14), .wire87(wire15), .wire88(wire10), .wire90(wire61), .y(wire220));
  assign wire222 = (8'h9d);
  always
    @(posedge clk) begin
      reg223 <= (reg8 ? (8'hb5) : (~|$unsigned((~&(wire59 ? wire10 : wire0)))));
      reg224 <= ($signed((+$signed(wire14))) ?
          (~^wire13) : {$signed(wire62[(1'h1):(1'h1)])});
      reg225 <= ((|wire61) ? wire4 : wire61[(4'ha):(2'h3)]);
      reg226 <= (&$signed((8'ha0)));
    end
  assign wire227 = reg225[(1'h1):(1'h0)];
  module170 #() modinst229 (.wire173(reg5), .wire174(wire15), .wire171(wire84), .wire172(wire11), .wire175(wire1), .y(wire228), .clk(clk));
  assign wire230 = ((((^(|(8'had))) > ({wire4} || reg6[(3'h6):(3'h6)])) ?
                           wire1[(4'hd):(4'hd)] : {wire12[(4'h8):(1'h0)],
                               wire228}) ?
                       $unsigned((((wire12 ? reg9 : (8'ha2)) != reg223) ?
                           $unsigned(wire13) : {(^wire62)})) : (($signed(wire1) * wire62) ?
                           wire84 : {$signed({wire227}),
                               wire222[(1'h0):(1'h0)]}));
  assign wire231 = $unsigned((reg7[(4'hd):(1'h0)] ?
                       $signed((8'hb9)) : (|{(^~wire1)})));
endmodule

module module86  (y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire91;
  input wire signed [(5'h15):(1'h0)] wire90;
  input wire signed [(5'h11):(1'h0)] wire89;
  input wire signed [(4'he):(1'h0)] wire88;
  input wire [(5'h10):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire219;
  wire signed [(2'h2):(1'h0)] wire218;
  wire signed [(4'h8):(1'h0)] wire207;
  wire [(5'h15):(1'h0)] wire206;
  wire [(5'h13):(1'h0)] wire205;
  wire signed [(4'hd):(1'h0)] wire204;
  wire signed [(3'h7):(1'h0)] wire203;
  wire signed [(3'h5):(1'h0)] wire202;
  wire signed [(4'h9):(1'h0)] wire201;
  wire signed [(3'h6):(1'h0)] wire200;
  wire signed [(2'h2):(1'h0)] wire199;
  wire [(3'h5):(1'h0)] wire198;
  wire [(3'h4):(1'h0)] wire197;
  wire signed [(4'he):(1'h0)] wire168;
  wire [(4'he):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire195;
  reg signed [(3'h5):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg216 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg214 = (1'h0);
  reg [(3'h4):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg212 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg211 = (1'h0);
  reg [(4'ha):(1'h0)] reg210 = (1'h0);
  reg [(5'h15):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg208 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  assign y = {wire219,
                 wire218,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire168,
                 wire118,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire144,
                 wire195,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg146,
                 (1'h0)};
  assign wire92 = $unsigned($unsigned((8'hb5)));
  assign wire93 = $unsigned($unsigned(wire91[(3'h4):(1'h0)]));
  assign wire94 = (((wire91 >> $unsigned({wire87})) ?
                      $unsigned($unsigned($unsigned(wire93))) : (|wire92)) | (^({(wire89 ?
                              wire93 : (8'ha6))} ?
                      $unsigned($unsigned(wire87)) : wire89)));
  assign wire95 = wire92[(4'h8):(1'h1)];
  module96 #() modinst119 (wire118, clk, wire91, wire95, wire89, wire94, wire88);
  module120 #() modinst145 (.clk(clk), .wire123(wire89), .wire125(wire91), .wire124(wire93), .wire121(wire92), .wire122(wire87), .y(wire144));
  always
    @(posedge clk) begin
      reg146 <= (($unsigned((wire92[(2'h2):(1'h1)] ?
          (wire95 <= (8'hb0)) : $unsigned(wire94))) < $unsigned(((~&wire91) == (wire90 ?
          wire92 : wire93)))) ~^ $signed((($unsigned(wire92) ?
              (wire89 || wire92) : (wire94 | wire93)) ?
          ({wire90} ?
              wire89 : wire144[(2'h2):(1'h1)]) : (wire88[(4'hb):(3'h4)] > (wire87 || wire87)))));
    end
  module147 #() modinst169 (.wire149(wire144), .wire148(wire92), .wire150(wire91), .wire151(wire95), .clk(clk), .wire152(wire88), .y(wire168));
  module170 #() modinst196 (wire195, clk, wire92, wire144, wire94, wire90, wire89);
  assign wire197 = ((wire95 ?
                       (wire195 ?
                           $unsigned({(8'hb5),
                               wire92}) : $unsigned($unsigned(wire168))) : wire195) > {((8'ha9) ?
                           wire93 : $unsigned((wire95 ? wire90 : wire89)))});
  assign wire198 = (((((wire95 < wire93) == ((8'h9f) > wire90)) >> wire144[(4'h8):(2'h3)]) ?
                           ((wire95[(4'hb):(4'h9)] ?
                                   (8'ha7) : (wire87 ? wire88 : reg146)) ?
                               ($signed(wire168) != (^(8'ha8))) : wire88[(2'h2):(1'h1)]) : (({wire195} << (^wire91)) ?
                               wire94[(4'hb):(4'h8)] : ($unsigned(wire94) ?
                                   $signed((7'h41)) : (wire95 ?
                                       wire90 : wire195)))) ?
                       (~&$unsigned($unsigned((reg146 >> wire168)))) : $unsigned(wire197));
  assign wire199 = ($unsigned((wire88[(4'h9):(3'h5)] >> reg146)) ?
                       (^~(-$signed($unsigned(wire94)))) : $unsigned($signed($signed($signed(wire95)))));
  assign wire200 = ($unsigned((wire89[(3'h4):(2'h2)] * {wire118})) + wire91);
  assign wire201 = ((8'hb4) ? (-{wire89}) : wire89[(4'he):(4'hd)]);
  assign wire202 = (+((^$signed((wire195 >> wire199))) || reg146[(1'h1):(1'h0)]));
  assign wire203 = wire94;
  assign wire204 = ($unsigned((reg146[(3'h7):(3'h5)] && (^~$signed(wire199)))) * (-$unsigned(((wire200 <= (8'had)) ?
                       $signed(wire87) : $signed((8'hb0))))));
  assign wire205 = wire198;
  assign wire206 = $unsigned($unsigned((|(wire168[(4'h8):(4'h8)] != (wire200 ?
                       wire205 : reg146)))));
  assign wire207 = (($signed((&{wire94})) < wire93[(3'h7):(3'h4)]) || $signed(($signed({(8'h9d),
                       (8'ha5)}) >>> {(~(8'hba)), wire202[(1'h1):(1'h0)]})));
  always
    @(posedge clk) begin
      reg208 <= $signed(wire91[(3'h6):(2'h3)]);
      reg209 <= $unsigned((+$unsigned(((wire94 ? wire118 : wire195) ?
          wire204[(4'ha):(3'h5)] : (wire197 ? (8'hb4) : wire207)))));
      reg210 <= $signed(wire87);
      if ((~^($signed(((8'ha5) > (~wire95))) > {((wire206 ? wire203 : wire118) ?
              {wire89, (8'hb7)} : {wire207, wire95})})))
        begin
          reg211 <= wire168[(3'h4):(2'h3)];
          reg212 <= $signed(($signed($signed($signed(wire204))) ^ ((~^(wire203 <= wire200)) ?
              $signed((wire87 << wire88)) : ((&wire168) == (~&wire201)))));
          if (wire207[(3'h4):(2'h3)])
            begin
              reg213 <= $unsigned(((wire200[(2'h3):(2'h3)] ?
                  $unsigned((+wire207)) : (wire90 ?
                      $signed(reg212) : $signed((8'ha5)))) > $unsigned((8'ha6))));
              reg214 <= $unsigned((8'hb3));
              reg215 <= $unsigned(wire87[(4'he):(4'hc)]);
            end
          else
            begin
              reg213 <= reg209;
            end
          reg216 <= (((8'h9f) <= (&$signed($unsigned(reg215)))) >= ((8'hac) != $signed((wire87 ?
              {reg209} : $signed((7'h42))))));
        end
      else
        begin
          reg211 <= (reg215 ?
              (reg211 ?
                  $signed({$unsigned(reg213)}) : $unsigned(((wire93 <= (8'hb4)) ?
                      $unsigned(reg212) : (reg214 ?
                          reg214 : wire195)))) : $unsigned(wire118));
          reg212 <= ($unsigned((($unsigned(reg209) & (wire88 >= (8'hb3))) ?
              wire93[(4'he):(4'hc)] : $unsigned($signed(reg212)))) & $unsigned(reg216[(3'h7):(2'h2)]));
          reg213 <= wire206;
        end
      reg217 <= $unsigned((~|wire118[(4'he):(3'h6)]));
    end
  assign wire218 = wire144;
  assign wire219 = wire168[(3'h4):(1'h0)];
endmodule

module module63  (y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire68;
  input wire signed [(5'h10):(1'h0)] wire67;
  input wire signed [(5'h11):(1'h0)] wire66;
  input wire [(5'h15):(1'h0)] wire65;
  input wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 reg83,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire69 = $unsigned(wire67);
  assign wire70 = wire66[(5'h10):(4'h8)];
  assign wire71 = $unsigned(wire69);
  assign wire72 = $unsigned({wire70[(2'h2):(2'h2)]});
  always
    @(posedge clk) begin
      reg73 <= $signed((~|(&$unsigned($signed(wire64)))));
      reg74 <= wire69[(2'h3):(2'h3)];
      reg75 <= $unsigned({$unsigned((&(wire68 ^ reg74))), wire68});
    end
  assign wire76 = (wire66 ?
                      $signed((((~|(8'had)) ?
                          reg75 : (reg74 && (8'hba))) >= (7'h43))) : (~^(&(wire72 ?
                          wire66 : (-(8'hac))))));
  assign wire77 = (^$unsigned(wire71));
  assign wire78 = wire66;
  assign wire79 = ($unsigned(({wire76[(4'h8):(3'h5)]} != (8'h9c))) | wire64[(3'h5):(3'h5)]);
  assign wire80 = wire65;
  assign wire81 = (&wire69);
  assign wire82 = (($signed(((^reg74) || $signed(reg74))) << wire65[(4'hf):(4'hd)]) >> (wire66 && $unsigned($unsigned((wire79 ?
                      wire76 : reg73)))));
  always
    @(posedge clk) begin
      reg83 <= (8'ha8);
    end
endmodule

module module16  (y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire signed [(4'h9):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire57;
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  assign y = {wire22,
                 wire28,
                 wire29,
                 wire30,
                 wire57,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire22 = {wire21[(2'h3):(1'h0)], wire17[(4'hb):(3'h6)]};
  always
    @(posedge clk) begin
      reg23 <= $unsigned($unsigned({(wire21 ? (~wire18) : $signed((8'hb3))),
          $signed($signed(wire19))}));
      reg24 <= $signed((^$signed(wire19)));
      reg25 <= $signed($signed($signed($unsigned(((8'hb3) <= reg24)))));
      reg26 <= (^~reg25);
      reg27 <= ((wire21 && ((reg25 ? $signed(wire17) : wire22) ?
          $unsigned((reg24 << (8'ha2))) : reg26)) + wire20);
    end
  assign wire28 = (^(8'hb0));
  assign wire29 = (8'ha7);
  assign wire30 = (((~|(((8'hbb) ? wire28 : (8'h9f)) > (wire17 ?
                          reg25 : wire28))) ?
                      $unsigned({reg23[(1'h1):(1'h0)],
                          (wire28 == wire29)}) : $signed($unsigned((+reg24)))) && ((wire29 != reg24[(1'h0):(1'h0)]) * (reg23[(3'h4):(1'h1)] ?
                      wire19 : $signed((reg24 ? wire22 : wire17)))));
  module31 #() modinst58 (.wire35(wire28), .wire32(reg27), .y(wire57), .wire36(wire17), .clk(clk), .wire34(reg24), .wire33(wire19));
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire [(3'h6):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire signed [(4'hb):(1'h0)] wire33;
  input wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire38,
                 wire37,
                 reg53,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire37 = wire34;
  assign wire38 = (+(wire35 ?
                      (wire32[(3'h6):(1'h0)] ?
                          $unsigned((8'ha3)) : $signed((wire36 >> (8'haa)))) : {(~|$unsigned(wire33)),
                          $signed((8'ha0))}));
  always
    @(posedge clk) begin
      if ((7'h43))
        begin
          if ($signed($signed((!$unsigned((wire35 ? wire35 : wire32))))))
            begin
              reg39 <= wire38;
              reg40 <= (^$signed((~|wire33[(2'h2):(2'h2)])));
              reg41 <= reg39[(4'h8):(3'h7)];
            end
          else
            begin
              reg39 <= wire33[(3'h7):(3'h5)];
              reg40 <= $signed($signed((wire34 >> reg39)));
              reg41 <= (-($signed((wire35 <= reg39)) < ((reg40 & $unsigned(reg39)) ^ wire36[(3'h6):(1'h0)])));
            end
          reg42 <= (({((wire33 ? wire35 : wire36) ?
                      wire38[(2'h2):(2'h2)] : (reg39 ? reg41 : wire36))} ?
              (~(reg39[(4'he):(4'hd)] ?
                  (wire34 < wire35) : (wire32 ?
                      (8'hb4) : wire37))) : wire38[(1'h1):(1'h1)]) - (wire34 ~^ (|{wire38})));
          if ($signed((wire33[(2'h3):(1'h1)] ?
              reg41 : {(8'h9e), ((wire32 - wire34) & $signed(wire35))})))
            begin
              reg43 <= $signed(((($unsigned(wire35) ^ (+reg41)) > ((wire35 ?
                      wire33 : wire34) >>> {(8'ha3), wire32})) ?
                  $unsigned(wire35) : wire37[(1'h0):(1'h0)]));
              reg44 <= (|$signed($signed((-$signed((8'hab))))));
            end
          else
            begin
              reg43 <= (~|$signed($signed($unsigned($unsigned(wire35)))));
              reg44 <= (!$signed($unsigned((-$unsigned((8'ha9))))));
              reg45 <= ($signed({$unsigned((reg39 ? wire35 : reg44))}) ?
                  $unsigned((~^$signed({wire36}))) : $unsigned(reg39));
            end
          if ((((((wire32 >>> (8'hbf)) ?
                      ((8'ha3) ^ reg44) : $unsigned(wire34)) - $signed($unsigned(reg40))) ?
                  (((wire35 > wire33) - $unsigned(wire38)) >= $unsigned($unsigned(reg42))) : (&$signed(wire34[(2'h3):(1'h0)]))) ?
              (~&(($signed(wire34) > ((8'hab) << (8'hb2))) ?
                  (reg43[(4'h8):(3'h5)] ~^ ((7'h41) == reg40)) : reg45)) : wire34))
            begin
              reg46 <= $unsigned(reg45[(4'he):(3'h6)]);
              reg47 <= wire33[(1'h1):(1'h1)];
            end
          else
            begin
              reg46 <= reg45[(2'h2):(2'h2)];
              reg47 <= $unsigned($unsigned((((reg43 >= reg46) ?
                      reg42[(2'h3):(1'h1)] : $signed((8'hbd))) ?
                  reg41[(1'h1):(1'h1)] : (~$unsigned(wire36)))));
              reg48 <= ((~^$signed($unsigned(reg44))) * {reg41,
                  ($unsigned(wire35[(1'h1):(1'h1)]) ?
                      reg43 : (~&$unsigned(reg47)))});
              reg49 <= (^~($signed(((^~wire35) ?
                  $unsigned(wire38) : $unsigned(reg45))) == (+(~&reg47))));
            end
        end
      else
        begin
          if ($signed((wire32[(3'h6):(3'h5)] != $unsigned(reg40))))
            begin
              reg39 <= ($signed((!(!reg47))) != (wire37 ?
                  $signed($signed($signed(reg45))) : (reg49 - $signed((reg43 ?
                      reg47 : reg45)))));
              reg40 <= (8'hbf);
              reg41 <= wire35[(1'h0):(1'h0)];
            end
          else
            begin
              reg39 <= ($signed($unsigned(reg45[(4'hb):(2'h2)])) ?
                  ($unsigned($unsigned(((8'haa) ?
                      wire33 : reg41))) ^ $unsigned(reg46[(2'h2):(1'h0)])) : reg49[(1'h1):(1'h0)]);
              reg40 <= (~&(&({$signed(reg39),
                  (wire32 >= wire36)} * (wire33 | $signed((8'ha0))))));
            end
          reg42 <= reg40;
          if ((8'hb3))
            begin
              reg43 <= ($signed(wire34[(1'h0):(1'h0)]) ?
                  $signed(reg44[(4'hc):(1'h0)]) : ((-reg44[(1'h1):(1'h1)]) < wire33[(3'h5):(3'h4)]));
              reg44 <= $signed($unsigned((reg43 - (reg39[(4'hc):(2'h3)] != $unsigned(reg47)))));
            end
          else
            begin
              reg43 <= {($signed((!((7'h40) ^ wire37))) ?
                      (reg42 <= ((reg39 > wire35) < ((8'hbc) && reg42))) : reg42)};
              reg44 <= (((((reg45 ?
                      reg42 : reg47) && reg45[(4'h9):(3'h4)]) | reg48[(3'h4):(1'h1)]) + reg39[(4'he):(4'ha)]) ?
                  reg46 : ($signed($unsigned(wire37)) ?
                      (((~wire37) ?
                          (wire38 ?
                              reg41 : wire32) : reg39[(3'h7):(1'h1)]) & ((reg46 ?
                          reg39 : wire37) > $signed(wire35))) : ($signed($unsigned(reg42)) ^~ $signed((reg45 ?
                          (8'h9c) : (7'h40))))));
              reg45 <= ($unsigned($signed($unsigned((reg44 == reg40)))) ?
                  $unsigned((|wire32)) : {wire38});
              reg46 <= $unsigned(($signed(reg46) > $unsigned((!(^wire32)))));
            end
          reg47 <= (^(($signed($unsigned((7'h40))) ?
                  $signed((wire33 ? (7'h43) : reg41)) : ({(8'ha9), wire35} ?
                      reg47 : (wire35 == wire35))) ?
              reg39 : $unsigned(({wire38, wire35} - (-(8'hbc))))));
          reg48 <= (wire37 ?
              (reg40[(2'h2):(2'h2)] ?
                  $signed(({wire34} != (~^reg42))) : $unsigned(($unsigned((8'hbf)) ?
                      wire37 : (reg39 + wire34)))) : ({reg44,
                      (+reg40[(1'h0):(1'h0)])} ?
                  $signed(({reg46} ?
                      (wire36 ~^ reg40) : wire34)) : reg43[(1'h0):(1'h0)]));
        end
      reg50 <= wire37[(3'h4):(2'h3)];
      reg51 <= reg41;
      reg52 <= $unsigned({{(((7'h42) ?
                  reg43 : (8'ha9)) >>> $unsigned((8'haf)))},
          {$unsigned((reg46 >>> reg48))}});
      reg53 <= $unsigned(reg39[(4'hc):(3'h6)]);
    end
  assign wire54 = reg48;
  assign wire55 = $signed($unsigned($unsigned(((~&wire38) ?
                      $signed(wire33) : wire38[(3'h4):(1'h1)]))));
  assign wire56 = wire38[(1'h1):(1'h1)];
endmodule

module module170
#(parameter param194 = {(8'h9e), {(|((|(8'hab)) ^ ((8'ha0) ? (8'hb7) : (8'hb5)))), (((^(8'hbf)) || (&(8'had))) ? ((8'ha8) - ((8'hae) ? (8'ha0) : (8'ha1))) : {((8'ha1) ^~ (8'hbe)), ((7'h43) ? (8'hbb) : (7'h43))})}})
(y, clk, wire175, wire174, wire173, wire172, wire171);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire175;
  input wire [(3'h5):(1'h0)] wire174;
  input wire [(4'h9):(1'h0)] wire173;
  input wire [(3'h5):(1'h0)] wire172;
  input wire [(5'h11):(1'h0)] wire171;
  wire signed [(3'h4):(1'h0)] wire193;
  wire [(4'hc):(1'h0)] wire192;
  wire signed [(3'h7):(1'h0)] wire191;
  wire [(4'hd):(1'h0)] wire190;
  wire [(4'hc):(1'h0)] wire189;
  wire signed [(4'hb):(1'h0)] wire188;
  wire [(4'hc):(1'h0)] wire181;
  wire signed [(4'he):(1'h0)] wire180;
  wire [(5'h14):(1'h0)] wire179;
  wire signed [(4'ha):(1'h0)] wire178;
  wire signed [(5'h10):(1'h0)] wire177;
  wire signed [(3'h4):(1'h0)] wire176;
  reg signed [(4'hf):(1'h0)] reg187 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg183 = (1'h0);
  reg [(2'h2):(1'h0)] reg182 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 (1'h0)};
  assign wire176 = wire172[(3'h5):(1'h0)];
  assign wire177 = wire172[(2'h3):(2'h3)];
  assign wire178 = $unsigned(($signed($signed((^wire175))) > $signed($unsigned((&wire177)))));
  assign wire179 = (~&wire173[(3'h5):(2'h3)]);
  assign wire180 = ((!$unsigned(((~wire176) ?
                       (wire172 ?
                           (8'hb7) : wire171) : {wire175}))) << ((((|wire178) ?
                               (~(8'hba)) : wire179) ?
                           ((wire174 ?
                               wire179 : wire173) & wire178) : (^~$unsigned(wire176))) ?
                       wire177[(3'h7):(3'h6)] : (((~&wire178) + $signed(wire172)) ?
                           wire177 : ($unsigned(wire171) >>> $signed(wire176)))));
  assign wire181 = ({$signed(wire176[(2'h3):(1'h0)])} >>> ($unsigned(($signed(wire180) ?
                           (wire177 || (8'hb0)) : ((8'ha4) ?
                               wire172 : (8'h9e)))) ?
                       wire174 : $unsigned({(8'hbb), $signed(wire178)})));
  always
    @(posedge clk) begin
      reg182 <= (~wire172[(2'h2):(1'h0)]);
      if ({(!$unsigned(wire176[(2'h3):(2'h2)]))})
        begin
          reg183 <= {(reg182 << {{wire178[(1'h1):(1'h1)], {wire177}},
                  wire171[(4'he):(3'h5)]}),
              (-wire177)};
          reg184 <= wire174[(1'h1):(1'h0)];
          reg185 <= $unsigned($unsigned(wire181[(4'hb):(2'h3)]));
          reg186 <= wire180;
        end
      else
        begin
          reg183 <= reg185[(3'h5):(1'h0)];
          reg184 <= (($unsigned($unsigned((reg183 && wire171))) * wire177[(3'h5):(1'h1)]) ?
              {((8'hb7) ? $signed(reg185[(4'ha):(4'h8)]) : (8'ha3)),
                  $signed($unsigned((wire180 ?
                      reg182 : reg182)))} : {(({wire171} ?
                          wire181[(3'h4):(1'h1)] : ((8'ha9) >> (8'hbb))) ?
                      reg183 : ((wire173 < wire174) ?
                          reg184 : $signed(wire178)))});
        end
      reg187 <= wire175[(2'h2):(1'h0)];
    end
  assign wire188 = (((wire179 ?
                           ((8'ha9) | (wire179 == wire180)) : $unsigned(wire175)) ?
                       ((7'h42) * wire172[(3'h4):(1'h1)]) : $unsigned($signed(reg182))) + $unsigned({(wire173 ?
                           reg182[(1'h1):(1'h0)] : {wire176, wire179}),
                       $signed($signed((8'hb6)))}));
  assign wire189 = wire188[(1'h1):(1'h1)];
  assign wire190 = reg182[(1'h0):(1'h0)];
  assign wire191 = wire177;
  assign wire192 = (~($signed($signed((~^wire191))) > (|(~&(-(7'h43))))));
  assign wire193 = $signed($signed($unsigned(reg183[(1'h0):(1'h0)])));
endmodule

module module147  (y, clk, wire152, wire151, wire150, wire149, wire148);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire152;
  input wire [(4'he):(1'h0)] wire151;
  input wire [(2'h3):(1'h0)] wire150;
  input wire signed [(3'h7):(1'h0)] wire149;
  input wire signed [(3'h5):(1'h0)] wire148;
  wire [(5'h11):(1'h0)] wire167;
  wire [(4'hb):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire165;
  wire [(3'h5):(1'h0)] wire164;
  wire signed [(4'ha):(1'h0)] wire163;
  wire signed [(4'hd):(1'h0)] wire162;
  wire signed [(5'h14):(1'h0)] wire161;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(5'h10):(1'h0)] wire159;
  wire [(3'h6):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire156;
  wire [(5'h14):(1'h0)] wire155;
  wire [(2'h2):(1'h0)] wire153;
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 reg158,
                 reg154,
                 (1'h0)};
  assign wire153 = (8'ha1);
  always
    @(posedge clk) begin
      reg154 <= wire150[(2'h3):(2'h3)];
    end
  assign wire155 = (~$unsigned($signed(wire153)));
  assign wire156 = $signed(({$signed($unsigned(wire155))} ?
                       $signed(((~^reg154) <<< reg154[(2'h3):(1'h0)])) : ({$signed(wire153)} ?
                           wire153[(1'h0):(1'h0)] : {((8'hb3) ?
                                   wire151 : wire150),
                               wire152})));
  assign wire157 = $signed((reg154[(4'hf):(4'ha)] ? wire149 : wire156));
  always
    @(posedge clk) begin
      reg158 <= {$unsigned(wire151), {wire149}};
    end
  assign wire159 = ((wire155[(2'h3):(2'h2)] >= (reg158 == $unsigned(wire149))) ?
                       ($signed((8'hb3)) ?
                           $signed((-wire155[(2'h2):(2'h2)])) : wire156[(3'h5):(2'h3)]) : wire155);
  assign wire160 = (!wire156);
  assign wire161 = $unsigned(wire149);
  assign wire162 = wire152[(1'h1):(1'h1)];
  assign wire163 = $unsigned(({$unsigned(wire157)} != (~|{((8'ha3) ~^ wire160),
                       $unsigned(wire152)})));
  assign wire164 = (({(wire148 <= (wire153 ^ wire161))} ~^ (wire162[(3'h7):(2'h3)] & $signed({wire157}))) | (wire163 || $signed($signed($unsigned(wire153)))));
  assign wire165 = {wire155[(1'h1):(1'h0)]};
  assign wire166 = $signed((!(~(-(wire151 ~^ wire164)))));
  assign wire167 = ({((wire148[(2'h3):(2'h3)] ?
                                   wire149[(3'h5):(1'h0)] : (|(8'hb6))) ?
                               reg154[(3'h7):(2'h3)] : $unsigned((+wire148))),
                           (($signed(wire148) ?
                                   $signed(wire150) : ((8'hbd) ?
                                       wire151 : wire151)) ?
                               $unsigned($unsigned((8'hb7))) : wire151[(4'hb):(4'hb)])} ?
                       ((|$signed(wire163)) <<< $unsigned(reg154[(1'h1):(1'h0)])) : wire164);
endmodule

module module120
#(parameter param142 = ((((~|((8'hb5) > (8'ha5))) ? (((8'haa) <= (8'h9c)) < ((8'hbd) ? (8'h9c) : (8'ha7))) : {((8'haf) ? (8'hba) : (8'hae)), ((8'ha0) >= (8'hb4))}) ? (8'h9e) : ((~|{(8'ha3)}) | (((8'hb9) * (8'haa)) ? (8'hb7) : {(8'hb6), (7'h43)}))) * ({((^(8'h9d)) <<< (7'h41))} || ((((8'ha6) == (8'h9d)) ? ((7'h42) + (8'ha0)) : ((8'h9c) >>> (8'hb1))) & ((^~(8'hb2)) ? (&(7'h43)) : (+(7'h42)))))), 
parameter param143 = {((!((8'ha9) ? (param142 ? param142 : param142) : (~|param142))) ? (param142 ? param142 : (param142 && {param142})) : (param142 ? ((param142 >>> (8'hba)) ? (param142 ^~ param142) : {param142, param142}) : (|(param142 ^~ param142))))})
(y, clk, wire125, wire124, wire123, wire122, wire121);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire125;
  input wire [(5'h13):(1'h0)] wire124;
  input wire [(3'h4):(1'h0)] wire123;
  input wire [(5'h10):(1'h0)] wire122;
  input wire [(4'hd):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire137;
  wire [(5'h10):(1'h0)] wire136;
  wire signed [(3'h6):(1'h0)] wire135;
  wire [(4'h8):(1'h0)] wire134;
  wire signed [(2'h2):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  wire signed [(4'hf):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire126;
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire126 = {($unsigned((wire125[(2'h2):(1'h0)] ?
                               wire121 : (~wire124))) ?
                           wire124 : wire124[(5'h11):(4'hb)])};
  assign wire127 = $unsigned((~^(wire124 ?
                       wire124 : ((!wire121) ?
                           $signed(wire121) : wire123[(3'h4):(1'h0)]))));
  assign wire128 = $signed((+$unsigned(wire122)));
  assign wire129 = $unsigned(wire125);
  always
    @(posedge clk) begin
      reg130 <= wire128[(3'h7):(2'h3)];
      if (wire128)
        begin
          reg131 <= ((~&({(wire121 >>> wire125),
              $signed(wire121)} <<< (wire128 != (~^(8'ha0))))) ~^ $signed(wire127));
        end
      else
        begin
          reg131 <= wire127[(1'h1):(1'h0)];
          reg132 <= wire129;
        end
    end
  assign wire133 = wire122[(4'ha):(4'h8)];
  assign wire134 = $unsigned(((+(~&(wire123 ?
                       wire122 : wire122))) || ({wire123[(1'h1):(1'h1)],
                           (^~wire123)} ?
                       wire121[(4'hd):(3'h5)] : $signed(((7'h44) == wire124)))));
  assign wire135 = (($signed({$signed(reg132)}) ? wire122 : reg130) ?
                       $signed({{$unsigned(wire133)},
                           (wire124[(3'h7):(3'h4)] + wire121[(4'hd):(2'h3)])}) : (wire121[(3'h7):(1'h1)] << $signed(reg131)));
  assign wire136 = (wire133[(1'h1):(1'h1)] > reg132[(4'hb):(3'h5)]);
  assign wire137 = $unsigned(((^wire121) ?
                       ($signed((wire124 * (8'hba))) ?
                           wire135[(3'h5):(3'h4)] : $signed((wire124 ?
                               (8'hb9) : wire126))) : reg130[(3'h6):(2'h3)]));
  always
    @(posedge clk) begin
      reg138 <= (~^(((wire124 ?
          $signed(reg131) : $signed(wire137)) >= $unsigned(reg132[(3'h6):(1'h1)])) >= (^({wire126} ?
          {wire129, wire123} : wire134))));
      reg139 <= {$signed((~^$signed((wire121 >> reg131))))};
      reg140 <= reg139[(5'h10):(3'h5)];
      reg141 <= $signed(wire134);
    end
endmodule

module module96
#(parameter param117 = {({(&((8'ha8) & (7'h40))), (~&(!(8'ha0)))} ? {{((7'h40) ? (8'ha9) : (8'hae))}} : (((^(7'h42)) <= (8'hb4)) != (^~((8'ha6) || (8'haf)))))})
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire101;
  input wire signed [(5'h10):(1'h0)] wire100;
  input wire signed [(3'h4):(1'h0)] wire99;
  input wire [(4'ha):(1'h0)] wire98;
  input wire signed [(4'h8):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg102 <= wire97;
      if ($signed(reg102[(4'h9):(3'h7)]))
        begin
          reg103 <= $signed(wire99[(1'h1):(1'h1)]);
        end
      else
        begin
          reg103 <= (wire97[(3'h5):(1'h1)] ?
              ($unsigned((~&(-(8'h9f)))) ?
                  $signed(reg102) : (((8'had) ?
                          (wire100 ? wire99 : (8'hbf)) : wire97) ?
                      $signed((|reg103)) : $unsigned((wire97 | wire99)))) : (7'h41));
          reg104 <= (~|($unsigned(((wire97 ?
              (8'hab) : wire97) ^ wire99[(2'h3):(1'h1)])) - {wire99[(1'h0):(1'h0)]}));
        end
      reg105 <= ((((wire98 ? {wire101} : $unsigned(wire101)) ?
                  $unsigned($signed(wire101)) : wire99[(1'h0):(1'h0)]) ?
              (|{(-wire100), {reg103}}) : (wire98 || ((&wire97) ?
                  $signed(wire99) : (+wire100)))) ?
          wire100 : $unsigned(reg102[(3'h7):(1'h1)]));
      reg106 <= wire100[(4'h9):(3'h4)];
    end
  assign wire107 = (+$signed($signed(wire99[(1'h1):(1'h0)])));
  assign wire108 = (~{(+reg106), reg106});
  assign wire109 = (~($unsigned((wire97[(2'h2):(2'h2)] <<< $unsigned(wire101))) + $unsigned((((8'ha5) ?
                       wire108 : wire97) << reg105))));
  always
    @(posedge clk) begin
      reg110 <= ((-{wire107}) >= (8'hba));
      reg111 <= $unsigned($unsigned(($unsigned((wire107 <= reg104)) || $signed((wire101 ?
          wire97 : reg103)))));
      if ($unsigned($unsigned($signed(reg111[(1'h0):(1'h0)]))))
        begin
          reg112 <= $signed((reg110 == ($signed(reg110) ?
              ($unsigned(reg111) ?
                  ((7'h40) ?
                      reg104 : reg106) : wire100[(2'h3):(1'h0)]) : ((~wire97) ?
                  wire100[(3'h5):(2'h3)] : {reg110, (7'h40)}))));
        end
      else
        begin
          reg112 <= $unsigned((^~$signed({$unsigned(reg105),
              (reg110 ^~ wire97)})));
          reg113 <= $unsigned(((((^wire101) ?
                      (8'hb3) : (wire108 ? wire98 : wire101)) ?
                  (-$signed((8'ha1))) : ((wire97 ?
                      reg106 : wire109) >> (~wire97))) ?
              (((wire101 ? reg102 : wire100) ?
                      {wire100, wire99} : $unsigned(reg106)) ?
                  (-wire107) : ($unsigned((8'ha9)) ?
                      $signed(reg111) : (|wire107))) : (reg112[(1'h1):(1'h1)] ?
                  $unsigned($unsigned(wire98)) : wire99)));
          reg114 <= (reg105 ~^ {$unsigned($signed(reg104[(4'h8):(2'h2)])),
              ({{reg102, (8'hb6)}} ?
                  wire99[(2'h3):(2'h2)] : $unsigned(((8'haf) ?
                      reg112 : (8'hac))))});
          reg115 <= (^~$signed((((reg103 & reg104) - reg103[(2'h2):(1'h0)]) ?
              $unsigned((+wire107)) : (((8'hb7) ?
                  reg114 : (8'hab)) < reg113))));
          reg116 <= ((-$signed($unsigned((|(8'hb1))))) ?
              $signed(wire98) : {(!reg103)});
        end
    end
endmodule
