module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire88;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned(wire2[(4'hc):(4'hb)]));
  assign wire6 = ($signed($signed((wire5[(3'h6):(2'h3)] && wire5[(3'h6):(3'h6)]))) > wire5[(1'h0):(1'h0)]);
  module7 #() modinst87 (wire86, clk, wire0, wire3, wire5, wire4);
  assign wire88 = wire0;
  assign wire89 = $unsigned(wire88[(3'h6):(3'h5)]);
  assign wire90 = (wire4[(2'h3):(2'h3)] ^ ((-((-(8'hb3)) ?
                      {wire89,
                          wire4} : $signed((8'ha4)))) * (^($signed((7'h44)) != $signed(wire3)))));
  assign wire91 = wire88;
  assign wire92 = (|wire86[(2'h2):(1'h0)]);
endmodule

module module7
#(parameter param84 = {(((((8'ha9) >>> (8'ha3)) - (8'hbc)) || (-((8'ha0) && (7'h43)))) < (((^(8'ha2)) <= (~(8'hba))) ^~ ((~(8'hae)) > (8'ha8))))}, 
parameter param85 = ((~{((param84 - param84) || (~|param84))}) ? param84 : ({(param84 ? param84 : (param84 ? param84 : param84))} ? (((param84 ? param84 : param84) ? (param84 + param84) : (param84 < param84)) ? ((!param84) ? (param84 & param84) : (param84 >>> param84)) : {{(8'haf), param84}, ((8'ha6) + param84)}) : (((param84 * (8'h9c)) > (~^(8'hb1))) ? ((param84 ? param84 : param84) <<< param84) : ((&param84) ? (param84 ? param84 : param84) : param84)))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire75;
  wire [(4'ha):(1'h0)] wire73;
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire75,
                 wire73,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  module12 #() modinst74 (wire73, clk, wire11, wire10, wire9, wire8);
  assign wire75 = wire8[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg76 <= $signed($unsigned((wire8 >= ((~&wire8) ^~ $signed(wire73)))));
      if ($signed($unsigned((wire73[(4'ha):(4'ha)] ?
          (~|(wire73 ? wire75 : wire9)) : ((wire11 ?
              (7'h40) : reg76) >= (wire73 <= wire10))))))
        begin
          reg77 <= $unsigned({reg76[(2'h3):(1'h0)], wire10[(5'h11):(4'hd)]});
        end
      else
        begin
          reg77 <= (reg77 ? {(8'had)} : (^wire75));
          reg78 <= $signed(({(((8'hb0) ? reg77 : wire10) ?
                      (wire73 ? wire11 : wire75) : $unsigned((8'hb6)))} ?
              $unsigned($unsigned($unsigned(reg77))) : (&$signed(wire9[(3'h7):(1'h0)]))));
        end
      reg79 <= reg76;
      reg80 <= (^(($signed((wire9 >> wire73)) + $signed((wire73 >>> wire73))) >>> (7'h44)));
    end
  assign wire81 = ((~|$unsigned({(wire9 ? wire11 : reg79)})) < reg77);
  assign wire82 = $unsigned((($signed(reg79[(3'h5):(3'h4)]) ?
                          ($unsigned(reg76) ?
                              (~&(8'hb4)) : {reg78}) : wire10[(3'h7):(3'h6)]) ?
                      $unsigned(wire81[(3'h4):(2'h3)]) : reg76));
  assign wire83 = wire75[(2'h3):(2'h3)];
endmodule

module module12
#(parameter param71 = ((^((!(&(8'hbc))) ^ (((8'ha7) | (8'hb5)) <<< ((8'haf) ? (8'hac) : (8'h9d))))) <<< (&({((8'h9f) ? (8'hbd) : (8'haf)), ((8'had) ? (8'h9d) : (8'ha8))} ? ((8'hb3) < ((8'ha0) << (8'hb5))) : (((8'ha6) ~^ (8'ha3)) ? ((8'had) - (8'ha7)) : ((8'hbd) | (8'haf)))))), 
parameter param72 = param71)
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h251):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(3'h5):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire19,
                 wire18,
                 wire17,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
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
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire17 = wire14;
  assign wire18 = wire17[(3'h4):(3'h4)];
  assign wire19 = (~&(8'ha4));
  always
    @(posedge clk) begin
      reg20 <= (^($signed(wire17) ?
          wire13[(3'h6):(1'h1)] : (&$unsigned(wire19))));
      if ((8'hba))
        begin
          reg21 <= $unsigned(reg20[(1'h1):(1'h1)]);
          reg22 <= wire14[(2'h3):(1'h0)];
          reg23 <= wire18[(1'h0):(1'h0)];
        end
      else
        begin
          if ((($signed(reg21[(5'h10):(4'hd)]) ?
              wire16[(2'h2):(1'h1)] : wire15) > (&wire15)))
            begin
              reg21 <= wire17[(1'h1):(1'h1)];
              reg22 <= $unsigned((~&((wire17 ? $unsigned((8'h9c)) : (+reg22)) ?
                  reg22[(3'h6):(3'h6)] : (^~$signed(reg20)))));
              reg23 <= reg20;
              reg24 <= wire13[(3'h5):(3'h5)];
              reg25 <= $unsigned($unsigned($unsigned((wire15 < (|wire15)))));
            end
          else
            begin
              reg21 <= reg25[(1'h1):(1'h0)];
              reg22 <= reg24;
            end
          reg26 <= wire16[(4'h8):(1'h1)];
          reg27 <= $unsigned((($unsigned((wire15 <<< (8'hab))) ?
                  reg21 : wire13[(3'h6):(1'h0)]) ?
              ((8'hba) >> {$unsigned(reg21),
                  wire15[(1'h1):(1'h1)]}) : {wire17}));
        end
      reg28 <= reg21[(1'h0):(1'h0)];
      reg29 <= wire14;
    end
  always
    @(posedge clk) begin
      if ((($signed(wire15[(4'hd):(4'h8)]) ?
          $signed(($signed((8'ha2)) ^ reg26)) : (!wire16[(3'h6):(3'h5)])) - wire14))
        begin
          reg30 <= {($signed((wire14 ? reg27 : (wire14 > reg24))) ?
                  reg26[(1'h0):(1'h0)] : (~&$unsigned(((8'ha3) | wire19)))),
              (($unsigned((wire19 * reg29)) | $signed(reg25[(2'h2):(2'h2)])) && wire13)};
          reg31 <= ((reg27[(3'h4):(1'h0)] & reg30[(1'h1):(1'h1)]) >= reg27[(3'h6):(1'h0)]);
          reg32 <= reg29;
        end
      else
        begin
          reg30 <= reg32;
          reg31 <= ({$signed(wire17),
                  ({$signed(wire18)} ? $unsigned($unsigned(reg29)) : reg22)} ?
              $unsigned((|(wire14[(1'h1):(1'h0)] ?
                  ((8'ha0) || reg23) : $signed(wire15)))) : reg26);
          if ((!$unsigned((~(!(reg25 ~^ (8'h9f)))))))
            begin
              reg32 <= (~|(($unsigned($signed(wire18)) ?
                      $signed(reg29) : $unsigned($signed(wire19))) ?
                  (+((reg30 ? reg32 : wire18) >>> $signed(reg29))) : (-reg30)));
              reg33 <= $signed((wire15 ~^ $unsigned($unsigned($signed(wire19)))));
            end
          else
            begin
              reg32 <= $unsigned(reg30);
              reg33 <= $unsigned(reg24);
              reg34 <= {wire13[(4'h9):(4'h9)], reg25[(2'h2):(1'h1)]};
              reg35 <= {$unsigned(((8'hbd) ?
                      (((8'hb3) == wire16) >= (reg24 && reg20)) : reg23))};
              reg36 <= reg29[(2'h2):(1'h1)];
            end
          reg37 <= reg36[(1'h1):(1'h0)];
          reg38 <= $signed(((8'hb4) ?
              $unsigned(reg26[(4'hb):(2'h2)]) : ($signed($unsigned(wire19)) ?
                  {(8'ha4)} : ({reg34, (8'ha1)} ? (|reg22) : $signed(reg33)))));
        end
      reg39 <= reg29;
      reg40 <= $signed((reg32 + wire15[(2'h2):(1'h0)]));
      reg41 <= $signed(reg27[(1'h0):(1'h0)]);
    end
  assign wire42 = (~&(|$unsigned({wire18, $unsigned(wire14)})));
  assign wire43 = (8'ha5);
  assign wire44 = $unsigned($unsigned($signed(reg31[(2'h2):(1'h1)])));
  assign wire45 = reg27[(3'h4):(2'h3)];
  assign wire46 = ((reg21 && (((~&(7'h43)) ?
                          (!(8'hbf)) : (8'h9d)) + $signed($unsigned(reg28)))) ?
                      reg36[(2'h2):(1'h1)] : $unsigned($unsigned($signed($unsigned(reg34)))));
  always
    @(posedge clk) begin
      reg47 <= ({($signed($signed(reg31)) ?
              ($signed(reg34) < $signed(reg41)) : (~|reg31))} * reg22);
      if (reg36)
        begin
          if ($signed($signed(($signed((^reg30)) ^~ (~|$signed(wire43))))))
            begin
              reg48 <= (reg37[(2'h3):(2'h3)] ? reg27 : reg33);
              reg49 <= $unsigned((~{reg29[(2'h2):(1'h0)]}));
              reg50 <= reg47[(1'h1):(1'h0)];
            end
          else
            begin
              reg48 <= reg37[(4'ha):(2'h2)];
              reg49 <= (|$unsigned({{(reg29 != (8'hb4)), (~|reg35)}}));
            end
          reg51 <= wire16[(4'ha):(2'h2)];
        end
      else
        begin
          reg48 <= $unsigned($signed($unsigned(wire16[(3'h6):(1'h0)])));
          reg49 <= ((+reg30) != wire15);
        end
      if (($signed({$unsigned({wire46, reg25})}) | reg32[(3'h4):(2'h2)]))
        begin
          reg52 <= {wire15,
              $unsigned(({(reg23 ? wire17 : reg39)} ?
                  reg47 : (-{reg26, reg28})))};
          reg53 <= $signed(({(wire14 ? wire43[(3'h7):(3'h7)] : (7'h40)),
                  (~^$unsigned(reg26))} ?
              (!$signed((reg47 ? (8'ha5) : reg48))) : reg50));
          reg54 <= $signed((-reg28));
        end
      else
        begin
          reg52 <= reg30;
          reg53 <= {$signed({{(reg50 ? reg47 : wire17), $unsigned((8'hb3))},
                  (|$unsigned(reg21))}),
              ((~reg39) ?
                  ($unsigned((reg29 ^ reg22)) <<< reg52) : ($signed(reg21) ?
                      (!(-reg22)) : $signed($unsigned(reg20))))};
          reg54 <= reg24[(3'h5):(3'h4)];
          reg55 <= $signed({(+((-reg51) ^~ (^reg48))), reg48});
          reg56 <= (~^{$signed(reg39[(4'h8):(2'h3)])});
        end
    end
  always
    @(posedge clk) begin
      if (reg25[(1'h0):(1'h0)])
        begin
          reg57 <= ((((((8'hbe) >>> reg48) ? $signed(wire42) : $signed(reg52)) ?
                      ((reg54 ? (8'hb2) : wire15) >= $signed(reg29)) : reg29) ?
                  reg40 : ($unsigned((reg41 ^~ (8'ha2))) ?
                      ((reg51 & reg34) ?
                          (reg20 ? reg31 : (8'hbd)) : {reg53,
                              wire13}) : reg27[(3'h5):(2'h2)])) ?
              wire44[(3'h7):(3'h7)] : ($signed({reg21, $unsigned(reg31)}) ?
                  $unsigned(wire46[(4'h9):(1'h1)]) : reg30[(1'h1):(1'h1)]));
          reg58 <= (^~wire18[(3'h7):(3'h4)]);
          reg59 <= wire42;
        end
      else
        begin
          reg57 <= $signed($signed({$signed((~&(8'ha4)))}));
        end
      reg60 <= ({(~&{reg27[(2'h3):(1'h0)], ((8'ha3) <<< wire15)}),
              $unsigned($unsigned((^~reg58)))} ?
          $unsigned((~&reg40[(3'h6):(1'h1)])) : $unsigned(($signed($signed(reg27)) ?
              $unsigned($signed(reg40)) : ((reg37 ? reg33 : reg37) ?
                  $signed(wire46) : (wire16 ? reg34 : reg24)))));
      if (($unsigned(((~^$signed(reg37)) ? wire46 : (~&wire46))) ?
          (wire15[(5'h13):(2'h3)] * ((wire18 & (~^reg48)) + $unsigned({(8'hbc)}))) : $signed(reg51)))
        begin
          if ((+reg50))
            begin
              reg61 <= reg37;
              reg62 <= $unsigned((reg33 >>> {(8'hb9),
                  ($unsigned(reg33) ?
                      {reg25, reg28} : (reg31 ? reg27 : reg28))}));
            end
          else
            begin
              reg61 <= reg29[(3'h5):(1'h1)];
              reg62 <= (^(wire42 < ((reg30 == wire14) > reg35)));
              reg63 <= {reg36};
            end
        end
      else
        begin
          reg61 <= $unsigned(wire46[(4'hf):(3'h7)]);
          reg62 <= (-reg22[(4'h9):(4'h8)]);
        end
    end
  assign wire64 = $unsigned((reg23 ^ (^~wire16[(3'h5):(2'h3)])));
  assign wire65 = (^reg63);
  assign wire66 = ((8'hb8) ^ reg22[(4'h9):(2'h3)]);
  assign wire67 = ($unsigned({((reg36 || wire15) ?
                          ((8'hbb) ?
                              reg52 : wire14) : (7'h41))}) << $unsigned(wire19));
  assign wire68 = ((reg51[(1'h1):(1'h1)] - reg37) ?
                      $unsigned((({reg63} ^~ $signed(reg47)) ?
                          ({wire17} ?
                              wire43 : (~^reg21)) : (!(-wire17)))) : (reg52[(3'h4):(1'h1)] ^~ (!(+(~&(8'ha7))))));
  assign wire69 = ($unsigned((~^(|wire44[(3'h7):(2'h3)]))) ?
                      ((~^$unsigned((~^reg39))) ?
                          (($signed(reg51) < (reg35 + reg50)) ?
                              $unsigned($unsigned((8'h9c))) : (wire64 ~^ {wire68})) : $unsigned({reg24})) : (reg24 - (^~((reg48 | reg57) ^~ (wire44 & (8'ha0))))));
  assign wire70 = {$signed(wire17)};
endmodule
