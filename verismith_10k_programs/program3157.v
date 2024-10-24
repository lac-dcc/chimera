module top
#(parameter param122 = ((((8'hb4) ? (~&{(8'hb3), (8'hae)}) : {(8'hbd)}) >> {(((8'hac) <= (7'h40)) ^ ((8'ha1) ^ (8'ha8)))}) ? (8'hb5) : (8'ha2)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire113;
  wire [(3'h5):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire64;
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  assign y = {wire121,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire108,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg73,
                 (1'h0)};
  module4 #() modinst65 (.wire7(wire0), .wire8(wire1), .y(wire64), .wire6(wire3), .wire5(wire2), .clk(clk));
  assign wire66 = (+((^(~^(wire2 ?
                      wire64 : wire64))) < $signed($unsigned(wire2[(4'he):(4'hc)]))));
  assign wire67 = (~&($unsigned((+{wire64, (8'ha1)})) == ({wire1} ?
                      ($signed(wire0) < $unsigned(wire1)) : (~|wire64[(3'h4):(3'h4)]))));
  assign wire68 = wire3;
  assign wire69 = {$signed((($unsigned(wire66) ?
                          wire0 : (wire3 ?
                              (8'hb0) : wire3)) ~^ (~&$signed(wire2)))),
                      wire64[(1'h0):(1'h0)]};
  assign wire70 = $signed($unsigned(wire69[(4'hf):(3'h4)]));
  assign wire71 = $unsigned((&wire68[(5'h13):(5'h11)]));
  assign wire72 = (&{($unsigned((+(8'hbc))) == ((wire0 + (8'hb6)) ?
                          (wire68 | wire70) : wire0))});
  always
    @(posedge clk) begin
      reg73 <= $signed(((~&$signed((wire69 < (7'h44)))) ?
          {(^~(wire68 ? (8'hac) : wire71))} : wire66[(2'h3):(1'h1)]));
    end
  module74 #() modinst109 (wire108, clk, wire64, wire66, wire71, wire2);
  assign wire110 = $signed($unsigned({wire0}));
  assign wire111 = (^~(~^((wire108[(1'h1):(1'h1)] == (wire70 ?
                       wire71 : wire69)) || (((8'hb0) ^ wire68) ?
                       (wire108 ? wire70 : wire66) : wire67))));
  assign wire112 = $signed({wire0});
  assign wire113 = wire68;
  assign wire114 = (~&$signed((~|(8'hb4))));
  assign wire115 = ($unsigned(wire111) ~^ wire111);
  assign wire116 = {((+$signed($unsigned(wire69))) ^ $signed(wire70))};
  always
    @(posedge clk) begin
      reg117 <= wire2[(5'h11):(3'h4)];
      reg118 <= $signed((~^$signed((&wire110[(2'h2):(2'h2)]))));
      reg119 <= $unsigned($unsigned($unsigned($signed((wire112 ?
          wire64 : wire108)))));
      reg120 <= $signed($unsigned(wire108));
    end
  assign wire121 = (-(-$unsigned($signed(reg118))));
endmodule

module module74
#(parameter param106 = ((~&(({(7'h43)} ? (^(8'hb1)) : ((8'hb5) * (8'hac))) && (((8'hb7) ? (8'ha8) : (8'ha3)) ? ((8'ha3) <= (8'hb6)) : ((8'haf) && (7'h42))))) ~^ (({((8'hba) != (8'hb6)), ((8'hb4) ? (8'hac) : (7'h40))} ? {(8'ha0), (~^(8'ha0))} : {{(8'ha6)}}) ^~ ((((8'ha3) ? (8'hb9) : (7'h40)) >>> ((8'h9d) ? (8'hb8) : (8'hb1))) ? (&((8'ha7) == (7'h41))) : {(-(7'h44)), (~^(7'h43))}))), 
parameter param107 = param106)
(y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire78;
  input wire signed [(4'ha):(1'h0)] wire77;
  input wire [(3'h5):(1'h0)] wire76;
  input wire [(5'h12):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire105;
  wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(3'h6):(1'h0)] wire92;
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire95,
                 wire94,
                 wire92,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg79,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg79 <= wire76;
    end
  module80 #() modinst93 (wire92, clk, reg79, wire77, wire75, wire78, wire76);
  assign wire94 = {($signed(wire78[(4'h9):(3'h7)]) ^ wire78),
                      wire78[(2'h2):(1'h1)]};
  assign wire95 = wire92;
  always
    @(posedge clk) begin
      if ($unsigned((8'hab)))
        begin
          reg96 <= ((~^(-wire78[(3'h5):(3'h4)])) != wire78);
          reg97 <= (wire94[(5'h13):(5'h11)] + $signed($signed(((wire75 ?
                  wire95 : reg96) ?
              $unsigned(wire76) : $unsigned((8'hab))))));
          reg98 <= (8'h9d);
        end
      else
        begin
          reg96 <= ((reg98 ?
                  $signed(((^wire76) << (reg96 <= reg96))) : wire94) ?
              $signed({((reg96 | (8'h9e)) <<< wire94[(4'hd):(4'hc)]),
                  reg96[(1'h0):(1'h0)]}) : reg96[(3'h5):(1'h1)]);
          reg97 <= reg97;
          reg98 <= $unsigned((wire77 & {(|(wire92 ? wire75 : wire94)),
              (wire78[(1'h1):(1'h1)] ? $signed(reg97) : $signed(wire78))}));
          reg99 <= {(wire76[(2'h3):(1'h1)] >= wire75[(4'h8):(3'h6)]), wire75};
        end
      reg100 <= wire75[(1'h1):(1'h0)];
      reg101 <= {$unsigned(wire94)};
      reg102 <= ((^~reg97) ?
          $signed({reg96, (-$signed(wire76))}) : $signed(wire95));
      reg103 <= wire78[(4'h9):(3'h5)];
    end
  assign wire104 = $signed(wire78);
  assign wire105 = wire95;
endmodule

module module4
#(parameter param62 = ({((|(~&(8'hb4))) >= (((8'ha3) > (8'ha0)) ? {(8'ha5)} : (~&(8'hac)))), (|(((8'ha8) ? (8'ha7) : (8'hb8)) ? {(8'ha1)} : (^(7'h40))))} ? (8'hba) : (~^(({(8'ha2), (8'hb6)} ? ((8'hb3) && (8'h9e)) : {(8'ha2)}) << (~^(|(8'hbf)))))), 
parameter param63 = {{{({(8'ha6)} & ((8'hb4) >> param62)), (((8'hb9) ? param62 : param62) || (param62 ? param62 : param62))}}, (&((8'hb9) ? (~|(-param62)) : (((8'h9e) << param62) ? {param62} : (param62 ? param62 : param62))))})
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire5;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire47;
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire51,
                 wire50,
                 wire49,
                 wire9,
                 wire47,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire9 = (wire7 ?
                     wire6 : (wire5[(4'hb):(3'h4)] ?
                         $signed($unsigned($signed(wire6))) : {$signed($signed(wire7)),
                             (&$unsigned(wire7))}));
  module10 #() modinst48 (.wire13(wire5), .wire15(wire6), .y(wire47), .clk(clk), .wire12(wire8), .wire14(wire9), .wire11(wire7));
  assign wire49 = wire8;
  assign wire50 = $signed($unsigned(wire8[(2'h2):(1'h0)]));
  assign wire51 = $unsigned(((&$unsigned(wire7)) ?
                      {{(~&(8'had)),
                              $unsigned(wire50)}} : wire5[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg52 <= $signed(wire50);
      reg53 <= reg52;
    end
  assign wire54 = ((8'hbe) || (($unsigned(((8'hb3) & (8'ha3))) ?
                          wire9 : (((8'h9d) <= wire50) ~^ {wire6})) ?
                      (!wire49[(1'h1):(1'h1)]) : $unsigned((!reg53[(2'h3):(1'h0)]))));
  assign wire55 = (wire6[(4'ha):(3'h4)] & $signed(($unsigned({wire8,
                      reg53}) >> (8'hb7))));
  assign wire56 = ((-wire7) ?
                      $unsigned($unsigned({$signed(wire8)})) : ((&(^~((8'hac) != wire51))) ^~ ((~(+reg53)) ?
                          wire9 : (reg53 ? (8'hb9) : $signed(wire51)))));
  assign wire57 = reg53[(3'h4):(3'h4)];
  assign wire58 = {(7'h40),
                      (wire57[(1'h1):(1'h0)] ?
                          ((~^$signed(wire55)) ?
                              ((^wire51) | $signed((8'h9e))) : (|(reg52 ?
                                  wire6 : wire9))) : {((-wire5) ?
                                  ((8'ha1) ?
                                      wire7 : reg52) : $unsigned(reg52))})};
  assign wire59 = $unsigned((wire50 >>> $unsigned($signed({(8'hbf), wire5}))));
  assign wire60 = ((wire49 >>> (~|(wire58 ?
                      $unsigned((8'ha3)) : wire55[(3'h5):(3'h5)]))) * ({$unsigned($unsigned((7'h40)))} ?
                      wire9 : $unsigned({(wire51 ^ (8'ha7)),
                          $signed((8'hb7))})));
  assign wire61 = ((wire58[(4'h8):(3'h6)] >>> $unsigned(wire8)) ?
                      ($unsigned(((reg52 & (8'ha0)) ?
                          wire50[(2'h2):(2'h2)] : (~&wire7))) ^~ ((reg53 ?
                          (~^wire49) : wire6) > $unsigned((wire58 >> wire60)))) : wire49);
endmodule

module module10
#(parameter param45 = {((^~(-((8'hab) != (8'ha0)))) ? ((((8'ha8) ? (8'ha5) : (7'h42)) & ((8'hac) > (8'hb1))) >= ((8'hbf) ? ((8'had) ~^ (8'haf)) : (!(8'h9f)))) : ((((8'h9e) ? (8'h9e) : (8'hbd)) ? ((8'hae) ? (8'hb7) : (8'ha1)) : ((8'hb0) ? (8'ha9) : (8'hbc))) >= ((^~(8'h9c)) ? ((7'h43) ? (8'hb4) : (7'h44)) : ((8'hba) && (8'haf))))), {((^~(~(8'hb6))) * (((8'hb6) == (8'ha8)) + (+(8'hb0)))), ((!(~^(8'ha2))) <<< (!((8'hba) & (8'hb4))))}}, 
parameter param46 = ((|((~&{param45}) ? (~(~^param45)) : (param45 * param45))) <= (8'ha5)))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  input wire [(3'h7):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire18,
                 wire17,
                 wire16,
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
  assign wire16 = $unsigned(wire13[(1'h0):(1'h0)]);
  assign wire17 = $unsigned($unsigned((wire15[(1'h0):(1'h0)] == (|{wire11}))));
  assign wire18 = (($signed($signed((+(8'hb5)))) ~^ wire15) * $unsigned(($unsigned((wire13 ?
                          wire15 : wire12)) ?
                      ((wire14 << (8'hb7)) ?
                          (!wire16) : wire11) : ({(8'ha4)} >>> (wire14 ?
                          wire14 : wire12)))));
  always
    @(posedge clk) begin
      reg19 <= ($unsigned($unsigned((+(wire15 ? wire16 : wire15)))) ?
          {$unsigned(({(8'hbe)} - (wire14 - (8'had)))),
              $signed((wire12[(2'h2):(1'h1)] ?
                  wire17[(2'h3):(1'h0)] : (8'ha1)))} : wire15[(4'h9):(3'h7)]);
      if (wire17)
        begin
          reg20 <= $unsigned($signed(($unsigned(((8'ha7) >>> wire13)) == wire17[(4'h9):(3'h7)])));
          if (wire13)
            begin
              reg21 <= $unsigned(wire16);
              reg22 <= (wire17 ?
                  (~|reg19[(4'hf):(4'h8)]) : wire18[(4'hb):(3'h6)]);
              reg23 <= $signed(wire16);
              reg24 <= reg23;
              reg25 <= (((+(wire11 ?
                      ((7'h41) ~^ reg22) : reg20[(2'h2):(1'h1)])) >>> reg19) ?
                  {(+$unsigned({reg22})),
                      {wire18[(3'h5):(3'h5)]}} : ((^~wire14[(1'h1):(1'h0)]) ?
                      ((7'h43) >= wire14) : $signed(($unsigned(wire14) <<< $unsigned(wire18)))));
            end
          else
            begin
              reg21 <= reg24[(3'h7):(3'h6)];
            end
          if (reg20)
            begin
              reg26 <= $signed($unsigned($signed($unsigned(((8'hb9) ?
                  (8'ha7) : reg20)))));
              reg27 <= $signed($unsigned({($unsigned(reg23) & $unsigned(reg19)),
                  $signed(reg22)}));
              reg28 <= ((($unsigned(wire16[(2'h2):(2'h2)]) == ($signed(wire12) + (reg19 ~^ reg23))) ?
                  (-(8'hbd)) : $unsigned({$unsigned(reg24)})) & $signed((|reg27[(3'h4):(1'h1)])));
              reg29 <= ((|$signed(reg21)) ?
                  {((reg27 ? reg28 : (8'ha4)) & wire17),
                      (8'hb3)} : (({$signed(wire16), $unsigned(reg25)} ?
                          $unsigned({(8'hac),
                              (7'h42)}) : ($signed(reg27) << (wire11 ?
                              reg26 : reg19))) ?
                      reg26[(1'h0):(1'h0)] : (~^((reg20 << wire15) ^~ reg20))));
              reg30 <= ((reg29 ^ (($signed(reg27) >>> {reg26}) * (~^$signed(wire18)))) ?
                  (!reg22[(4'hd):(1'h0)]) : $unsigned(((~|$unsigned(reg20)) >>> (+(~|reg23)))));
            end
          else
            begin
              reg26 <= (|wire17);
            end
          reg31 <= reg22;
          if (((^~(reg25[(2'h2):(1'h0)] + reg19[(4'he):(3'h6)])) << $signed(reg20[(2'h3):(2'h3)])))
            begin
              reg32 <= (~$unsigned(($unsigned((wire12 ? reg21 : wire17)) ?
                  (reg25[(1'h1):(1'h0)] <= reg19) : ($unsigned(reg29) ?
                      $signed(reg31) : $unsigned(reg19)))));
              reg33 <= ((~|($unsigned((+reg31)) ?
                  (^~(reg30 ?
                      (8'hb4) : (8'ha9))) : reg31[(4'hb):(1'h1)])) >> $signed($signed(reg21[(3'h4):(2'h2)])));
              reg34 <= $signed($signed($unsigned((|wire15))));
              reg35 <= wire13;
              reg36 <= wire13;
            end
          else
            begin
              reg32 <= ((+$unsigned({reg35[(2'h3):(1'h0)],
                      (reg31 ? reg31 : wire12)})) ?
                  ((|{reg22[(4'he):(2'h3)], $unsigned(reg21)}) >> ({(~|reg19),
                      (wire11 * (8'hb7))} | reg31)) : (reg32[(2'h2):(1'h0)] ?
                      {$signed(reg26[(1'h0):(1'h0)]),
                          {$signed(reg21),
                              $unsigned(reg31)}} : ((8'ha8) * $unsigned((^reg24)))));
              reg33 <= (~&$signed($signed(wire13[(3'h6):(3'h5)])));
            end
        end
      else
        begin
          reg20 <= {$unsigned((~&(|(~&wire11)))), $unsigned(reg24)};
          reg21 <= $signed((($unsigned((reg29 | wire16)) ~^ reg29[(4'hf):(3'h4)]) >> reg26[(3'h5):(3'h4)]));
          reg22 <= {reg36, reg19[(4'hc):(3'h6)]};
          reg23 <= {(((((8'hae) && wire15) ?
                  $unsigned(wire11) : $signed(wire18)) ^~ ($unsigned(reg21) ?
                  (-wire14) : (reg22 ?
                      reg30 : (8'hba)))) >>> ($signed({reg25}) ?
                  reg25[(3'h4):(1'h0)] : (-wire15))),
              ($unsigned(($unsigned(wire18) ? reg29 : reg30)) ?
                  wire14 : reg32)};
        end
      if ({reg31[(4'ha):(4'h8)]})
        begin
          reg37 <= ((((~&(wire15 == wire16)) ?
              ($signed(reg21) > {wire13,
                  reg29}) : $unsigned((|reg28))) && ($unsigned(reg20[(2'h2):(1'h0)]) * {wire15[(4'hd):(3'h6)]})) ^ $unsigned((wire12 ?
              $signed(((7'h44) ?
                  wire16 : reg19)) : $unsigned($unsigned(reg24)))));
          reg38 <= $signed({$unsigned($signed((reg23 + reg29)))});
        end
      else
        begin
          reg37 <= wire13[(3'h7):(1'h1)];
        end
    end
  assign wire39 = (wire12 < $signed(reg31));
  assign wire40 = reg30[(1'h1):(1'h1)];
  assign wire41 = (wire17 ?
                      (wire14 < wire14[(1'h1):(1'h1)]) : ($signed($unsigned((7'h42))) ?
                          $unsigned(reg30[(1'h1):(1'h1)]) : ($signed(((8'haf) ^ reg37)) <<< reg31[(4'hb):(4'h8)])));
  assign wire42 = $unsigned($unsigned($unsigned(reg26)));
  assign wire43 = (((reg27 ? (|{reg28}) : wire40) >> {wire17,
                          reg21[(4'hd):(2'h3)]}) ?
                      (($signed($unsigned(wire18)) && reg23) ?
                          ((8'ha7) ?
                              $unsigned($signed(reg30)) : wire39[(1'h1):(1'h0)]) : ($unsigned($signed(wire15)) ?
                              reg24 : $unsigned((reg34 ?
                                  wire42 : wire39)))) : wire17[(3'h5):(1'h0)]);
  assign wire44 = {(~^reg21[(4'ha):(4'h8)])};
endmodule

module module80
#(parameter param90 = (((~|(((8'hbc) || (7'h43)) ? {(8'haa)} : ((8'ha6) ~^ (8'h9c)))) ? ((((8'hb8) << (8'ha0)) ? (~(8'hbd)) : ((7'h44) ? (8'hb5) : (8'had))) ? ((^~(8'ha7)) ? ((8'hb2) ? (8'hb2) : (8'had)) : {(8'hac)}) : (~(|(8'ha5)))) : ((~((8'ha2) < (8'hb9))) ? (((7'h42) >>> (8'hba)) ? (~|(8'ha0)) : (~&(7'h43))) : (((8'hbb) ? (8'hb4) : (8'h9e)) >>> ((8'hba) ? (8'ha7) : (8'h9c))))) ? {(8'hbe), ((8'h9e) <= (((7'h43) ? (8'h9d) : (8'h9e)) ? ((8'ha6) ~^ (8'hb6)) : {(8'ha0)}))} : (~&{(!(^(8'hb1)))})), 
parameter param91 = ({{{(|(7'h40))}, param90}} ? ((~(8'ha1)) ? (|(~^(param90 > param90))) : (param90 ^~ {(~param90)})) : ((param90 ? {(8'h9e)} : param90) ? {({param90} - (8'hb9)), (param90 ? param90 : (param90 ^ (8'hac)))} : param90)))
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire85;
  input wire [(2'h3):(1'h0)] wire84;
  input wire [(5'h12):(1'h0)] wire83;
  input wire [(4'he):(1'h0)] wire82;
  input wire [(3'h5):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(2'h2):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  assign y = {wire89, wire88, wire87, wire86, (1'h0)};
  assign wire86 = wire83[(3'h6):(3'h4)];
  assign wire87 = wire83[(5'h10):(1'h1)];
  assign wire88 = $signed($unsigned($unsigned((^~(^~wire81)))));
  assign wire89 = ((wire81[(2'h3):(1'h1)] ? wire81[(3'h4):(1'h1)] : wire87) ?
                      {$unsigned($unsigned((^wire82)))} : $signed(wire81));
endmodule
