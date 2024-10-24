module top
#(parameter param147 = {{(^~(8'hbd)), (~(~|{(8'haf), (8'ha9)}))}}, 
parameter param148 = ((8'hb1) > (param147 ? ((!(param147 - param147)) ? ((^~param147) >= (param147 > param147)) : param147) : param147)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire146;
  wire signed [(4'he):(1'h0)] wire145;
  wire signed [(3'h5):(1'h0)] wire144;
  wire [(2'h3):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire135;
  wire [(4'he):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(2'h2):(1'h0)] wire131;
  wire signed [(3'h7):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire125;
  wire [(4'h8):(1'h0)] wire126;
  wire signed [(3'h6):(1'h0)] wire127;
  wire [(5'h13):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire129;
  reg [(5'h12):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire121,
                 wire84,
                 wire82,
                 wire69,
                 wire67,
                 wire123,
                 wire125,
                 wire126,
                 wire127,
                 wire128,
                 wire129,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg124,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(wire0);
    end
  module5 #() modinst68 (wire67, clk, wire2, wire0, wire1, wire3);
  assign wire69 = ($signed($unsigned($unsigned($signed(wire1)))) <<< $signed((|$unsigned(wire3[(4'h9):(3'h6)]))));
  module70 #() modinst83 (wire82, clk, reg4, wire67, wire1, wire69, wire2);
  assign wire84 = ((-(-((wire2 | wire82) ? (~wire0) : wire67))) ?
                      {$unsigned(wire1[(5'h12):(4'ha)])} : (($signed($unsigned(wire67)) ?
                              $signed(wire67) : $unsigned((reg4 & wire1))) ?
                          (($signed(wire69) ?
                              (wire82 <<< wire67) : ((7'h42) ?
                                  wire3 : wire69)) || wire3[(2'h2):(1'h1)]) : ((reg4[(5'h13):(5'h13)] ?
                              (|wire69) : wire0) ^ ((^~wire0) ?
                              (^~wire1) : $signed(wire0)))));
  module85 #() modinst122 (wire121, clk, wire84, wire67, wire0, wire2, wire1);
  assign wire123 = $unsigned(((wire3[(3'h5):(3'h4)] + wire82[(1'h1):(1'h0)]) ?
                       wire121[(1'h0):(1'h0)] : (&((wire1 | wire69) ?
                           ((8'ha0) | wire82) : ((8'hae) ? wire3 : wire84)))));
  always
    @(posedge clk) begin
      reg124 <= $signed(wire123[(1'h1):(1'h0)]);
    end
  assign wire125 = {wire3[(4'h9):(1'h0)], wire69[(2'h2):(2'h2)]};
  assign wire126 = (({wire1} ?
                       ((&{wire67}) ?
                           (~(~|wire0)) : ((reg4 | wire1) ?
                               $unsigned(wire123) : $unsigned((8'hbf)))) : $signed({wire0})) ^ {((wire2[(5'h12):(1'h0)] != {wire69}) ?
                           ($unsigned(reg124) > (~wire125)) : wire84),
                       wire67});
  assign wire127 = (~&$signed(wire2[(5'h11):(3'h7)]));
  assign wire128 = wire84;
  module85 #() modinst130 (wire129, clk, wire3, wire69, wire0, wire128, wire121);
  assign wire131 = ($signed($signed(wire125)) - ($signed($signed($signed(wire69))) ?
                       $unsigned(((8'ha7) != (wire2 ?
                           wire84 : wire69))) : wire2[(4'ha):(4'ha)]));
  assign wire132 = wire128;
  assign wire133 = $signed((!wire128));
  assign wire134 = {(wire128[(3'h7):(1'h0)] ?
                           ((~^((8'ha8) ^~ wire125)) <= ((wire84 ?
                                   wire1 : reg4) ?
                               (wire125 <<< wire2) : wire1[(4'hf):(4'hb)])) : (($signed(wire131) ^~ wire127[(2'h3):(2'h3)]) ^ wire82[(2'h3):(2'h3)])),
                       {(((~wire84) ?
                               wire3[(2'h3):(1'h0)] : wire132) > $signed(wire128[(5'h11):(4'hf)]))}};
  assign wire135 = ($signed(wire133[(3'h7):(1'h0)]) > ((wire129[(3'h7):(1'h0)] <<< (|(~|wire123))) ~^ {$signed((wire128 ?
                           wire0 : wire69))}));
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire128)))
        begin
          if ($signed(wire1))
            begin
              reg136 <= wire133[(4'hd):(4'h9)];
              reg137 <= {(^~wire126[(4'h8):(3'h6)]),
                  (wire129 ? (|$signed((wire3 == reg136))) : {reg124})};
              reg138 <= ((wire67[(4'h8):(3'h4)] && (+($signed(wire134) << wire84[(4'h8):(1'h0)]))) ?
                  (($unsigned({wire67}) != ((wire123 ? reg124 : (8'hb7)) ?
                          wire121 : (-wire125))) ?
                      wire3 : wire134[(4'h9):(2'h2)]) : {$signed(wire69[(4'hb):(4'h9)]),
                      wire133});
              reg139 <= wire82;
              reg140 <= ($signed((((wire121 == reg139) - (8'hba)) ?
                  (wire67 ?
                      {reg138} : wire123[(1'h0):(1'h0)]) : (wire131[(2'h2):(1'h0)] ^~ $unsigned(wire131)))) && reg139);
            end
          else
            begin
              reg136 <= ($signed((+$unsigned($signed(reg4)))) ?
                  wire133 : ((wire123[(1'h0):(1'h0)] >> ((~^wire0) > wire1[(4'hd):(4'h9)])) != $signed((wire69[(5'h10):(4'hf)] ?
                      ((7'h43) ^ wire131) : wire84))));
              reg137 <= (^~(^($signed(wire125[(4'hc):(3'h4)]) && ($signed((8'hb6)) ?
                  reg137 : $unsigned(reg137)))));
            end
          reg141 <= reg138[(3'h6):(3'h6)];
        end
      else
        begin
          reg136 <= ($unsigned(reg140[(3'h5):(3'h5)]) ?
              $signed((wire126[(3'h4):(2'h3)] ?
                  $unsigned((^wire133)) : {(reg138 ? (8'hb3) : (7'h41)),
                      {wire132, wire131}})) : (($signed({wire0, wire129}) ?
                  ((wire132 ? wire126 : wire69) ?
                      (&reg141) : reg138) : {$unsigned(wire126)}) ^~ ((^wire67) >= reg138)));
          if ({(|$unsigned((~^$unsigned((8'hab))))),
              ($signed((7'h40)) != (+$signed($unsigned((8'hb1)))))})
            begin
              reg137 <= wire126;
              reg138 <= wire133[(4'ha):(2'h2)];
            end
          else
            begin
              reg137 <= ($signed((wire127[(3'h4):(1'h0)] - ({wire1} ?
                  (^~wire121) : (~^wire84)))) != $unsigned(((reg124[(4'hb):(4'h8)] ?
                      (^reg4) : {(7'h41)}) ?
                  wire84 : (~&((8'ha0) <= reg124)))));
              reg138 <= (8'h9f);
              reg139 <= $signed(wire3[(3'h5):(2'h3)]);
              reg140 <= wire123[(1'h0):(1'h0)];
              reg141 <= $unsigned(($unsigned($signed((~^wire128))) ?
                  reg139 : $unsigned(wire133)));
            end
          reg142 <= {{$signed(((reg124 ? wire125 : wire133) - (~|(8'hb5))))},
              $unsigned($unsigned((~&$unsigned(wire129))))};
        end
    end
  assign wire143 = wire135;
  assign wire144 = (+wire143[(2'h2):(2'h2)]);
  assign wire145 = (reg140 ^~ $unsigned(wire67));
  assign wire146 = (wire123[(3'h5):(1'h1)] ^~ wire127[(3'h5):(1'h1)]);
endmodule

module module85
#(parameter param120 = (^~(({((8'ha0) ? (8'hab) : (8'hb4))} ? (((8'hb7) ^~ (8'h9d)) ? ((8'ha7) < (8'hac)) : ((8'ha9) ^~ (8'hb2))) : ((^(8'hbc)) + ((7'h40) ? (7'h40) : (8'h9d)))) ? (|(((7'h42) ^ (8'ha3)) ? (~&(8'hac)) : ((8'ha5) ? (8'ha4) : (8'ha5)))) : ((((8'ha3) ? (8'had) : (8'haa)) == ((8'hb0) ? (7'h40) : (8'hb3))) ? ({(7'h41)} - ((8'h9c) ? (7'h41) : (8'hb3))) : ((-(8'ha1)) ? ((8'hba) * (7'h42)) : (-(8'haf)))))))
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire90;
  input wire [(4'hd):(1'h0)] wire89;
  input wire [(5'h12):(1'h0)] wire88;
  input wire [(5'h13):(1'h0)] wire87;
  input wire signed [(3'h7):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire115;
  wire signed [(3'h6):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire111;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire109,
                 wire92,
                 wire91,
                 (1'h0)};
  assign wire91 = (-({(^~((8'hbc) && wire86))} ~^ ((wire88[(1'h1):(1'h0)] ?
                      (wire87 ? wire87 : wire90) : (wire88 ?
                          wire90 : wire87)) > $signed((~|(8'h9c))))));
  assign wire92 = wire88;
  module93 #() modinst110 (.wire94(wire88), .wire95(wire89), .y(wire109), .clk(clk), .wire96(wire90), .wire97(wire92));
  assign wire111 = (((({wire92,
                           (8'ha1)} || $signed(wire87)) - (wire109[(4'h8):(2'h3)] ?
                           $unsigned(wire91) : {wire92, wire91})) ?
                       wire90 : ($unsigned($unsigned(wire90)) >>> {$signed(wire92)})) >>> wire90);
  assign wire112 = wire88;
  assign wire113 = (^~({($signed((8'hae)) & $unsigned(wire87)),
                       $unsigned($unsigned(wire90))} ~^ (~&(^~((8'hbf) <<< wire89)))));
  assign wire114 = (^~$unsigned((|(~^(wire91 == (8'hab))))));
  assign wire115 = $signed(((^~{$signed(wire90)}) <= $unsigned((|wire86[(1'h0):(1'h0)]))));
  assign wire116 = $signed(wire90);
  assign wire117 = (~&(^~(!$signed((wire109 >>> wire109)))));
  assign wire118 = ($signed(({(&wire115),
                           (+(8'hbb))} >>> (~^$unsigned(wire87)))) ?
                       $unsigned($unsigned($unsigned($signed(wire87)))) : $unsigned(((~|$unsigned((8'hbb))) ?
                           wire88 : wire91)));
  assign wire119 = (wire90[(2'h2):(1'h0)] + (8'hbb));
endmodule

module module70
#(parameter param80 = (|(((~&((8'hb7) ^~ (8'h9d))) ~^ ({(8'ha4)} && ((8'hb9) ? (8'ha1) : (8'hbc)))) ? (~&(((8'ha8) || (8'h9c)) == ((7'h40) <<< (8'hb8)))) : (8'hb2))), 
parameter param81 = param80)
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire75;
  input wire signed [(2'h2):(1'h0)] wire74;
  input wire [(4'hd):(1'h0)] wire73;
  input wire [(5'h11):(1'h0)] wire72;
  input wire signed [(4'h8):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  assign y = {wire79, wire78, wire77, wire76, (1'h0)};
  assign wire76 = $unsigned(wire73);
  assign wire77 = (({wire72[(4'hd):(4'ha)], wire72[(4'h9):(3'h5)]} ?
                      wire75 : {(wire72 << wire76[(3'h6):(2'h2)])}) - (wire75 ?
                      $signed(wire71[(4'h8):(3'h5)]) : wire75));
  assign wire78 = (!(({$signed(wire76), $unsigned(wire73)} ?
                          $unsigned((wire77 ?
                              (8'hb2) : wire76)) : (wire73[(3'h7):(3'h6)] ?
                              (wire73 ? wire77 : wire71) : $signed(wire77))) ?
                      (wire74 != wire74) : wire76[(4'h9):(3'h6)]));
  assign wire79 = ((+$signed($unsigned(wire71))) ?
                      $unsigned(wire78) : $unsigned($signed((~|$unsigned(wire78)))));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire41;
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  assign y = {wire66,
                 wire57,
                 wire56,
                 wire44,
                 wire43,
                 wire10,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire41,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
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
                 reg11,
                 (1'h0)};
  assign wire10 = $unsigned(wire7);
  always
    @(posedge clk) begin
      reg11 <= (8'hb5);
    end
  assign wire12 = $unsigned(wire8);
  assign wire13 = $signed(wire9[(1'h0):(1'h0)]);
  assign wire14 = reg11;
  assign wire15 = $unsigned({$signed((((8'ha6) ? wire9 : wire12) <<< ((8'hbf) ?
                          (8'ha6) : reg11)))});
  assign wire16 = $signed(wire7);
  assign wire17 = wire10[(4'h9):(3'h7)];
  module18 #() modinst42 (.wire20(reg11), .clk(clk), .y(wire41), .wire21(wire14), .wire22(wire7), .wire19(wire13));
  assign wire43 = wire14[(1'h0):(1'h0)];
  assign wire44 = wire15[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg45 <= (($unsigned($unsigned(wire9[(2'h3):(2'h2)])) << {wire44,
          ((wire41 || (8'ha7)) && $signed(wire44))}) && reg11);
    end
  always
    @(posedge clk) begin
      if (wire41)
        begin
          reg46 <= wire43[(3'h6):(1'h1)];
          reg47 <= (&wire44[(4'hc):(3'h7)]);
          if ({wire14[(1'h0):(1'h0)], (~|reg47[(1'h0):(1'h0)])})
            begin
              reg48 <= wire10[(3'h4):(2'h3)];
              reg49 <= ((~^(-($signed(wire14) || wire43))) != (~|wire41));
            end
          else
            begin
              reg48 <= wire10[(5'h12):(3'h5)];
              reg49 <= (~$unsigned($signed({$signed(reg46)})));
            end
        end
      else
        begin
          if ($unsigned(({((&wire8) * {wire6})} >= $unsigned(wire8[(5'h15):(3'h4)]))))
            begin
              reg46 <= wire9;
              reg47 <= wire6[(3'h5):(3'h5)];
              reg48 <= $unsigned($signed(wire13));
              reg49 <= reg47[(1'h0):(1'h0)];
              reg50 <= $unsigned($signed($signed((8'hb1))));
            end
          else
            begin
              reg46 <= (8'hb3);
              reg47 <= (^~reg50);
              reg48 <= $unsigned(wire6);
              reg49 <= reg48[(3'h5):(2'h2)];
              reg50 <= {reg50[(3'h6):(2'h2)]};
            end
          reg51 <= reg11;
          reg52 <= wire43[(1'h1):(1'h0)];
          reg53 <= wire7;
          reg54 <= $signed(wire15);
        end
      reg55 <= {$unsigned({{(|reg50)}}), (^~(-wire12))};
    end
  assign wire56 = (~^reg51);
  assign wire57 = (+(wire43[(3'h4):(1'h0)] && ($unsigned((wire15 || wire14)) || (^~$unsigned(reg47)))));
  always
    @(posedge clk) begin
      reg58 <= wire17;
      if (wire12)
        begin
          reg59 <= (wire44[(5'h11):(4'hb)] ?
              reg50 : {{reg50}, (~|($unsigned((8'ha9)) | $unsigned(reg54)))});
          reg60 <= reg11[(2'h3):(1'h1)];
          reg61 <= (wire8 * ((wire15[(2'h3):(1'h1)] >= (8'hb1)) + wire12));
          reg62 <= {wire10};
        end
      else
        begin
          reg59 <= $unsigned(wire13);
          reg60 <= reg51[(2'h2):(2'h2)];
          reg61 <= reg61;
        end
      reg63 <= (~&reg62);
      reg64 <= ((((~^(reg54 * reg59)) < $unsigned(reg63[(1'h0):(1'h0)])) == {(7'h41),
          reg49}) ~^ (-reg11[(4'hd):(4'hb)]));
      reg65 <= (&($signed((|wire12[(3'h4):(1'h0)])) + ((8'ha3) ?
          ((~reg62) == {(8'hb6), (8'ha7)}) : (~&(+(8'ha9))))));
    end
  assign wire66 = wire15;
endmodule

module module18
#(parameter param40 = (~|(((+{(8'haa)}) ? ((7'h42) ? (&(8'ha3)) : (!(8'ha6))) : (((7'h40) || (8'hae)) ? (&(8'ha5)) : ((8'had) ? (8'hb1) : (7'h41)))) ? (!(((8'ha3) & (7'h40)) << ((8'ha6) | (8'ha0)))) : {(|(8'hbe))})))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire22;
  input wire [(3'h6):(1'h0)] wire21;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
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
                 (1'h0)};
  assign wire23 = (({wire21[(3'h4):(2'h2)]} ^~ $unsigned($unsigned($unsigned(wire20)))) > ((~&{(wire20 ^~ wire20)}) ?
                      wire21[(1'h1):(1'h1)] : (!($signed((8'h9c)) > $unsigned((8'haa))))));
  assign wire24 = (($signed((&wire19)) ?
                          (^~(8'ha3)) : ({{wire23, wire22}} ?
                              ({wire19} & wire21[(2'h3):(2'h3)]) : {$unsigned(wire20)})) ?
                      (($signed(wire22[(4'hd):(3'h4)]) == ({wire22} & {wire21,
                          wire20})) | ($signed(wire23[(4'ha):(1'h0)]) ^~ (wire19 <= (|wire22)))) : $unsigned(($unsigned((!wire22)) ?
                          $unsigned(wire23[(4'he):(3'h7)]) : (wire21 ?
                              (wire23 <= wire21) : (wire21 ^ wire19)))));
  assign wire25 = $signed(wire20[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      if ($unsigned({(wire21 ?
              ($signed(wire22) ^~ (wire21 ? wire21 : wire23)) : (~^(wire19 ?
                  (8'ha4) : wire22)))}))
        begin
          reg26 <= $signed(wire19);
        end
      else
        begin
          if ((wire25[(4'h9):(1'h1)] ? (wire23 ? wire20 : wire21) : wire19))
            begin
              reg26 <= wire24[(2'h2):(1'h1)];
              reg27 <= wire25;
            end
          else
            begin
              reg26 <= (8'hb1);
              reg27 <= wire24[(2'h2):(1'h0)];
              reg28 <= (wire24[(3'h4):(2'h2)] ?
                  $signed($unsigned({wire25,
                      ((7'h41) ?
                          (8'ha0) : wire21)})) : ($signed(wire20[(3'h4):(2'h2)]) != ($unsigned(wire25) - (~|(wire24 ?
                      wire19 : wire24)))));
              reg29 <= (-$unsigned($unsigned((&{reg27, reg27}))));
            end
          if ((^~wire21))
            begin
              reg30 <= $unsigned((wire20 ?
                  $signed({wire25,
                      wire21[(3'h5):(3'h5)]}) : ((~&$signed(wire25)) ?
                      $unsigned(wire23[(3'h5):(2'h2)]) : ((wire19 ^~ wire20) | reg26))));
            end
          else
            begin
              reg30 <= {wire23[(4'hf):(1'h0)]};
              reg31 <= ($signed($signed(reg26[(4'h8):(3'h7)])) << (8'ha1));
              reg32 <= $unsigned(reg31);
              reg33 <= $signed((8'hb2));
            end
          reg34 <= ((^~reg31) ?
              reg26[(3'h7):(1'h1)] : ({reg30[(3'h5):(3'h4)]} ? reg32 : reg26));
          reg35 <= $unsigned($unsigned($unsigned(reg32[(5'h12):(4'ha)])));
          reg36 <= ($unsigned((wire25 <<< reg28[(1'h1):(1'h1)])) ?
              (wire23 ?
                  $signed(wire25) : {{(reg32 >= reg31)}}) : $signed({$signed($unsigned(reg27))}));
        end
      reg37 <= $signed(($signed(({reg27} ?
              $unsigned(reg32) : (wire20 ? reg27 : wire24))) ?
          ({(~reg35), wire19[(3'h7):(1'h1)]} ?
              (reg32[(2'h3):(1'h1)] ?
                  (-wire24) : (reg33 ?
                      wire23 : (7'h43))) : reg34[(5'h10):(4'h9)]) : $unsigned(reg32[(5'h10):(1'h0)])));
      reg38 <= $unsigned((~|(+reg34[(2'h3):(2'h3)])));
      reg39 <= wire20;
    end
endmodule

module module93
#(parameter param108 = ((~|((7'h40) ? (((8'h9e) ? (7'h44) : (8'hb8)) ? ((8'ha8) ? (8'ha8) : (8'hb5)) : {(8'hb0), (8'hbf)}) : ((&(8'hb0)) <= ((8'hb7) ? (8'ha1) : (8'h9d))))) >>> (-((((7'h41) ? (8'ha4) : (8'haf)) ? {(8'hbb)} : ((8'hbb) ? (8'hb3) : (8'hb3))) >> (8'h9d)))))
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire97;
  input wire [(3'h6):(1'h0)] wire96;
  input wire [(4'hd):(1'h0)] wire95;
  input wire signed [(5'h12):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire [(3'h6):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire98;
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  assign y = {wire107,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire98 = {$signed(((-wire95) << wire96[(1'h0):(1'h0)]))};
  assign wire99 = ((!wire97) ?
                      (((8'hb2) ?
                          (~(~^wire95)) : wire98[(4'h8):(1'h1)]) & wire98[(1'h0):(1'h0)]) : wire97[(4'h9):(4'h9)]);
  assign wire100 = (8'h9e);
  assign wire101 = $signed(((~|wire94[(4'ha):(1'h1)]) || {$unsigned(wire100[(4'h9):(2'h2)]),
                       wire94[(4'h9):(3'h6)]}));
  assign wire102 = $unsigned(wire94[(4'hc):(2'h2)]);
  always
    @(posedge clk) begin
      reg103 <= $signed((($unsigned((7'h44)) >= (^$signed(wire97))) ?
          $signed($signed($signed(wire98))) : wire94));
      reg104 <= (+$unsigned((~^wire97[(3'h5):(1'h0)])));
      reg105 <= wire101[(1'h0):(1'h0)];
      reg106 <= (+(|wire95[(1'h0):(1'h0)]));
    end
  assign wire107 = (($unsigned((!reg104)) ?
                       $unsigned({(wire100 != wire98),
                           ((8'hb5) ?
                               wire96 : reg104)}) : $signed($unsigned((wire95 + (8'hbf))))) || ({{((8'hb0) ?
                               wire98 : wire97)},
                       $unsigned($signed(wire94))} != wire98));
endmodule
