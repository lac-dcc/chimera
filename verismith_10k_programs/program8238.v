module top
#(parameter param92 = {(((((8'haa) << (8'h9f)) ? ((8'ha1) < (8'hb7)) : ((7'h42) && (8'hb9))) ? {((8'ha5) >>> (8'hb7))} : ((^(8'haf)) ? (~(8'hbf)) : ((8'haf) - (8'hb6)))) < ((^(!(8'hb7))) - ((&(8'had)) && ((8'hbc) ? (8'hb7) : (7'h41)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire86;
  assign y = {wire91, wire90, wire89, wire88, wire5, wire86, (1'h0)};
  assign wire5 = $unsigned($unsigned(wire1));
  module6 #() modinst87 (.wire9(wire1), .wire7(wire2), .wire11(wire5), .wire10(wire4), .wire8(wire3), .y(wire86), .clk(clk));
  assign wire88 = $signed((&(^~wire2)));
  assign wire89 = (wire5 <<< ($unsigned($unsigned((wire2 == wire2))) ?
                      $signed((~^$signed((8'h9f)))) : {(^$signed(wire0))}));
  assign wire90 = wire1[(2'h2):(1'h1)];
  assign wire91 = (~^wire0);
endmodule

module module6
#(parameter param85 = (((((^(8'h9c)) ? (-(7'h40)) : ((8'ha7) ? (8'ha0) : (7'h44))) ? (((8'ha6) ? (8'ha3) : (8'hae)) ? ((8'ha7) ? (8'ha8) : (8'hab)) : ((8'ha8) < (7'h44))) : (&((8'hbf) ? (8'ha9) : (8'hbe)))) >= ({(8'hb8), (&(8'hab))} ? (((7'h43) << (8'h9c)) || ((8'hb1) ^~ (8'hbd))) : (((7'h40) ^ (8'ha9)) > ((8'hb5) ? (8'hb4) : (8'hb8))))) ? ((8'hb3) ? (|(&(~|(8'ha3)))) : ((-((8'hb9) << (8'h9d))) ? (((8'hab) > (8'hbb)) <<< (8'h9f)) : (((8'hb2) == (8'hab)) ? ((8'hac) ~^ (8'hb6)) : (&(7'h41))))) : (&((((8'hbe) ^ (8'haf)) | ((8'hb0) ? (8'h9f) : (8'ha8))) || {(^~(8'haa)), ((8'hab) ? (8'ha8) : (8'hab))}))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire80;
  wire [(2'h2):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire73;
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire75,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire33,
                 wire34,
                 wire35,
                 wire73,
                 reg77,
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
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire12 = (wire7[(1'h1):(1'h0)] ?
                      wire9[(3'h6):(2'h3)] : ($signed(((wire9 ?
                                  wire10 : wire11) ?
                              wire8 : (wire7 ? wire10 : (8'hbd)))) ?
                          wire7 : (^$signed((wire11 | wire7)))));
  assign wire13 = $unsigned((^~wire9));
  assign wire14 = $unsigned(((8'hb9) ?
                      (wire12[(4'hb):(1'h1)] >> ((wire11 >= (8'hb2)) ?
                          (wire7 ? wire11 : (7'h41)) : (wire7 ?
                              wire12 : wire8))) : {wire9[(2'h2):(1'h1)]}));
  assign wire15 = (^(~^wire10[(4'h8):(3'h7)]));
  assign wire16 = ((8'hae) - $unsigned((+(+(-wire13)))));
  assign wire17 = ($unsigned($unsigned(($signed(wire8) > wire9))) >= $signed((((^wire11) ~^ $unsigned(wire12)) ?
                      ($signed(wire16) ? (+wire9) : {wire7}) : $signed({(8'ha6),
                          wire14}))));
  always
    @(posedge clk) begin
      if (wire13[(4'h9):(3'h4)])
        begin
          reg18 <= (+wire8);
          if (wire13)
            begin
              reg19 <= $unsigned((~^(|$unsigned(wire15))));
              reg20 <= (|(7'h40));
            end
          else
            begin
              reg19 <= $unsigned((~^{(~^$unsigned(wire15))}));
            end
          reg21 <= ((wire10 ^~ $signed((~(reg19 + wire7)))) ?
              {reg18[(4'h9):(2'h3)]} : wire16);
          reg22 <= wire17;
          if (reg18)
            begin
              reg23 <= {wire8[(3'h4):(1'h0)], reg20};
              reg24 <= (~&((($unsigned(reg22) ?
                      $unsigned(wire14) : {wire10}) & (!$unsigned(wire10))) ?
                  ($unsigned((reg23 ? wire12 : reg22)) ?
                      (((8'h9c) - (8'ha9)) ?
                          {wire7, reg23} : {reg21}) : $unsigned({wire10,
                          wire12})) : $signed({$signed(wire12), (-reg22)})));
              reg25 <= $unsigned((~reg20));
            end
          else
            begin
              reg23 <= wire16[(4'h8):(3'h7)];
              reg24 <= (reg19[(3'h5):(3'h5)] ?
                  $signed($signed(reg25[(4'hb):(2'h3)])) : reg19);
            end
        end
      else
        begin
          reg18 <= $unsigned($unsigned(($unsigned($unsigned(wire9)) ?
              ((wire8 ? (8'hbd) : (8'ha6)) <= (wire17 ?
                  wire8 : reg18)) : $signed({wire13, wire13}))));
          reg19 <= $unsigned((~&((~&(wire13 ? wire13 : wire10)) ?
              ((wire9 != reg25) ~^ wire13[(4'ha):(2'h2)]) : reg22[(3'h5):(1'h0)])));
          if (($signed({$unsigned((wire9 ? wire16 : reg24)),
                  wire11[(4'h9):(4'h9)]}) ?
              {($signed($signed(wire9)) ? reg21[(2'h3):(1'h0)] : reg25),
                  $unsigned(({wire17, wire7} ?
                      $unsigned(reg19) : wire15))} : $unsigned($signed((wire9 ?
                  reg18[(4'h9):(4'h9)] : (~&wire8))))))
            begin
              reg20 <= (wire15[(2'h3):(1'h1)] ?
                  wire17 : (!($unsigned((+(7'h44))) ?
                      {$unsigned(reg23)} : wire16)));
              reg21 <= ((wire15 << ($signed((~^wire12)) ?
                  $signed((!wire14)) : $unsigned({wire9,
                      wire15}))) ~^ (((~&(+wire10)) ?
                      wire11[(2'h3):(1'h0)] : (~^reg19)) ?
                  {$unsigned($signed(reg20))} : (+(!reg21[(3'h7):(3'h4)]))));
            end
          else
            begin
              reg20 <= (~&reg21[(1'h0):(1'h0)]);
              reg21 <= reg22;
              reg22 <= (wire11 >>> (reg25[(4'he):(1'h1)] ?
                  wire7[(1'h0):(1'h0)] : reg24[(5'h10):(1'h0)]));
              reg23 <= (!(8'ha7));
            end
          reg24 <= ($signed({$signed(reg20)}) ?
              (!$signed(wire9[(4'h9):(1'h0)])) : ({((reg25 ?
                      wire13 : wire10) >>> {wire12, wire11})} && (!(-reg24))));
          if ((-(wire10 * $unsigned($unsigned((&reg24))))))
            begin
              reg25 <= reg21[(2'h2):(2'h2)];
              reg26 <= ((($unsigned((wire10 + wire17)) ?
                          (~&wire11) : reg24[(3'h6):(2'h3)]) ?
                      (-$unsigned($unsigned(wire17))) : reg21) ?
                  (reg22[(3'h5):(2'h3)] ?
                      $signed(((reg22 ? wire14 : wire9) ?
                          wire14 : (wire16 <= reg21))) : $unsigned({(wire7 ?
                              reg25 : wire9),
                          $signed(wire17)})) : wire10);
            end
          else
            begin
              reg25 <= wire8;
              reg26 <= $unsigned((&reg24[(1'h0):(1'h0)]));
              reg27 <= {$unsigned($signed((8'haf))), wire17[(1'h1):(1'h1)]};
            end
        end
      reg28 <= (|$unsigned(($signed(reg25) << ({wire17} ?
          (8'hae) : (^wire8)))));
      reg29 <= wire10;
    end
  always
    @(posedge clk) begin
      reg30 <= {(~|wire15[(1'h1):(1'h1)]),
          ({{$unsigned((8'had))},
              (^reg22[(3'h7):(1'h1)])} + $signed($signed(wire9[(3'h5):(2'h3)])))};
      reg31 <= wire14[(3'h6):(3'h5)];
      reg32 <= reg29;
    end
  assign wire33 = ((^(8'hae)) ?
                      ((~$unsigned({(8'hb1), reg27})) ?
                          ((wire13 + (reg32 ? reg22 : reg28)) >> ((wire13 ?
                                  wire16 : (8'hbe)) ?
                              wire10 : (reg30 << (8'hae)))) : wire12[(4'ha):(1'h0)]) : (~^reg29));
  assign wire34 = ((^~(reg27[(1'h1):(1'h1)] ?
                      (reg27[(5'h10):(4'h9)] ?
                          $signed(reg21) : (wire10 || wire15)) : {(reg32 >> wire9)})) != (($signed(wire10) ?
                      (reg25 ?
                          $signed(wire14) : (wire15 ?
                              reg29 : wire12)) : $unsigned((wire13 ?
                          (8'hbf) : reg20))) ~^ {(-((7'h40) ? wire11 : reg20)),
                      $signed(((7'h43) && reg28))}));
  assign wire35 = ($signed(((reg25[(4'hd):(2'h2)] ?
                      $unsigned(wire13) : wire33[(3'h4):(1'h0)]) > $unsigned($unsigned(reg26)))) != (!(wire7 >>> $unsigned(reg26[(4'hc):(1'h1)]))));
  module36 #() modinst74 (.clk(clk), .y(wire73), .wire41(wire11), .wire37(reg29), .wire39(reg21), .wire38(wire16), .wire40(wire17));
  assign wire75 = (&$unsigned((7'h43)));
  assign wire76 = (reg24 * reg26[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg77 <= $unsigned(reg30);
    end
  assign wire78 = ((^reg77) > {(((reg23 ?
                          reg28 : wire10) <<< reg21[(4'hc):(4'hb)]) || $signed($unsigned(wire73))),
                      {((~reg22) ^~ $unsigned(wire14)),
                          (~&$unsigned(wire76))}});
  assign wire79 = {($unsigned(((^wire8) || (wire78 ? wire8 : reg18))) ?
                          $signed(reg19[(2'h3):(2'h2)]) : ((~|$signed(wire15)) || $signed(((8'hac) < wire12))))};
  assign wire80 = reg23;
  assign wire81 = ({reg77} ~^ wire15);
  assign wire82 = $unsigned((8'h9f));
  assign wire83 = $signed((reg29[(1'h1):(1'h1)] ?
                      wire33[(2'h3):(2'h2)] : ($signed(reg29[(4'h9):(3'h7)]) ?
                          ((wire16 >>> wire82) - $unsigned((8'haf))) : wire14)));
  assign wire84 = ($unsigned(({$signed(wire33), (+reg23)} ?
                          wire75[(2'h3):(1'h0)] : {wire83})) ?
                      ((-{$signed((8'hbe))}) ?
                          ({wire33[(4'he):(4'hc)],
                              (~&wire15)} ^ $signed(wire11)) : (({wire15,
                                  reg31} >>> (-wire79)) ?
                              $signed(wire78[(1'h0):(1'h0)]) : (wire16[(4'he):(4'ha)] || $signed(reg25)))) : (~&$unsigned((wire33 ?
                          $signed(reg23) : wire13))));
endmodule

module module36
#(parameter param71 = (((|(((8'ha4) ^~ (8'hb8)) * ((8'had) ? (8'hb0) : (7'h43)))) ? {(((8'ha3) != (8'hb4)) ~^ {(8'hbc)})} : (8'hbe)) ? (({(&(8'hba))} ? (~|((8'hbc) & (8'hb6))) : (&((8'hb6) ? (8'hb1) : (7'h40)))) & (7'h43)) : (^~{(^~{(8'hae)})})), 
parameter param72 = param71)
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire39;
  input wire [(3'h6):(1'h0)] wire38;
  input wire signed [(4'hc):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire42;
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire47,
                 wire46,
                 wire45,
                 wire42,
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
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire42 = (8'ha5);
  always
    @(posedge clk) begin
      reg43 <= {wire38[(3'h5):(2'h2)], $signed(wire38[(3'h4):(2'h2)])};
      reg44 <= {(&{$signed(wire42[(1'h1):(1'h1)])}), (~&reg43[(3'h4):(2'h3)])};
    end
  assign wire45 = ($unsigned($unsigned((wire38 ?
                      ((8'haa) != wire37) : (wire37 ?
                          (8'ha2) : wire42)))) != (($unsigned((wire41 >> (7'h44))) ?
                          ((^wire38) != (^wire40)) : (+$signed(reg43))) ?
                      (^~$signed($signed(reg44))) : wire40));
  assign wire46 = (wire41 ? wire39[(3'h4):(3'h4)] : reg44);
  assign wire47 = $unsigned(($unsigned(($signed(wire37) == (wire37 <= reg44))) ?
                      $signed((((7'h43) || reg44) | $signed(wire40))) : ((^~$signed(wire39)) > ((wire40 ~^ reg43) ?
                          (wire40 ? wire40 : wire38) : $signed(wire37)))));
  always
    @(posedge clk) begin
      if ($signed(wire41))
        begin
          reg48 <= (~^{$signed($signed($signed(wire38))),
              ($unsigned({wire37, wire38}) <= (~&(|reg44)))});
          if (wire41)
            begin
              reg49 <= wire38[(2'h2):(1'h1)];
              reg50 <= wire40;
              reg51 <= $unsigned(($unsigned((^(~&reg44))) * ((wire40[(3'h7):(2'h3)] ?
                  {reg50} : (reg44 || wire46)) >> wire46[(3'h6):(3'h6)])));
              reg52 <= reg48;
              reg53 <= wire41[(4'h9):(1'h0)];
            end
          else
            begin
              reg49 <= {$signed((^wire39))};
            end
          reg54 <= (~$unsigned(wire39));
          reg55 <= $signed((((&(reg50 ? reg48 : reg53)) ?
              reg43[(3'h7):(3'h5)] : wire42[(2'h3):(2'h2)]) + (($unsigned(reg54) ?
              wire42 : reg52) >= $unsigned($unsigned(wire47)))));
          if (wire40[(4'h9):(3'h4)])
            begin
              reg56 <= ((!(((reg54 ? wire45 : (8'hb4)) ^~ {(8'hb5),
                      reg49}) > $unsigned(reg55[(2'h3):(2'h2)]))) ?
                  (|$unsigned($unsigned((wire39 & reg49)))) : ($unsigned((reg49 ?
                      wire46 : reg44[(2'h3):(1'h1)])) != reg54[(3'h7):(3'h7)]));
            end
          else
            begin
              reg56 <= ($signed(reg54[(1'h1):(1'h1)]) == $signed(((^$signed(wire45)) ?
                  reg52[(3'h5):(2'h3)] : {(reg43 != reg52)})));
              reg57 <= $signed({{(reg49 ? $unsigned(wire42) : $signed(wire39))},
                  ((~&{reg53, wire40}) && reg54[(3'h5):(3'h5)])});
              reg58 <= $signed($unsigned(reg50[(4'ha):(4'h9)]));
            end
        end
      else
        begin
          reg48 <= $unsigned((-$unsigned(wire42[(3'h6):(3'h6)])));
          reg49 <= ((-$unsigned((reg51 ?
                  $unsigned((8'h9d)) : (wire40 << wire46)))) ?
              $unsigned(wire38[(3'h5):(1'h1)]) : $unsigned($unsigned({reg56[(1'h0):(1'h0)]})));
          reg50 <= $unsigned(wire37);
          reg51 <= reg55[(3'h4):(2'h3)];
        end
    end
  assign wire59 = $signed(($signed((8'hb1)) ?
                      (reg56[(2'h3):(2'h2)] * reg57[(2'h2):(2'h2)]) : $unsigned({((8'hba) ?
                              reg52 : reg58)})));
  assign wire60 = $signed(($signed($unsigned(reg43)) ?
                      (reg48 ? reg48 : reg58) : wire45));
  assign wire61 = $signed(wire47[(4'hf):(4'hf)]);
  assign wire62 = (~reg51);
  assign wire63 = $unsigned($signed(($signed(wire38[(3'h4):(1'h1)]) * ($unsigned(wire46) ?
                      {reg50, wire62} : (~wire37)))));
  assign wire64 = $unsigned($signed((((wire62 != wire42) ?
                          $signed(reg50) : $signed((8'ha7))) ?
                      ((reg43 ^~ reg53) ?
                          (wire39 < reg43) : $unsigned((8'ha6))) : wire62[(4'h8):(1'h0)])));
  assign wire65 = wire46[(3'h6):(2'h3)];
  assign wire66 = (^($signed((~|$unsigned((8'had)))) ?
                      (&(wire46 <<< ((8'h9d) ?
                          wire62 : reg57))) : ((^wire39) == ($unsigned(wire42) ?
                          $unsigned(wire63) : reg56[(1'h0):(1'h0)]))));
  assign wire67 = (~&reg49[(3'h5):(3'h4)]);
  assign wire68 = (~$signed($signed($signed(reg43))));
  assign wire69 = $signed(wire61[(5'h10):(4'he)]);
  assign wire70 = wire61[(4'hc):(2'h3)];
endmodule
