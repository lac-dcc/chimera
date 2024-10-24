module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire208;
  wire [(3'h6):(1'h0)] wire207;
  wire [(5'h15):(1'h0)] wire206;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire204;
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire206,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire204,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2;
    end
  assign wire6 = {$unsigned(($signed((!wire1)) ?
                         $unsigned((wire2 ?
                             reg5 : wire1)) : $signed(((8'hb1) & wire0)))),
                     ({(((8'ha5) > wire3) ?
                             wire2[(4'he):(4'ha)] : (wire0 ? reg5 : wire3)),
                         $unsigned($signed(reg5))} <= reg5)};
  assign wire7 = $signed($unsigned((wire4 ^~ $unsigned($unsigned((8'h9e))))));
  assign wire8 = (-(^(($signed((8'hb8)) & $unsigned(reg5)) && $signed(wire1[(4'h8):(2'h2)]))));
  assign wire9 = (reg5[(1'h0):(1'h0)] ?
                     $signed($signed((|wire0[(3'h7):(3'h7)]))) : {(8'haf)});
  assign wire10 = $signed(({{{reg5, wire2}, $unsigned(wire1)},
                      (^wire0[(3'h5):(3'h4)])} + (-wire8)));
  assign wire11 = $unsigned($unsigned(wire0[(1'h1):(1'h0)]));
  module12 #() modinst205 (wire204, clk, wire1, wire2, wire10, wire8, wire3);
  assign wire206 = {($unsigned((8'h9f)) != wire2), $unsigned(wire10)};
  assign wire207 = $unsigned($unsigned(wire10[(3'h5):(3'h5)]));
  assign wire208 = $signed($unsigned(($signed((wire9 ? wire207 : wire10)) ?
                       $unsigned((wire9 ? (8'ha8) : (8'hb8))) : (8'hb1))));
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h38e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire203;
  wire [(4'hb):(1'h0)] wire198;
  wire [(5'h13):(1'h0)] wire193;
  wire [(3'h4):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire102;
  wire signed [(3'h6):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  reg [(4'he):(1'h0)] reg202 = (1'h0);
  reg [(4'ha):(1'h0)] reg201 = (1'h0);
  reg [(5'h15):(1'h0)] reg200 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg196 = (1'h0);
  reg [(3'h7):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  assign y = {wire203,
                 wire198,
                 wire193,
                 wire130,
                 wire128,
                 wire102,
                 wire101,
                 wire89,
                 wire60,
                 wire59,
                 wire19,
                 wire18,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg197,
                 reg196,
                 reg195,
                 reg131,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
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
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 (1'h0)};
  assign wire18 = ($unsigned((|$signed($unsigned(wire14)))) >>> ((!(~$signed(wire14))) ?
                      wire16 : {wire15, wire14}));
  assign wire19 = (~|$unsigned({(-wire18), ($signed(wire14) ^ wire15)}));
  always
    @(posedge clk) begin
      if ({$signed((-($signed(wire16) + wire18))), wire14[(1'h1):(1'h1)]})
        begin
          if ($signed({{$signed((wire16 >> wire16))},
              ($unsigned(wire16[(4'ha):(4'h9)]) ? (8'hb2) : wire17)}))
            begin
              reg20 <= (wire16[(4'ha):(4'h8)] ?
                  ((~|({wire13} ?
                      (wire13 ?
                          wire19 : wire15) : (!wire16))) == ($signed((wire17 ?
                          wire18 : wire18)) ?
                      $signed(wire17) : $unsigned((wire13 ?
                          wire19 : wire15)))) : $unsigned((~^$signed((wire15 ?
                      wire14 : wire13)))));
              reg21 <= wire19[(3'h4):(2'h3)];
            end
          else
            begin
              reg20 <= wire18;
            end
          if ({{wire14[(4'h8):(3'h7)], $signed($unsigned($unsigned(wire17)))}})
            begin
              reg22 <= $unsigned((~($unsigned((wire19 ~^ (8'hb5))) ?
                  $signed(wire18[(2'h3):(1'h0)]) : $signed((-wire13)))));
              reg23 <= {$unsigned((((wire16 ? (8'ha5) : (8'h9c)) ?
                          {wire13} : $signed((8'hbb))) ?
                      ((wire15 != reg20) ?
                          wire18[(2'h3):(2'h3)] : reg21) : ($signed(reg20) ^ (|wire16))))};
              reg24 <= $unsigned(reg20[(1'h1):(1'h0)]);
              reg25 <= $signed($unsigned($unsigned((wire16[(4'h8):(1'h0)] + reg20[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg22 <= wire18;
              reg23 <= $signed((^reg23));
              reg24 <= (wire14 ?
                  (-(({reg22} ? reg22 : $signed(reg21)) - $signed((wire14 ?
                      reg24 : wire13)))) : ((($unsigned(reg24) ?
                          (~|reg21) : reg24[(3'h5):(1'h0)]) >> $unsigned(wire13)) ?
                      ($unsigned(wire15[(2'h2):(2'h2)]) ^~ wire14[(4'h8):(1'h1)]) : (8'hba)));
              reg25 <= ({{((reg21 ? wire15 : wire19) << wire17[(2'h3):(1'h0)]),
                      {wire14}},
                  (((reg25 <<< reg22) & (8'ha1)) & {(wire17 ?
                          reg24 : wire18)})} ^ (!$signed((!(wire15 ?
                  reg24 : reg20)))));
              reg26 <= (reg20[(1'h0):(1'h0)] ?
                  $signed(wire15[(3'h4):(2'h3)]) : $unsigned((+(|$unsigned(reg24)))));
            end
          reg27 <= (~^(^~wire17[(2'h3):(2'h2)]));
          if (wire16)
            begin
              reg28 <= wire13[(3'h5):(3'h4)];
              reg29 <= (($unsigned((reg26[(1'h1):(1'h0)] ^ (wire19 <<< reg23))) ?
                  $unsigned(reg21[(4'hf):(4'hc)]) : wire18[(1'h1):(1'h0)]) <= ((^~wire15) ?
                  $signed(wire17) : $unsigned((&reg26[(1'h0):(1'h0)]))));
              reg30 <= ((reg26 ?
                      ($unsigned(reg21) ?
                          {$signed(wire16)} : reg20[(4'hb):(1'h1)]) : $signed(reg28[(3'h7):(2'h3)])) ?
                  ($unsigned(reg23[(2'h3):(1'h0)]) < reg23) : wire18[(1'h0):(1'h0)]);
              reg31 <= wire14[(2'h3):(1'h0)];
              reg32 <= (~wire18[(3'h4):(1'h1)]);
            end
          else
            begin
              reg28 <= ({{$unsigned((wire15 != wire17))}} ?
                  reg26[(2'h2):(1'h1)] : $unsigned(reg30));
              reg29 <= (~|(~&(reg22 ^~ wire13)));
              reg30 <= (~$unsigned(wire15[(1'h0):(1'h0)]));
            end
          if (wire17[(3'h4):(1'h1)])
            begin
              reg33 <= $signed(wire18);
              reg34 <= (($unsigned(reg27[(1'h1):(1'h1)]) ?
                      (!wire17) : (reg33 << (~(~&reg29)))) ?
                  $signed(wire13) : ($unsigned(wire14) ?
                      $unsigned(reg31[(2'h3):(2'h2)]) : (wire13 ?
                          reg20 : $signed((reg31 ? reg31 : wire19)))));
              reg35 <= $signed($signed((~&((reg26 ?
                  (8'hb2) : reg33) != reg32))));
              reg36 <= {(((8'hb6) ? reg28 : wire18) ^~ {reg29[(1'h0):(1'h0)]})};
            end
          else
            begin
              reg33 <= $signed($unsigned($unsigned(({reg23} < $unsigned(reg27)))));
              reg34 <= reg36[(3'h4):(1'h1)];
              reg35 <= $unsigned(wire19);
              reg36 <= $unsigned(reg36);
              reg37 <= (((|(&$signed(reg32))) ?
                      $unsigned($signed(wire19)) : {($signed((8'hb0)) != (!reg31)),
                          $unsigned((&wire15))}) ?
                  (reg30 ?
                      (&(|(-wire13))) : reg28[(3'h6):(1'h1)]) : $unsigned($unsigned({reg27})));
            end
        end
      else
        begin
          reg20 <= (wire17[(2'h3):(1'h0)] ?
              (~(reg25 ?
                  reg20 : $signed((wire14 << reg24)))) : $signed((($unsigned(reg24) ?
                  ((8'h9e) >>> reg25) : wire17[(3'h4):(3'h4)]) != $unsigned((wire18 & reg21)))));
          reg21 <= (-reg23);
          if (((((^~reg26[(2'h3):(2'h2)]) <= ((reg27 != reg26) == wire17[(2'h3):(2'h2)])) ?
                  $unsigned((^~$signed(reg23))) : ($signed((reg23 ^ reg23)) || (~$signed(wire19)))) ?
              $unsigned(((reg30 ?
                  $unsigned(reg31) : $signed(reg33)) >>> (reg28[(4'h9):(3'h6)] - wire17))) : reg22[(4'h9):(3'h6)]))
            begin
              reg22 <= ($unsigned($signed($signed($unsigned(reg26)))) ?
                  (reg29[(4'ha):(2'h3)] ?
                      (8'ha3) : wire15[(3'h4):(3'h4)]) : reg37[(4'hd):(4'hd)]);
              reg23 <= reg22[(4'ha):(1'h0)];
              reg24 <= reg35;
            end
          else
            begin
              reg22 <= $signed(({(~^(!reg24))} > (wire19 ?
                  wire19 : $unsigned((wire18 == reg34)))));
              reg23 <= $signed({($unsigned($unsigned(wire15)) ?
                      wire14 : $signed((reg32 <<< reg20))),
                  reg31[(2'h3):(2'h3)]});
            end
          reg25 <= reg32[(2'h3):(1'h0)];
          reg26 <= $signed(reg30[(1'h1):(1'h1)]);
        end
      if (reg28[(3'h4):(3'h4)])
        begin
          reg38 <= ((((~^$unsigned(reg20)) ?
              ({reg35} & reg36[(3'h7):(3'h4)]) : $unsigned(reg23[(3'h7):(3'h7)])) >= reg30) > ({(~^reg23),
              ($signed(wire19) + (~|reg35))} + reg33[(2'h2):(1'h1)]));
          reg39 <= {(~^$signed(({reg31} ? $unsigned(wire17) : {wire16})))};
        end
      else
        begin
          reg38 <= $unsigned((^~(|reg31[(3'h4):(1'h1)])));
        end
      reg40 <= (reg28 < $unsigned(($signed((reg29 && reg39)) == (reg25[(4'hb):(4'h9)] ?
          wire17[(2'h3):(1'h0)] : wire13))));
      if ({reg35[(1'h0):(1'h0)]})
        begin
          reg41 <= (~&(~|(8'ha1)));
          reg42 <= ($signed(wire15) ?
              (^(~wire15)) : (reg23[(2'h2):(2'h2)] ?
                  {reg37[(5'h14):(4'he)]} : ((^~reg28) ?
                      $unsigned(reg38[(3'h7):(2'h2)]) : {(reg25 ~^ reg27)})));
          reg43 <= $unsigned($signed($unsigned((^(reg33 ? reg24 : reg37)))));
          reg44 <= {($signed(reg27) ?
                  ($unsigned(reg33) ?
                      {$signed(reg27),
                          (reg26 ?
                              (7'h43) : reg22)} : (!reg32[(2'h2):(2'h2)])) : $signed(reg38[(2'h3):(1'h1)])),
              (reg20 ? (~&{wire15}) : wire15)};
          if (reg41)
            begin
              reg45 <= $signed({(8'hab), $signed(reg34[(1'h0):(1'h0)])});
              reg46 <= wire18[(3'h4):(1'h1)];
            end
          else
            begin
              reg45 <= reg28;
            end
        end
      else
        begin
          reg41 <= ((~reg29) ?
              (((~$signed(reg36)) >>> reg26) ?
                  reg31[(2'h2):(2'h2)] : (|$unsigned((^~reg44)))) : ((($unsigned((8'ha0)) >>> (reg37 ?
                      reg46 : (8'haf))) ?
                  reg23 : ((!reg28) ?
                      reg34 : (reg40 ~^ reg41))) >= reg43[(4'h8):(3'h7)]));
          reg42 <= $unsigned(reg32[(2'h3):(2'h2)]);
          reg43 <= $unsigned(wire18);
          reg44 <= $unsigned(wire18);
        end
      if ((wire16 * ((reg39[(5'h14):(2'h2)] ?
              reg44 : (((8'hb5) & (8'hb9)) >>> (reg20 + (8'hb9)))) ?
          reg44 : (($unsigned(reg22) | (^~(8'hb5))) >> (reg36 ?
              (reg24 ? reg34 : wire19) : (reg46 | (8'hab)))))))
        begin
          if ($signed((8'ha9)))
            begin
              reg47 <= (|(reg44 ? reg25[(5'h10):(3'h5)] : reg27));
              reg48 <= $signed(((~reg25[(4'hd):(1'h1)]) ? wire13 : reg47));
            end
          else
            begin
              reg47 <= $signed($unsigned((reg39[(4'hc):(4'h9)] >= reg39)));
              reg48 <= $signed((&$signed($signed(reg41))));
            end
          reg49 <= reg34[(1'h1):(1'h0)];
          if (reg24[(4'h8):(3'h5)])
            begin
              reg50 <= (|$signed((reg37[(4'h9):(1'h1)] ?
                  reg22[(3'h5):(1'h0)] : ($unsigned(reg21) ?
                      $unsigned(wire15) : (reg27 ? (7'h42) : reg28)))));
              reg51 <= ((8'hb2) <<< ((~^$signed($unsigned(reg23))) & ($unsigned((reg20 != reg45)) ?
                  wire18 : (&{wire14, reg47}))));
              reg52 <= ($signed(wire19[(2'h3):(2'h3)]) << {$unsigned(reg49),
                  reg51[(3'h7):(3'h6)]});
              reg53 <= (($signed(wire14) & (^~(!reg38[(3'h5):(2'h2)]))) && (^~reg20));
            end
          else
            begin
              reg50 <= ((wire15 <<< {$signed((8'hb9))}) + reg35[(4'hb):(4'ha)]);
              reg51 <= (((reg35[(4'h9):(3'h5)] ? (&reg36) : reg34) ?
                  {$signed(((8'hb4) ? (8'hb3) : reg40)), wire17} : (reg30 ?
                      reg39 : (&(reg23 < reg29)))) << wire18[(3'h4):(3'h4)]);
              reg52 <= (-$unsigned($unsigned(reg32)));
              reg53 <= reg49[(4'h9):(3'h4)];
            end
          if (reg26[(1'h1):(1'h0)])
            begin
              reg54 <= $unsigned((~^($signed(reg41) <= $signed($signed(wire14)))));
              reg55 <= wire14[(3'h5):(2'h3)];
              reg56 <= {{$unsigned($unsigned($unsigned((8'hb2)))),
                      ({(reg41 ? reg39 : reg34), wire13} ?
                          {$unsigned(reg26)} : wire18[(1'h0):(1'h0)])}};
              reg57 <= (^(^~$signed(reg51)));
            end
          else
            begin
              reg54 <= ((-reg21) ?
                  (reg35[(3'h4):(1'h0)] ?
                      (((reg32 & wire17) >= (reg42 ? reg21 : wire16)) ?
                          (((8'hbc) ?
                              reg53 : reg38) | $signed(reg33)) : (reg23[(2'h3):(1'h1)] == reg54)) : (~|(!(!reg22)))) : {(reg28[(3'h7):(3'h5)] >= reg52[(2'h2):(2'h2)]),
                      (+{$signed(reg49), $signed(wire15)})});
            end
          reg58 <= reg37[(1'h0):(1'h0)];
        end
      else
        begin
          reg47 <= $unsigned(reg52);
          reg48 <= $unsigned($signed(wire13[(4'h9):(3'h4)]));
          reg49 <= reg42;
          reg50 <= (reg38[(4'hf):(3'h5)] ?
              ((^~$signed(reg42[(3'h4):(1'h0)])) ?
                  reg54[(3'h4):(1'h1)] : (8'hb1)) : $signed((+reg56)));
        end
    end
  assign wire59 = reg32[(1'h0):(1'h0)];
  assign wire60 = reg39;
  module61 #() modinst90 (.wire62(reg46), .wire65(reg54), .y(wire89), .clk(clk), .wire66(reg21), .wire64(reg44), .wire63(reg28));
  always
    @(posedge clk) begin
      reg91 <= ($unsigned($signed($unsigned(reg53))) || $signed(($signed(reg23) ?
          ({reg51} | (reg22 >= reg58)) : ((^reg33) >> reg36[(1'h1):(1'h1)]))));
      reg92 <= {(+reg54)};
      if ($signed((+($signed($unsigned(reg21)) ?
          $signed((reg54 ? (8'hb7) : reg54)) : ($signed(reg43) || (reg27 ?
              reg35 : reg92))))))
        begin
          reg93 <= (reg91 ? reg21[(1'h0):(1'h0)] : wire16);
          reg94 <= reg31[(1'h1):(1'h1)];
          reg95 <= reg39;
        end
      else
        begin
          if (wire89)
            begin
              reg93 <= (8'hac);
              reg94 <= (7'h43);
              reg95 <= $signed($unsigned(reg91[(2'h2):(1'h1)]));
              reg96 <= $unsigned((^~$signed(reg24)));
              reg97 <= reg27;
            end
          else
            begin
              reg93 <= (((~|{{(8'hb7)}, reg93[(1'h1):(1'h0)]}) ?
                  $signed($signed((|reg26))) : reg37) << {$unsigned($signed(((7'h40) != reg49))),
                  wire60});
              reg94 <= ($unsigned((~|((reg93 + reg57) != $signed(reg45)))) ?
                  {reg58,
                      $unsigned(($signed(reg50) ?
                          (reg26 || reg49) : reg48))} : {wire19[(4'h9):(3'h6)],
                      $signed({(reg96 ^ reg46), (!(7'h41))})});
              reg95 <= $unsigned((~|$unsigned($unsigned((reg52 >>> reg40)))));
            end
          reg98 <= ((reg24[(4'hb):(1'h1)] ?
                  ($signed(reg25) & $unsigned($unsigned(reg23))) : ((reg41 ?
                          ((8'hab) ? wire15 : wire59) : reg24[(5'h12):(2'h2)]) ?
                      $signed($unsigned((8'hb0))) : ((reg22 ?
                          reg54 : wire60) >= reg37[(5'h11):(4'ha)]))) ?
              $unsigned(((reg91 ? (~|reg31) : $unsigned((8'hbe))) & (+{wire18,
                  reg46}))) : reg97);
          reg99 <= (((reg46[(2'h3):(1'h0)] ?
                      ((-(8'ha2)) ?
                          (^~reg23) : $unsigned(reg41)) : ((reg23 + (8'hb5)) ?
                          (reg31 < reg32) : $signed(wire19))) ?
                  $signed(reg31) : $unsigned(($signed(wire13) ?
                      ((8'ha0) ^~ reg51) : (!wire60)))) ?
              {{reg38[(4'hf):(4'h9)], $signed((|reg52))},
                  reg48[(2'h2):(1'h1)]} : reg92[(3'h5):(2'h2)]);
        end
      reg100 <= (^~(+(~^(~$unsigned(reg99)))));
    end
  assign wire101 = $unsigned(reg45);
  assign wire102 = reg25;
  module103 #() modinst129 (wire128, clk, reg56, reg36, reg22, reg34);
  assign wire130 = ($unsigned($unsigned((!(^~reg42)))) <= reg97);
  always
    @(posedge clk) begin
      reg131 <= (reg51 ?
          {(^{wire19[(3'h7):(2'h2)], reg53}),
              ((wire19[(3'h6):(3'h4)] << (reg93 ? (8'hb5) : reg42)) ?
                  (-$signed(reg46)) : ({reg53,
                      reg97} | $unsigned(wire16)))} : (^~reg38[(4'hc):(4'h9)]));
    end
  module132 #() modinst194 (.wire135(reg53), .wire133(reg23), .wire136(reg131), .y(wire193), .clk(clk), .wire134(reg34));
  always
    @(posedge clk) begin
      reg195 <= $signed($unsigned((^~reg94)));
      reg196 <= reg46[(5'h15):(3'h6)];
      reg197 <= (~^(reg196[(3'h7):(3'h7)] ?
          (+reg99) : {reg41[(2'h2):(1'h1)], (~$signed((8'ha8)))}));
    end
  assign wire198 = {reg22,
                       {$signed((((8'ha8) ? reg30 : reg58) >> (reg52 ?
                               reg39 : reg98))),
                           (|$signed((reg29 * wire59)))}};
  always
    @(posedge clk) begin
      reg199 <= {(({reg96[(1'h1):(1'h0)], (wire59 ? (8'hb9) : wire16)} ?
              (^reg45) : (+reg27[(1'h0):(1'h0)])) >= reg39)};
      reg200 <= (!($signed(wire198) >> (((reg43 ? wire60 : reg44) >>> (reg20 ?
          reg28 : reg46)) > $unsigned((reg22 ? reg195 : reg55)))));
      reg201 <= wire15;
      reg202 <= $unsigned((8'ha0));
    end
  assign wire203 = (|reg38);
endmodule

module module132
#(parameter param191 = {(({(+(8'ha4)), ((7'h42) ? (8'ha3) : (8'h9c))} ? (((8'ha0) >= (8'hb2)) >>> (+(8'hb2))) : (~^(|(8'h9e)))) ? ({{(8'h9c), (8'hba)}, ((8'ha6) <= (8'hba))} & (8'hb8)) : ((~&((8'hb1) & (8'ha5))) <<< (~|((8'hb3) ? (8'hac) : (8'hb4)))))}, 
parameter param192 = (&({({param191} ? {param191, param191} : param191)} | (-(-(8'ha0))))))
(y, clk, wire136, wire135, wire134, wire133);
  output wire [(32'h292):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire136;
  input wire [(4'h8):(1'h0)] wire135;
  input wire [(3'h4):(1'h0)] wire134;
  input wire [(3'h4):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire [(5'h12):(1'h0)] wire161;
  wire [(4'he):(1'h0)] wire160;
  wire signed [(4'h9):(1'h0)] wire159;
  wire [(5'h14):(1'h0)] wire158;
  wire [(4'h9):(1'h0)] wire157;
  wire signed [(5'h10):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire146;
  wire [(3'h4):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire144;
  wire [(5'h13):(1'h0)] wire143;
  wire signed [(5'h15):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire137;
  reg signed [(3'h4):(1'h0)] reg190 = (1'h0);
  reg [(5'h12):(1'h0)] reg189 = (1'h0);
  reg [(5'h10):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg186 = (1'h0);
  reg [(4'h9):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg183 = (1'h0);
  reg [(4'hc):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg180 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg179 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg173 = (1'h0);
  reg [(5'h12):(1'h0)] reg172 = (1'h0);
  reg [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(3'h7):(1'h0)] reg170 = (1'h0);
  reg [(5'h13):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg164 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire138,
                 wire137,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
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
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg140,
                 reg139,
                 (1'h0)};
  assign wire137 = wire133;
  assign wire138 = ((wire134[(1'h1):(1'h1)] ?
                       wire137[(2'h3):(2'h3)] : wire136) + wire133);
  always
    @(posedge clk) begin
      reg139 <= $signed($unsigned((((^wire137) == (wire135 ?
          wire136 : wire133)) + wire135[(3'h7):(3'h6)])));
      reg140 <= $signed(reg139[(1'h0):(1'h0)]);
    end
  assign wire141 = $signed(wire138[(1'h0):(1'h0)]);
  assign wire142 = reg140[(3'h4):(2'h2)];
  assign wire143 = wire138;
  assign wire144 = ($unsigned(wire142) || (((+((8'ha2) > wire137)) > (wire134[(3'h4):(2'h2)] ?
                           {(8'hbb), wire135} : (!(7'h43)))) ?
                       ((+{wire135, wire135}) ~^ {$signed(wire143),
                           $unsigned(reg140)}) : $unsigned({reg140})));
  assign wire145 = ((wire135[(1'h0):(1'h0)] ?
                       (wire134[(1'h1):(1'h1)] && $unsigned((wire144 & wire135))) : $signed(reg140)) * wire142[(3'h6):(3'h5)]);
  assign wire146 = (+(wire145 ?
                       (&$unsigned(wire135)) : ((wire136 ?
                               $signed(reg140) : (reg140 == (8'hb5))) ?
                           $signed((wire135 >>> wire133)) : ($signed(wire136) ~^ (wire133 || wire136)))));
  assign wire147 = (!$unsigned((&wire144)));
  always
    @(posedge clk) begin
      reg148 <= ((!(!(^$unsigned(wire137)))) == $unsigned((8'ha5)));
      reg149 <= {wire135};
      reg150 <= $unsigned(((~^((+wire143) >= (wire146 <<< wire141))) ?
          $unsigned($unsigned({(8'hb0)})) : $signed(wire137[(1'h1):(1'h0)])));
      if ($signed((!((|{wire145, wire142}) ^~ ((8'h9c) ?
          {(8'hbf), wire137} : ((8'hb7) || reg150))))))
        begin
          reg151 <= {(~($unsigned((wire138 ?
                  (7'h44) : wire137)) | $unsigned((|wire143))))};
          if ((~&{(|($unsigned(reg150) == {wire133, (7'h44)}))}))
            begin
              reg152 <= $unsigned((&wire136));
              reg153 <= wire138;
            end
          else
            begin
              reg152 <= (~^($unsigned((((7'h43) ? reg149 : reg140) ?
                      $signed(wire141) : wire138[(3'h7):(1'h0)])) ?
                  wire134[(2'h2):(2'h2)] : wire135[(4'h8):(3'h5)]));
              reg153 <= wire133;
              reg154 <= wire141;
            end
          reg155 <= wire137;
          reg156 <= reg149[(4'h9):(2'h2)];
        end
      else
        begin
          if ((8'had))
            begin
              reg151 <= ((wire142 ?
                      {$unsigned((^~wire137)),
                          $unsigned((~wire147))} : reg149) ?
                  reg155[(4'hf):(2'h2)] : (($signed((wire142 > wire143)) > (reg155 ?
                          reg139[(1'h1):(1'h1)] : (~&(8'ha5)))) ?
                      {(reg155[(5'h10):(1'h1)] ?
                              reg155[(2'h3):(1'h0)] : (reg149 >> (8'ha6)))} : $signed(reg150[(4'h8):(4'h8)])));
            end
          else
            begin
              reg151 <= $unsigned({(((wire135 ? (8'hb1) : wire136) ?
                      $unsigned(reg153) : (wire136 ?
                          wire134 : reg148)) >>> $unsigned(wire141))});
            end
          reg152 <= (wire138 ?
              (((8'hbc) * $signed($signed(wire147))) ?
                  (~^((wire141 ? wire145 : wire143) ?
                      reg149[(5'h14):(4'ha)] : $unsigned(wire144))) : wire143[(3'h5):(2'h3)]) : (!(wire135[(2'h3):(1'h1)] > ({(8'hbc),
                      reg139} ?
                  (wire146 ? wire137 : reg152) : (reg148 ? reg139 : reg151)))));
        end
    end
  assign wire157 = {(8'h9d)};
  assign wire158 = {(reg149 ?
                           $unsigned(($signed(reg139) & wire145[(2'h2):(1'h1)])) : $signed(({reg152} >> reg154))),
                       (wire136 ?
                           (~|wire135[(4'h8):(4'h8)]) : (~|(+{reg156})))};
  assign wire159 = $unsigned(wire137);
  assign wire160 = (reg153[(3'h6):(3'h5)] ?
                       $unsigned((($signed(wire136) ?
                               wire135[(3'h4):(3'h4)] : $unsigned(reg153)) ?
                           $signed($signed(reg154)) : wire134)) : {$unsigned(({reg151,
                               (7'h43)} | $signed(wire133))),
                           (|wire145[(1'h0):(1'h0)])});
  assign wire161 = ({$unsigned(wire157[(4'h8):(3'h6)])} >>> wire142);
  assign wire162 = $signed(((~&$signed($unsigned(reg139))) * wire136));
  assign wire163 = ($signed((wire146 >>> wire143[(2'h3):(1'h1)])) ?
                       $signed($signed($signed((wire145 ?
                           wire160 : wire159)))) : (wire141[(5'h11):(4'ha)] ?
                           ((~(reg148 ~^ wire160)) ~^ $unsigned(wire145[(2'h2):(1'h1)])) : $signed($unsigned(wire134))));
  always
    @(posedge clk) begin
      reg164 <= $signed(wire138);
      reg165 <= reg152;
      reg166 <= $unsigned(wire138);
      reg167 <= (8'ha1);
      if (reg139[(2'h2):(1'h0)])
        begin
          reg168 <= $unsigned($signed({$unsigned((wire142 - wire145))}));
          reg169 <= $unsigned((wire142 | wire135));
          reg170 <= reg154;
        end
      else
        begin
          reg168 <= wire146[(2'h2):(1'h0)];
          reg169 <= $signed($unsigned(wire145[(2'h3):(2'h2)]));
          reg170 <= (($signed(((7'h41) >>> reg170[(1'h0):(1'h0)])) ?
              $unsigned((wire143 <<< (8'had))) : $unsigned((((8'hb7) ?
                      wire158 : reg156) ?
                  (^~reg155) : $unsigned(wire138)))) ^ ({wire161} ?
              reg140[(1'h1):(1'h0)] : $unsigned((wire158[(4'hc):(4'h8)] ?
                  {reg151} : $signed(reg139)))));
        end
    end
  always
    @(posedge clk) begin
      reg171 <= wire147;
      if (($unsigned(wire157) >= ($unsigned($unsigned((wire146 * reg148))) & $signed(reg165))))
        begin
          if ($signed($signed((wire162 >= ({reg170, wire143} ?
              (8'ha1) : (|wire145))))))
            begin
              reg172 <= ({wire146} || $unsigned((~$unsigned($unsigned(reg170)))));
              reg173 <= (8'ha9);
              reg174 <= (reg164[(3'h6):(3'h6)] == (wire143 ?
                  (($unsigned((8'ha9)) ?
                      $unsigned(reg168) : {wire146,
                          wire145}) >> $unsigned(reg149)) : ((~&(~|reg170)) ?
                      $signed($unsigned(wire145)) : {(reg156 ?
                              (8'hab) : wire160),
                          wire141})));
              reg175 <= (^$signed(wire159[(2'h2):(2'h2)]));
            end
          else
            begin
              reg172 <= (^($unsigned(((reg165 ? (8'ha7) : reg166) ?
                      $unsigned(wire138) : (wire145 ? reg170 : reg174))) ?
                  (wire163 ?
                      $unsigned((|wire141)) : $unsigned(reg171[(1'h0):(1'h0)])) : (wire136[(2'h2):(2'h2)] ?
                      $signed($signed(reg156)) : ($signed(wire136) ^~ {reg172,
                          reg152}))));
              reg173 <= reg139[(1'h1):(1'h0)];
              reg174 <= (($signed(($unsigned(reg153) ?
                      (wire133 ?
                          wire136 : reg148) : (|wire138))) * reg155[(3'h4):(2'h2)]) ?
                  reg150[(4'h8):(1'h0)] : reg152[(4'hb):(4'h9)]);
              reg175 <= {reg154[(4'h9):(4'h8)],
                  $signed($signed(((8'haa) << (reg169 ? (8'had) : wire136))))};
            end
        end
      else
        begin
          if ($signed($signed(($signed((!reg140)) || (~{wire161})))))
            begin
              reg172 <= ({(reg153[(1'h0):(1'h0)] ?
                          $unsigned((wire160 ? reg139 : reg156)) : wire136),
                      wire161} ?
                  ($signed($signed(wire158)) && $unsigned($signed($signed(reg164)))) : {wire145[(1'h0):(1'h0)]});
              reg173 <= wire158[(4'h9):(3'h4)];
              reg174 <= (^(~|reg152[(3'h5):(2'h2)]));
            end
          else
            begin
              reg172 <= (((reg167[(3'h5):(3'h4)] ? {{wire134}} : reg174) ?
                      ({(~^(8'ha4))} && reg148[(1'h1):(1'h1)]) : reg167) ?
                  $unsigned(((!$signed(wire138)) ?
                      (8'ha0) : $unsigned($signed(wire161)))) : {(reg173[(3'h5):(1'h0)] ?
                          ((reg151 ? reg150 : (8'hb9)) >= (reg166 ?
                              wire136 : wire145)) : $signed(wire134))});
              reg173 <= $unsigned(wire162);
            end
          reg175 <= reg171;
          reg176 <= ({((7'h43) < (^~((8'ha4) ?
                  reg173 : wire161)))} >> {(wire161[(2'h2):(2'h2)] & reg174)});
        end
      if (reg152[(4'hc):(3'h4)])
        begin
          if (wire136[(3'h7):(1'h0)])
            begin
              reg177 <= $signed((8'h9e));
            end
          else
            begin
              reg177 <= $unsigned(reg177[(1'h1):(1'h1)]);
              reg178 <= ($signed($signed($unsigned(reg156))) ?
                  wire162[(4'h8):(3'h4)] : reg166[(1'h1):(1'h1)]);
              reg179 <= (($unsigned($unsigned($unsigned(reg165))) + ($unsigned((reg174 >= wire163)) > ((7'h41) || reg171[(1'h1):(1'h0)]))) ?
                  (wire133[(1'h0):(1'h0)] ^ ((+{wire158}) ?
                      $unsigned(reg153[(3'h4):(1'h1)]) : $signed($unsigned(reg154)))) : wire135);
              reg180 <= (reg165 < reg139[(1'h1):(1'h0)]);
            end
          reg181 <= (reg179[(2'h3):(1'h0)] + reg155[(3'h4):(2'h3)]);
        end
      else
        begin
          reg177 <= $signed((wire145[(2'h2):(2'h2)] ?
              (~{$unsigned(reg148)}) : $unsigned((8'hb3))));
          reg178 <= wire136[(4'h8):(1'h1)];
          reg179 <= $unsigned($unsigned(wire146));
          reg180 <= (reg174 & reg151);
        end
      reg182 <= reg181;
    end
  always
    @(posedge clk) begin
      reg183 <= ($unsigned(({(reg172 ? reg180 : wire160)} ?
          reg153[(1'h1):(1'h1)] : $signed(reg167[(1'h0):(1'h0)]))) ~^ {reg171});
      reg184 <= {wire143,
          ((wire161 ? wire137[(3'h4):(2'h3)] : reg168) ?
              reg180[(1'h0):(1'h0)] : (reg180[(1'h1):(1'h1)] ~^ $unsigned((|wire161))))};
      reg185 <= (((+reg173) ^ ((8'ha2) >= reg182)) ?
          $unsigned($signed(((wire157 ^ reg155) * {(7'h44)}))) : ($signed(reg174) ~^ reg182[(2'h2):(2'h2)]));
      if ({wire142[(3'h6):(2'h2)], reg172})
        begin
          if (((reg170[(2'h2):(2'h2)] ~^ wire160[(3'h5):(3'h5)]) << (&$signed(((wire163 | reg183) | (7'h41))))))
            begin
              reg186 <= reg183[(4'ha):(2'h2)];
            end
          else
            begin
              reg186 <= reg184[(4'hf):(2'h2)];
              reg187 <= ($unsigned({(&reg183),
                      (reg166[(1'h1):(1'h0)] == (reg164 ?
                          wire136 : wire136))}) ?
                  (+$signed((wire138 ?
                      (reg140 >= (8'hbb)) : $signed(reg166)))) : $unsigned((wire134[(2'h2):(1'h1)] | $unsigned(reg153[(3'h4):(1'h0)]))));
              reg188 <= ($signed((((reg165 ? reg168 : reg151) ?
                  reg175 : (reg155 & reg185)) != wire143)) ~^ ({($unsigned(reg182) << reg178)} ?
                  reg171 : ((!(wire159 ? reg180 : reg155)) ?
                      wire157 : (^~$signed(reg186)))));
            end
          reg189 <= (|wire158);
        end
      else
        begin
          reg186 <= {(reg165[(2'h2):(1'h0)] < reg179)};
        end
      reg190 <= (|(~^$unsigned(wire145)));
    end
endmodule

module module103  (y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire107;
  input wire signed [(2'h3):(1'h0)] wire106;
  input wire signed [(4'h9):(1'h0)] wire105;
  input wire [(4'hf):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire127;
  wire [(4'hf):(1'h0)] wire126;
  wire [(3'h5):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(5'h14):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire signed [(4'h9):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire108;
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire111,
                 wire110,
                 wire108,
                 reg113,
                 reg109,
                 (1'h0)};
  assign wire108 = ($signed((((wire105 ?
                               wire104 : wire105) ~^ (wire107 ~^ wire107)) ?
                           (^~(wire106 ?
                               wire104 : wire106)) : wire107[(1'h0):(1'h0)])) ?
                       (8'hb1) : ({((wire104 ? wire106 : (8'ha6)) ?
                               wire106 : $signed((8'hb5)))} << $unsigned(wire105[(3'h7):(2'h3)])));
  always
    @(posedge clk) begin
      reg109 <= ((~^wire105) > (&wire105[(1'h1):(1'h0)]));
    end
  assign wire110 = wire107;
  assign wire111 = wire110[(3'h4):(2'h2)];
  assign wire112 = (wire107[(3'h6):(3'h6)] ?
                       wire105[(1'h1):(1'h0)] : {$signed($signed($signed(reg109))),
                           (wire105[(3'h6):(3'h4)] ?
                               (|((8'hb6) ?
                                   wire105 : wire106)) : (+$signed((8'hb8))))});
  always
    @(posedge clk) begin
      reg113 <= $unsigned(wire111[(3'h4):(1'h0)]);
    end
  assign wire114 = (-(wire106 && $unsigned({(reg113 == wire104)})));
  assign wire115 = $unsigned($unsigned({$unsigned($signed(wire106)),
                       $unsigned($unsigned(reg113))}));
  assign wire116 = (wire105[(1'h0):(1'h0)] == ($unsigned($signed($unsigned(wire110))) + (|$signed(wire111))));
  assign wire117 = {wire115, wire104[(4'h9):(4'h8)]};
  assign wire118 = $signed($unsigned($signed({$unsigned((8'hb3)),
                       $unsigned((8'hb5))})));
  assign wire119 = wire111;
  assign wire120 = (!wire108[(3'h6):(2'h2)]);
  assign wire121 = ($signed(($unsigned((~wire110)) > (~{reg109,
                       (7'h41)}))) < reg113[(3'h5):(1'h0)]);
  assign wire122 = ($signed(wire111) ?
                       {(($unsigned(wire105) ?
                               (wire104 ? wire111 : wire120) : (wire117 ?
                                   wire118 : wire117)) & {(|(8'ha6)),
                               $unsigned(wire106)})} : {(^~$unsigned($signed(wire115)))});
  assign wire123 = (((wire121[(1'h1):(1'h0)] || wire114[(3'h6):(1'h1)]) + wire106[(1'h0):(1'h0)]) <<< $unsigned((wire106[(1'h1):(1'h0)] ?
                       wire110 : ((wire120 ? wire104 : reg113) <= {wire104,
                           wire118}))));
  assign wire124 = wire106;
  assign wire125 = $signed((+wire118[(2'h2):(2'h2)]));
  assign wire126 = (wire115[(4'hd):(4'hd)] ?
                       $signed((~&(wire125[(1'h1):(1'h1)] ^ wire105))) : ({((wire110 >>> (8'hb1)) ?
                               $unsigned(wire120) : wire108)} < {(wire104[(3'h7):(2'h3)] ?
                               (wire122 | (8'hb7)) : {wire115, wire117}),
                           {((8'haa) < wire105)}}));
  assign wire127 = reg109;
endmodule

module module61  (y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire66;
  input wire [(4'hd):(1'h0)] wire65;
  input wire signed [(5'h11):(1'h0)] wire64;
  input wire [(4'h9):(1'h0)] wire63;
  input wire signed [(5'h14):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  assign y = {wire88,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
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
                 (1'h0)};
  assign wire67 = (~^wire66[(1'h0):(1'h0)]);
  assign wire68 = $signed((wire66[(2'h2):(2'h2)] != {($signed(wire66) | (wire67 ?
                          (8'ha5) : wire66)),
                      ((8'hb5) * (wire65 ? wire63 : wire67))}));
  assign wire69 = ((8'hbb) ?
                      $signed($unsigned(wire65[(1'h1):(1'h0)])) : ((((8'hb1) ?
                                  wire65 : $unsigned(wire68)) ?
                              wire62[(1'h1):(1'h1)] : ($signed(wire66) != $signed(wire68))) ?
                          $unsigned($signed((wire62 ?
                              wire68 : wire62))) : wire67[(2'h3):(1'h1)]));
  assign wire70 = $unsigned((~&{$signed(wire66[(1'h1):(1'h0)]),
                      wire66[(1'h0):(1'h0)]}));
  assign wire71 = wire65[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg72 <= $signed((!{(wire67 ? (-wire67) : $signed(wire63)),
          {(wire67 ? wire69 : wire67), wire62[(5'h14):(5'h14)]}}));
      reg73 <= $unsigned((+$unsigned({(wire71 ? wire69 : (7'h42))})));
      reg74 <= wire64[(3'h6):(2'h2)];
      if ((wire68[(1'h1):(1'h0)] ?
          reg73[(4'h9):(4'h9)] : $signed((wire63[(2'h3):(1'h1)] ?
              (8'hb3) : (|(wire68 ? wire70 : wire64))))))
        begin
          if (wire66)
            begin
              reg75 <= $signed(((~&($unsigned(wire63) == (wire62 ?
                  wire67 : wire69))) >> (8'hb4)));
              reg76 <= (wire69[(1'h0):(1'h0)] ?
                  (~&wire63[(3'h6):(3'h5)]) : (^$signed(($unsigned(reg72) ?
                      $unsigned(reg73) : wire67))));
              reg77 <= ($signed((~wire70[(3'h4):(2'h2)])) ?
                  {wire65} : (~|reg76));
              reg78 <= $unsigned({reg74, wire69});
              reg79 <= ($signed($signed($unsigned((wire65 ?
                  reg77 : (8'ha9))))) == $signed(reg72[(3'h6):(3'h4)]));
            end
          else
            begin
              reg75 <= ($signed((^reg76)) ? wire71[(4'h8):(2'h3)] : wire70);
              reg76 <= (+wire66[(1'h0):(1'h0)]);
              reg77 <= (+{(wire68 ?
                      {{reg77, (8'hbe)},
                          $unsigned(reg77)} : $unsigned($unsigned(wire69)))});
            end
          reg80 <= reg73;
          reg81 <= wire71[(4'ha):(2'h3)];
          reg82 <= $unsigned(((~|($unsigned((8'h9e)) ?
              (wire67 ?
                  reg81 : reg81) : $unsigned((8'ha5)))) ^ ($signed({wire68}) == ((+wire63) ^ (-(8'hb0))))));
          if ($signed(reg82[(4'hd):(4'h8)]))
            begin
              reg83 <= $unsigned((reg77[(2'h3):(1'h0)] ? wire66 : reg76));
              reg84 <= {$unsigned(((|wire65) ?
                      ((reg81 ^~ reg80) + wire71) : reg76[(1'h1):(1'h0)]))};
              reg85 <= $signed($signed($unsigned((-reg82[(3'h7):(3'h7)]))));
              reg86 <= reg76[(4'h8):(2'h2)];
              reg87 <= $unsigned(wire67);
            end
          else
            begin
              reg83 <= $unsigned({reg73,
                  ((!(|reg83)) * wire66[(2'h2):(2'h2)])});
            end
        end
      else
        begin
          reg75 <= (reg84 + (wire70 ?
              wire65 : ((~&(reg85 > reg82)) ?
                  reg84[(3'h4):(3'h4)] : $unsigned((~^wire64)))));
          reg76 <= (&$signed(reg75[(2'h2):(1'h0)]));
          reg77 <= $unsigned((wire71[(1'h0):(1'h0)] ?
              (wire63 ?
                  (~&reg74[(2'h2):(1'h1)]) : ((reg76 ? wire68 : reg77) ?
                      (wire62 & reg83) : (reg75 ? reg81 : reg77))) : wire64));
          reg78 <= (reg87[(4'h9):(2'h3)] ?
              ((wire69[(1'h1):(1'h1)] ?
                  (^reg76[(2'h2):(1'h0)]) : ((~&wire65) + (reg81 ?
                      wire62 : reg82))) >>> ((~&$signed(wire64)) ?
                  reg72[(1'h0):(1'h0)] : (reg85 ?
                      (wire62 - reg79) : $unsigned(reg81)))) : (^~(+wire71[(1'h0):(1'h0)])));
        end
    end
  assign wire88 = (8'hae);
endmodule
