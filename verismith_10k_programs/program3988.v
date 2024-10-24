module top
#(parameter param96 = (((((8'ha0) < ((8'hb7) - (8'ha1))) == (((8'ha8) ? (8'ha9) : (7'h42)) ? ((8'hab) ? (8'hb9) : (8'hb7)) : {(8'ha9), (8'had)})) || {{{(8'h9f)}, ((8'hb0) ? (8'hb1) : (8'hba))}}) < (+(!(+((8'ha1) ~^ (8'hb3)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire80;
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg4 = (1'h0);
  assign y = {wire82,
                 wire10,
                 wire80,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3;
      if (wire2[(5'h10):(4'h8)])
        begin
          if ($unsigned(({wire0[(2'h2):(2'h2)]} ^~ (|(&{wire2})))))
            begin
              reg5 <= $unsigned($unsigned(wire3[(3'h6):(3'h5)]));
              reg6 <= wire2;
            end
          else
            begin
              reg5 <= ((wire2 && reg4[(2'h3):(1'h1)]) ?
                  {$signed(((reg6 == (8'ha8)) ?
                          {(8'ha0), wire3} : wire3[(2'h2):(1'h0)])),
                      $signed((~^wire3[(2'h2):(1'h0)]))} : $unsigned(wire1[(3'h7):(3'h5)]));
              reg6 <= wire1;
            end
        end
      else
        begin
          reg5 <= (reg6[(4'hc):(3'h4)] ?
              reg6[(3'h5):(1'h1)] : {$unsigned(reg6[(4'hb):(3'h6)]), wire3});
          reg6 <= $signed(wire2);
          reg7 <= ((wire1[(3'h4):(3'h4)] ? reg6 : (wire2 << $unsigned(wire3))) ?
              $unsigned(wire0) : reg5);
          reg8 <= (|reg5[(2'h2):(1'h0)]);
        end
      reg9 <= $unsigned(($signed((^~{reg6, wire3})) ?
          ($unsigned(((8'h9c) >>> (8'ha3))) & $unsigned($signed(reg7))) : reg7[(4'hc):(3'h7)]));
    end
  assign wire10 = ($unsigned(reg4[(2'h3):(2'h3)]) < ((8'h9c) - $signed(wire3)));
  module11 #() modinst81 (.clk(clk), .wire15(reg4), .wire16(reg5), .y(wire80), .wire14(wire10), .wire12(reg6), .wire13(reg9));
  assign wire82 = $signed(wire3);
  always
    @(posedge clk) begin
      reg83 <= $signed($unsigned((|wire10[(3'h6):(3'h5)])));
      if (((&{$signed((8'ha8))}) + $unsigned(($unsigned({(7'h40)}) ^~ $unsigned($unsigned(wire80))))))
        begin
          if (reg8[(5'h13):(4'he)])
            begin
              reg84 <= $unsigned((~(wire80 ? wire3 : wire10)));
              reg85 <= wire3[(4'ha):(3'h5)];
            end
          else
            begin
              reg84 <= (!(reg7 ?
                  {$unsigned(reg6),
                      $signed(((8'hb6) ?
                          reg8 : wire3))} : (wire82[(3'h6):(3'h5)] != $unsigned(wire10[(3'h5):(3'h5)]))));
              reg85 <= reg9[(3'h6):(1'h1)];
              reg86 <= (~|wire82[(1'h0):(1'h0)]);
            end
          reg87 <= $signed(($unsigned({reg85[(3'h4):(2'h2)]}) ?
              $signed($unsigned(((8'hb3) ? reg83 : wire0))) : reg86));
          reg88 <= ($signed((-(&(wire3 >>> reg4)))) ~^ reg5);
          if (($signed(($signed((wire10 ~^ wire2)) ?
                  (((8'ha7) ? (7'h42) : reg83) <<< ((8'hae) ?
                      wire82 : reg86)) : $signed((reg86 ? reg7 : wire10)))) ?
              reg5[(2'h3):(1'h0)] : wire0[(4'ha):(4'h9)]))
            begin
              reg89 <= $signed((^~reg85));
              reg90 <= ($unsigned((reg86[(4'h9):(3'h6)] ?
                  $signed((wire1 ?
                      wire0 : wire80)) : reg4[(5'h11):(5'h10)])) < $unsigned({$signed($unsigned(reg86))}));
              reg91 <= (~^(((!$unsigned(reg87)) < ($signed(reg88) << $signed(reg87))) ?
                  $unsigned($unsigned(wire3[(3'h7):(1'h1)])) : (~&reg83)));
              reg92 <= reg5;
              reg93 <= $unsigned({$signed({(reg89 & wire3)})});
            end
          else
            begin
              reg89 <= (wire10 * reg87[(4'hc):(2'h2)]);
              reg90 <= {wire0};
              reg91 <= {$signed(reg5[(2'h2):(2'h2)]), $unsigned(reg87)};
            end
        end
      else
        begin
          reg84 <= (reg7[(3'h5):(3'h5)] >= reg84[(1'h1):(1'h0)]);
          reg85 <= $unsigned(({(^~wire82[(2'h2):(1'h1)])} <<< ((|(reg91 >>> reg93)) * reg83)));
          if (((&$unsigned($signed(wire0[(4'h9):(3'h5)]))) ?
              reg87[(4'h8):(4'h8)] : $signed(($signed((~|(8'hb8))) <<< $unsigned($signed(reg5))))))
            begin
              reg86 <= reg85[(1'h0):(1'h0)];
              reg87 <= wire80[(4'he):(4'hd)];
              reg88 <= $signed((~^{($unsigned(reg5) * (wire1 << reg92)),
                  {(wire80 ? wire0 : wire2), reg5}}));
              reg89 <= ($signed(reg92) | (~&(((wire2 == wire1) ?
                  (wire0 ^ wire2) : {wire82}) * ({reg85, reg5} ?
                  ((8'haf) ? wire3 : wire0) : (~|reg88)))));
            end
          else
            begin
              reg86 <= $unsigned((({wire82[(3'h5):(1'h0)], $unsigned(reg91)} ?
                      $signed({reg9, reg89}) : $signed({reg93})) ?
                  (^((reg5 ? reg86 : reg88) > (reg91 < wire82))) : (reg87 ?
                      $unsigned((reg6 >= wire2)) : reg90)));
              reg87 <= (reg7[(5'h10):(4'h8)] ?
                  (^~$unsigned(({wire82,
                      reg85} - $unsigned(wire0)))) : {reg6[(5'h13):(4'hc)]});
              reg88 <= reg89;
            end
          reg90 <= wire10[(4'h8):(3'h5)];
        end
      reg94 <= (wire1[(3'h6):(3'h5)] ^~ reg90);
      reg95 <= $signed(reg6[(5'h11):(3'h7)]);
    end
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire18,
                 wire17,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire17 = $unsigned(wire16);
  assign wire18 = {(+((|wire13[(2'h2):(1'h0)]) ?
                          {wire15[(1'h1):(1'h1)],
                              $signed((8'hab))} : $unsigned($signed(wire15))))};
  always
    @(posedge clk) begin
      if ($unsigned(wire14[(3'h6):(2'h2)]))
        begin
          reg19 <= ((&$unsigned((wire18 ^~ wire18))) ?
              wire18 : (~^$unsigned((~^wire13[(2'h3):(1'h0)]))));
          reg20 <= $signed($signed($signed($unsigned(reg19[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg19 <= (^~($signed(((wire12 ?
              (8'hb8) : wire17) - $unsigned(wire12))) >> (wire13 ?
              $unsigned($unsigned(reg20)) : ($signed((8'ha3)) != (wire12 <<< wire12)))));
          if ($signed(($unsigned($signed((wire18 ? reg20 : wire12))) ?
              reg20 : ($signed(wire13) > (8'hb0)))))
            begin
              reg20 <= (((7'h44) ?
                  $unsigned(wire18[(1'h0):(1'h0)]) : ((8'hb8) + (8'hba))) & (wire13 ?
                  ($signed({(8'haa), reg20}) ?
                      ((wire17 && wire18) ?
                          $signed(wire18) : $signed(wire16)) : ((~&wire18) | wire12)) : ($signed($signed(wire15)) >> ((wire14 < wire18) ?
                      (reg20 ^~ reg20) : $unsigned(wire14)))));
              reg21 <= $unsigned(($signed(wire12[(4'h8):(4'h8)]) != $unsigned(reg20[(1'h0):(1'h0)])));
            end
          else
            begin
              reg20 <= $unsigned((reg21[(2'h2):(2'h2)] ? reg19 : wire12));
              reg21 <= $unsigned($unsigned(reg20));
            end
        end
    end
  assign wire22 = $signed($unsigned({$unsigned({wire13}),
                      (wire14 ?
                          ((8'h9f) ? wire17 : wire16) : (reg19 ^ wire14))}));
  assign wire23 = wire13;
  assign wire24 = (($signed(wire12[(3'h5):(1'h0)]) * $unsigned($signed(reg21[(3'h4):(2'h2)]))) ?
                      $unsigned($unsigned(($unsigned(wire17) != (~|wire12)))) : {$signed({wire12[(3'h7):(2'h2)],
                              (~&wire16)}),
                          $unsigned($signed($signed(wire16)))});
  assign wire25 = ($signed({(wire17 ?
                          $signed(wire22) : wire15)}) >> ($signed($signed($signed(reg19))) ?
                      {wire15[(5'h14):(3'h4)],
                          (~^(~|wire17))} : ((~&{(8'ha1)}) ?
                          (((8'ha6) ?
                              wire17 : (8'hb5)) && (wire12 | wire16)) : (^(wire24 ?
                              wire12 : wire12)))));
  assign wire26 = $unsigned(wire16[(1'h1):(1'h1)]);
  module27 #() modinst75 (wire74, clk, wire14, reg20, reg19, reg21, wire18);
  assign wire76 = ($signed(wire17[(1'h1):(1'h1)]) ?
                      ((~^(^$unsigned(wire74))) || $signed($signed((reg19 << wire14)))) : $signed(wire25));
  assign wire77 = (^~(wire24[(1'h1):(1'h1)] ?
                      (!((wire14 != wire15) ?
                          (~wire12) : (wire16 >>> wire25))) : ((-(+wire15)) ?
                          {$signed(wire15)} : (|(wire76 ? wire16 : wire17)))));
  assign wire78 = $unsigned((|(8'h9d)));
  assign wire79 = $signed((wire18 ?
                      wire18 : $signed({(wire26 ? (8'ha1) : reg20),
                          (wire17 ? wire12 : wire26)})));
endmodule

module module27
#(parameter param72 = {(({((8'hb9) >>> (8'ha6)), {(8'hb9)}} ? {(^~(8'ha5)), (~(8'haa))} : (8'ha4)) ? (|(-((8'hbe) ? (8'ha6) : (8'hb4)))) : (|(((8'hb5) ? (8'haa) : (8'h9f)) ? (8'hbb) : ((8'ha2) ? (8'hbd) : (8'ha8))))), ((((&(8'ha2)) ? ((8'hbc) << (7'h42)) : (~&(8'ha2))) ? (((8'had) ? (8'hb7) : (7'h40)) ? ((8'h9e) != (8'h9f)) : (~|(8'hb5))) : (~|(~|(7'h42)))) ? (+(((8'hb1) ? (8'hbd) : (8'haa)) > ((8'h9e) ? (8'hbb) : (8'hb3)))) : (((~(7'h41)) ? ((8'hab) >>> (7'h43)) : (8'hb8)) < (|((8'haf) ? (8'hb8) : (8'haf)))))}, 
parameter param73 = (param72 ? param72 : (~&{param72, ({param72} ? (param72 >= param72) : (param72 < param72))})))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h1b3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire31;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire signed [(2'h2):(1'h0)] wire29;
  input wire signed [(5'h10):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 (1'h0)};
  assign wire33 = (wire30 < $signed($unsigned((wire32 ?
                      (wire28 ? wire32 : wire29) : ((8'hb0) ?
                          (8'haa) : wire32)))));
  assign wire34 = (|(^~(!((wire29 ? wire33 : wire30) ?
                      $signed((8'hbf)) : wire29))));
  assign wire35 = (wire29[(2'h2):(2'h2)] <<< $unsigned((~^({wire28} ?
                      (8'hbb) : (&wire28)))));
  assign wire36 = {(~&({(wire30 <<< (8'hb4)),
                          wire29} <<< $signed(wire35[(1'h0):(1'h0)]))),
                      (~^(($signed((8'ha1)) ?
                              $signed(wire30) : wire29[(2'h2):(2'h2)]) ?
                          ($signed(wire30) + ((7'h41) <= (8'ha6))) : ($unsigned((8'haf)) ?
                              (^wire30) : (wire34 ~^ wire33))))};
  always
    @(posedge clk) begin
      reg37 <= $signed(wire31[(3'h4):(2'h2)]);
      if ((^~$signed({$signed((^wire34)),
          ($signed(wire30) ? (wire33 * wire33) : $signed(wire29))})))
        begin
          reg38 <= ((^(wire30[(1'h1):(1'h1)] ?
              $signed($unsigned(wire30)) : (wire34[(1'h1):(1'h0)] > $signed(wire34)))) && ({(!wire35)} ?
              $signed((!wire29)) : ($unsigned($signed(wire34)) ?
                  ($signed(wire30) ?
                      {wire28} : ((8'h9c) ?
                          wire29 : wire34)) : $signed($signed(wire34)))));
          reg39 <= wire35;
          reg40 <= ($unsigned($signed((8'hb9))) ?
              $unsigned($unsigned($unsigned(wire29[(2'h2):(1'h0)]))) : ($unsigned((-(wire33 ~^ (7'h40)))) | (&wire28)));
          if (($unsigned($signed($unsigned(reg39))) ?
              (!(($signed((8'hab)) ?
                      (wire29 << wire28) : (reg39 ? wire35 : wire33)) ?
                  (8'haf) : ($unsigned(wire35) >> $signed(reg39)))) : (wire31 ?
                  reg39 : wire32[(2'h2):(1'h0)])))
            begin
              reg41 <= (8'hbe);
            end
          else
            begin
              reg41 <= ((^(-(wire34[(4'hd):(3'h4)] ?
                      (~^(8'hb8)) : (^wire30)))) ?
                  $unsigned(wire31) : (!$signed(wire31[(4'h9):(1'h0)])));
            end
          reg42 <= (reg38 ?
              $signed(($signed((wire33 <<< wire33)) < $unsigned((wire32 - wire36)))) : wire33[(4'h9):(2'h3)]);
        end
      else
        begin
          reg38 <= $signed((($unsigned({wire33}) ?
                  wire31 : $unsigned($signed((8'hb3)))) ?
              $unsigned(wire28[(4'hc):(4'hb)]) : $unsigned($unsigned((^wire32)))));
          if (((($unsigned(wire35[(2'h2):(2'h2)]) ? reg39 : wire34) ?
                  (-$unsigned((wire29 ?
                      reg40 : wire32))) : $unsigned(($signed(wire28) ?
                      (~|(7'h40)) : {(8'ha9), wire29}))) ?
              (&$unsigned((+wire32))) : (~|(!wire28))))
            begin
              reg39 <= reg42[(1'h1):(1'h0)];
              reg40 <= reg39;
              reg41 <= wire31[(1'h0):(1'h0)];
              reg42 <= $unsigned(reg39[(4'h8):(3'h4)]);
              reg43 <= ((wire34 ?
                      wire32 : {(wire36 ^~ ((8'hb3) >= wire35)), reg38}) ?
                  (reg40 ?
                      (wire32[(2'h3):(1'h0)] ?
                          wire31[(3'h6):(1'h1)] : $unsigned((~&wire35))) : wire34[(4'h8):(3'h4)]) : reg37);
            end
          else
            begin
              reg39 <= $unsigned($unsigned(((~reg38[(5'h14):(4'hd)]) ?
                  (wire36 ^ (reg43 ?
                      wire28 : wire34)) : reg42[(1'h1):(1'h0)])));
            end
          if (((reg39 & $unsigned(wire28)) + reg41[(2'h3):(2'h3)]))
            begin
              reg44 <= (~^(^~$signed(wire31[(4'hd):(1'h0)])));
              reg45 <= wire36[(3'h6):(3'h6)];
              reg46 <= reg41;
            end
          else
            begin
              reg44 <= $unsigned(reg42);
            end
          reg47 <= (~|(~^reg42[(1'h0):(1'h0)]));
          reg48 <= ($unsigned(reg40[(1'h0):(1'h0)]) ?
              ($unsigned($unsigned(wire28)) > wire34) : wire34);
        end
      reg49 <= ($signed($unsigned(reg45[(3'h5):(3'h5)])) & {$unsigned(reg41[(3'h7):(3'h7)]),
          reg40[(1'h0):(1'h0)]});
      if (($signed($signed({(!reg38),
          (wire28 ? wire31 : (8'h9c))})) <= (((((8'hb1) ^ wire31) ?
                  (+reg40) : {reg42}) ?
              ({reg46} >> wire36) : (wire32[(2'h2):(1'h0)] ?
                  (wire33 ? wire31 : wire33) : (reg39 ^ wire33))) ?
          (~^((wire31 * wire31) ?
              (wire29 ? reg47 : wire35) : reg42)) : $signed((~|wire34)))))
        begin
          if ($unsigned(wire32[(3'h4):(2'h3)]))
            begin
              reg50 <= $signed($unsigned(wire32));
              reg51 <= (reg46[(3'h6):(3'h6)] + (8'hab));
              reg52 <= (8'ha9);
              reg53 <= reg51[(3'h5):(2'h2)];
              reg54 <= ((~(~&$unsigned(((8'h9f) ?
                  reg47 : reg37)))) <<< $unsigned((8'ha4)));
            end
          else
            begin
              reg50 <= (wire33[(3'h5):(1'h1)] ^ (wire29[(2'h2):(1'h1)] ?
                  $unsigned(reg51[(3'h6):(3'h5)]) : wire32[(2'h3):(1'h1)]));
              reg51 <= $unsigned((|(reg43[(4'hf):(1'h0)] != reg43[(4'hd):(2'h2)])));
            end
          reg55 <= ($signed($signed(({reg40} * $signed(reg42)))) ?
              reg46[(1'h0):(1'h0)] : (reg52[(1'h0):(1'h0)] ?
                  reg51[(4'hf):(4'ha)] : (|$unsigned((reg46 << (8'hbd))))));
          reg56 <= wire28;
          if ({(~&(wire32 <= {(!reg39), wire28}))})
            begin
              reg57 <= reg54;
              reg58 <= {$unsigned((^reg39[(3'h4):(2'h2)]))};
              reg59 <= (~|$unsigned(($signed((^reg49)) ?
                  {$unsigned(wire32),
                      reg41[(2'h2):(1'h0)]} : $signed($unsigned((8'hac))))));
              reg60 <= (~$unsigned({((8'hb4) - (wire35 ? reg42 : reg53))}));
              reg61 <= {reg44};
            end
          else
            begin
              reg57 <= reg43[(1'h1):(1'h1)];
              reg58 <= reg42;
              reg59 <= (+reg55);
              reg60 <= {(8'hb7),
                  ((8'had) ?
                      $unsigned(((+reg47) > (reg53 ?
                          (8'hb1) : reg37))) : (^((reg45 & (7'h42)) ?
                          (reg48 ? (8'hbd) : reg37) : (reg59 ?
                              (8'ha0) : reg60))))};
              reg61 <= reg49[(4'hf):(4'hb)];
            end
          if (wire36)
            begin
              reg62 <= reg60;
            end
          else
            begin
              reg62 <= (!({{reg62[(2'h2):(2'h2)], $unsigned(reg55)}} ?
                  (!$signed(reg52)) : reg55[(3'h6):(1'h0)]));
            end
        end
      else
        begin
          reg50 <= {(~(8'hb4))};
          reg51 <= ($signed((($unsigned(wire36) ?
              (wire33 ?
                  (8'hbc) : reg62) : $signed(reg52)) != ((~(8'hbc)) <= $signed(reg44)))) | $signed($unsigned($signed((reg47 ?
              reg42 : wire32)))));
          reg52 <= (reg55[(1'h0):(1'h0)] ? (^(-(~|$unsigned(reg37)))) : reg60);
          reg53 <= (reg50[(1'h0):(1'h0)] ^~ reg47[(4'ha):(1'h0)]);
          reg54 <= (reg51 ^~ reg46);
        end
      reg63 <= $signed($signed((reg53[(3'h6):(1'h1)] != reg45[(3'h4):(2'h2)])));
    end
  assign wire64 = $signed(reg47[(5'h12):(2'h2)]);
  assign wire65 = reg41;
  assign wire66 = ((+wire36) ?
                      (8'hb8) : $unsigned(({(reg48 ?
                              reg52 : reg63)} - ((wire29 <<< (8'hab)) ?
                          reg40[(1'h0):(1'h0)] : reg55))));
  assign wire67 = reg59;
  assign wire68 = {(reg51[(2'h2):(1'h0)] && reg55[(4'h8):(4'h8)])};
  assign wire69 = $signed(($signed(reg48) ?
                      (reg63[(4'h9):(2'h2)] + $signed((reg39 ?
                          reg48 : reg53))) : reg41));
  assign wire70 = $signed({$signed((reg37 ? wire67 : {reg45, (8'ha1)}))});
  assign wire71 = {((^({wire67,
                          reg40} + {wire33})) * $signed((reg54[(3'h4):(3'h4)] ^ $signed(reg38)))),
                      $unsigned($unsigned(($unsigned(reg39) + ((8'ha6) >> reg39))))};
endmodule
