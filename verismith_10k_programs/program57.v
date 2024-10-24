module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h179):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire129;
  wire [(5'h10):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire108;
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire122,
                 wire121,
                 wire110,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire9,
                 wire10,
                 wire108,
                 reg124,
                 reg123,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg8,
                 (1'h0)};
  assign wire4 = $unsigned(((($signed(wire0) - (wire3 & wire1)) ^ (wire2[(2'h2):(1'h1)] ?
                         (wire1 ? wire0 : wire2) : wire2)) ?
                     (-(~|wire3)) : {$signed(wire1)}));
  assign wire5 = wire1[(5'h14):(3'h4)];
  assign wire6 = $signed($unsigned($unsigned($signed((&wire0)))));
  assign wire7 = (^$unsigned((&(&$signed(wire3)))));
  always
    @(posedge clk) begin
      reg8 <= wire4[(1'h0):(1'h0)];
    end
  assign wire9 = (!$signed(((wire2 ?
                     (wire1 == wire0) : wire2) ^ (+((7'h41) | wire6)))));
  assign wire10 = (|wire7);
  module11 #() modinst109 (.wire13(wire1), .clk(clk), .wire14(wire9), .wire15(wire4), .y(wire108), .wire12(reg8));
  assign wire110 = wire0;
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(wire1[(4'hc):(3'h7)]) ?
          (^~wire110) : (((wire6 < (8'hb0)) ? wire108 : (&wire110)) ?
              $unsigned($signed(wire6)) : $unsigned((wire7 > wire5))))))
        begin
          if ($unsigned({$unsigned($signed(((8'hb2) & wire7))),
              {{{wire108, (7'h41)}, ((7'h43) ? wire3 : wire6)}}}))
            begin
              reg111 <= $unsigned(wire3[(3'h7):(1'h1)]);
              reg112 <= (~|$signed((~^({wire108,
                  wire0} * wire5[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg111 <= (8'hb0);
              reg112 <= (wire1[(4'h8):(4'h8)] ^ wire0[(4'he):(4'he)]);
            end
          if ($unsigned($signed((~|(~&(wire6 == wire2))))))
            begin
              reg113 <= ($unsigned({(wire1 ?
                      (wire7 == (8'hb6)) : (reg112 ? wire2 : wire108)),
                  ($unsigned((8'hbe)) ~^ {wire110})}) <<< wire10);
              reg114 <= (!(8'h9c));
              reg115 <= $unsigned(reg113[(2'h2):(2'h2)]);
            end
          else
            begin
              reg113 <= wire3;
              reg114 <= wire5;
            end
        end
      else
        begin
          reg111 <= $signed((((-(wire110 & wire2)) ?
                  $signed((wire9 ? wire1 : (7'h40))) : $signed((wire1 ?
                      wire6 : reg8))) ?
              ($unsigned((~^reg113)) ?
                  $signed(wire9[(1'h0):(1'h0)]) : (^~(wire7 ?
                      wire110 : wire0))) : (wire3[(3'h4):(1'h0)] | reg8[(1'h1):(1'h1)])));
        end
      if (wire9)
        begin
          if ((&$signed($signed(($unsigned(wire110) > ((8'hbb) <<< wire5))))))
            begin
              reg116 <= $signed(wire2);
              reg117 <= (($signed(wire4[(4'hd):(4'ha)]) ?
                  wire4[(3'h7):(3'h6)] : $unsigned($unsigned(reg114[(2'h2):(2'h2)]))) != (~|reg8[(1'h0):(1'h0)]));
              reg118 <= $unsigned({$signed(((~|wire9) ^~ (~^wire1))), wire6});
            end
          else
            begin
              reg116 <= reg117[(4'ha):(1'h0)];
              reg117 <= ($signed(wire6[(3'h4):(1'h1)]) || {$unsigned(reg112[(3'h6):(2'h3)]),
                  reg114});
              reg118 <= $unsigned({(+(-(reg111 << wire6))),
                  $signed((~^wire110))});
            end
          reg119 <= reg113[(3'h7):(2'h2)];
        end
      else
        begin
          reg116 <= wire110;
        end
    end
  always
    @(posedge clk) begin
      reg120 <= $unsigned(wire0);
    end
  assign wire121 = wire1;
  assign wire122 = (wire108[(5'h11):(4'hb)] & (-(~((!wire0) ?
                       (wire5 <= reg111) : {(8'hab), wire5}))));
  always
    @(posedge clk) begin
      reg123 <= reg113;
      reg124 <= wire3[(4'hb):(4'ha)];
    end
  assign wire125 = (($unsigned($unsigned(reg124[(1'h1):(1'h1)])) ?
                           (wire121[(1'h1):(1'h0)] >= $signed(reg119)) : $unsigned((+(~|wire121)))) ?
                       ({$unsigned(wire5[(3'h6):(2'h2)])} ?
                           reg124 : {$unsigned($unsigned(wire1)),
                               reg115}) : ({{reg111}} | $unsigned($signed($signed(reg111)))));
  assign wire126 = {{(reg117[(3'h5):(1'h1)] ? (^(~^wire10)) : (8'hac))},
                       $signed(reg114[(3'h5):(2'h2)])};
  assign wire127 = $signed({(~|($unsigned(wire126) ?
                           $unsigned(wire5) : wire110)),
                       $signed($signed((~wire121)))});
  assign wire128 = ((8'ha4) != wire5);
  assign wire129 = (+{{($signed(reg8) ? (!reg118) : reg120[(5'h14):(2'h2)])},
                       (($signed(wire121) - (reg116 ? wire0 : wire122)) ?
                           $unsigned(reg118) : ($unsigned(reg116) == reg117))});
  assign wire130 = reg123;
  assign wire131 = wire10;
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire signed [(3'h4):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire102;
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire16,
                 wire17,
                 wire18,
                 wire30,
                 wire31,
                 wire32,
                 wire69,
                 wire102,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
  assign wire16 = ((wire13 ?
                      $unsigned($signed((~^wire14))) : wire15) != wire13[(2'h3):(2'h3)]);
  assign wire17 = $unsigned(($signed((wire14[(1'h1):(1'h1)] ?
                          (wire16 ^ wire16) : (wire13 || wire16))) ?
                      $unsigned(wire14) : $signed($unsigned((wire13 <= (7'h44))))));
  assign wire18 = $unsigned($signed($signed(($signed(wire15) * wire12[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      if (wire14[(3'h4):(1'h1)])
        begin
          reg19 <= wire18[(3'h5):(1'h0)];
          reg20 <= wire14[(3'h4):(3'h4)];
          if (((!$unsigned((~^(wire12 ? (8'ha0) : wire18)))) ?
              wire14[(2'h2):(2'h2)] : wire12[(3'h4):(3'h4)]))
            begin
              reg21 <= {$unsigned((((reg20 ? wire18 : wire13) < ((8'hb4) ?
                      wire16 : reg19)) ^ $unsigned($unsigned(wire15))))};
              reg22 <= (wire16 ? wire12 : wire12[(1'h1):(1'h0)]);
              reg23 <= (|((&$signed(wire15)) ?
                  $signed(wire16[(2'h2):(1'h1)]) : (7'h44)));
            end
          else
            begin
              reg21 <= ($signed((wire12[(2'h2):(2'h2)] >> $unsigned({reg21}))) && $signed(reg21));
              reg22 <= (($unsigned({{(8'ha2),
                          wire13}}) < (~&wire16[(2'h3):(1'h0)])) ?
                  wire17 : $unsigned(wire16[(3'h5):(1'h1)]));
              reg23 <= wire17[(5'h11):(3'h4)];
            end
          reg24 <= $unsigned(wire16[(3'h5):(1'h0)]);
        end
      else
        begin
          if ($signed($unsigned((8'h9c))))
            begin
              reg19 <= ($signed((+$signed($unsigned(wire13)))) != (-$signed(reg23)));
              reg20 <= reg19;
              reg21 <= $unsigned($signed(reg22));
            end
          else
            begin
              reg19 <= {wire13[(2'h3):(2'h2)]};
            end
          reg22 <= ((reg24 > (^{{reg21, reg23},
              (&wire15)})) > ((wire14 | (~|(reg23 >>> wire13))) && $signed(($unsigned(reg21) ?
              $unsigned(reg24) : wire12[(1'h0):(1'h0)]))));
          reg23 <= $unsigned((8'hb5));
          reg24 <= $signed($unsigned((~$unsigned(wire12))));
          reg25 <= $signed((8'haa));
        end
      reg26 <= {$signed({(-(wire18 ^~ wire18))})};
      reg27 <= wire17;
      reg28 <= ({$signed($signed((8'hbb))),
          {reg19, wire18[(1'h0):(1'h0)]}} ~^ (^~(+($unsigned(reg20) | ((8'ha8) ?
          wire16 : reg27)))));
      reg29 <= ($unsigned((((reg22 <<< reg24) == (reg20 ?
          (8'ha6) : (8'hae))) || (^{(8'hb4)}))) ~^ $unsigned($unsigned((&$signed(reg23)))));
    end
  assign wire30 = ($signed($signed(wire17)) >= wire18);
  assign wire31 = wire18[(1'h1):(1'h0)];
  assign wire32 = (reg21[(3'h6):(3'h5)] ?
                      ((+{wire13[(3'h5):(2'h2)], {reg29, reg28}}) ?
                          (8'hac) : ($signed({reg26}) ?
                              ((wire30 <<< reg28) ?
                                  $unsigned(wire17) : (^~wire15)) : {reg20})) : (reg22[(3'h6):(3'h6)] ?
                          $unsigned(reg25[(3'h4):(1'h0)]) : (((~wire12) ?
                              $signed(reg19) : (reg24 ?
                                  reg29 : reg27)) || (!$unsigned(wire14)))));
  always
    @(posedge clk) begin
      reg33 <= reg22;
      reg34 <= ($unsigned(wire15[(2'h2):(1'h0)]) ?
          $unsigned((($unsigned(reg23) ?
              (8'hab) : (wire31 ^ wire31)) || $unsigned(reg25[(3'h7):(3'h7)]))) : (wire12 >= {$signed({reg29})}));
      reg35 <= (^(~^(|reg25[(1'h0):(1'h0)])));
      reg36 <= (~&$unsigned($unsigned(reg33)));
      reg37 <= reg28[(4'hc):(4'h8)];
    end
  module38 #() modinst70 (.wire43(reg27), .clk(clk), .wire41(reg37), .wire40(reg28), .wire42(reg19), .y(wire69), .wire39(reg36));
  module71 #() modinst103 (.wire75(reg28), .wire73(wire18), .clk(clk), .wire74(reg21), .wire72(reg27), .y(wire102));
  assign wire104 = $unsigned($signed($unsigned($signed($unsigned(reg23)))));
  assign wire105 = $signed(reg29);
  assign wire106 = (reg27[(1'h1):(1'h1)] ?
                       wire14 : ($unsigned($signed($signed(reg28))) >= ((~&(|reg35)) ?
                           (~|reg27) : ({reg29, reg22} ?
                               (reg33 ? reg20 : reg28) : $signed(wire30)))));
  assign wire107 = wire105;
endmodule

module module71  (y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire75;
  input wire signed [(2'h3):(1'h0)] wire74;
  input wire signed [(5'h12):(1'h0)] wire73;
  input wire [(5'h13):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire76;
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire85,
                 wire76,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire76 = ((|$unsigned(wire72)) >= $unsigned(wire75));
  always
    @(posedge clk) begin
      reg77 <= wire72;
      reg78 <= wire72[(5'h13):(4'hd)];
      reg79 <= (&{(~|$unsigned($signed(wire76)))});
      if (wire73)
        begin
          reg80 <= $signed(($unsigned(wire74[(2'h3):(2'h2)]) - $unsigned($signed({reg78,
              wire76}))));
        end
      else
        begin
          reg80 <= $unsigned($signed(wire75[(1'h0):(1'h0)]));
          if ((reg77 ?
              $signed(wire75[(4'hf):(3'h7)]) : $unsigned(($unsigned((^reg79)) >> $signed((wire72 ?
                  reg80 : reg77))))))
            begin
              reg81 <= wire72[(3'h5):(1'h1)];
              reg82 <= $signed(wire73);
            end
          else
            begin
              reg81 <= (|reg82[(2'h3):(1'h1)]);
              reg82 <= wire72;
              reg83 <= reg80;
            end
          reg84 <= $unsigned(($unsigned($signed(wire76[(1'h1):(1'h0)])) - ($signed(reg79) >= $unsigned($unsigned(wire75)))));
        end
    end
  assign wire85 = ($signed($unsigned($signed((~&(8'hb9))))) >> reg82);
  always
    @(posedge clk) begin
      reg86 <= (reg82[(3'h4):(1'h1)] ? wire74[(1'h1):(1'h0)] : $signed(reg81));
      reg87 <= $signed(({reg81[(1'h0):(1'h0)]} ?
          (8'hbe) : $unsigned(((~^wire76) ?
              $signed(reg80) : reg81[(3'h5):(1'h0)]))));
      reg88 <= wire74[(2'h2):(1'h1)];
      reg89 <= (($unsigned(wire75[(3'h5):(1'h1)]) ?
              (8'hbb) : reg87[(1'h0):(1'h0)]) ?
          (reg77 ?
              ((~|reg83) <<< reg84) : reg78) : (!(wire85[(4'ha):(1'h0)] * (^(&reg83)))));
      reg90 <= reg80[(3'h6):(1'h1)];
    end
  assign wire91 = ((~|((reg80 ?
                          (wire74 ?
                              reg80 : wire73) : $signed((8'h9f))) >= $unsigned(wire73))) ?
                      ({reg80[(5'h12):(3'h6)]} || {$unsigned((8'hae))}) : wire76);
  assign wire92 = ($unsigned($signed(wire74[(1'h0):(1'h0)])) & {reg88[(4'hf):(3'h5)],
                      (($unsigned(wire72) > wire76[(5'h11):(4'he)]) ?
                          $signed(((8'haa) * (8'hb0))) : $signed((~(8'hb1))))});
  assign wire93 = $signed((8'ha5));
  assign wire94 = (-$signed({$signed($signed(reg87)), wire73}));
  assign wire95 = (~^(~^((~|reg86[(2'h2):(2'h2)]) ?
                      wire94[(1'h0):(1'h0)] : {$signed((8'hb0)),
                          ((8'ha5) <= wire75)})));
  assign wire96 = $signed((wire74 - $unsigned((&wire72[(4'hf):(4'hc)]))));
  assign wire97 = $unsigned({$signed((|{reg82}))});
  always
    @(posedge clk) begin
      if ($unsigned(((8'h9d) ?
          ($unsigned((8'ha2)) ?
              $signed($unsigned(reg81)) : (8'h9c)) : (-{(-(8'h9e)),
              (|wire97)}))))
        begin
          if ($unsigned(wire97))
            begin
              reg98 <= $signed({$unsigned(((-wire93) >> (reg78 >> (7'h40))))});
              reg99 <= ((((-$signed((8'hbe))) - reg80[(4'he):(4'h9)]) ?
                  ($unsigned(reg81) * (7'h44)) : (+((wire74 ?
                      wire96 : (8'ha1)) >> (8'h9c)))) & {$signed(wire91[(1'h1):(1'h1)])});
            end
          else
            begin
              reg98 <= $unsigned($signed(reg82[(3'h4):(1'h1)]));
              reg99 <= (~|((~|(reg81[(5'h14):(3'h7)] ?
                      (wire94 >>> wire93) : wire72)) ?
                  $unsigned(wire73[(4'h9):(1'h0)]) : $unsigned({wire97})));
              reg100 <= $unsigned($unsigned($signed($unsigned(reg79))));
              reg101 <= {((&(~$signed(wire75))) ^~ ({(8'hbb)} >>> (wire72[(1'h1):(1'h0)] << ((8'hba) ?
                      wire85 : (8'ha2))))),
                  $unsigned((~reg84[(3'h4):(3'h4)]))};
            end
        end
      else
        begin
          reg98 <= ($unsigned(reg90) ?
              {(((wire91 ? reg100 : wire92) ?
                      $unsigned(reg90) : (reg83 && (8'hb0))) - wire93[(3'h4):(2'h3)]),
                  $signed((8'haf))} : ((8'hbd) == wire91[(3'h6):(3'h5)]));
          reg99 <= $signed(wire72);
        end
    end
endmodule

module module38
#(parameter param68 = ((((((8'hbe) ? (8'ha0) : (8'hac)) + (-(8'ha6))) ? ({(8'h9d)} < ((7'h43) ? (8'hb9) : (7'h40))) : (((8'hbb) >> (8'h9f)) ^~ (+(8'hbd)))) ^~ (8'hbf)) ? (~(({(8'hb0), (8'ha6)} >> ((8'hb7) ? (8'hae) : (8'hb5))) ? (8'ha8) : (|((8'hb8) != (7'h41))))) : (8'ha9)))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire43;
  input wire [(2'h2):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  input wire signed [(5'h13):(1'h0)] wire40;
  input wire [(4'h9):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg60,
                 reg59,
                 reg53,
                 reg49,
                 (1'h0)};
  assign wire44 = (^~((8'ha6) ?
                      ((wire43 >= (wire39 ?
                          wire41 : wire40)) >= $unsigned((wire41 ?
                          wire41 : wire39))) : $unsigned((~|wire40))));
  assign wire45 = $signed((!$unsigned(wire43[(1'h0):(1'h0)])));
  assign wire46 = $unsigned(wire39);
  assign wire47 = wire45;
  assign wire48 = {{wire44, (-wire45)}};
  always
    @(posedge clk) begin
      reg49 <= (&$signed((~((wire39 > wire46) * (wire41 ?
          (7'h43) : (8'hbd))))));
    end
  assign wire50 = {(^~(((wire42 ? wire45 : (7'h44)) ?
                              $unsigned((8'hac)) : (wire40 ? wire43 : wire42)) ?
                          $unsigned(reg49) : wire41)),
                      (+((~&wire41) ?
                          $unsigned($unsigned(wire40)) : $unsigned(wire41)))};
  assign wire51 = ((~|(!(wire48 >>> (wire41 + wire42)))) ?
                      (((+((8'hbb) == wire40)) >> $unsigned((wire46 + wire39))) & ($signed(wire39[(3'h4):(2'h3)]) ?
                          (7'h43) : $unsigned({wire48,
                              (8'hb5)}))) : wire40[(2'h3):(1'h0)]);
  assign wire52 = $signed(wire43);
  always
    @(posedge clk) begin
      reg53 <= ((wire52[(2'h2):(1'h1)] ~^ (wire44 ?
              ($signed(wire43) ?
                  $signed(wire41) : wire52[(2'h3):(1'h0)]) : (~(&wire44)))) ?
          (wire43[(1'h1):(1'h1)] ?
              $unsigned(wire41[(3'h4):(1'h1)]) : $signed({((8'hb6) ~^ wire42)})) : wire52);
    end
  assign wire54 = (8'hbd);
  assign wire55 = $signed(reg53[(3'h5):(3'h5)]);
  assign wire56 = wire44;
  assign wire57 = {($signed($unsigned($unsigned(wire42))) ?
                          wire44[(1'h0):(1'h0)] : $signed(wire48[(3'h5):(2'h3)]))};
  assign wire58 = wire52;
  always
    @(posedge clk) begin
      reg59 <= $unsigned($unsigned(($unsigned((wire40 ? (8'h9d) : wire55)) ?
          $signed(wire54[(3'h6):(2'h3)]) : (|(wire43 << wire58)))));
      reg60 <= wire45;
    end
  assign wire61 = $unsigned(wire44);
  assign wire62 = $signed((+$signed(wire52)));
  assign wire63 = ($unsigned(wire43[(2'h2):(1'h1)]) > wire55[(3'h7):(3'h7)]);
  assign wire64 = (~&(~^reg49));
  assign wire65 = (^~(reg59 ? $signed((-(!(8'h9d)))) : wire40[(5'h13):(1'h0)]));
  assign wire66 = (^(~|(wire58 && (+(wire39 != wire63)))));
  assign wire67 = wire50[(2'h2):(1'h0)];
endmodule
