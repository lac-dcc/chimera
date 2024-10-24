module top
#(parameter param99 = ((^~(8'ha6)) ? ({({(8'ha6)} ? (8'ha1) : {(8'hba)}), (~(~&(8'hb9)))} ? {((~(8'h9e)) ~^ ((8'hb9) & (8'h9d)))} : (~^((!(7'h43)) | ((8'had) * (8'hb5))))) : (^(&(~^((8'hb4) ? (7'h43) : (8'ha7)))))), 
parameter param100 = (((param99 + (^{param99})) <<< param99) ? (({{param99}} > ((param99 ^ param99) ~^ (param99 && param99))) ? (8'had) : ((~(7'h40)) != ((~^param99) && param99))) : param99))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire93;
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  assign y = {wire98, wire96, wire95, wire93, reg97, (1'h0)};
  module5 #() modinst94 (.wire7(wire3), .wire10(wire2), .wire6(wire0), .clk(clk), .wire8(wire4), .y(wire93), .wire9(wire1));
  assign wire95 = wire3;
  assign wire96 = (($signed(wire2) ?
                          wire95[(4'ha):(3'h7)] : $unsigned((^~(&wire95)))) ?
                      $unsigned($unsigned((-{(8'haf)}))) : ($unsigned(wire4) ?
                          {$signed((wire1 >>> (8'hb3)))} : $unsigned(wire0)));
  always
    @(posedge clk) begin
      reg97 <= (-wire4);
    end
  assign wire98 = wire2[(1'h1):(1'h1)];
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire11;
  assign y = {wire91, wire65, wire64, wire62, wire11, (1'h0)};
  assign wire11 = (^~$unsigned($signed(((~&wire9) ~^ (wire10 ?
                      (8'h9e) : wire8)))));
  module12 #() modinst63 (wire62, clk, wire11, wire8, wire10, wire6);
  assign wire64 = (-wire9);
  assign wire65 = (8'hae);
  module66 #() modinst92 (.wire68(wire7), .wire67(wire10), .y(wire91), .wire69(wire65), .wire70(wire64), .clk(clk));
endmodule

module module66
#(parameter param89 = {(~|{(((7'h40) ? (8'ha8) : (8'hbf)) | ((8'hb8) << (8'ha6)))})}, 
parameter param90 = ((!{param89, (!(param89 ? param89 : param89))}) ^~ (^param89)))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire70;
  input wire signed [(5'h10):(1'h0)] wire69;
  input wire signed [(4'hc):(1'h0)] wire68;
  input wire [(4'ha):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire71 = $unsigned($signed(wire69));
  assign wire72 = wire68[(3'h5):(3'h5)];
  assign wire73 = {($signed(wire70) != $unsigned(($signed(wire72) ~^ (wire72 >= wire68)))),
                      $unsigned((&(&(wire72 ? wire71 : wire70))))};
  assign wire74 = ($signed(wire71[(3'h6):(1'h1)]) > (+$unsigned(((wire67 ?
                          (8'hbc) : (8'hb2)) ?
                      $signed(wire73) : (~&wire69)))));
  assign wire75 = (~&{$signed((~^{wire67}))});
  assign wire76 = (({(((7'h40) ? (8'ha2) : wire67) ?
                          $signed(wire70) : wire71)} - wire68) - $unsigned($unsigned((wire71 ?
                      (wire69 < wire71) : ((8'hac) ? wire73 : (8'hb6))))));
  assign wire77 = $unsigned((wire74 ?
                      (8'hb8) : ((wire71[(4'hc):(4'h8)] ?
                          $signed(wire71) : (wire67 >= wire67)) >> wire73[(2'h2):(1'h0)])));
  assign wire78 = (!wire68);
  assign wire79 = (($signed($signed(wire71[(4'h8):(3'h7)])) >>> wire72) ?
                      (^~$unsigned($signed((8'ha8)))) : wire76);
  always
    @(posedge clk) begin
      reg80 <= $unsigned($signed(($unsigned($unsigned(wire77)) && wire77[(1'h0):(1'h0)])));
      if ($unsigned($unsigned($unsigned($unsigned((^~wire74))))))
        begin
          if (((~|$unsigned(({wire70} | wire70[(3'h4):(1'h1)]))) ^ $signed(wire77)))
            begin
              reg81 <= wire71;
              reg82 <= $unsigned((~|wire78[(4'hc):(1'h1)]));
            end
          else
            begin
              reg81 <= (7'h44);
              reg82 <= (reg80 ?
                  reg82[(4'h9):(2'h3)] : {$signed(($unsigned(wire69) ?
                          $unsigned(wire75) : $unsigned(wire71)))});
              reg83 <= (8'hb3);
              reg84 <= wire72[(3'h4):(1'h0)];
              reg85 <= $unsigned($unsigned((reg81[(2'h2):(1'h1)] ?
                  (wire72 >>> wire76[(3'h7):(1'h1)]) : $unsigned($signed(reg83)))));
            end
          reg86 <= wire75[(3'h6):(3'h6)];
          reg87 <= (((({wire76} ?
                      wire76[(4'hb):(4'ha)] : (wire78 | wire78)) ^ ((wire77 ?
                          wire75 : wire74) ?
                      (~^wire74) : wire71[(3'h6):(3'h6)])) ?
                  reg80 : wire69) ?
              ($signed($signed(reg86[(3'h5):(1'h1)])) & wire73) : (((~&reg81) ?
                      ((+reg85) ?
                          ((8'ha7) ?
                              (8'ha7) : wire72) : (wire78 & reg86)) : (+wire69[(2'h2):(1'h0)])) ?
                  wire75[(3'h6):(2'h2)] : (+(wire67 ?
                      {(8'hbb), wire73} : $signed(reg84)))));
          reg88 <= wire68[(1'h0):(1'h0)];
        end
      else
        begin
          reg81 <= wire75;
          reg82 <= (8'hb8);
          reg83 <= (-wire71);
        end
    end
endmodule

module module12
#(parameter param61 = ((((((8'ha7) == (8'hb6)) && (-(8'hbf))) ? (~((7'h42) | (8'h9f))) : (((8'ha6) ? (8'hb4) : (8'ha3)) && {(8'h9d)})) ? {{((7'h43) < (8'hb4))}} : (({(8'hbe)} ? ((8'ha5) <<< (8'hb7)) : {(8'ha6), (8'hb6)}) ? (~&{(8'hb7), (7'h43)}) : (-((8'ha7) ? (7'h40) : (8'hb7))))) ? (!({((8'hab) ? (8'hba) : (8'haa)), ((8'had) ? (7'h40) : (8'hac))} <<< (((8'hb6) ? (8'h9c) : (8'h9d)) ? ((8'hb5) ? (8'ha8) : (8'had)) : ((8'hb4) & (8'h9d))))) : {((^((8'haa) ? (8'hb8) : (8'hae))) ? {{(8'hbb), (8'hb3)}, ((8'hb2) | (8'hb0))} : ((|(8'h9c)) ^~ ((8'hbd) ? (8'hb0) : (8'hac)))), ((((8'had) ^ (8'haa)) ? {(7'h40)} : {(8'ha1)}) ? (&{(8'h9d), (8'ha6)}) : (-((8'hbb) == (8'h9d))))}))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h1f4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire17;
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  assign y = {wire60,
                 wire53,
                 wire52,
                 wire51,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire17,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 reg38,
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
  assign wire17 = $signed({((|wire16[(5'h12):(4'h8)]) ?
                          (^wire13) : $unsigned({wire15})),
                      $signed(wire15)});
  always
    @(posedge clk) begin
      reg18 <= {{$signed($unsigned((wire15 ? wire16 : (8'hbd)))),
              wire13[(4'hb):(3'h4)]}};
      if (wire16)
        begin
          reg19 <= {$signed((!((reg18 <<< wire15) + wire16[(4'hc):(3'h6)])))};
          if (wire17)
            begin
              reg20 <= {$signed($unsigned($unsigned({(7'h42), wire17})))};
              reg21 <= (8'hba);
              reg22 <= $signed((reg21[(4'ha):(1'h0)] + (7'h41)));
              reg23 <= $unsigned({(((reg20 != wire15) > reg18[(5'h10):(3'h6)]) != wire14[(3'h7):(1'h0)]),
                  {reg22,
                      ((wire14 ? reg22 : (7'h43)) ?
                          $unsigned((8'hac)) : (~|wire17))}});
            end
          else
            begin
              reg20 <= (!wire16);
              reg21 <= reg22[(4'ha):(3'h5)];
              reg22 <= ((!(!(wire15[(1'h0):(1'h0)] ?
                      {reg20, wire13} : (|reg22)))) ?
                  reg18 : $signed(((|reg20[(2'h3):(2'h3)]) && reg20[(3'h4):(1'h1)])));
            end
          if ({(~$unsigned(wire15)), $signed($unsigned(wire15[(1'h0):(1'h0)]))})
            begin
              reg24 <= wire13;
              reg25 <= (~(({(wire17 - reg20)} - ($unsigned(reg21) >= {wire15})) ?
                  reg20[(4'hb):(2'h2)] : ($unsigned(wire16[(5'h12):(4'ha)]) * $unsigned(wire17[(3'h5):(2'h3)]))));
              reg26 <= $signed((!reg24));
              reg27 <= (wire17[(2'h3):(1'h0)] ?
                  $signed($unsigned(({reg23,
                      wire13} ^~ (~&(8'hbf))))) : ({$signed($signed((8'hbb)))} < ($unsigned((reg23 != wire17)) && (((8'hac) ?
                      wire13 : wire15) - (+reg18)))));
              reg28 <= (8'hb6);
            end
          else
            begin
              reg24 <= wire16;
              reg25 <= $unsigned($signed(($unsigned(((8'hb9) >>> wire16)) | $unsigned((8'hb7)))));
              reg26 <= $unsigned(wire16);
            end
        end
      else
        begin
          reg19 <= $signed(((^(((8'ha0) ^~ reg25) ^ $signed(reg18))) >>> ({$unsigned(reg27),
              (reg21 ? wire17 : reg22)} >> $unsigned($signed((8'hb0))))));
          reg20 <= (+{(|$unsigned((wire16 ? reg25 : reg19))),
              ($signed((reg22 ? reg21 : reg27)) ?
                  $signed(reg24) : (~^(reg21 ^~ reg21)))});
        end
    end
  assign wire29 = $unsigned(wire16[(3'h7):(2'h3)]);
  assign wire30 = (8'ha4);
  assign wire31 = ($signed({$signed((reg22 ? reg18 : wire16))}) ?
                      (~^($unsigned({reg27}) ?
                          ((~|(8'hb9)) ?
                              (^(8'ha7)) : $unsigned((8'hb6))) : reg20[(3'h6):(3'h4)])) : reg24);
  assign wire32 = ((reg22 + (wire17[(4'hc):(4'h9)] - $signed((reg24 ?
                      reg26 : reg23)))) ^ (reg25[(4'hf):(1'h0)] ?
                      ({reg18} ?
                          (|(~|wire31)) : (reg20[(2'h3):(2'h2)] | $signed((8'hae)))) : $unsigned(reg18)));
  assign wire33 = wire16;
  assign wire34 = {(wire14[(2'h3):(1'h0)] ?
                          reg20[(4'hc):(3'h7)] : {(|(~|reg21)),
                              ($unsigned(wire32) ?
                                  wire13 : reg24[(5'h11):(4'ha)])}),
                      $signed(reg20)};
  assign wire35 = (reg28[(3'h4):(1'h0)] ?
                      wire13[(4'h9):(2'h3)] : {$unsigned($signed((wire29 ?
                              wire30 : reg26))),
                          ((wire29 ?
                              (~^(8'ha0)) : $signed(wire15)) | ((!reg23) ?
                              (8'hbe) : $unsigned(reg22)))});
  assign wire36 = ((reg26 ?
                          wire13 : ($unsigned((8'hb0)) >> wire33[(4'hb):(3'h7)])) ?
                      reg22 : (~^reg22[(4'hb):(4'h9)]));
  assign wire37 = (|{({reg21, wire36} - (&$unsigned(wire34)))});
  always
    @(posedge clk) begin
      reg38 <= wire31[(2'h3):(2'h3)];
    end
  assign wire39 = {($unsigned(wire36[(3'h5):(3'h4)]) < $signed((wire29 ?
                          (-wire30) : $unsigned(wire17))))};
  always
    @(posedge clk) begin
      if (wire36[(1'h1):(1'h0)])
        begin
          reg40 <= (^~({(^$signed(wire29))} ?
              reg28 : $signed(($unsigned(reg20) && $signed(reg19)))));
          reg41 <= (~|((wire34 >>> reg25[(5'h11):(2'h2)]) <= {wire37}));
          if (((wire30 ?
              $unsigned({{wire35}, (+(7'h41))}) : ((((8'hb7) >= (8'h9d)) ?
                  {reg41} : (wire32 - wire31)) != (~^reg28))) >> $unsigned({reg40[(4'ha):(1'h1)],
              ((wire16 ? (8'hb4) : reg24) != {reg41, reg41})})))
            begin
              reg42 <= reg40;
              reg43 <= wire29;
              reg44 <= (({(!reg26)} < ((reg25[(3'h6):(3'h4)] <= $unsigned(wire31)) | wire34[(3'h6):(3'h4)])) != $signed(reg18));
            end
          else
            begin
              reg42 <= reg20[(2'h2):(1'h0)];
              reg43 <= $signed(wire17);
              reg44 <= (8'hb6);
              reg45 <= reg40;
              reg46 <= ($unsigned((-(-wire35))) - ((($unsigned(wire17) ~^ reg27) || $unsigned($signed(reg25))) ?
                  {{$signed((8'h9c)),
                          reg26[(4'h9):(4'h9)]}} : reg23[(3'h6):(3'h6)]));
            end
        end
      else
        begin
          reg40 <= ($unsigned($unsigned({((8'haa) ?
                  (8'haa) : reg27)})) ~^ (8'ha4));
          if ($signed(wire16))
            begin
              reg41 <= ((~|(wire29 ? wire16 : reg20[(4'hc):(4'hb)])) & (8'hbf));
              reg42 <= (^~((&(!$unsigned(wire16))) != $signed((wire37[(2'h3):(1'h0)] << $unsigned(wire30)))));
              reg43 <= ($unsigned({wire35[(1'h1):(1'h0)], (~(^~reg38))}) ?
                  wire13[(1'h0):(1'h0)] : (-$unsigned($unsigned(reg25))));
              reg44 <= $unsigned((|(~^($signed(wire30) ?
                  $signed(reg38) : {wire17, reg38}))));
            end
          else
            begin
              reg41 <= {$signed($signed($unsigned($unsigned(reg27)))),
                  $signed($unsigned($unsigned((reg43 * reg22))))};
              reg42 <= $signed((~^reg38));
            end
          reg45 <= $unsigned(reg25);
          reg46 <= {(~|reg44),
              ((wire15[(2'h3):(2'h2)] ?
                  reg44[(4'h9):(4'h8)] : (^~{wire36})) == (~&((reg19 ~^ reg20) ?
                  wire37[(1'h1):(1'h0)] : (reg23 ? wire32 : (8'ha1)))))};
        end
      reg47 <= $unsigned((~^reg23[(1'h0):(1'h0)]));
      reg48 <= ($signed(reg38) - reg47[(4'h8):(3'h5)]);
      if (($signed($unsigned(({reg48,
          reg28} == (wire34 != wire29)))) == (~^(~|((reg26 ^ wire32) ?
          $signed(reg27) : (wire13 ? wire29 : wire13))))))
        begin
          reg49 <= (7'h43);
          reg50 <= {{(8'hbc), {(wire35 & reg18), $unsigned($unsigned(reg28))}},
              ((+$signed((reg25 ~^ wire29))) ?
                  $signed($signed((&reg26))) : $signed($unsigned(reg46)))};
        end
      else
        begin
          reg49 <= ((~^reg23) ?
              ((!$signed((^~wire14))) <<< reg38[(3'h5):(2'h3)]) : (~|reg45[(2'h2):(1'h0)]));
          reg50 <= reg26;
        end
    end
  assign wire51 = wire31[(3'h5):(2'h3)];
  assign wire52 = reg38[(2'h2):(1'h0)];
  assign wire53 = (((($signed(reg22) > (+reg26)) ?
                          $unsigned(reg40) : {reg22}) >= $signed($signed($signed(reg21)))) ?
                      $signed(wire33[(4'h9):(3'h4)]) : ($unsigned(reg50) ?
                          (!wire37) : ($signed($unsigned(reg27)) * ($unsigned(wire17) ?
                              reg40[(3'h4):(2'h2)] : wire34))));
  always
    @(posedge clk) begin
      if (reg38[(3'h6):(2'h2)])
        begin
          reg54 <= $unsigned(reg27);
        end
      else
        begin
          if ($unsigned(wire15[(1'h0):(1'h0)]))
            begin
              reg54 <= (^~($unsigned((~^$unsigned(reg20))) | reg50));
            end
          else
            begin
              reg54 <= (~|(((reg48 ?
                  (^~(8'hb5)) : $signed(reg21)) && {$unsigned(reg26)}) >= ((reg28[(2'h2):(1'h0)] << (8'ha3)) ?
                  $signed(reg47) : wire36[(1'h0):(1'h0)])));
              reg55 <= $unsigned(wire15);
            end
          reg56 <= reg38;
          reg57 <= (-reg55[(3'h7):(3'h7)]);
          reg58 <= reg38;
        end
      reg59 <= reg20;
    end
  assign wire60 = $unsigned(reg43[(3'h4):(1'h1)]);
endmodule
