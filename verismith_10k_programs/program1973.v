module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire82;
  assign y = {wire4, wire5, wire6, wire7, wire82, (1'h0)};
  assign wire4 = wire0[(2'h3):(2'h2)];
  assign wire5 = $unsigned(wire2);
  assign wire6 = wire0;
  assign wire7 = (^~(+$signed(wire4)));
  module8 #() modinst83 (wire82, clk, wire4, wire7, wire0, wire1, wire5);
endmodule

module module8
#(parameter param81 = ((^~(~&({(8'haf)} ? {(7'h42)} : ((8'hb9) >>> (8'hb9))))) ? ({(^(+(8'hbb)))} ? (((8'h9c) != ((7'h42) ^ (8'hb6))) <= {(|(8'haf)), (~|(7'h41))}) : ((((8'hbd) >> (8'ha8)) ? ((7'h42) < (8'hbc)) : ((8'haf) * (8'haf))) - ((8'h9f) ? (!(8'hb1)) : {(8'hae)}))) : (((((8'hb5) ^ (8'ha3)) ? ((8'hb7) * (7'h41)) : ((8'hb1) >= (8'h9d))) ? (&((8'hbd) ? (7'h41) : (8'had))) : (~|((8'hbd) ? (8'h9f) : (8'ha1)))) ? (-(~|{(8'hae), (8'hb7)})) : (({(8'ha2)} ? {(8'haa)} : ((8'hab) - (8'ha9))) <<< {(~^(8'h9d)), {(8'hba)}}))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire68;
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire71,
                 wire70,
                 wire14,
                 wire16,
                 wire17,
                 wire18,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire68,
                 reg73,
                 reg72,
                 reg15,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire14 = $unsigned(wire11);
  always
    @(posedge clk) begin
      reg15 <= $signed((~^{{(wire12 <= wire9)}}));
    end
  assign wire16 = (+(+$signed($unsigned(wire12))));
  assign wire17 = (~|$unsigned($signed(($signed((8'hb4)) != $unsigned(wire14)))));
  assign wire18 = wire10;
  always
    @(posedge clk) begin
      if ((!(wire10 ?
          (~^wire11[(2'h3):(2'h3)]) : $unsigned((~(wire11 != wire13))))))
        begin
          reg19 <= $signed(((-(~&(wire14 > wire17))) - wire12));
          reg20 <= ((wire16[(4'he):(4'hb)] ?
              (8'ha9) : (wire11[(1'h0):(1'h0)] ?
                  $unsigned(((8'ha9) <= wire16)) : (~&$signed((8'hb3))))) != $signed(wire14));
        end
      else
        begin
          reg19 <= {wire17};
          if (wire18[(4'h8):(2'h3)])
            begin
              reg20 <= $signed(wire9[(2'h3):(2'h2)]);
            end
          else
            begin
              reg20 <= $signed($signed($unsigned($signed((reg20 ?
                  wire13 : wire16)))));
            end
          if (((!{(((8'haf) << (8'hb1)) >>> (wire18 > wire17))}) ?
              ($signed((wire9 ? {wire11} : (wire11 >> wire17))) ?
                  (~&(8'ha3)) : wire18) : {reg19[(2'h2):(2'h2)], reg20}))
            begin
              reg21 <= ((7'h43) ? (wire13 < wire13) : wire14[(4'h8):(3'h6)]);
              reg22 <= wire18[(3'h7):(1'h1)];
              reg23 <= reg21[(5'h10):(4'h8)];
            end
          else
            begin
              reg21 <= ((((!(reg23 - wire18)) <<< reg22[(3'h4):(3'h4)]) != wire16) || ($signed({(wire16 ?
                      wire10 : wire13),
                  wire17[(5'h14):(4'h9)]}) ~^ wire12[(1'h0):(1'h0)]));
              reg22 <= $signed($unsigned($signed($unsigned({wire17}))));
              reg23 <= wire18[(4'h8):(2'h3)];
              reg24 <= wire14;
              reg25 <= reg15;
            end
          if (wire10)
            begin
              reg26 <= wire16[(1'h0):(1'h0)];
              reg27 <= (((7'h43) ?
                      reg19[(3'h4):(2'h3)] : ($unsigned(wire11) * $unsigned((reg21 << reg19)))) ?
                  (8'ha6) : wire17);
            end
          else
            begin
              reg26 <= (wire12 ?
                  {wire10[(2'h2):(1'h1)],
                      $signed({(~|(8'hb9))})} : $signed(($signed((wire9 >= wire12)) >>> $unsigned((^~reg19)))));
              reg27 <= {$signed((~&($unsigned(wire17) ?
                      (wire17 ? wire14 : (8'hac)) : (reg19 ~^ (8'hb5)))))};
            end
        end
      reg28 <= ($unsigned(wire9) ? reg15[(3'h7):(2'h3)] : reg25[(2'h3):(2'h2)]);
    end
  assign wire29 = (wire13 ? $signed((reg27 && (8'hb9))) : reg15[(3'h6):(2'h3)]);
  assign wire30 = $unsigned(((wire11 ?
                      wire9[(4'hf):(4'hf)] : {(^~reg27), (~&reg25)}) | reg25));
  assign wire31 = $signed((reg24[(1'h1):(1'h0)] ? wire13 : (|(7'h40))));
  assign wire32 = $signed(($unsigned(((reg25 ? (8'ha2) : reg27) || (wire12 ?
                          wire31 : wire13))) ?
                      wire10[(1'h1):(1'h1)] : {$unsigned(reg21)}));
  assign wire33 = (($unsigned($signed($signed(reg26))) ?
                          (wire13[(4'hb):(3'h7)] ?
                              $unsigned((wire16 ? wire17 : wire9)) : ({wire30,
                                      wire29} ?
                                  ((8'hb4) >= wire9) : reg21)) : ((((8'ha2) ~^ wire32) << reg19) ~^ reg22)) ?
                      $signed(($signed($signed((8'ha7))) && ($unsigned(reg19) ?
                          $unsigned(reg28) : $unsigned(wire17)))) : wire30);
  always
    @(posedge clk) begin
      reg34 <= $unsigned(wire11);
      reg35 <= (+$unsigned($unsigned(reg19)));
    end
  module36 #() modinst69 (wire68, clk, wire32, wire14, reg24, wire16);
  assign wire70 = reg28[(3'h7):(1'h1)];
  assign wire71 = $unsigned($unsigned((&(~^wire31))));
  always
    @(posedge clk) begin
      reg72 <= (!wire30);
      reg73 <= $signed(wire16);
    end
  assign wire74 = ((wire17[(4'he):(3'h5)] >> $unsigned(((reg26 ^ reg73) ?
                      reg20[(4'h8):(3'h5)] : (~&(8'hbc))))) - $unsigned(({((8'ha4) ?
                          wire71 : wire18)} ^ ((reg20 ?
                      wire11 : wire18) ^ $unsigned(wire71)))));
  assign wire75 = (wire30[(2'h2):(2'h2)] ?
                      reg26 : $unsigned(($unsigned((wire17 ? reg15 : wire12)) ?
                          (wire13 ?
                              $unsigned(reg27) : $signed(wire74)) : (wire32[(3'h4):(3'h4)] - wire70))));
  assign wire76 = $unsigned(($signed(reg24[(3'h7):(3'h6)]) ?
                      (&(reg21 ?
                          $unsigned(reg26) : reg35[(4'hc):(1'h0)])) : {(&$unsigned((8'hb6))),
                          reg15}));
  assign wire77 = $signed(reg28[(3'h7):(3'h7)]);
  assign wire78 = (8'hb7);
  assign wire79 = reg20[(4'he):(4'ha)];
  assign wire80 = $signed($unsigned((((wire13 >>> wire11) ?
                          wire31[(5'h10):(2'h3)] : (wire13 ?
                              (8'ha7) : wire17)) ?
                      $unsigned((^reg28)) : (8'ha0))));
endmodule

module module36
#(parameter param66 = ((!((((8'h9c) ? (8'hbc) : (8'hb9)) ? (+(8'hb8)) : (8'hb9)) ? ((~|(8'hb1)) * ((8'hb0) | (8'haa))) : ((7'h44) ? {(8'hbd)} : ((8'ha7) && (8'hb7))))) ? (((+((8'h9c) ^~ (8'ha2))) ^ ((~&(8'hb4)) == (^~(8'hbd)))) * ((((8'hb3) ? (7'h40) : (8'h9d)) * ((8'ha8) ? (8'ha9) : (7'h42))) ? (((7'h40) & (8'hb9)) ? ((8'ha5) ? (8'ha2) : (8'hb8)) : (&(7'h41))) : (((8'hb2) ? (8'h9c) : (8'hb0)) ? ((8'hbe) || (8'hb1)) : ((8'hbe) * (8'hac))))) : (!((~|(~(8'hba))) << (^(|(8'hae)))))), 
parameter param67 = (^~(param66 ~^ param66)))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire40;
  input wire [(3'h6):(1'h0)] wire39;
  input wire signed [(3'h7):(1'h0)] wire38;
  input wire signed [(2'h2):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire49,
                 wire48,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= (7'h41);
      if (({{wire37[(2'h2):(2'h2)], wire37[(1'h1):(1'h1)]}} ?
          wire38[(3'h5):(1'h0)] : ((wire40 ?
                  (~wire40) : {(wire39 ? (8'h9c) : (8'hac)),
                      wire40[(1'h0):(1'h0)]}) ?
              $unsigned({(wire37 | wire37),
                  wire37[(2'h2):(1'h0)]}) : ($unsigned($signed(wire38)) ~^ $signed((wire37 ?
                  wire40 : wire37))))))
        begin
          if ($unsigned($unsigned((reg41 ?
              ((wire37 > (8'ha2)) - wire37) : $signed($unsigned(wire38))))))
            begin
              reg42 <= wire39;
              reg43 <= reg42;
              reg44 <= reg42;
            end
          else
            begin
              reg42 <= $signed($unsigned($signed(wire40)));
              reg43 <= (~({reg42,
                  ({wire39} < {wire40, wire40})} <<< (~&reg42)));
              reg44 <= $unsigned({(^~(&((8'ha6) <<< (8'had))))});
              reg45 <= wire37;
            end
          reg46 <= ({wire39[(1'h1):(1'h0)]} ?
              (($unsigned({wire38, reg42}) && reg42) || ((((8'ha6) ?
                      (8'ha2) : reg44) ?
                  $unsigned((8'hb2)) : $unsigned(wire39)) <<< (((8'ha8) + reg42) && wire37))) : reg45[(4'h9):(4'h9)]);
        end
      else
        begin
          reg42 <= ($signed(((reg42 != $signed(wire38)) >= $unsigned(((8'h9f) ?
                  reg45 : wire38)))) ?
              (reg43[(1'h1):(1'h0)] && reg42) : wire38);
          reg43 <= (reg44[(4'h8):(3'h4)] + ($signed(((~^wire40) || (reg43 ^~ wire37))) ?
              ($signed(wire40[(1'h0):(1'h0)]) ?
                  ((wire38 >= wire40) ?
                      {wire40,
                          reg46} : (|reg41)) : $signed((^(8'had)))) : (|reg42[(1'h1):(1'h0)])));
          if ($unsigned($unsigned($signed((reg41[(1'h1):(1'h1)] << $signed(wire38))))))
            begin
              reg44 <= ($signed((($signed(reg41) | (reg41 <= wire38)) <<< reg43)) ?
                  reg46 : (-((~$signed(reg45)) ?
                      reg41[(2'h3):(1'h0)] : wire40[(1'h1):(1'h0)])));
              reg45 <= reg42;
            end
          else
            begin
              reg44 <= $signed(($signed({((7'h44) ? (8'hb1) : wire39),
                  $unsigned(reg43)}) > reg43));
              reg45 <= $signed((reg41 > ($signed((reg45 ?
                  wire39 : reg44)) ^~ $unsigned($signed(wire38)))));
              reg46 <= (reg44 ?
                  (~^reg41[(1'h1):(1'h0)]) : (^({((8'hae) ? reg45 : (8'ha0))} ?
                      reg45[(3'h6):(2'h2)] : {{wire37, reg45}})));
            end
          reg47 <= $unsigned($unsigned($unsigned($signed({wire38}))));
        end
    end
  assign wire48 = $signed($signed((($unsigned(wire40) ?
                      wire40 : (reg47 ?
                          wire40 : wire37)) && $unsigned(reg43))));
  assign wire49 = (~^(((reg42[(1'h0):(1'h0)] ?
                              $unsigned(wire38) : ((8'h9d) ? reg41 : wire40)) ?
                          $signed($unsigned(reg44)) : ((^~wire40) ?
                              (^(8'had)) : $unsigned(reg47))) ?
                      {(reg45[(3'h4):(2'h2)] ? wire37 : $unsigned(reg43)),
                          (^~(reg41 ?
                              reg45 : (8'hbd)))} : $unsigned(reg45[(4'h9):(3'h6)])));
  always
    @(posedge clk) begin
      if ($signed(wire37))
        begin
          reg50 <= $signed((+wire38));
          if (($signed(((+(~wire48)) ?
              {$unsigned(wire40)} : reg43[(4'hb):(4'hb)])) + (($signed($unsigned(wire39)) ?
              {$unsigned(reg46), reg42} : (|reg43[(4'h9):(2'h2)])) - (&reg47))))
            begin
              reg51 <= wire40[(1'h0):(1'h0)];
              reg52 <= (((~(((8'ha6) != reg43) == (reg47 ? wire40 : reg45))) ?
                      (reg41[(4'ha):(3'h7)] ^~ (7'h40)) : wire37) ?
                  $unsigned(($signed(reg44) ?
                      wire38[(2'h3):(1'h1)] : $signed(((8'hbc) * reg47)))) : (((^(^wire40)) << $unsigned($unsigned(reg45))) ?
                      $unsigned($signed((reg41 ~^ (8'ha7)))) : $signed($signed((reg41 & wire37)))));
              reg53 <= $signed({((-{reg46, reg50}) ?
                      (reg41 ? (~wire40) : (wire40 == reg45)) : {(^~reg42)}),
                  {{(reg42 & reg47), reg52[(2'h3):(1'h0)]}, $signed(reg41)}});
              reg54 <= reg43[(4'hb):(3'h7)];
              reg55 <= (((wire37[(2'h2):(2'h2)] ?
                          ({reg53, reg43} | (reg54 ?
                              wire37 : wire48)) : (-{reg46, wire40})) ?
                      (|$unsigned({reg51})) : $signed($unsigned($signed(reg50)))) ?
                  ((wire49[(3'h7):(3'h5)] ?
                      ($unsigned(reg45) & ((8'hb6) ?
                          reg50 : (8'ha5))) : reg44[(4'hb):(2'h2)]) < ((reg41 ?
                      reg41 : reg51[(3'h6):(1'h1)]) && $signed($unsigned(reg50)))) : reg42);
            end
          else
            begin
              reg51 <= ($unsigned($signed(reg43)) | {$signed((reg47 > wire37[(1'h1):(1'h0)])),
                  $signed(reg55[(2'h2):(2'h2)])});
              reg52 <= ((^((wire40[(1'h1):(1'h1)] > $signed(wire40)) == reg53)) ?
                  (-((((8'hb6) ^ wire40) ?
                          (reg50 <= wire39) : $signed(wire49)) ?
                      ((wire48 ?
                          reg50 : reg42) > reg54[(3'h5):(2'h3)]) : $signed((+(7'h40))))) : $signed($unsigned(wire37[(1'h1):(1'h0)])));
              reg53 <= (((&wire39) == $signed(reg52)) ?
                  reg47 : wire37[(1'h0):(1'h0)]);
              reg54 <= wire37[(2'h2):(1'h0)];
            end
          reg56 <= (({wire38[(3'h4):(1'h1)], {reg53}} - reg43[(4'h9):(3'h6)]) ?
              wire37[(1'h0):(1'h0)] : (reg42[(1'h0):(1'h0)] | $unsigned({(reg51 < reg52)})));
        end
      else
        begin
          if (({(~^($unsigned(reg52) >> $signed(reg46))),
                  reg51[(3'h5):(3'h4)]} ?
              ((-{{reg44},
                  reg46}) | reg42[(2'h2):(1'h0)]) : reg46[(1'h0):(1'h0)]))
            begin
              reg50 <= wire40;
              reg51 <= reg42;
            end
          else
            begin
              reg50 <= $signed(wire48);
              reg51 <= reg51;
            end
        end
      reg57 <= wire38[(3'h6):(3'h5)];
    end
  assign wire58 = $signed(($signed((~&((8'hb6) + (8'hb8)))) << (^(&(wire39 ?
                      reg50 : reg41)))));
  assign wire59 = reg43;
  assign wire60 = $signed((wire38[(2'h3):(1'h0)] ?
                      {(reg45[(4'ha):(3'h6)] ?
                              $unsigned((7'h44)) : {wire37, reg42}),
                          $signed(((8'hb8) ?
                              reg50 : reg41))} : $signed((+(^~(8'hac))))));
  assign wire61 = reg53;
  assign wire62 = (+$unsigned(($unsigned((wire39 >> reg42)) >> reg43[(3'h6):(3'h5)])));
  assign wire63 = (8'ha2);
  assign wire64 = $signed($signed((8'hb7)));
  assign wire65 = reg50;
endmodule
