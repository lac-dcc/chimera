module top
#(parameter param112 = (({((^(8'h9f)) <= ((8'ha4) << (8'ha2)))} >= ({(8'hbc)} ? ((~|(8'hb8)) ? {(8'ha9)} : ((8'hb4) ? (8'ha7) : (7'h41))) : (~^{(8'h9e), (8'ha9)}))) ? ((^(~&(-(8'hbe)))) ? (({(7'h41), (8'ha7)} < {(7'h42)}) || (((8'ha2) >>> (8'hac)) ? ((8'hb5) - (8'hac)) : (&(8'hbd)))) : ((8'ha9) << {((8'hbc) ? (8'ha6) : (7'h41)), {(8'hba)}})) : (!{({(8'hbe)} ? (~|(7'h40)) : ((8'h9f) ^ (8'hbd))), (&((8'hae) ? (8'hb0) : (7'h42)))})), 
parameter param113 = param112)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire [(5'h13):(1'h0)] wire103;
  wire [(2'h3):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire98;
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire101,
                 wire100,
                 wire98,
                 reg111,
                 reg110,
                 reg102,
                 (1'h0)};
  module5 #() modinst99 (.clk(clk), .wire7(wire3), .wire8(wire4), .wire9(wire2), .wire6(wire1), .y(wire98));
  assign wire100 = (((^wire0[(1'h0):(1'h0)]) != ((wire0[(2'h2):(1'h0)] > wire2) ?
                           ((wire4 >>> wire0) ?
                               (wire0 >> wire4) : $unsigned((8'hb8))) : wire1[(2'h3):(2'h2)])) ?
                       wire1[(2'h2):(2'h2)] : wire2);
  assign wire101 = ($signed($unsigned($unsigned($unsigned(wire1)))) && ((8'hb6) ^ $signed($unsigned($unsigned((8'hbe))))));
  always
    @(posedge clk) begin
      reg102 <= $signed(wire100);
    end
  assign wire103 = wire4[(1'h1):(1'h1)];
  assign wire104 = (8'hbb);
  assign wire105 = (!((8'h9e) ?
                       $signed(wire101[(2'h3):(2'h2)]) : wire98[(3'h5):(2'h3)]));
  assign wire106 = reg102[(2'h3):(2'h3)];
  assign wire107 = (~^(wire2[(4'h9):(4'h8)] ?
                       $signed($signed((wire1 ?
                           wire103 : wire105))) : {$signed(wire3[(2'h2):(1'h1)]),
                           $signed($signed(wire0))}));
  assign wire108 = ((+$signed($unsigned($unsigned((7'h43))))) ?
                       wire4 : ($signed(wire3) ?
                           ({wire98[(3'h5):(1'h0)]} ?
                               {(wire106 ?
                                       wire3 : wire98)} : $signed($unsigned(wire104))) : wire104[(3'h6):(2'h3)]));
  assign wire109 = wire100[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg110 <= (($signed({(wire107 != wire3),
          wire108}) + wire107) >>> $signed($unsigned((|wire4[(3'h7):(3'h5)]))));
      reg111 <= (-($unsigned($signed((wire104 ? wire98 : wire4))) ?
          wire108[(4'h9):(2'h2)] : (8'hbc)));
    end
endmodule

module module5
#(parameter param97 = (((^~(((8'ha1) * (8'hba)) ? (-(8'hb1)) : {(8'hbb), (8'haa)})) ? (8'hb2) : ((|(~(8'hb7))) <<< (^{(8'ha9)}))) ? {(&(((8'h9c) | (8'hb9)) ? (!(8'hb6)) : ((8'ha0) * (7'h40)))), (&(((8'had) ? (8'hb9) : (7'h40)) ? (|(8'hbd)) : ((8'ha7) >> (8'had))))} : ((({(8'hbc), (8'hb7)} ? ((8'h9f) >= (8'hb6)) : (~&(8'hbc))) ? {((8'hbc) <= (8'ha6))} : (((8'ha3) ? (8'ha6) : (8'hb1)) != {(8'ha4), (8'ha3)})) ? ((((8'hb8) ? (8'had) : (8'ha8)) || (8'ha1)) >= (8'hb7)) : {(((7'h41) < (8'ha5)) - {(8'ha4)}), (((7'h44) >> (8'h9e)) ? (~|(8'hb7)) : (!(8'h9f)))})))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire94;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire71;
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  assign y = {wire96,
                 wire94,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire71,
                 reg16,
                 reg17,
                 reg18,
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
                 reg29,
                 reg73,
                 reg74,
                 (1'h0)};
  assign wire10 = $unsigned(wire6);
  assign wire11 = {$signed(wire7[(4'hf):(4'hc)])};
  assign wire12 = $signed((7'h40));
  assign wire13 = wire8[(3'h5):(3'h4)];
  assign wire14 = ($unsigned((^~(+wire12[(1'h1):(1'h0)]))) ?
                      $signed((wire7 ?
                          (~$signed((8'ha3))) : (wire11[(5'h11):(5'h11)] ?
                              wire8 : $unsigned(wire13)))) : wire13[(1'h0):(1'h0)]);
  assign wire15 = $signed(((wire13 + wire14) ?
                      wire7[(3'h4):(3'h4)] : (wire14[(3'h7):(2'h2)] ^~ (~^wire7[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($signed((!(!($unsigned(wire15) <= wire15[(2'h2):(1'h1)])))))
        begin
          reg16 <= (+({($signed(wire7) ?
                      (wire9 ? wire8 : wire14) : (wire12 != wire6))} ?
              wire12 : $unsigned($signed(wire8))));
          reg17 <= (-(&wire13[(2'h2):(1'h0)]));
          reg18 <= $signed(wire14[(4'ha):(3'h4)]);
        end
      else
        begin
          if ($unsigned($signed(wire8[(4'h9):(3'h5)])))
            begin
              reg16 <= {(wire7[(1'h1):(1'h0)] ? wire15 : wire7[(3'h4):(2'h2)])};
              reg17 <= reg16;
              reg18 <= {(wire13[(2'h3):(2'h3)] ?
                      (((+wire9) ? ((8'hb6) ~^ wire14) : {reg17, (8'haa)}) ?
                          {wire6[(3'h6):(1'h0)],
                              (reg17 ?
                                  (8'hbf) : (8'ha4))} : $signed((~^wire14))) : $signed((wire10[(1'h1):(1'h1)] ?
                          (wire9 ? wire8 : wire6) : $signed(reg16)))),
                  $unsigned(((^wire14) ~^ (|$signed((7'h40)))))};
            end
          else
            begin
              reg16 <= wire7[(5'h10):(2'h3)];
              reg17 <= ({$unsigned(reg16), (~&$unsigned($signed(wire12)))} ?
                  wire9[(5'h13):(1'h0)] : reg18[(1'h0):(1'h0)]);
              reg18 <= (8'hbe);
              reg19 <= {(wire15[(1'h0):(1'h0)] ?
                      wire8[(1'h0):(1'h0)] : ((-(&wire10)) ?
                          $unsigned((wire14 ?
                              wire7 : wire11)) : wire11[(1'h0):(1'h0)]))};
              reg20 <= ($unsigned(wire11) <= {(!((wire14 < (8'hbf)) <= {wire10}))});
            end
          if ((^~(&(|(^$signed(reg20))))))
            begin
              reg21 <= $unsigned(((7'h40) >= ($unsigned($unsigned(reg16)) >> (wire10[(1'h0):(1'h0)] >= (reg19 < reg17)))));
              reg22 <= (8'ha3);
              reg23 <= (^((((+(8'ha3)) ? (~|(8'ha2)) : (!(8'had))) * ({wire14} ?
                      $unsigned(wire10) : (&reg21))) ?
                  (^$unsigned($unsigned(wire11))) : $signed(reg20[(3'h5):(2'h3)])));
            end
          else
            begin
              reg21 <= ({((wire10[(2'h2):(2'h2)] > (reg18 ? wire13 : wire10)) ?
                          (wire7[(2'h2):(1'h1)] ?
                              (8'ha3) : $unsigned(wire11)) : (wire15 ?
                              (wire7 ?
                                  wire11 : wire8) : wire12[(1'h1):(1'h0)])),
                      ({(reg21 ? wire14 : reg23),
                          {reg23, wire14}} ~^ $signed(wire11))} ?
                  wire13[(1'h0):(1'h0)] : $signed($signed((wire14 && (wire8 - wire10)))));
              reg22 <= {$unsigned(wire8[(1'h0):(1'h0)]),
                  $unsigned($signed((reg21[(3'h6):(3'h5)] ?
                      ((8'ha2) ? (8'hb3) : reg22) : $unsigned(reg21))))};
              reg23 <= $unsigned({(((reg23 >>> wire15) ? (!reg19) : (|reg21)) ?
                      wire10 : (((8'hb9) ? reg23 : (8'h9c)) ?
                          (wire15 <= reg17) : $unsigned(reg22)))});
            end
          reg24 <= (!({reg18[(1'h1):(1'h1)], (wire15 <<< wire11)} ?
              ((wire13 >= {(8'ha1), wire12}) & ((reg17 ? (8'hac) : reg17) ?
                  (7'h43) : $signed(reg18))) : $signed($signed((+(8'hb3))))));
          if ($unsigned(wire12))
            begin
              reg25 <= wire9[(5'h11):(2'h2)];
              reg26 <= ((!$unsigned(reg18)) ?
                  (((wire10 ? $signed(reg20) : reg18) ?
                      $unsigned((reg16 <= wire14)) : ((reg24 && wire8) ^ (wire9 ?
                          reg22 : wire9))) + $signed(((reg18 && (8'hb4)) ?
                      {(8'hb8),
                          (7'h40)} : (~^wire14)))) : ((((|reg19) & wire6) & $signed($signed(reg16))) ?
                      wire14 : ((reg25[(2'h2):(1'h0)] ?
                          {reg20} : {wire9}) + reg17)));
              reg27 <= wire6;
              reg28 <= $signed(((((reg26 ? (8'ha4) : wire13) ?
                      (wire15 > wire8) : (reg24 | reg25)) ^~ reg19[(1'h1):(1'h1)]) ?
                  ($unsigned($signed(reg25)) <= reg25[(1'h1):(1'h0)]) : {$signed($signed((8'ha8)))}));
            end
          else
            begin
              reg25 <= $signed((reg26[(3'h7):(3'h5)] >> (wire12 >= (~(reg18 ?
                  reg17 : wire10)))));
              reg26 <= (8'ha9);
            end
          reg29 <= reg18;
        end
    end
  assign wire30 = wire13;
  assign wire31 = $unsigned((~|({$signed(wire15)} <<< ((^~(8'hb3)) <= reg16[(4'h9):(3'h6)]))));
  assign wire32 = $signed($signed($unsigned($signed({wire31}))));
  assign wire33 = wire10[(1'h1):(1'h1)];
  assign wire34 = $signed($signed(wire9[(5'h10):(4'h8)]));
  assign wire35 = reg24;
  assign wire36 = ((^~(wire13[(1'h0):(1'h0)] ~^ reg24[(4'hc):(3'h5)])) <= (~|{wire13[(2'h2):(2'h2)],
                      (wire32 ? (wire12 ^~ wire11) : $unsigned(reg21))}));
  module37 #() modinst72 (.wire38(reg27), .clk(clk), .wire42(reg23), .wire40(reg20), .y(wire71), .wire41(wire34), .wire39(reg29));
  always
    @(posedge clk) begin
      reg73 <= $unsigned($unsigned((^~($signed(reg16) ?
          reg23[(3'h7):(1'h1)] : (|wire11)))));
      reg74 <= wire31[(1'h0):(1'h0)];
    end
  module75 #() modinst95 (.wire78(wire35), .clk(clk), .wire80(reg27), .wire77(wire34), .wire79(reg25), .y(wire94), .wire76(reg23));
  assign wire96 = reg21[(3'h7):(1'h1)];
endmodule

module module75
#(parameter param92 = ((~{(((8'hba) > (8'hbf)) == (~^(8'hae)))}) != ({({(8'h9d), (8'hb9)} ? {(8'ha0), (8'hb1)} : ((8'ha0) & (8'ha0))), (((8'ha9) == (8'hab)) * ((8'hb2) ^ (8'hb8)))} ? (-{(~(8'hbd))}) : (!(((8'hb2) ~^ (8'hb8)) << ((8'h9c) ? (8'ha8) : (8'hba)))))), 
parameter param93 = (((param92 - (8'hae)) ? (param92 == (param92 && ((8'ha7) ? param92 : param92))) : ((param92 ? (~^param92) : {param92, param92}) ? ((8'hbf) ? (~param92) : (param92 ? param92 : param92)) : param92)) ^ {(((^~param92) + {param92}) ? {((7'h42) ? param92 : param92)} : (param92 - (param92 ? param92 : param92))), (({(8'haa), param92} * param92) >> (^(param92 ? param92 : param92)))}))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire80;
  input wire [(5'h11):(1'h0)] wire79;
  input wire signed [(4'h8):(1'h0)] wire78;
  input wire [(4'h8):(1'h0)] wire77;
  input wire signed [(4'ha):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire81;
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 (1'h0)};
  assign wire81 = $signed({$signed(wire79),
                      $unsigned(((wire77 ? wire79 : wire76) ?
                          ((8'hbc) ? (7'h40) : wire80) : $unsigned(wire80)))});
  assign wire82 = (wire76 <= (8'ha2));
  assign wire83 = (($unsigned($unsigned($signed(wire78))) ?
                          $unsigned(((wire81 && wire76) ?
                              $unsigned((8'h9e)) : wire81)) : ($signed($unsigned(wire78)) != (^(8'hbe)))) ?
                      (wire76 ?
                          ($signed(((8'hbc) ^~ wire76)) ?
                              (!wire76) : {wire82[(3'h5):(1'h0)]}) : $unsigned(wire77)) : (~wire77[(3'h6):(3'h6)]));
  assign wire84 = {wire81[(3'h4):(2'h2)],
                      $signed((!((wire77 | wire79) ?
                          ((7'h41) >= (8'hb6)) : (wire83 ~^ wire78))))};
  assign wire85 = wire82;
  assign wire86 = (~^(8'hbd));
  assign wire87 = {$unsigned({(+$signed(wire77)), wire85[(2'h2):(1'h0)]}),
                      wire80};
  assign wire88 = (&$unsigned($signed($signed((wire85 ? wire80 : wire76)))));
  assign wire89 = $signed(wire76);
  assign wire90 = wire87[(3'h5):(1'h1)];
  assign wire91 = wire82[(3'h7):(3'h5)];
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire42;
  input wire signed [(5'h15):(1'h0)] wire41;
  input wire [(2'h2):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  input wire [(3'h6):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire62,
                 wire61,
                 wire59,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg60,
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
                 (1'h0)};
  assign wire43 = ($signed($unsigned((^wire41[(4'hd):(4'hb)]))) << (-$unsigned(wire41)));
  assign wire44 = wire39[(4'ha):(3'h7)];
  assign wire45 = $unsigned({$unsigned($unsigned($unsigned(wire38)))});
  assign wire46 = {(!wire41), wire38[(3'h5):(1'h0)]};
  always
    @(posedge clk) begin
      reg47 <= (-wire43);
      if (wire41[(4'hc):(3'h5)])
        begin
          reg48 <= $signed(wire44[(2'h2):(2'h2)]);
          if ((8'haf))
            begin
              reg49 <= {wire44[(4'hb):(3'h4)]};
            end
          else
            begin
              reg49 <= wire41[(1'h0):(1'h0)];
              reg50 <= {wire38,
                  ($signed(wire43) ?
                      $signed(reg49[(2'h2):(2'h2)]) : {($unsigned(wire46) >= $signed(wire41)),
                          wire43[(4'hd):(2'h2)]})};
            end
          reg51 <= $unsigned((~$signed(wire43)));
        end
      else
        begin
          if ($unsigned($signed((+({wire39, wire38} ?
              (~wire46) : {reg49, wire46})))))
            begin
              reg48 <= wire45;
              reg49 <= $unsigned({wire41,
                  (($unsigned((8'ha0)) >>> reg47) + (wire45 ~^ wire38))});
              reg50 <= $unsigned(wire39[(1'h1):(1'h0)]);
            end
          else
            begin
              reg48 <= (8'ha9);
            end
          reg51 <= wire44;
          reg52 <= wire46;
          reg53 <= (!wire42);
        end
      if (reg50[(4'hd):(3'h4)])
        begin
          reg54 <= $unsigned(reg53);
          reg55 <= ($unsigned((!{{wire45}, reg47})) ?
              ((^(wire46[(2'h3):(2'h2)] ?
                  (reg48 | reg49) : (wire44 ?
                      reg53 : reg53))) & $signed({wire41})) : wire44[(4'h8):(1'h0)]);
          reg56 <= $signed((reg55 ?
              (^reg50[(1'h0):(1'h0)]) : (((reg49 < wire38) ?
                      (^wire43) : (wire46 && reg51)) ?
                  wire46[(4'ha):(3'h4)] : {(reg53 <= reg55), {reg47}})));
          reg57 <= wire39;
          reg58 <= (^(reg56 - $signed(({reg55} ?
              (reg54 ? wire42 : reg53) : $signed(reg49)))));
        end
      else
        begin
          reg54 <= $unsigned({$unsigned(($unsigned(reg52) ?
                  {reg53, wire39} : (wire40 ? reg58 : reg56)))});
          reg55 <= (($unsigned((((7'h44) ^ wire42) ?
              (reg58 ?
                  (8'hb4) : wire44) : reg53)) ~^ $unsigned((wire42[(2'h2):(2'h2)] * (^reg53)))) && reg49);
          reg56 <= (wire43 <= (((reg53 && (wire45 | (8'h9f))) && (+(reg48 ?
                  wire38 : reg50))) ?
              (reg48 ^ $signed($signed((8'hb7)))) : $signed(((reg56 ?
                  reg55 : wire43) | (reg52 <<< reg53)))));
          reg57 <= $unsigned((wire42 ^ (~^wire46)));
          reg58 <= $signed($unsigned((($signed(wire40) && (wire41 && wire40)) >> {reg52[(2'h2):(1'h1)]})));
        end
    end
  assign wire59 = reg51;
  always
    @(posedge clk) begin
      reg60 <= $signed(wire38[(2'h3):(1'h1)]);
    end
  assign wire61 = $unsigned(((({reg60, (8'ha3)} ^ ((8'hb0) ?
                          reg58 : wire45)) * (!$signed(reg52))) ?
                      reg58 : $unsigned(($signed(reg51) - (wire45 * reg50)))));
  assign wire62 = $unsigned(reg58[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      reg63 <= $unsigned(reg52);
      reg64 <= (($signed((8'hab)) ^~ ($unsigned(wire44[(4'he):(4'he)]) ?
              $unsigned(reg50[(2'h2):(2'h2)]) : (reg58 ?
                  $signed(wire44) : reg56[(4'ha):(3'h4)]))) ?
          (^~(~^reg55[(1'h0):(1'h0)])) : $signed(($signed(wire45) ?
              (~|wire40) : ((~^reg58) ? $unsigned((8'hae)) : wire41))));
      reg65 <= $unsigned($unsigned(($signed($signed(wire62)) * $signed((8'ha0)))));
      reg66 <= (8'hbe);
    end
  assign wire67 = $unsigned((wire45 + {wire40[(2'h2):(1'h1)], wire42}));
  assign wire68 = (reg48 >= ({reg52[(4'he):(4'h8)],
                      reg57[(2'h2):(1'h0)]} * ((~$signed(reg53)) ?
                      wire45[(1'h1):(1'h1)] : ((wire44 ? reg60 : reg56) ?
                          (wire44 - reg47) : $unsigned((8'haa))))));
  assign wire69 = (|reg56);
  assign wire70 = wire61[(3'h6):(3'h4)];
endmodule
