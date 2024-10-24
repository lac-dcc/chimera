module top
#(parameter param122 = ((|((&((8'ha0) * (8'haa))) ? (((8'haa) >>> (7'h42)) ? (~&(8'hb7)) : (~(8'hbb))) : (&(8'h9d)))) ? (-{(8'hb8), (^((8'ha8) ? (8'hba) : (8'ha9)))}) : ((|(((8'ha9) || (7'h42)) ^~ ((8'h9f) ? (8'hba) : (8'ha8)))) ? {(~&(~(8'haf)))} : (({(8'hbc)} ? ((7'h42) ? (8'ha4) : (8'hb0)) : (~^(8'h9c))) ? (!((8'hb3) ^~ (8'h9d))) : (((8'hb6) ? (8'hae) : (8'hb0)) == ((7'h40) ? (7'h42) : (8'haa)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire48;
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire109,
                 wire50,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire48,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire4 = wire1[(2'h3):(1'h0)];
  assign wire5 = $unsigned(((~^wire0) ? {wire2[(1'h1):(1'h0)]} : wire1));
  assign wire6 = (-$signed(($signed(wire4[(4'h9):(2'h2)]) ^~ wire4)));
  assign wire7 = $signed(wire2[(3'h7):(1'h0)]);
  module8 #() modinst49 (wire48, clk, wire7, wire5, wire6, wire4, wire3);
  assign wire50 = (&{wire0[(2'h3):(1'h1)]});
  module51 #() modinst110 (wire109, clk, wire6, wire7, wire48, wire3);
  assign wire111 = $signed($unsigned(((wire50[(4'ha):(4'h9)] ?
                           $signed(wire6) : wire2) ?
                       $signed($unsigned(wire48)) : {{wire5}})));
  assign wire112 = {wire4[(4'hc):(1'h1)]};
  assign wire113 = wire109;
  assign wire114 = $signed($unsigned((~^wire1)));
  always
    @(posedge clk) begin
      if (wire113[(3'h5):(2'h2)])
        begin
          if ((&$signed($unsigned(wire111))))
            begin
              reg115 <= ((-wire6) == wire114[(3'h7):(2'h3)]);
              reg116 <= ($signed($unsigned((wire4[(4'hd):(3'h4)] ?
                      {wire7} : $signed(wire1)))) ?
                  wire5[(4'ha):(2'h3)] : $signed({{(wire112 >= wire6),
                          wire6[(5'h10):(4'he)]},
                      (|wire50)}));
            end
          else
            begin
              reg115 <= wire2;
              reg116 <= reg116;
            end
          if ($unsigned((|wire4)))
            begin
              reg117 <= wire109[(4'he):(3'h6)];
              reg118 <= wire111;
            end
          else
            begin
              reg117 <= {$unsigned((wire7 >= {(^~wire1)}))};
              reg118 <= reg116[(4'h9):(3'h5)];
              reg119 <= wire48;
              reg120 <= $signed((-(+$signed($signed(wire111)))));
            end
          reg121 <= wire1;
        end
      else
        begin
          reg115 <= reg115[(3'h4):(2'h3)];
          reg116 <= (reg120 ? wire6 : wire114[(3'h6):(1'h1)]);
          reg117 <= (~&$unsigned((((&wire111) ?
                  (wire109 ? wire2 : wire112) : wire50) ?
              wire7[(4'h9):(2'h2)] : $signed($unsigned(reg116)))));
          reg118 <= $signed(((~&$unsigned((wire112 ? (8'ha1) : reg117))) ?
              $signed((^~wire6)) : wire7));
        end
    end
endmodule

module module51
#(parameter param108 = {(((^~(&(7'h40))) >= {(+(8'hb0)), {(8'hab), (8'hae)}}) ? (~(((8'ha9) ? (8'ha9) : (8'ha2)) ^ ((8'hb8) ? (8'h9c) : (8'hb8)))) : (((-(8'hb1)) <<< (^~(7'h41))) || (((8'ha1) <= (8'hbb)) ? {(8'ha6), (8'ha9)} : ((8'ha6) ? (8'hb2) : (7'h44))))), {(^(~^((8'hb4) >= (8'h9e))))}})
(y, clk, wire52, wire53, wire54, wire55);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire52;
  input wire [(5'h15):(1'h0)] wire53;
  input wire signed [(5'h10):(1'h0)] wire54;
  input wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(4'ha):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire91;
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire56,
                 wire57,
                 wire58,
                 wire91,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire56 = $signed($signed($unsigned(wire52[(3'h6):(3'h6)])));
  assign wire57 = wire54[(3'h4):(3'h4)];
  assign wire58 = (&(~|$unsigned(wire53)));
  module59 #() modinst92 (.wire60(wire56), .wire63(wire55), .wire62(wire54), .y(wire91), .clk(clk), .wire64(wire52), .wire61(wire57));
  assign wire93 = wire52[(2'h2):(1'h1)];
  assign wire94 = $signed({wire91, {(8'hb7), $unsigned(wire93)}});
  always
    @(posedge clk) begin
      if ((~(wire94 ?
          $signed((wire53[(3'h7):(3'h4)] >> (wire91 | (8'hae)))) : $signed((7'h43)))))
        begin
          reg95 <= ({(wire55[(4'hb):(1'h1)] ?
                      $unsigned((wire55 << wire94)) : $unsigned({wire58})),
                  (!wire58[(3'h4):(1'h1)])} ?
              (wire91[(1'h0):(1'h0)] ^~ ({(wire53 >> wire55)} ?
                  $signed((~wire57)) : wire53)) : wire55[(5'h13):(4'he)]);
          reg96 <= $signed(({(-$signed(reg95)),
              (wire57 >>> $signed(wire56))} >= $signed(wire56[(4'hb):(1'h0)])));
          if ((8'ha8))
            begin
              reg97 <= $signed({wire52[(3'h7):(2'h2)]});
              reg98 <= ((reg97 ?
                      (-(8'ha0)) : ($signed($unsigned(wire58)) ?
                          $signed($unsigned(wire91)) : ({wire57} ~^ $signed((8'ha6))))) ?
                  wire57[(1'h0):(1'h0)] : ($signed(wire58) ?
                      $signed((~$unsigned(wire94))) : $signed(reg95)));
              reg99 <= $unsigned($signed(wire57));
            end
          else
            begin
              reg97 <= wire53[(1'h0):(1'h0)];
              reg98 <= reg98[(3'h5):(1'h1)];
              reg99 <= wire57[(4'hd):(3'h5)];
              reg100 <= ($unsigned((((wire56 <<< wire53) ?
                  $unsigned(wire91) : {wire93}) - (+wire57))) & $unsigned(($unsigned(wire56) ~^ $unsigned(wire53[(4'he):(2'h2)]))));
              reg101 <= (~^reg97[(3'h5):(2'h2)]);
            end
        end
      else
        begin
          if (wire58[(2'h3):(1'h1)])
            begin
              reg95 <= ((($signed(wire58[(2'h2):(1'h1)]) ?
                      $signed((wire56 || reg98)) : (~&$signed(wire58))) - $unsigned((wire53[(4'hc):(4'h9)] ?
                      (wire53 ^~ wire94) : ((8'h9c) ? wire91 : reg95)))) ?
                  $signed($signed((~^reg98))) : (^~(reg95[(2'h3):(1'h1)] < {reg96})));
              reg96 <= ((~^(reg100 ?
                      (~&(|wire56)) : (~&wire91[(1'h0):(1'h0)]))) ?
                  (reg95[(3'h5):(3'h4)] ?
                      (((wire55 ? wire55 : reg96) ?
                          {wire57,
                              wire54} : wire52) != wire94[(4'h8):(3'h5)]) : (&{(reg99 ?
                              reg97 : reg95),
                          (|reg100)})) : $unsigned((((^~wire54) & wire56[(4'hc):(1'h0)]) & reg95[(4'he):(3'h5)])));
              reg97 <= $signed($signed($signed(($unsigned(wire91) >= (reg98 ^~ reg95)))));
              reg98 <= (($unsigned(wire54) ?
                  (wire54[(4'hb):(2'h2)] ?
                      reg98 : (reg95[(2'h3):(1'h0)] & $unsigned((8'hae)))) : (~&(wire56 == reg97[(2'h2):(2'h2)]))) && (^({(wire52 ?
                      wire56 : (8'ha8)),
                  wire94} - (~|((8'ha4) || reg97)))));
            end
          else
            begin
              reg95 <= ((^$unsigned((wire54[(4'ha):(1'h0)] ?
                      wire54 : (wire94 ? wire94 : reg95)))) ?
                  (wire57[(3'h7):(1'h1)] ?
                      wire93 : wire57) : wire57[(2'h3):(2'h2)]);
            end
          reg99 <= $unsigned(((^~{{(8'ha4)},
              ((8'hac) >> wire57)}) <= $unsigned(($unsigned(reg101) ~^ (reg100 ?
              wire93 : (7'h40))))));
          if (wire58[(2'h3):(1'h0)])
            begin
              reg100 <= (~|wire55[(1'h1):(1'h1)]);
              reg101 <= ($unsigned(wire93[(2'h2):(2'h2)]) ?
                  reg99 : ((wire91 ?
                      wire53[(5'h15):(5'h15)] : wire91) ^ wire94[(4'hf):(4'hd)]));
              reg102 <= reg97;
            end
          else
            begin
              reg100 <= {($signed(reg99) ?
                      {reg99, $signed(wire52)} : {((reg99 >> (8'hb5)) ?
                              (~^wire57) : wire54[(3'h7):(1'h0)]),
                          reg100}),
                  ($signed((reg100 ^ (~^reg101))) ?
                      $signed(((wire56 ^ reg97) ?
                          $unsigned(wire55) : (~wire55))) : (+(wire53 >>> $signed(wire52))))};
              reg101 <= reg98[(2'h2):(2'h2)];
            end
          if ((^reg96[(1'h0):(1'h0)]))
            begin
              reg103 <= (+($unsigned(wire56[(1'h0):(1'h0)]) >>> $unsigned((^reg98[(3'h6):(1'h1)]))));
              reg104 <= wire93;
              reg105 <= (!(&reg101));
            end
          else
            begin
              reg103 <= reg104;
              reg104 <= ((8'h9d) ? wire52 : wire54[(4'ha):(3'h6)]);
            end
          reg106 <= ($unsigned((wire57[(4'ha):(4'ha)] ?
              wire91[(2'h3):(2'h3)] : wire57)) > $signed({((wire56 - wire94) & $signed(reg101))}));
        end
      reg107 <= ($signed((((reg98 >= reg103) ?
              (~|reg104) : (reg99 & wire93)) == ((reg101 || reg97) ?
              (reg97 < wire58) : (wire91 ? (7'h41) : reg104)))) ?
          (|$signed(reg103)) : (~&$unsigned($unsigned((reg95 ?
              wire93 : reg97)))));
    end
endmodule

module module8
#(parameter param47 = ((8'ha9) == {(8'hbd), ((-((8'ha2) ? (7'h41) : (8'hbd))) ^~ {((8'ha2) ? (8'hb5) : (7'h40))})}))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
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
                 reg19,
                 (1'h0)};
  assign wire14 = $signed((wire11[(4'hb):(4'h9)] ?
                      {(wire10[(4'hc):(2'h3)] ?
                              wire12[(4'hf):(4'h8)] : (wire10 ?
                                  wire13 : wire12))} : (8'hbc)));
  assign wire15 = $unsigned($signed(wire11));
  assign wire16 = wire14[(3'h6):(1'h0)];
  assign wire17 = (~$signed($unsigned({wire9, (-wire9)})));
  assign wire18 = wire13;
  always
    @(posedge clk) begin
      reg19 <= ($signed(((~|(wire9 ? wire13 : wire15)) ?
              wire11 : wire13[(1'h0):(1'h0)])) ?
          wire12[(4'h9):(4'h9)] : (~|wire11[(4'hf):(1'h0)]));
      if (((!wire13) ^ wire15[(4'h8):(2'h2)]))
        begin
          reg20 <= ((^(({(8'ha1)} ^~ (~(8'h9c))) ^ $unsigned($unsigned(wire9)))) < (8'ha0));
          if ((~^($unsigned(wire13[(3'h5):(1'h0)]) ?
              (wire17[(4'h8):(1'h1)] ^~ (8'hb8)) : wire9)))
            begin
              reg21 <= wire16;
              reg22 <= $unsigned($unsigned($unsigned(($signed((8'h9d)) == $signed(wire18)))));
              reg23 <= (~&$unsigned({(~^(wire14 - wire9)),
                  $unsigned((reg20 ? wire14 : (8'ha3)))}));
              reg24 <= (reg19[(1'h0):(1'h0)] ?
                  $signed($unsigned((~$unsigned(reg22)))) : (((((8'ha1) != wire18) ^~ (wire11 != wire14)) * wire14) ?
                      wire13 : $signed($unsigned((reg23 ? wire18 : wire14)))));
              reg25 <= wire17[(4'he):(1'h0)];
            end
          else
            begin
              reg21 <= wire9[(2'h2):(1'h1)];
              reg22 <= wire14[(4'h8):(1'h1)];
            end
          if (reg22[(2'h2):(1'h1)])
            begin
              reg26 <= $signed($unsigned(wire12));
              reg27 <= (~^wire17[(4'hb):(3'h4)]);
            end
          else
            begin
              reg26 <= ((8'hb5) >= {$signed({reg22[(2'h3):(2'h3)]}),
                  (($signed(wire14) ^ (wire13 ?
                      (8'hb9) : (8'ha1))) <<< wire18[(2'h2):(1'h1)])});
            end
          if ($unsigned({(wire17 ?
                  wire12[(4'hc):(3'h7)] : {wire17[(2'h2):(1'h0)]})}))
            begin
              reg28 <= (~^($unsigned(reg26) ~^ reg21));
              reg29 <= wire16;
              reg30 <= wire13;
            end
          else
            begin
              reg28 <= ((reg30 || wire10) ? reg26 : wire9);
            end
        end
      else
        begin
          reg20 <= wire15;
          reg21 <= ($signed(wire11) ?
              (wire17 | $signed((8'ha8))) : {{((wire12 ~^ reg30) ~^ {wire14,
                          wire13})},
                  {$unsigned((wire18 ? wire17 : reg22)),
                      $signed($unsigned(reg24))}});
        end
      reg31 <= $signed($signed($unsigned((~|$signed((7'h40))))));
      reg32 <= {$signed($signed($unsigned($unsigned(reg19)))),
          (reg28 <<< $unsigned({(reg31 ? reg29 : reg30)}))};
      if (({($unsigned({wire15}) ?
                  $unsigned(reg23[(4'hd):(4'hc)]) : ($signed(reg26) <<< $signed(reg25)))} ?
          reg24 : $unsigned(reg26)))
        begin
          reg33 <= reg19[(3'h7):(3'h7)];
          reg34 <= $signed(wire13);
          reg35 <= {reg19[(2'h2):(1'h0)], reg30};
          if ($signed($signed($signed(wire16[(4'he):(3'h5)]))))
            begin
              reg36 <= {reg25[(1'h1):(1'h1)]};
            end
          else
            begin
              reg36 <= $unsigned(($unsigned($signed($unsigned(reg24))) <<< {($unsigned(wire10) ^~ (!wire12)),
                  $signed($unsigned(reg29))}));
              reg37 <= (reg33[(1'h1):(1'h1)] ~^ wire11[(3'h5):(2'h3)]);
              reg38 <= $signed({reg29, reg31});
              reg39 <= ((((wire14[(4'ha):(4'ha)] ?
                  $signed(reg22) : wire14[(4'ha):(4'h9)]) | (wire13[(2'h3):(2'h3)] != $unsigned(reg24))) > $signed(wire13[(4'hc):(3'h7)])) > (~&(wire11[(4'h8):(3'h4)] ?
                  reg25[(3'h6):(1'h0)] : (reg34[(2'h3):(2'h3)] ?
                      $signed(reg32) : $unsigned(reg28)))));
            end
          reg40 <= $signed(($signed(((~&reg24) ?
              ((7'h40) ?
                  reg24 : reg21) : (+(8'ha8)))) >>> wire11[(3'h5):(1'h1)]));
        end
      else
        begin
          reg33 <= (~$signed((reg27 ?
              ((reg28 & reg19) >= $unsigned(wire15)) : ({wire14} & (reg19 << reg19)))));
        end
    end
  always
    @(posedge clk) begin
      reg41 <= wire16;
    end
  assign wire42 = (wire9 ? $signed((8'hb6)) : reg31);
  assign wire43 = (~&reg40[(4'h9):(3'h5)]);
  assign wire44 = (((wire18 ?
                      (~^(wire16 + reg21)) : $unsigned({reg23,
                          reg34})) - ((&wire16[(4'he):(4'h9)]) ?
                      wire18 : wire42)) < reg41);
  assign wire45 = reg30[(1'h0):(1'h0)];
  assign wire46 = $signed({$signed(reg32[(4'hc):(3'h6)]),
                      ((((8'h9f) ? reg39 : reg20) ?
                          (+(8'hb3)) : reg19[(1'h0):(1'h0)]) | {$signed(reg21),
                          $unsigned(reg33)})});
endmodule

module module59
#(parameter param90 = (&(((((8'ha4) ? (8'ha9) : (8'hba)) ? (~(8'hbb)) : (~&(8'hb4))) ^ (|((8'hab) != (8'ha3)))) != {(&(!(8'ha5)))})))
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire64;
  input wire [(5'h13):(1'h0)] wire63;
  input wire signed [(4'h9):(1'h0)] wire62;
  input wire [(5'h11):(1'h0)] wire61;
  input wire signed [(5'h11):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  assign y = {wire89,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire65 = ({wire60[(1'h0):(1'h0)]} ?
                      wire63 : $unsigned(($unsigned(wire62) >>> {{wire64,
                              wire62}})));
  assign wire66 = $unsigned(wire62[(4'h8):(2'h2)]);
  assign wire67 = ({$signed({$signed(wire64)}),
                      (^~$unsigned((wire66 > wire63)))} && ($signed((((8'ha1) > wire65) * wire66)) & $signed($unsigned({wire66}))));
  assign wire68 = ((+(wire60[(4'hd):(4'h9)] || $unsigned({wire62, wire65}))) ?
                      $signed($signed((wire67[(5'h13):(4'ha)] >> (~wire66)))) : (wire66 && wire61[(4'he):(4'hb)]));
  assign wire69 = (((wire67 ? $signed(wire68[(3'h4):(1'h1)]) : wire60) ?
                      (&$unsigned($signed(wire63))) : $unsigned(((wire61 <= wire64) != ((8'ha7) + wire67)))) >>> {$unsigned(((&wire67) ?
                          wire61[(1'h1):(1'h1)] : $signed(wire60)))});
  always
    @(posedge clk) begin
      reg70 <= $signed($unsigned((((wire68 ?
              wire61 : wire64) ^~ wire63[(3'h6):(1'h0)]) ?
          {wire61} : (wire62 + wire61))));
      if ($unsigned($signed(($unsigned((^~wire68)) ?
          wire66[(2'h2):(2'h2)] : wire64[(1'h0):(1'h0)]))))
        begin
          reg71 <= {(!wire63), $unsigned((~&wire61[(4'h8):(3'h7)]))};
          reg72 <= ($unsigned(wire66) ?
              wire67 : $unsigned(({{wire67, wire60}} >= wire66)));
          reg73 <= $signed((({wire65[(4'h9):(3'h7)]} ?
              $unsigned((wire63 ~^ wire68)) : (8'ha8)) - (&(wire69[(2'h3):(2'h3)] << {wire67}))));
          reg74 <= wire65;
          if (wire66)
            begin
              reg75 <= $signed(wire62);
            end
          else
            begin
              reg75 <= $unsigned(((~&wire68) ? $signed(reg74) : (8'ha9)));
            end
        end
      else
        begin
          reg71 <= $signed({$signed(($unsigned(wire62) ?
                  (wire67 ^~ reg74) : (wire67 ? wire65 : reg73))),
              (wire64[(1'h0):(1'h0)] && $signed((wire66 >>> reg71)))});
          reg72 <= wire67;
          reg73 <= reg73;
          reg74 <= $unsigned(wire65);
          reg75 <= wire63[(4'he):(4'ha)];
        end
      if (wire60)
        begin
          reg76 <= (~^(~^reg71));
          if ({((((wire68 || wire61) && (reg70 > (8'hba))) < $signed({(8'ha0)})) ?
                  (((wire68 ?
                      wire68 : wire60) >>> (8'ha1)) & (wire66[(2'h2):(2'h2)] || wire61[(4'he):(3'h6)])) : {$signed(reg73)}),
              (^$unsigned(($signed(reg76) || (&wire63))))})
            begin
              reg77 <= $unsigned((~(+reg73[(4'hc):(4'hc)])));
              reg78 <= (^~wire60);
              reg79 <= reg73[(5'h14):(5'h10)];
              reg80 <= $signed(((|(8'ha1)) ?
                  $signed((reg79[(1'h1):(1'h0)] ^~ (wire63 ^ (8'hbe)))) : ($unsigned($signed(wire64)) >>> (8'hae))));
            end
          else
            begin
              reg77 <= wire64;
              reg78 <= (&$unsigned((((~&wire68) >> ((8'ha7) + reg77)) ?
                  ($unsigned(reg77) ?
                      $signed(reg73) : $signed(reg72)) : (reg79 - (reg70 ^~ wire65)))));
            end
          reg81 <= $signed(((wire60[(3'h7):(1'h0)] ?
                  reg80[(3'h4):(1'h0)] : ($signed((8'hb1)) ?
                      (wire63 ? wire66 : reg76) : $signed(reg72))) ?
              (((wire69 & (8'hbf)) < (reg80 & reg77)) ?
                  reg71 : ($signed((8'h9d)) <<< (&reg70))) : $signed($unsigned($signed(wire68)))));
          if ((-(((wire65 ? $signed(reg75) : ((8'hb9) ? reg77 : reg71)) ?
                  wire61[(3'h7):(2'h3)] : reg74[(5'h13):(4'hd)]) ?
              (($signed(wire64) | $unsigned(reg70)) && (^{reg72})) : (8'hb4))))
            begin
              reg82 <= reg75[(2'h2):(1'h1)];
              reg83 <= $unsigned($unsigned(reg80));
              reg84 <= (wire65 ?
                  (reg80[(1'h1):(1'h1)] - ((wire67[(2'h2):(2'h2)] ?
                          (~(8'ha7)) : ((8'hae) ? reg76 : reg82)) ?
                      ($unsigned(reg74) ~^ reg81[(3'h6):(1'h0)]) : $signed($signed(wire63)))) : wire68);
              reg85 <= wire61[(2'h2):(2'h2)];
            end
          else
            begin
              reg82 <= $unsigned(reg78);
              reg83 <= (((8'h9c) ?
                  $signed($signed(wire67)) : $unsigned($unsigned($signed(reg84)))) != $signed((($signed(reg80) > reg72[(3'h7):(3'h4)]) ?
                  wire66 : reg77[(5'h10):(4'h8)])));
              reg84 <= ($unsigned($signed({wire62[(4'h9):(2'h3)]})) - (reg83 << wire65[(4'hc):(4'hc)]));
            end
          reg86 <= (8'ha3);
        end
      else
        begin
          if ($signed($signed(({reg75, (~^reg79)} | ($unsigned(reg71) ?
              $unsigned(wire67) : (&reg85))))))
            begin
              reg76 <= $signed(wire60[(2'h3):(1'h1)]);
              reg77 <= ($unsigned((8'hae)) ?
                  $unsigned({reg85[(1'h1):(1'h1)],
                      (&$signed(reg74))}) : $unsigned((wire67 ^~ ((wire61 ?
                          wire64 : reg77) ?
                      reg84[(1'h0):(1'h0)] : $signed((8'hb6))))));
              reg78 <= (^wire66);
              reg79 <= {($unsigned(((~^reg82) | {reg78,
                      reg85})) == $signed(reg77)),
                  ({$signed((reg77 ?
                          reg73 : wire66))} + $signed(($signed(reg79) ?
                      (reg76 << wire63) : (~|(8'hbb)))))};
              reg80 <= reg79[(1'h0):(1'h0)];
            end
          else
            begin
              reg76 <= $signed(wire64);
              reg77 <= (&wire67);
            end
          reg81 <= reg76;
        end
      reg87 <= reg79[(1'h1):(1'h1)];
      reg88 <= reg71[(3'h5):(3'h4)];
    end
  assign wire89 = $unsigned(($signed((8'hac)) || (!((^reg74) ^~ (reg84 < (8'hb2))))));
endmodule
