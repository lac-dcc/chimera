module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire240;
  wire signed [(3'h6):(1'h0)] wire239;
  wire [(4'hc):(1'h0)] wire238;
  wire [(4'he):(1'h0)] wire237;
  wire [(2'h2):(1'h0)] wire236;
  wire [(4'h9):(1'h0)] wire235;
  wire signed [(5'h13):(1'h0)] wire234;
  wire [(4'h9):(1'h0)] wire233;
  wire [(4'hf):(1'h0)] wire230;
  wire [(5'h10):(1'h0)] wire228;
  wire [(5'h14):(1'h0)] wire227;
  wire signed [(4'hf):(1'h0)] wire226;
  wire [(4'h8):(1'h0)] wire225;
  wire signed [(4'hc):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire223;
  reg signed [(3'h6):(1'h0)] reg232 = (1'h0);
  reg [(3'h4):(1'h0)] reg231 = (1'h0);
  assign y = {wire240,
                 wire239,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire230,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire73,
                 wire223,
                 reg232,
                 reg231,
                 (1'h0)};
  module4 #() modinst74 (.wire5(wire2), .wire6(wire3), .clk(clk), .wire8(wire0), .wire7(wire1), .y(wire73));
  module75 #() modinst224 (wire223, clk, wire2, wire1, wire0, wire73, wire3);
  assign wire225 = wire73;
  assign wire226 = (wire3 < wire1);
  assign wire227 = wire225[(3'h5):(1'h0)];
  module85 #() modinst229 (.y(wire228), .wire86(wire3), .wire89(wire226), .clk(clk), .wire87(wire0), .wire88(wire1));
  assign wire230 = $unsigned(((&$signed($unsigned(wire0))) ?
                       $unsigned((^$signed(wire226))) : (^wire2[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      reg231 <= $unsigned((8'hae));
      reg232 <= ((wire226 <= (-wire3)) ?
          (~(8'hb0)) : {$signed($signed(((7'h44) ? wire2 : wire0)))});
    end
  assign wire233 = $unsigned(reg232[(1'h1):(1'h0)]);
  assign wire234 = wire230;
  assign wire235 = $signed($unsigned(wire230[(3'h7):(1'h1)]));
  assign wire236 = $signed(wire0[(4'hd):(2'h2)]);
  assign wire237 = reg232[(3'h4):(3'h4)];
  assign wire238 = (reg231[(3'h4):(1'h1)] ?
                       {{((|wire230) == wire226)}} : wire237[(4'he):(4'hd)]);
  assign wire239 = {(((!(wire1 ? reg232 : wire230)) - (^~$unsigned(wire227))) ?
                           ((wire228[(3'h6):(2'h2)] < (!wire235)) ?
                               ((wire0 ? wire237 : wire0) ?
                                   $signed(wire225) : (wire237 ?
                                       wire225 : reg232)) : ((wire228 ^~ wire1) ?
                                   $signed(wire2) : wire226[(2'h3):(2'h2)])) : (~((wire230 - wire238) ?
                               wire223[(4'hc):(2'h3)] : $signed(wire73)))),
                       ($signed((-(~wire230))) ?
                           wire0[(3'h6):(1'h0)] : wire230[(2'h2):(1'h1)])};
  assign wire240 = $unsigned(((!(~&(wire73 != wire237))) != (&(^~{wire236}))));
endmodule

module module75  (y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire80;
  input wire [(5'h14):(1'h0)] wire79;
  input wire [(5'h11):(1'h0)] wire78;
  input wire signed [(4'h8):(1'h0)] wire77;
  input wire signed [(4'he):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire221;
  wire [(4'hb):(1'h0)] wire220;
  wire signed [(4'hb):(1'h0)] wire188;
  wire signed [(4'h9):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire190;
  wire [(2'h2):(1'h0)] wire218;
  reg [(4'ha):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  assign y = {wire221,
                 wire220,
                 wire188,
                 wire125,
                 wire123,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire190,
                 wire218,
                 reg222,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 (1'h0)};
  assign wire81 = (^($unsigned($unsigned(wire80[(2'h3):(1'h0)])) ?
                      wire80 : (8'h9f)));
  assign wire82 = {$unsigned((^wire76[(4'h9):(3'h7)])), wire78[(3'h6):(1'h0)]};
  assign wire83 = ($signed(wire81) != $unsigned(wire82[(4'h8):(3'h5)]));
  assign wire84 = ($signed(wire76) & (~&$unsigned(({wire82,
                      wire81} != $unsigned(wire81)))));
  module85 #() modinst124 (.wire87(wire83), .clk(clk), .wire88(wire76), .y(wire123), .wire89(wire79), .wire86(wire78));
  assign wire125 = wire83;
  always
    @(posedge clk) begin
      reg126 <= (-(((~|$signed(wire81)) << (&(wire123 ? wire76 : (8'h9e)))) ?
          $signed(wire80) : (wire125[(2'h2):(2'h2)] ?
              $signed((wire80 - wire123)) : (wire82 < ((8'ha4) ?
                  wire83 : wire84)))));
      if ($signed((~((wire83[(1'h1):(1'h1)] ?
              (-wire84) : (wire82 ? wire78 : wire82)) ?
          (-wire77) : ($unsigned(wire84) <<< (wire80 ^~ (8'ha5)))))))
        begin
          reg127 <= {($signed(wire81[(3'h6):(1'h1)]) | (&wire81[(3'h6):(3'h4)])),
              $signed(wire83[(1'h0):(1'h0)])};
          reg128 <= (wire82 || ((~((wire84 != (8'ha6)) ? {wire76} : wire83)) ?
              wire76[(2'h2):(1'h0)] : (^~((wire76 ^~ (8'ha6)) > wire77))));
        end
      else
        begin
          reg127 <= (^~($unsigned(reg128) << $signed(wire84)));
        end
      reg129 <= wire77;
      reg130 <= wire125;
    end
  module131 #() modinst189 (wire188, clk, wire123, wire76, wire79, wire78, wire81);
  assign wire190 = $signed($signed((~|(wire76[(3'h5):(2'h3)] ?
                       (~(7'h41)) : wire79[(3'h4):(2'h2)]))));
  module191 #() modinst219 (wire218, clk, reg128, wire83, wire82, wire190);
  assign wire220 = ((8'had) ?
                       ((8'ha8) >>> $signed(wire125)) : $signed((|(&wire84[(2'h2):(1'h1)]))));
  assign wire221 = (~|wire78[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      reg222 <= (8'ha7);
    end
endmodule

module module4
#(parameter param72 = (~^(~&((((8'hae) - (8'h9d)) ? ((8'ha2) ? (7'h40) : (8'hb3)) : ((8'hab) <<< (8'hbe))) || (~|((8'ha2) >= (8'ha8)))))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  assign y = {wire70,
                 wire19,
                 wire18,
                 wire11,
                 wire10,
                 wire9,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire9 = ({((wire7[(3'h4):(2'h3)] ^ (~|wire6)) ?
                         (7'h44) : $unsigned($signed(wire7)))} - (~$unsigned(wire7[(5'h15):(4'h9)])));
  assign wire10 = $unsigned(wire5[(4'hf):(3'h7)]);
  assign wire11 = wire8[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg12 <= $signed($signed(wire5));
      if (($unsigned($signed($signed((!wire5)))) ?
          (wire5[(4'hb):(3'h5)] | wire5[(5'h10):(4'hd)]) : $signed((wire10[(1'h0):(1'h0)] >> (+(|wire8))))))
        begin
          reg13 <= {($signed(wire7) + ($signed({wire5}) || wire10))};
        end
      else
        begin
          reg13 <= ($unsigned($unsigned($unsigned((wire7 ? reg12 : wire7)))) ?
              {({(reg13 ? (8'ha2) : wire5), $unsigned(wire5)} ?
                      (reg12[(2'h3):(1'h1)] ?
                          wire5[(2'h3):(2'h2)] : wire5[(4'hc):(2'h2)]) : (^~wire11)),
                  $signed(($unsigned((8'ha1)) ?
                      $signed(wire9) : wire9[(3'h6):(3'h6)]))} : reg12);
          reg14 <= $signed((($unsigned(wire11) || (^~(wire11 ?
              wire5 : wire8))) ^ {(wire8[(3'h4):(2'h3)] < (~^wire9)),
              $signed((wire11 | wire10))}));
          reg15 <= ({$signed((!$signed((8'h9f))))} > ((($signed(reg13) >>> $unsigned((8'hb6))) ?
                  $unsigned((wire10 ?
                      wire8 : (8'h9e))) : wire10[(2'h3):(2'h3)]) ?
              wire8[(3'h4):(1'h0)] : (~^(~&wire8[(2'h2):(1'h1)]))));
          reg16 <= wire7[(5'h11):(1'h0)];
        end
      reg17 <= (~&(-reg16[(4'hc):(2'h3)]));
    end
  assign wire18 = (reg13 || $signed($unsigned(wire5)));
  assign wire19 = reg17;
  module20 #() modinst71 (.wire22(wire19), .clk(clk), .wire24(wire18), .wire21(reg13), .wire23(wire8), .y(wire70), .wire25(wire5));
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire25;
  input wire [(3'h5):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  input wire signed [(4'hb):(1'h0)] wire22;
  input wire signed [(5'h11):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
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
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire26 = ((~$signed(wire21[(3'h7):(3'h5)])) << (+$unsigned(wire23[(3'h6):(3'h6)])));
  assign wire27 = (+((8'had) << $unsigned((8'had))));
  assign wire28 = ((!$signed($unsigned($unsigned((8'hb0))))) ?
                      $signed(((wire23[(3'h4):(1'h0)] >= {wire25,
                          (8'ha1)}) ^~ ($signed((8'hb9)) ?
                          $unsigned(wire22) : wire24[(3'h4):(1'h1)]))) : $signed($unsigned((+(-wire23)))));
  assign wire29 = ((|(8'hb3)) ? $unsigned(wire25) : wire26);
  assign wire30 = wire24[(3'h4):(2'h2)];
  assign wire31 = $signed((&wire23));
  assign wire32 = ((~^(8'hb1)) ?
                      $signed((((wire23 || wire31) ?
                          wire29[(2'h3):(2'h2)] : {wire28}) + ((wire27 ?
                          wire25 : wire23) ~^ (^wire28)))) : wire28);
  assign wire33 = {wire24[(1'h1):(1'h1)]};
  assign wire34 = {wire33,
                      (wire30 >> ((8'haf) - $unsigned((wire29 == wire27))))};
  assign wire35 = (|wire22);
  always
    @(posedge clk) begin
      if ($unsigned(((&((8'hb9) ? {wire21} : wire35)) ?
          ($unsigned($unsigned(wire23)) ?
              ((!wire30) ?
                  $unsigned(wire35) : {wire23}) : wire21[(3'h4):(2'h3)]) : {$unsigned(wire26)})))
        begin
          reg36 <= wire28;
          reg37 <= wire28;
        end
      else
        begin
          reg36 <= ($signed(wire29) < $unsigned(wire35));
          reg37 <= wire25;
          reg38 <= {(+(~^((+reg37) <= $unsigned(wire26))))};
          reg39 <= $signed((((~^$unsigned(wire23)) ?
              $unsigned((8'hb7)) : wire31[(1'h1):(1'h1)]) < {wire22}));
          reg40 <= ($signed($unsigned(wire30)) ?
              ({$unsigned((|wire32)), ($unsigned(wire23) <= {(8'hb2)})} ?
                  reg39[(3'h7):(2'h3)] : reg37) : $unsigned(wire22));
        end
      if ((&($unsigned(((reg37 ? wire25 : wire32) ?
          wire33 : wire28[(1'h0):(1'h0)])) <= wire32)))
        begin
          reg41 <= wire30[(1'h1):(1'h1)];
        end
      else
        begin
          if ($unsigned(({$unsigned((wire30 ? reg41 : wire23)),
              reg37} < $unsigned((wire31 == (reg40 ? wire33 : wire24))))))
            begin
              reg41 <= $unsigned($unsigned($signed((!$signed(wire27)))));
              reg42 <= ({$unsigned($signed($signed(wire29)))} ^~ wire29[(2'h3):(1'h0)]);
            end
          else
            begin
              reg41 <= (-wire24);
            end
          reg43 <= $signed(wire25[(2'h2):(1'h0)]);
          reg44 <= $unsigned(wire26);
          if ($unsigned(wire24))
            begin
              reg45 <= $unsigned(wire30);
              reg46 <= (^{(reg44 == (wire35[(1'h1):(1'h0)] + $unsigned(reg37))),
                  (8'haa)});
              reg47 <= ((($unsigned(reg44) ?
                  ((wire30 || wire31) >>> {wire31,
                      reg42}) : (+wire28)) && (~^reg36[(4'ha):(3'h4)])) | (reg45 ?
                  $signed((8'had)) : {$signed((wire35 ? wire23 : wire25)),
                      wire27}));
              reg48 <= (((($unsigned(wire35) <= (!wire35)) ?
                      reg43 : ($unsigned(wire30) * wire32)) ?
                  ($signed({reg41}) ?
                      $signed((^~(8'hb1))) : (reg42[(1'h1):(1'h1)] >> ((8'ha8) ?
                          reg46 : reg39))) : wire29[(3'h7):(3'h7)]) >= (((&$signed(wire26)) * wire25) + (+(~&(wire28 ?
                  (8'hb1) : wire28)))));
              reg49 <= {reg43[(5'h12):(3'h5)]};
            end
          else
            begin
              reg45 <= {(^((~|(reg38 ? reg48 : wire27)) ?
                      ((reg48 >> (8'hbb)) ?
                          reg41 : ((8'h9d) ? (8'ha9) : (8'h9e))) : wire26)),
                  reg40[(2'h3):(2'h3)]};
              reg46 <= (wire22 <<< $unsigned(($signed(((8'hb8) ?
                      wire34 : reg49)) ?
                  $signed((wire30 ? reg47 : wire21)) : (wire21[(4'hd):(2'h2)] ?
                      $signed(wire22) : (reg39 ? (8'hbc) : reg47)))));
              reg47 <= (wire27[(3'h4):(1'h1)] ?
                  {wire27[(3'h5):(1'h0)]} : $unsigned((reg41[(4'hd):(4'h9)] != reg39)));
              reg48 <= reg49;
            end
          reg50 <= $unsigned(({(((7'h41) ? wire31 : wire21) ?
                  wire34[(2'h3):(2'h3)] : $signed(wire30)),
              ((reg42 >>> reg44) + (8'hb7))} - $signed(({wire32} ?
              reg36[(4'hd):(3'h5)] : $unsigned(reg39)))));
        end
      reg51 <= ((~&$signed(wire30)) ~^ $unsigned(reg40));
      if (($unsigned($signed((reg41 ? $signed(wire30) : $unsigned(reg38)))) ?
          reg44 : (~^(|reg44))))
        begin
          if ($unsigned(reg45[(5'h11):(3'h6)]))
            begin
              reg52 <= (!{(|$signed(wire27)),
                  ($unsigned((^~reg38)) <= wire24[(2'h3):(2'h3)])});
            end
          else
            begin
              reg52 <= wire24[(1'h0):(1'h0)];
              reg53 <= $signed(wire23[(2'h2):(2'h2)]);
            end
          reg54 <= (8'hae);
          if ($signed((|(&reg50))))
            begin
              reg55 <= reg45;
              reg56 <= reg43[(4'h8):(3'h5)];
              reg57 <= $unsigned(wire25);
            end
          else
            begin
              reg55 <= {$unsigned(wire23[(4'h8):(2'h2)]),
                  {((((8'hbf) < reg36) ? $unsigned(wire30) : $signed(wire35)) ?
                          (|reg41[(4'hb):(3'h7)]) : (~&(reg41 | (8'hbe))))}};
              reg56 <= ($unsigned(reg39[(3'h5):(2'h3)]) ^ (~reg54[(4'hb):(3'h5)]));
              reg57 <= wire29;
              reg58 <= reg52;
            end
          if (wire34[(3'h7):(3'h7)])
            begin
              reg59 <= wire21;
              reg60 <= (reg56[(2'h2):(1'h1)] == reg56[(2'h3):(1'h1)]);
              reg61 <= ($unsigned(reg49[(1'h1):(1'h0)]) >= (!(reg51[(1'h0):(1'h0)] ?
                  $unsigned((reg46 ? reg51 : reg49)) : reg53[(3'h4):(2'h2)])));
            end
          else
            begin
              reg59 <= $unsigned((reg50 | ($unsigned({wire21}) != $signed(wire26[(1'h1):(1'h1)]))));
              reg60 <= reg47;
            end
          if ($signed($unsigned(reg41[(4'hd):(1'h1)])))
            begin
              reg62 <= {({reg37[(3'h7):(3'h4)], reg57} ?
                      wire34[(3'h4):(3'h4)] : {reg41[(5'h11):(4'h9)]})};
              reg63 <= {wire22[(4'h9):(3'h4)]};
              reg64 <= $signed((wire34 ?
                  $signed(reg57[(2'h3):(2'h3)]) : (wire29 >> (wire25 && (wire31 ?
                      reg61 : reg44)))));
            end
          else
            begin
              reg62 <= {$unsigned($signed(reg37))};
            end
        end
      else
        begin
          if (({$signed(wire32), wire23} ?
              (~{(reg51 ? {wire21, reg54} : (wire23 ? (8'hb2) : reg61)),
                  (~&reg37[(4'ha):(4'h9)])}) : {((reg43[(3'h6):(1'h0)] ?
                      (|reg55) : (|reg50)) >= reg38[(1'h1):(1'h1)])}))
            begin
              reg52 <= (((~^$unsigned((~reg63))) ?
                  reg37 : wire24[(3'h5):(3'h4)]) == {(reg56[(2'h2):(1'h0)] != wire23[(1'h0):(1'h0)]),
                  $signed((8'hb6))});
              reg53 <= wire24;
            end
          else
            begin
              reg52 <= (reg62[(3'h5):(3'h4)] ?
                  $signed($unsigned({$unsigned(reg63),
                      (reg36 & wire23)})) : reg58[(3'h6):(2'h2)]);
            end
          reg54 <= (~|reg41[(5'h10):(4'h8)]);
          reg55 <= (reg57 ?
              (~^(((reg40 && wire34) ?
                  $signed(reg60) : $unsigned(wire30)) ^~ reg61[(4'h9):(2'h3)])) : (reg58[(3'h7):(3'h5)] & (!{wire35[(4'hb):(3'h4)],
                  {reg50}})));
          reg56 <= $unsigned((|(((|reg39) == (reg39 != (7'h43))) << ((wire30 << wire35) ?
              reg52 : $signed(reg55)))));
        end
      reg65 <= (~^(wire26[(1'h1):(1'h1)] ?
          (reg51 ? reg57[(3'h7):(2'h3)] : {(!reg50)}) : ((~|$unsigned(reg47)) ?
              ({(8'ha1)} ^ $signed(reg46)) : ((reg62 && wire30) || $unsigned(reg38)))));
    end
  assign wire66 = (((($unsigned(reg40) ? reg64 : (&reg38)) ?
                          reg41[(3'h6):(3'h6)] : reg38[(3'h4):(2'h2)]) | wire25) ?
                      wire29[(4'hb):(3'h7)] : reg60);
  assign wire67 = reg45[(5'h11):(5'h11)];
  assign wire68 = (reg45 ?
                      ({reg53} == $signed($unsigned((reg37 ?
                          wire29 : (8'hbb))))) : reg43[(1'h0):(1'h0)]);
  assign wire69 = $unsigned($unsigned((+(~(~^reg44)))));
endmodule

module module191
#(parameter param217 = (!{({((8'hbc) ^ (8'ha6)), {(8'ha0)}} ? ((|(8'hb2)) <= ((8'hb5) ? (7'h44) : (8'hb6))) : ({(8'haf), (8'hac)} != (^~(8'hba)))), ((~(+(8'ha6))) ? (((8'haa) ? (8'h9c) : (8'hbb)) >> {(8'hb0)}) : ({(8'hbe), (8'ha5)} || ((7'h41) < (8'ha0))))}))
(y, clk, wire195, wire194, wire193, wire192);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire195;
  input wire [(4'hf):(1'h0)] wire194;
  input wire [(3'h4):(1'h0)] wire193;
  input wire [(5'h10):(1'h0)] wire192;
  wire [(5'h13):(1'h0)] wire216;
  wire signed [(4'hc):(1'h0)] wire215;
  wire [(4'ha):(1'h0)] wire213;
  wire [(5'h14):(1'h0)] wire212;
  wire [(2'h3):(1'h0)] wire211;
  wire signed [(5'h14):(1'h0)] wire209;
  wire signed [(2'h2):(1'h0)] wire208;
  wire [(4'h8):(1'h0)] wire207;
  wire signed [(4'h9):(1'h0)] wire206;
  wire [(5'h12):(1'h0)] wire196;
  reg signed [(5'h13):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg210 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg205 = (1'h0);
  reg [(4'hb):(1'h0)] reg204 = (1'h0);
  reg [(5'h11):(1'h0)] reg203 = (1'h0);
  reg [(4'hd):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg201 = (1'h0);
  reg [(5'h14):(1'h0)] reg200 = (1'h0);
  reg [(5'h12):(1'h0)] reg199 = (1'h0);
  reg [(4'h8):(1'h0)] reg198 = (1'h0);
  reg [(4'hb):(1'h0)] reg197 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire213,
                 wire212,
                 wire211,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire196,
                 reg214,
                 reg210,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 (1'h0)};
  assign wire196 = $signed(wire193[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg197 <= ((~^({(wire195 ~^ wire193),
              wire193[(3'h4):(2'h3)]} <= wire194[(4'ha):(3'h6)])) ?
          wire196 : wire194[(4'he):(1'h0)]);
      if ((~^(($signed((|wire194)) <<< ($unsigned(reg197) ?
          wire196[(3'h7):(3'h6)] : (&wire192))) ~^ $signed(wire193[(1'h1):(1'h1)]))))
        begin
          reg198 <= wire193[(1'h1):(1'h1)];
          reg199 <= (~|$unsigned(((^~$unsigned(wire194)) ?
              $signed(wire194[(4'ha):(4'h8)]) : wire196)));
          reg200 <= (|(+(reg199[(4'hf):(4'hf)] ?
              $unsigned(wire195) : $signed((wire192 ? reg197 : reg197)))));
          reg201 <= $signed($signed((reg199[(4'ha):(1'h1)] == (!wire192[(4'he):(1'h0)]))));
        end
      else
        begin
          if ({wire196})
            begin
              reg198 <= {$unsigned(((~(reg201 ? reg198 : (7'h44))) ?
                      wire194 : reg199[(4'hb):(3'h5)]))};
            end
          else
            begin
              reg198 <= $signed(($unsigned((reg200[(4'hf):(4'he)] ^ (~|wire195))) != wire193));
              reg199 <= ((reg198 & reg200[(4'hd):(1'h1)]) ?
                  ((~|($signed(reg199) && wire192)) ?
                      (7'h40) : wire193[(2'h2):(1'h0)]) : reg200);
              reg200 <= wire193;
              reg201 <= wire192[(4'hd):(4'hb)];
            end
          if ($signed((wire192 ?
              (reg197 <= reg197[(3'h5):(3'h5)]) : ($unsigned((7'h41)) | $unsigned($signed(reg197))))))
            begin
              reg202 <= ((^~(~^((reg197 && reg197) ?
                  $signed(wire196) : (wire195 >= (8'ha7))))) && reg200[(3'h4):(1'h0)]);
              reg203 <= {$signed(($signed($signed(reg202)) ?
                      reg199[(5'h12):(3'h7)] : $signed((wire193 != wire195)))),
                  (&(wire192[(4'hb):(4'h9)] ?
                      ((reg200 ? wire194 : wire196) == {reg201,
                          wire193}) : $unsigned(reg201)))};
              reg204 <= (^({reg197[(4'h9):(2'h2)],
                  {(reg202 ? wire195 : wire193),
                      $unsigned(wire193)}} >= ($signed(wire192[(3'h5):(1'h0)]) == ($signed(wire196) ?
                  $signed(wire196) : ((8'hb0) <= reg202)))));
            end
          else
            begin
              reg202 <= wire192;
            end
        end
      reg205 <= (($unsigned($signed((reg197 ? wire194 : reg198))) || wire194) ?
          (($signed(wire192[(3'h4):(2'h2)]) - reg203[(4'hc):(1'h0)]) ?
              wire194 : reg198[(1'h0):(1'h0)]) : reg201);
    end
  assign wire206 = $signed((wire196[(5'h12):(4'hb)] ?
                       wire195[(2'h3):(2'h3)] : (^reg198[(3'h7):(3'h5)])));
  assign wire207 = reg204;
  assign wire208 = $unsigned(wire195);
  assign wire209 = $signed(($signed(reg205[(2'h3):(1'h1)]) ?
                       ({wire194} ?
                           $unsigned($signed(wire195)) : reg204) : reg203));
  always
    @(posedge clk) begin
      reg210 <= (^~((|((wire209 - (8'hb3)) ~^ $signed(reg200))) * reg199));
    end
  assign wire211 = (^~(-(reg200[(4'hc):(3'h5)] ~^ reg210)));
  assign wire212 = $signed(reg199[(2'h3):(2'h2)]);
  assign wire213 = $unsigned((^~($unsigned((~reg199)) + $signed($signed((8'ha0))))));
  always
    @(posedge clk) begin
      reg214 <= $unsigned(wire212[(5'h11):(3'h4)]);
    end
  assign wire215 = $unsigned((reg200 <<< reg214));
  assign wire216 = $signed({$unsigned(((&reg201) ?
                           wire206 : (wire215 ? reg197 : reg199))),
                       $signed($signed(reg200[(5'h13):(2'h3)]))});
endmodule

module module131  (y, clk, wire136, wire135, wire134, wire133, wire132);
  output wire [(32'h22b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire136;
  input wire signed [(4'he):(1'h0)] wire135;
  input wire signed [(5'h14):(1'h0)] wire134;
  input wire signed [(4'hc):(1'h0)] wire133;
  input wire signed [(3'h7):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire187;
  wire [(3'h6):(1'h0)] wire186;
  wire signed [(3'h5):(1'h0)] wire163;
  wire signed [(5'h13):(1'h0)] wire162;
  wire [(4'h9):(1'h0)] wire161;
  wire signed [(5'h10):(1'h0)] wire160;
  wire signed [(3'h6):(1'h0)] wire159;
  wire [(5'h13):(1'h0)] wire158;
  wire signed [(4'h8):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire156;
  wire [(4'h9):(1'h0)] wire155;
  wire [(2'h3):(1'h0)] wire154;
  wire [(5'h14):(1'h0)] wire153;
  wire signed [(5'h10):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire147;
  wire [(4'h9):(1'h0)] wire146;
  wire [(4'h8):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire137;
  reg [(4'hf):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  reg [(4'hd):(1'h0)] reg182 = (1'h0);
  reg [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(5'h12):(1'h0)] reg180 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg179 = (1'h0);
  reg [(4'h9):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg177 = (1'h0);
  reg [(4'hf):(1'h0)] reg176 = (1'h0);
  reg [(3'h5):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg174 = (1'h0);
  reg [(4'hd):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(4'h9):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg168 = (1'h0);
  reg [(3'h4):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg165 = (1'h0);
  reg [(2'h2):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg139 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire147,
                 wire146,
                 wire138,
                 wire137,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 (1'h0)};
  assign wire137 = {wire135, wire132};
  assign wire138 = $signed((wire136[(2'h2):(1'h1)] ?
                       (((wire133 <= wire136) || wire137[(1'h0):(1'h0)]) ?
                           $unsigned({wire136}) : ((wire133 ?
                               wire135 : wire136) ~^ (^wire134))) : $unsigned((+$signed(wire132)))));
  always
    @(posedge clk) begin
      if (wire137[(4'hc):(1'h1)])
        begin
          if (wire136[(1'h1):(1'h0)])
            begin
              reg139 <= $unsigned($unsigned(wire132[(3'h7):(3'h6)]));
              reg140 <= wire132[(2'h3):(2'h2)];
              reg141 <= reg139[(4'hf):(1'h0)];
              reg142 <= wire137[(4'hf):(4'hd)];
              reg143 <= $signed($unsigned((wire134[(2'h3):(2'h2)] ?
                  reg140 : ((reg140 ? reg139 : (8'haf)) <<< (wire132 ?
                      wire137 : (7'h40))))));
            end
          else
            begin
              reg139 <= ($signed(((~|reg141[(3'h4):(2'h2)]) ?
                      ($signed((8'h9d)) ?
                          wire136 : $signed((8'haf))) : wire136)) ?
                  reg140[(1'h1):(1'h0)] : $unsigned(((&$signed((8'hb7))) ?
                      ((^wire137) ?
                          wire137 : (reg139 <= wire135)) : ((~&reg142) >> (wire132 ?
                          reg141 : reg143)))));
              reg140 <= $signed($unsigned((~^(reg143[(5'h11):(3'h4)] ?
                  (wire138 > wire135) : {wire136}))));
              reg141 <= ({(~|(!reg142))} >= reg139);
              reg142 <= $signed((8'haf));
            end
          reg144 <= reg141[(2'h3):(1'h0)];
        end
      else
        begin
          if (((wire134[(2'h2):(1'h0)] ?
                  {reg141,
                      reg141[(1'h1):(1'h1)]} : (wire138 ~^ wire134[(1'h0):(1'h0)])) ?
              wire132 : {($unsigned(wire137[(3'h5):(1'h0)]) ?
                      (reg139 ?
                          (wire136 ?
                              wire138 : wire135) : (wire132 <= wire138)) : wire137),
                  wire136[(1'h0):(1'h0)]}))
            begin
              reg139 <= $signed($unsigned(wire136[(1'h1):(1'h1)]));
              reg140 <= reg139;
              reg141 <= (wire133 ^~ $unsigned($unsigned(wire132[(3'h5):(3'h5)])));
              reg142 <= $unsigned(reg142[(4'hb):(4'ha)]);
              reg143 <= reg141;
            end
          else
            begin
              reg139 <= (((((reg144 || reg140) ?
                      $signed(wire135) : wire135) && {(wire138 ^ reg140),
                      (^wire132)}) ?
                  reg141[(3'h5):(2'h3)] : ($signed(reg141[(3'h4):(1'h0)]) >> wire136[(1'h0):(1'h0)])) <= (|$unsigned(({(8'hbc),
                      (8'ha9)} ?
                  (wire136 ^~ wire133) : (^~reg144)))));
              reg140 <= $signed((reg141 ?
                  {((wire135 >> reg141) ^ (reg139 ^~ reg139)),
                      wire137[(4'h8):(3'h6)]} : $unsigned($signed($signed(wire132)))));
              reg141 <= $unsigned({wire135[(2'h3):(1'h0)],
                  $unsigned({wire138})});
              reg142 <= wire133;
            end
        end
      reg145 <= reg142;
    end
  assign wire146 = {{(($unsigned(wire137) ^ $signed(wire135)) | reg143)}};
  assign wire147 = wire134[(5'h12):(3'h4)];
  always
    @(posedge clk) begin
      reg148 <= ($signed(reg140[(4'hc):(4'hb)]) < ((reg144[(3'h5):(3'h5)] <= (^~{reg143,
          wire135})) > (wire135 ? wire146 : (7'h43))));
      reg149 <= $unsigned($unsigned({(wire135 - wire133)}));
      reg150 <= wire135;
      reg151 <= (wire135[(4'hc):(1'h0)] && $signed(({((8'hb0) ?
              reg140 : wire133),
          reg150} != $signed(wire135[(4'ha):(1'h1)]))));
    end
  assign wire152 = reg145;
  assign wire153 = {(!$unsigned(wire133[(4'ha):(4'h9)])),
                       (-($unsigned((~&reg150)) <<< $signed(reg143)))};
  assign wire154 = wire153[(5'h12):(5'h11)];
  assign wire155 = ($signed($signed((+reg143[(1'h1):(1'h1)]))) ?
                       {$signed($unsigned({wire152})),
                           (reg151[(3'h5):(3'h5)] ?
                               $signed(wire132[(3'h7):(2'h3)]) : reg139[(1'h0):(1'h0)])} : $signed(((~|(reg140 ?
                               wire135 : wire146)) ?
                           (8'ha6) : (reg142 | $signed(wire135)))));
  assign wire156 = wire154;
  assign wire157 = $unsigned(($unsigned(($unsigned(reg139) ?
                           ((8'ha0) == wire146) : (&wire152))) ?
                       (wire156 != $signed((^wire146))) : wire153));
  assign wire158 = wire154[(1'h1):(1'h0)];
  assign wire159 = (wire132 ?
                       {(($unsigned(reg141) & wire158) * $unsigned(wire132[(3'h4):(1'h1)])),
                           reg148[(4'h9):(3'h5)]} : reg149);
  assign wire160 = wire137[(2'h3):(1'h0)];
  assign wire161 = $signed((^~{{(&(8'h9e)), {reg149}}}));
  assign wire162 = ((^~wire156[(4'ha):(3'h5)]) ~^ $unsigned((reg139 ?
                       wire136 : (reg142 < $unsigned(reg148)))));
  assign wire163 = wire157[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if ((reg151 || $signed(($unsigned(reg142[(4'hb):(4'ha)]) ^ (|wire162)))))
        begin
          reg164 <= reg149[(1'h0):(1'h0)];
          reg165 <= reg164;
          reg166 <= ($unsigned(reg150) ?
              $signed((!wire135[(4'h8):(3'h4)])) : ((($unsigned(wire163) ^~ (~wire160)) ?
                      $unsigned($signed(wire160)) : ((reg150 ?
                          wire137 : reg150) <= {wire136})) ?
                  (8'hb6) : wire157[(3'h5):(3'h4)]));
        end
      else
        begin
          reg164 <= reg149[(1'h0):(1'h0)];
          if (reg148[(2'h3):(1'h1)])
            begin
              reg165 <= wire133;
              reg166 <= (~|$signed(wire161));
              reg167 <= ((~&{(~&(wire163 >= wire163)),
                  $unsigned(wire138[(3'h5):(1'h0)])}) - {(wire146[(2'h2):(1'h0)] <<< (^(-reg148)))});
              reg168 <= (reg142[(2'h2):(1'h0)] * $unsigned({(~&(&reg164))}));
            end
          else
            begin
              reg165 <= (~wire132[(2'h2):(2'h2)]);
              reg166 <= $unsigned($signed($unsigned(reg164)));
              reg167 <= wire146;
              reg168 <= $unsigned((($signed(((8'haa) ? wire154 : wire134)) ?
                  (wire156[(3'h4):(1'h1)] <= {wire152}) : ((reg150 ~^ reg164) << $unsigned(wire157))) ~^ (($signed(reg167) ?
                  $unsigned(wire163) : (wire162 ^~ (8'h9c))) <<< ((wire137 ?
                  wire156 : (8'haf)) > (&(8'hae))))));
            end
          if (($unsigned((|wire155)) + (~^{wire162})))
            begin
              reg169 <= (^~wire157);
            end
          else
            begin
              reg169 <= $unsigned(reg145);
              reg170 <= $unsigned((({(~wire160)} == (8'hb4)) ?
                  wire163 : wire153[(4'h9):(1'h0)]));
              reg171 <= wire161[(1'h0):(1'h0)];
              reg172 <= ($signed(((^((8'haf) * wire162)) ?
                      $signed((wire136 ?
                          (8'hb2) : reg166)) : $unsigned(reg171[(1'h1):(1'h1)]))) ?
                  (reg140 - {$signed((wire159 ?
                          (8'ha8) : reg168))}) : {$signed(wire153[(3'h5):(3'h4)])});
              reg173 <= ($signed((~|wire147[(3'h7):(1'h0)])) & (reg168[(3'h4):(1'h1)] - (&((wire161 ?
                      reg145 : wire138) ?
                  {wire136} : $unsigned(reg148)))));
            end
          reg174 <= $unsigned((8'h9c));
        end
      reg175 <= (({((&reg140) ^~ wire135[(4'he):(4'h8)]),
                  ($signed(wire133) & (reg151 ? reg170 : (8'ha9)))} ?
              wire132 : wire159[(3'h6):(1'h0)]) ?
          {($unsigned((reg144 ? (8'h9e) : reg171)) ?
                  {((8'ha8) <= wire157),
                      (wire153 ?
                          wire163 : reg148)} : ($signed(wire153) * wire134)),
              (wire132[(3'h6):(1'h0)] != {reg174})} : (wire134 ?
              wire154 : (&reg170[(3'h5):(2'h3)])));
      reg176 <= {$unsigned($signed($signed(((8'h9f) < wire138)))),
          (({(!reg165)} ? ({(8'ha9)} + reg145[(2'h2):(1'h0)]) : (8'ha4)) ?
              {{reg142}, {(wire158 << wire146), $signed(reg143)}} : (wire135 ?
                  (|wire137) : (((8'ha4) ?
                      reg173 : wire137) | $signed(wire133))))};
      reg177 <= (~$signed(($signed(reg169) ?
          (reg168 ?
              $signed(wire152) : (reg149 * wire132)) : wire152[(5'h10):(4'h8)])));
      if ((8'hb0))
        begin
          reg178 <= reg166[(2'h3):(2'h3)];
        end
      else
        begin
          reg178 <= (reg174 ~^ wire155[(4'h8):(1'h0)]);
          reg179 <= (8'hb5);
          reg180 <= $signed(((((8'hb1) ^~ reg150[(3'h6):(1'h1)]) < $signed($unsigned(wire146))) ?
              (8'had) : reg169));
          reg181 <= wire154;
          reg182 <= ($unsigned((~&$signed(reg140[(4'hc):(3'h4)]))) <<< reg172[(1'h1):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg183 <= (~(^{(+$signed(reg181)), (~wire162)}));
      reg184 <= {$unsigned($signed(((reg171 + (8'hb4)) >= wire163))),
          {$unsigned($unsigned({wire134}))}};
      reg185 <= $unsigned((reg150[(2'h2):(2'h2)] ?
          $signed(($signed(reg165) ^ $unsigned(reg144))) : ($unsigned(reg140) ?
              (~&$signed(reg144)) : reg178)));
    end
  assign wire186 = reg140;
  assign wire187 = wire146;
endmodule

module module85  (y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire89;
  input wire signed [(4'hd):(1'h0)] wire88;
  input wire [(2'h3):(1'h0)] wire87;
  input wire [(5'h11):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire120;
  wire signed [(3'h4):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire116;
  wire signed [(3'h4):(1'h0)] wire115;
  wire signed [(4'h9):(1'h0)] wire114;
  wire [(4'hb):(1'h0)] wire101;
  wire [(5'h10):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire90;
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire90 = {$unsigned($unsigned($unsigned(wire86[(4'hb):(4'hb)])))};
  assign wire91 = (~|((((wire86 || wire87) <<< (wire86 || wire87)) ?
                      $unsigned((wire89 ? wire89 : wire87)) : ({wire88,
                          (7'h43)} == $signed(wire86))) < ($signed(wire90) << $signed(wire90))));
  assign wire92 = wire87[(2'h3):(2'h2)];
  assign wire93 = (wire90 * (((wire91 ? wire90 : $signed(wire87)) ?
                          (wire92 ?
                              ((8'hab) ? wire87 : wire92) : ((8'ha1) ?
                                  wire90 : wire88)) : (8'h9c)) ?
                      {$unsigned(((8'hbb) || wire89))} : wire90[(5'h11):(4'h9)]));
  assign wire94 = $signed((wire86[(3'h7):(2'h3)] ?
                      $unsigned($signed((wire87 <= wire86))) : wire86));
  assign wire95 = (~$unsigned((wire88[(1'h0):(1'h0)] ~^ {{wire91},
                      (wire90 ? wire88 : wire94)})));
  assign wire96 = $unsigned((&($unsigned((8'hb2)) != $unsigned((wire94 & wire90)))));
  assign wire97 = $unsigned({(-wire92[(4'hc):(1'h1)])});
  assign wire98 = ($signed($signed(wire93)) == (~^{(wire97[(3'h6):(1'h1)] >> wire90[(4'he):(1'h1)])}));
  assign wire99 = $unsigned($unsigned((+((wire94 ? wire86 : wire90) ?
                      $unsigned((8'hae)) : wire87[(2'h3):(1'h0)]))));
  assign wire100 = wire98[(3'h4):(1'h0)];
  assign wire101 = ($unsigned($unsigned(((wire95 ? wire89 : (8'hb9)) ?
                       wire99[(2'h3):(2'h2)] : $signed(wire100)))) | $unsigned(({(wire90 ?
                               wire91 : (8'ha8))} ?
                       ($unsigned(wire92) ?
                           wire89[(3'h4):(1'h0)] : (wire90 <<< wire91)) : ({wire90} ?
                           (^~wire92) : wire94))));
  always
    @(posedge clk) begin
      reg102 <= $signed(wire98);
      reg103 <= wire93[(4'h9):(3'h5)];
      reg104 <= $unsigned(({((8'ha8) | $signed(wire90))} ~^ $unsigned({{wire91}})));
      if (reg104[(1'h0):(1'h0)])
        begin
          reg105 <= ((^~$signed((reg103[(1'h0):(1'h0)] | wire89[(3'h4):(3'h4)]))) >= (~((wire94[(4'h9):(3'h5)] + {wire98,
              wire87}) ^~ wire92)));
        end
      else
        begin
          reg105 <= (^~(wire87[(1'h1):(1'h0)] ? wire96 : $unsigned(reg104)));
          reg106 <= $unsigned({$unsigned(((reg102 ? wire97 : wire91) ?
                  (wire100 ? wire92 : reg102) : (wire94 * reg102)))});
          reg107 <= $signed(reg104[(2'h3):(2'h2)]);
          reg108 <= (wire91[(4'hf):(3'h6)] ?
              (reg107 >> (8'hb5)) : ($unsigned($signed(wire89[(2'h3):(1'h0)])) >= (~|$unsigned($unsigned(wire91)))));
          if (wire90)
            begin
              reg109 <= $signed(wire96);
              reg110 <= (8'ha3);
              reg111 <= wire98[(4'h8):(3'h4)];
              reg112 <= ((&((^~$unsigned(wire100)) ?
                      ($signed(reg107) <= wire96[(3'h5):(3'h5)]) : $unsigned($signed(reg104)))) ?
                  reg103[(1'h0):(1'h0)] : (wire96 ?
                      wire94[(4'hb):(3'h4)] : reg106[(2'h2):(1'h0)]));
              reg113 <= ({(((-reg107) <= $unsigned(reg109)) >> (-$signed((8'hb8))))} ?
                  wire95[(3'h7):(3'h7)] : $unsigned($unsigned(reg105[(2'h2):(1'h1)])));
            end
          else
            begin
              reg109 <= wire100;
              reg110 <= ({$unsigned(((reg110 ? wire99 : (7'h44)) == {reg105,
                          wire101})),
                      $signed((|(^reg107)))} ?
                  (reg108 ?
                      wire97[(2'h3):(1'h0)] : ({{wire95,
                              wire97}} < {$signed(reg102),
                          (&wire89)})) : wire99[(2'h2):(1'h1)]);
              reg111 <= (~^$unsigned((&$unsigned($signed((8'hb3))))));
              reg112 <= reg102;
            end
        end
    end
  assign wire114 = reg106;
  assign wire115 = reg107;
  assign wire116 = {wire99[(1'h0):(1'h0)], $signed({reg113[(4'hc):(3'h4)]})};
  assign wire117 = $unsigned({{(!(wire88 ? reg108 : wire92)), (^reg102)},
                       ((((8'hb8) ? wire98 : wire92) ?
                               {wire86} : reg111[(3'h6):(1'h0)]) ?
                           wire91[(4'hc):(3'h5)] : wire88)});
  assign wire118 = ((8'haa) ?
                       (~^$unsigned(((~^wire86) >>> reg112[(3'h6):(1'h1)]))) : (~|({((8'hb6) ?
                                   (8'ha1) : (8'hb4))} ?
                           wire116 : ((wire98 ?
                               reg109 : reg103) + $signed(wire114)))));
  assign wire119 = (!wire98);
  assign wire120 = (-$signed(($unsigned($unsigned(wire117)) ?
                       (-wire92[(4'h8):(1'h0)]) : $unsigned(wire114))));
  assign wire121 = $signed((|wire95[(2'h2):(2'h2)]));
  assign wire122 = $unsigned(({$unsigned((^~(8'hae))),
                           (~(reg105 ? wire117 : reg109))} ?
                       (^~reg113[(4'hb):(2'h3)]) : ({$signed(wire95)} || (+(|wire97)))));
endmodule
