module top
#(parameter param207 = (-((((8'ha6) ^ ((8'hb6) + (8'hb5))) ? (|(8'hbb)) : ((&(8'hb8)) ? ((8'hb7) < (8'ha1)) : ((8'ha3) ? (8'hb5) : (8'hb0)))) ? {(((8'hbd) ^~ (8'ha4)) ? ((8'ha3) ? (8'hb4) : (8'ha0)) : (8'hbf))} : (~^{(~&(8'hbb)), {(8'haf), (8'h9f)}}))), 
parameter param208 = param207)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire206;
  wire [(4'h9):(1'h0)] wire205;
  wire signed [(2'h2):(1'h0)] wire204;
  wire [(5'h15):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire195;
  reg [(4'h9):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg202 = (1'h0);
  reg [(4'h9):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg198 = (1'h0);
  reg [(4'h8):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire69,
                 wire74,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire195,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg71,
                 reg72,
                 reg73,
                 reg75,
                 reg81,
                 (1'h0)};
  module4 #() modinst70 (.y(wire69), .wire8(wire1), .clk(clk), .wire6(wire2), .wire7(wire0), .wire5(wire3));
  always
    @(posedge clk) begin
      reg71 <= ((8'h9d) ?
          wire3[(4'h9):(2'h2)] : ($unsigned(((wire69 - wire3) << $unsigned(wire69))) - (^~wire69)));
      reg72 <= (((wire2[(3'h6):(2'h3)] >> {$unsigned((8'hbd))}) ?
              $unsigned(wire2[(3'h6):(3'h4)]) : (~&$unsigned(((8'hb4) ?
                  wire1 : wire1)))) ?
          ({wire69[(3'h5):(1'h0)],
              ((wire3 ? wire0 : wire2) ~^ (wire2 ?
                  wire3 : wire2))} ^ $unsigned(({reg71,
              wire69} >> $unsigned(wire69)))) : $unsigned($unsigned((-(-wire3)))));
      reg73 <= wire0[(4'h9):(2'h3)];
    end
  assign wire74 = (8'hb1);
  always
    @(posedge clk) begin
      reg75 <= (~^$unsigned(wire2[(4'hd):(1'h1)]));
    end
  assign wire76 = (($unsigned($signed(wire74[(1'h0):(1'h0)])) != ((&(reg73 <= reg75)) ^ $signed(reg72))) ?
                      (+$unsigned(wire2)) : (($unsigned((reg73 == reg73)) + ($unsigned(wire69) || $unsigned(reg71))) || wire3[(2'h2):(1'h0)]));
  assign wire77 = $unsigned($signed($signed((wire3 ?
                      ((8'h9e) ? (7'h40) : wire0) : wire74[(2'h2):(2'h2)]))));
  assign wire78 = wire77[(2'h2):(1'h1)];
  assign wire79 = reg72[(3'h6):(3'h6)];
  assign wire80 = (((reg71 * (wire1 >>> (wire76 < wire69))) < $signed($unsigned(((8'hb4) ?
                          wire0 : reg71)))) ?
                      wire77 : $unsigned($unsigned((^~wire2[(4'ha):(1'h1)]))));
  always
    @(posedge clk) begin
      reg81 <= reg72;
    end
  module82 #() modinst196 (wire195, clk, wire79, wire0, reg81, wire3);
  always
    @(posedge clk) begin
      if (((~^(reg73 != (^~wire2[(4'h9):(1'h1)]))) ^~ $unsigned((($unsigned(wire69) ?
          wire78 : wire2[(5'h10):(5'h10)]) <= wire74))))
        begin
          reg197 <= {((|reg75) ?
                  (^((!wire79) ?
                      {wire80,
                          wire80} : (~|wire79))) : (~&(reg81[(4'hf):(4'he)] | (wire80 | wire0))))};
          if ((~^reg75[(3'h4):(1'h1)]))
            begin
              reg198 <= {($signed({(reg71 >>> wire78)}) <= (~$signed($signed((8'ha0)))))};
            end
          else
            begin
              reg198 <= (^$signed($signed($unsigned(wire69[(3'h4):(2'h3)]))));
              reg199 <= $unsigned({(($signed(wire74) ~^ (wire195 ?
                      (8'hb4) : wire80)) >> wire78[(1'h0):(1'h0)]),
                  wire77[(1'h1):(1'h1)]});
              reg200 <= $unsigned(wire0[(4'h9):(2'h3)]);
              reg201 <= $signed($signed($signed($signed($signed((8'hb3))))));
            end
        end
      else
        begin
          reg197 <= (wire74 >>> $signed((!{(reg72 >>> wire80)})));
          reg198 <= {reg71, wire77};
          if (reg71[(1'h0):(1'h0)])
            begin
              reg199 <= reg199;
              reg200 <= (~^$unsigned((~^wire76[(4'hd):(4'hd)])));
            end
          else
            begin
              reg199 <= ((reg73 ?
                  $signed((reg71[(1'h1):(1'h1)] ^ ((8'ha4) ?
                      wire1 : reg71))) : reg72[(4'hb):(1'h1)]) == wire195[(3'h5):(1'h1)]);
              reg200 <= reg197;
              reg201 <= (wire0 * ((($signed(wire2) || (reg75 != wire80)) ~^ (wire80[(4'hf):(4'hc)] <<< $unsigned(reg71))) ?
                  {(~(wire0 ? (8'ha4) : reg72)),
                      ((8'ha2) ?
                          ((8'ha3) ~^ reg201) : wire77[(1'h1):(1'h0)])} : $unsigned((reg200[(2'h3):(2'h2)] >>> (reg199 ?
                      reg75 : reg198)))));
              reg202 <= (8'hb0);
            end
          reg203 <= reg197;
        end
    end
  assign wire204 = ($signed((&($signed(reg198) | wire76))) && wire2[(2'h2):(1'h1)]);
  assign wire205 = $unsigned((~|wire69));
  assign wire206 = {(($signed($unsigned(wire79)) ^~ wire78[(4'h9):(4'h9)]) ?
                           (!wire76) : wire79[(1'h1):(1'h0)]),
                       (wire1 ?
                           reg75 : ($unsigned((wire80 && wire3)) ?
                               (-(reg75 ?
                                   wire77 : wire2)) : wire3[(4'h8):(2'h2)]))};
endmodule

module module82
#(parameter param193 = (~^(8'hb0)), 
parameter param194 = (~param193))
(y, clk, wire83, wire84, wire85, wire86);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire83;
  input wire signed [(5'h12):(1'h0)] wire84;
  input wire signed [(4'hf):(1'h0)] wire85;
  input wire [(3'h7):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(4'hb):(1'h0)] wire141;
  wire [(4'hd):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire145;
  wire signed [(4'hb):(1'h0)] wire146;
  wire [(5'h10):(1'h0)] wire148;
  wire [(4'hd):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire151;
  wire [(2'h3):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire156;
  wire signed [(4'hc):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire191;
  reg signed [(4'hb):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  assign y = {wire87,
                 wire90,
                 wire91,
                 wire98,
                 wire99,
                 wire141,
                 wire143,
                 wire144,
                 wire145,
                 wire146,
                 wire148,
                 wire149,
                 wire150,
                 wire151,
                 wire155,
                 wire156,
                 wire157,
                 wire191,
                 reg154,
                 reg153,
                 reg152,
                 reg147,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire87 = ((~|(^~$signed(((8'h9d) != wire84)))) + ({$signed((^~wire84))} ?
                      ({$unsigned(wire86),
                          wire84} <<< wire84) : $signed(((wire85 ?
                          wire86 : wire83) == {(8'hbb), wire86}))));
  always
    @(posedge clk) begin
      if (($signed(($signed(wire87) && wire86[(3'h7):(3'h5)])) ?
          (~^((8'hb4) ?
              $signed((wire84 ?
                  (7'h40) : (8'h9f))) : wire86)) : $signed(($signed((wire85 * wire87)) < wire87[(1'h0):(1'h0)]))))
        begin
          reg88 <= wire87[(1'h0):(1'h0)];
        end
      else
        begin
          reg88 <= ((^wire87[(2'h3):(1'h1)]) ?
              {wire85[(1'h0):(1'h0)],
                  ($signed($signed(wire84)) - (|wire85))} : ((~$signed($signed((8'ha1)))) <= wire85));
          reg89 <= $signed(wire84[(2'h3):(2'h3)]);
        end
    end
  assign wire90 = {{(+reg88)}};
  assign wire91 = $signed((($signed((wire90 ? (8'hb4) : (7'h41))) ?
                      wire87 : ((^wire85) || (wire87 ?
                          wire86 : wire87))) >> $unsigned($signed(wire90))));
  always
    @(posedge clk) begin
      reg92 <= reg88;
      reg93 <= ($unsigned(wire84) ^ ((((+(8'hbd)) >>> reg88[(1'h0):(1'h0)]) && ((wire84 ?
              (8'h9d) : reg92) ?
          ((7'h43) << reg88) : wire84[(1'h0):(1'h0)])) < {($signed(reg88) ?
              wire84[(1'h0):(1'h0)] : {wire86}),
          ((wire86 ? (8'had) : reg89) != (wire86 << wire84))}));
      reg94 <= wire83[(1'h0):(1'h0)];
      if ($unsigned(wire86[(3'h7):(2'h3)]))
        begin
          reg95 <= ((!((8'ha9) ? reg88 : (~wire86[(3'h5):(1'h0)]))) ?
              $signed((~$signed(((8'hbc) ?
                  wire87 : wire84)))) : wire84[(1'h0):(1'h0)]);
          reg96 <= wire90[(1'h0):(1'h0)];
          reg97 <= reg92;
        end
      else
        begin
          reg95 <= reg89[(3'h7):(3'h4)];
          reg96 <= (~|wire86);
        end
    end
  assign wire98 = (^(~|((8'hb9) || (-(wire91 ? wire84 : (7'h43))))));
  assign wire99 = ($signed($unsigned(wire83)) ?
                      $unsigned(wire83[(4'hc):(3'h6)]) : reg96);
  module100 #() modinst142 (wire141, clk, wire91, wire85, wire98, wire83);
  assign wire143 = (8'hab);
  assign wire144 = {reg89[(4'hf):(3'h5)], $unsigned(reg92[(3'h4):(2'h2)])};
  assign wire145 = {{$signed($signed(wire144[(2'h2):(1'h1)]))},
                       $unsigned(wire141)};
  assign wire146 = reg97;
  always
    @(posedge clk) begin
      reg147 <= ((~&(|({(8'hb3), wire83} ? $signed(reg94) : $signed(wire86)))) ?
          $unsigned($signed((wire141 & (^reg89)))) : (~&{((wire86 ?
                      wire83 : (8'hb9)) ?
                  wire83[(4'he):(3'h4)] : ((8'ha7) ? wire144 : wire84)),
              ((8'hb7) <<< {wire87})}));
    end
  assign wire148 = $signed($signed({$signed((!wire85))}));
  assign wire149 = wire85;
  assign wire150 = wire90;
  assign wire151 = (((+$unsigned((wire141 * wire143))) <= $signed({(~^reg93)})) <<< {$signed($unsigned($signed(wire145))),
                       ((|wire146[(2'h2):(1'h0)]) ?
                           (-$unsigned(reg93)) : wire91)});
  always
    @(posedge clk) begin
      reg152 <= (~&wire91[(3'h4):(2'h2)]);
      reg153 <= (7'h44);
      reg154 <= $signed(wire90);
    end
  assign wire155 = $unsigned(({(~|(~wire99)),
                       $signed(((8'ha8) ?
                           wire151 : wire84))} == wire143[(4'hd):(2'h2)]));
  assign wire156 = $signed(wire91);
  assign wire157 = (8'hbb);
  module158 #() modinst192 (.y(wire191), .wire161(wire145), .wire162(wire84), .wire163(wire91), .wire160(wire148), .clk(clk), .wire159(wire151));
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(4'h9):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire9;
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire9,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire9 = wire8[(3'h7):(3'h5)];
  module10 #() modinst53 (.clk(clk), .wire11(wire8), .wire14(wire6), .wire12(wire5), .wire13(wire7), .y(wire52));
  assign wire54 = wire8;
  assign wire55 = $signed((8'hbe));
  assign wire56 = wire8[(2'h2):(2'h2)];
  assign wire57 = {wire8[(3'h4):(2'h3)],
                      ($unsigned(($unsigned((8'h9f)) <= wire56[(4'he):(1'h0)])) << (~|wire52))};
  assign wire58 = ($signed(((-$unsigned(wire8)) == ((wire6 < wire55) > {wire5}))) + ($signed($signed({(8'hb7)})) ?
                      $unsigned(((wire57 ? wire54 : wire52) ?
                          wire54 : $unsigned(wire57))) : wire56[(3'h6):(3'h6)]));
  assign wire59 = (wire8[(4'hc):(2'h3)] ~^ wire55[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg60 <= $signed($unsigned((wire55 ?
          $signed($unsigned(wire55)) : ($unsigned(wire56) ?
              $unsigned(wire8) : wire54[(4'h8):(1'h1)]))));
      reg61 <= wire52[(2'h3):(1'h1)];
      reg62 <= $unsigned($unsigned((($signed(wire6) ?
          (wire5 || (8'hb2)) : {wire52, wire9}) != $signed($signed(wire6)))));
      if ({({(^(wire7 < (7'h40)))} ? wire57 : $unsigned({$signed(wire7)}))})
        begin
          reg63 <= ($signed(($unsigned(((8'ha0) + wire59)) ?
              (^~{wire52}) : $unsigned((wire52 ^~ (8'hb3))))) ^ wire7);
          reg64 <= wire54[(3'h4):(1'h0)];
        end
      else
        begin
          reg63 <= {($unsigned(wire57) ^ {wire54, $signed(wire6)})};
        end
    end
  always
    @(posedge clk) begin
      reg65 <= $signed((8'ha7));
    end
  always
    @(posedge clk) begin
      reg66 <= wire6;
    end
  assign wire67 = $signed($unsigned(wire6[(2'h3):(2'h3)]));
  assign wire68 = reg65[(2'h3):(2'h3)];
endmodule

module module10
#(parameter param51 = (~^{(7'h40)}))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire15 = wire12[(4'hc):(3'h6)];
  assign wire16 = wire11[(4'hc):(1'h0)];
  assign wire17 = $unsigned({$signed($unsigned(wire16)),
                      $unsigned(($unsigned(wire16) <<< wire15))});
  assign wire18 = {wire11};
  assign wire19 = $signed(wire13);
  assign wire20 = ((wire14[(1'h0):(1'h0)] ^ wire16) ? wire11 : wire15);
  assign wire21 = (+$unsigned((wire19 != ((~&wire11) ^ (wire15 < wire16)))));
  assign wire22 = wire12[(4'hc):(3'h4)];
  assign wire23 = wire12[(4'h8):(2'h3)];
  assign wire24 = {$unsigned({wire11[(3'h4):(1'h1)]})};
  assign wire25 = (~|(-wire15));
  assign wire26 = (wire25[(3'h4):(2'h3)] ?
                      $unsigned(wire16) : (^wire15[(2'h3):(2'h2)]));
  assign wire27 = wire12[(5'h10):(4'ha)];
  assign wire28 = {(~&(((wire19 ^~ wire25) >> (wire22 <= wire15)) ?
                          $signed((wire18 > wire27)) : $signed((wire11 != wire17)))),
                      ($unsigned($signed($unsigned(wire15))) ?
                          $signed(wire23[(2'h2):(1'h1)]) : ($signed((~(8'hbe))) ?
                              (&{wire25}) : (~^(~wire23))))};
  assign wire29 = {((^~$signed(wire23[(4'h9):(3'h7)])) & {$unsigned(wire20[(2'h2):(1'h1)]),
                          {$signed(wire24), wire14}})};
  assign wire30 = $unsigned((~^(~(wire12 ? wire19 : wire13))));
  assign wire31 = (wire13[(1'h0):(1'h0)] ?
                      wire26[(2'h2):(1'h0)] : ((wire30 ?
                              ($signed(wire23) ?
                                  $signed(wire14) : (wire25 ?
                                      wire20 : wire21)) : $unsigned(wire22)) ?
                          (wire14 ?
                              (wire21 >>> wire18) : $unsigned(wire27)) : wire22));
  assign wire32 = (|$unsigned($unsigned(wire30)));
  always
    @(posedge clk) begin
      if (wire26)
        begin
          if ($signed($signed(($unsigned($unsigned(wire27)) & $signed((wire23 >> wire18))))))
            begin
              reg33 <= (({(wire32 ? {wire18, wire11} : wire19[(2'h3):(2'h3)]),
                      wire12[(3'h6):(1'h1)]} ?
                  (&wire11) : (8'haf)) != $signed($signed(wire17)));
            end
          else
            begin
              reg33 <= (8'hbe);
              reg34 <= wire21[(3'h4):(1'h1)];
              reg35 <= wire25;
              reg36 <= ((wire14 ?
                      ((wire14 ? wire11[(4'h9):(3'h5)] : wire29) ?
                          (&(^wire22)) : $unsigned((wire24 & reg35))) : $unsigned($unsigned($signed(wire32)))) ?
                  (((^~$signed(wire15)) ?
                          (&$signed(wire20)) : $unsigned($unsigned(wire18))) ?
                      $unsigned(wire20) : wire23[(4'h9):(1'h0)]) : wire30);
            end
        end
      else
        begin
          reg33 <= ((-($signed((~^reg36)) ?
              wire25 : $unsigned((wire15 - wire25)))) ~^ (($unsigned($unsigned(wire27)) ?
              {$signed(wire11)} : (&$unsigned(wire30))) & (~&wire15)));
          reg34 <= $unsigned((wire27 ? $signed(wire19) : reg33));
          reg35 <= (^{(wire25[(1'h1):(1'h0)] ?
                  $signed(((8'h9f) ? wire28 : (8'ha4))) : $unsigned(wire27)),
              wire28});
          reg36 <= wire28;
          reg37 <= $unsigned((&wire20));
        end
      if ($unsigned((+(~|((~wire29) ^~ wire20[(4'hb):(3'h6)])))))
        begin
          reg38 <= (($signed((wire26 > (8'ha4))) >>> $unsigned(((-(8'hab)) ?
                  wire23 : $signed(wire25)))) ?
              wire18 : wire21);
          if (((($unsigned(wire25) ?
              ($signed(reg36) > {wire25}) : ($unsigned((8'hab)) | wire31)) > wire17[(2'h3):(1'h0)]) && wire30[(3'h4):(1'h0)]))
            begin
              reg39 <= reg33;
              reg40 <= (8'hba);
              reg41 <= wire17[(3'h7):(2'h2)];
              reg42 <= ({(-$unsigned(reg39)), wire11} != wire27);
              reg43 <= $signed(wire30[(3'h5):(2'h3)]);
            end
          else
            begin
              reg39 <= ((($signed({reg41}) ^~ (wire13[(2'h2):(1'h0)] ?
                  wire19[(1'h1):(1'h1)] : $signed(wire12))) || $unsigned(reg41[(4'h8):(2'h3)])) != (~&{((&reg43) ?
                      wire13 : (wire13 ? wire18 : wire29))}));
              reg40 <= wire29[(3'h4):(3'h4)];
            end
          reg44 <= (~|wire20[(4'he):(3'h6)]);
          reg45 <= $signed(((^((wire22 ~^ wire12) ?
                  (wire23 ? reg42 : wire20) : (reg36 ^~ wire12))) ?
              (&(-(+(8'hb2)))) : wire22));
          reg46 <= reg42[(2'h2):(1'h0)];
        end
      else
        begin
          reg38 <= $signed((($unsigned(reg42[(1'h0):(1'h0)]) ?
                  (~|$signed(reg35)) : (reg38[(4'h8):(1'h1)] | ((8'hbe) ?
                      reg45 : wire27))) ?
              $signed($signed(wire14[(3'h4):(3'h4)])) : ({{wire15}} ?
                  (~reg35) : $unsigned({wire15}))));
          reg39 <= $signed(($signed(reg40) ?
              reg33 : $unsigned(wire16[(1'h0):(1'h0)])));
          reg40 <= (reg44[(3'h4):(1'h0)] | $unsigned($unsigned($signed($unsigned((8'hb7))))));
          if ($unsigned(wire17))
            begin
              reg41 <= ($signed({((reg42 && wire17) ?
                      ((8'ha7) ? wire11 : wire17) : wire15),
                  reg35}) << $unsigned(wire24));
              reg42 <= $unsigned((+{wire19, (+reg42[(2'h2):(1'h1)])}));
              reg43 <= ($unsigned((~reg38)) ?
                  $unsigned((((wire31 ?
                      wire26 : (8'hbb)) <<< {wire24}) >= ($signed(wire29) <<< (wire19 ?
                      reg36 : wire19)))) : {(8'hb3)});
              reg44 <= ((7'h43) && {(^~$unsigned($unsigned(wire15))), {reg38}});
              reg45 <= $unsigned(reg42[(1'h1):(1'h0)]);
            end
          else
            begin
              reg41 <= ($unsigned((^$unsigned($unsigned(reg45)))) ~^ wire19);
            end
          reg46 <= {wire31};
        end
      reg47 <= $unsigned({$unsigned(reg39),
          (((wire28 ? reg37 : (8'hb7)) ^ (7'h40)) ?
              $unsigned((reg40 ?
                  wire14 : reg45)) : ($signed(wire23) != $signed(reg40)))});
      reg48 <= (~&{wire23, {wire31}});
    end
  assign wire49 = $unsigned($signed((wire30[(1'h0):(1'h0)] >>> {(reg40 && wire25)})));
  assign wire50 = $unsigned((^$unsigned(wire28[(3'h6):(3'h6)])));
endmodule

module module158
#(parameter param189 = {((+((~^(8'ha1)) ? ((8'h9d) ? (8'hba) : (8'ha2)) : (8'hb2))) ? (!{(~|(8'had)), ((8'hae) ? (8'hb5) : (8'ha5))}) : (^~((~|(8'ha1)) == ((8'haa) ? (8'hb0) : (8'ha4)))))}, 
parameter param190 = param189)
(y, clk, wire163, wire162, wire161, wire160, wire159);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire163;
  input wire [(5'h12):(1'h0)] wire162;
  input wire signed [(4'hc):(1'h0)] wire161;
  input wire signed [(5'h10):(1'h0)] wire160;
  input wire signed [(5'h10):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire188;
  wire signed [(5'h12):(1'h0)] wire187;
  wire [(4'h8):(1'h0)] wire181;
  wire signed [(3'h7):(1'h0)] wire180;
  wire signed [(5'h12):(1'h0)] wire170;
  wire signed [(4'he):(1'h0)] wire169;
  wire signed [(4'hd):(1'h0)] wire168;
  wire signed [(5'h10):(1'h0)] wire167;
  wire [(4'h9):(1'h0)] wire166;
  wire [(5'h13):(1'h0)] wire165;
  wire signed [(3'h6):(1'h0)] wire164;
  reg signed [(4'h8):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg184 = (1'h0);
  reg [(5'h15):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg178 = (1'h0);
  reg [(4'he):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg176 = (1'h0);
  reg [(3'h4):(1'h0)] reg175 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg172 = (1'h0);
  reg [(4'ha):(1'h0)] reg171 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire181,
                 wire180,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire164 = (^(~|wire162));
  assign wire165 = ((-((~|$unsigned((8'hac))) ^ $signed($signed(wire161)))) ?
                       ($signed((~$signed(wire161))) ?
                           wire163[(4'hd):(4'ha)] : wire160) : $signed((~|$unsigned({wire161}))));
  assign wire166 = $unsigned((wire164 ?
                       wire164[(3'h4):(3'h4)] : {$signed($unsigned(wire162))}));
  assign wire167 = $signed((wire165 ?
                       wire165 : (wire161 ?
                           $unsigned(wire161[(1'h1):(1'h1)]) : wire163)));
  assign wire168 = $signed($signed((|{{wire164, wire162}})));
  assign wire169 = ($unsigned(wire162) ?
                       wire160[(4'hc):(4'hc)] : $signed($unsigned(wire166[(1'h0):(1'h0)])));
  assign wire170 = (((!(wire162[(4'hb):(3'h6)] ?
                               $signed(wire168) : (wire165 ?
                                   (8'h9d) : wire164))) ?
                           $unsigned($signed($signed(wire167))) : {(7'h44)}) ?
                       wire169 : (-$unsigned($signed((|wire160)))));
  always
    @(posedge clk) begin
      reg171 <= (-((wire159 && (8'hb6)) << $unsigned(wire164)));
      reg172 <= (~^($unsigned($unsigned(wire165)) ?
          {$signed(wire160),
              ((~&wire169) - (wire162 | wire166))} : wire164[(1'h0):(1'h0)]));
      if (wire166[(3'h4):(2'h3)])
        begin
          reg173 <= wire163;
          if ($unsigned(({$signed({wire161})} ?
              ($signed((~&reg171)) ?
                  ($signed(wire166) ?
                      (8'ha8) : (wire164 <<< (8'hb0))) : reg173) : wire169[(4'h8):(2'h2)])))
            begin
              reg174 <= ($signed(((^~wire164[(2'h2):(1'h0)]) + (&(wire159 ?
                      wire169 : wire168)))) ?
                  wire160[(4'he):(4'he)] : reg171[(3'h4):(3'h4)]);
              reg175 <= $unsigned((8'hb4));
              reg176 <= (~^$signed({$unsigned((8'haa))}));
              reg177 <= reg175[(1'h1):(1'h0)];
            end
          else
            begin
              reg174 <= (wire163 >>> reg174[(4'h9):(2'h3)]);
              reg175 <= {$signed($unsigned((7'h42))), wire160};
              reg176 <= reg173;
              reg177 <= (^~$signed(wire168[(2'h3):(1'h1)]));
            end
        end
      else
        begin
          reg173 <= ($unsigned(reg174) ?
              ($unsigned(($signed(wire169) == (~|reg175))) ?
                  $signed($unsigned(reg173[(3'h5):(1'h0)])) : $unsigned(((!reg172) ^~ $signed(wire170)))) : (wire161 ?
                  ($signed((wire168 < reg176)) < ({reg171, wire170} ?
                      (wire160 || reg171) : $unsigned(wire161))) : {wire161,
                      {(|wire163), wire167[(1'h0):(1'h0)]}}));
          reg174 <= (~^{($unsigned((|wire164)) < ((wire169 < reg171) ?
                  (wire164 ? wire163 : reg172) : wire169))});
        end
      if ((wire159[(5'h10):(3'h6)] ?
          {(wire169[(4'hc):(4'hc)] & reg172)} : (!reg177[(3'h6):(3'h5)])))
        begin
          reg178 <= $signed((~$unsigned($signed($unsigned(reg174)))));
        end
      else
        begin
          reg178 <= $unsigned($unsigned(({(reg178 ? wire159 : wire164),
                  (+wire164)} ?
              $unsigned((^~wire166)) : ((^~(8'hb0)) <= reg175))));
          if ({(reg176[(4'ha):(1'h1)] ?
                  reg178 : $unsigned((^~$unsigned(reg171)))),
              reg175})
            begin
              reg179 <= $unsigned($unsigned((^~(wire163[(3'h7):(3'h5)] || wire164[(2'h3):(1'h0)]))));
            end
          else
            begin
              reg179 <= (wire167[(4'hb):(4'h8)] ?
                  wire168 : ({(reg175 ?
                          $unsigned(reg178) : reg172[(4'hc):(2'h2)])} && ((wire167 ?
                      (wire166 != wire163) : (wire166 <<< wire163)) + reg178)));
            end
        end
    end
  assign wire180 = ($unsigned((reg174 ?
                           (~^(reg173 & wire163)) : (((8'hbb) >>> wire159) ?
                               reg173 : $signed(reg172)))) ?
                       ({((reg174 ? (8'hbd) : wire169) != (wire160 ?
                               reg177 : reg173))} | $unsigned((+$unsigned(reg173)))) : wire165[(5'h12):(1'h1)]);
  assign wire181 = $unsigned(wire169[(3'h7):(2'h2)]);
  always
    @(posedge clk) begin
      reg182 <= $signed($signed($signed(($signed(reg178) && (wire169 ?
          reg174 : wire163)))));
      reg183 <= $unsigned($unsigned(wire166[(2'h3):(1'h0)]));
      reg184 <= $unsigned(($unsigned($unsigned({reg172})) ?
          {(|$unsigned(wire181)), wire165} : ($signed({reg176,
              wire159}) == reg172[(4'h8):(2'h2)])));
      reg185 <= wire161[(4'ha):(3'h7)];
      reg186 <= (reg177[(4'he):(2'h3)] ? reg171 : (^reg185[(1'h1):(1'h1)]));
    end
  assign wire187 = reg178;
  assign wire188 = (reg178[(1'h0):(1'h0)] <<< (&$unsigned({{(8'haa)},
                       $signed(reg179)})));
endmodule

module module100
#(parameter param140 = ((((((8'had) != (8'hb6)) ? ((8'hbb) ? (8'ha4) : (8'hbc)) : {(8'haa)}) - (|((8'hae) ? (7'h43) : (8'h9f)))) ? {(8'hba), (((8'hbe) & (8'hbb)) | (+(8'h9c)))} : {((|(8'h9d)) ? (!(8'ha4)) : (^(8'hac)))}) ? ((({(8'hb0), (8'hbd)} > ((8'ha6) ? (8'ha2) : (8'hb4))) ? ((8'hbc) ? (^~(8'ha6)) : ((8'hac) << (8'hb0))) : ((~(8'hab)) ? ((8'hb9) + (7'h43)) : ((8'ha9) ? (8'h9f) : (8'hb0)))) | (^({(8'hb4), (8'haf)} ? ((8'hb2) ? (8'ha5) : (8'ha5)) : ((8'hba) ? (8'hae) : (7'h43))))) : (((8'haf) ? (((8'hbe) ? (8'hbe) : (8'hb2)) ? ((8'hb7) ? (8'h9d) : (8'ha8)) : ((8'hbb) ? (7'h41) : (8'ha4))) : ((8'hb0) ? ((8'ha2) - (8'ha0)) : (8'hac))) ? (~&(8'hb6)) : ({(8'hab), {(8'haa), (8'hb0)}} ? ((+(8'ha1)) ? ((8'hbe) ? (8'hbc) : (8'hb2)) : (^(8'ha4))) : ((8'had) ^ ((8'hb1) ^~ (8'ha6)))))))
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire104;
  input wire [(4'hf):(1'h0)] wire103;
  input wire signed [(2'h2):(1'h0)] wire102;
  input wire signed [(5'h15):(1'h0)] wire101;
  wire signed [(3'h4):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire132;
  wire signed [(3'h6):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire [(3'h5):(1'h0)] wire111;
  wire signed [(5'h12):(1'h0)] wire105;
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire133,
                 wire132,
                 wire130,
                 wire129,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire105,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg131,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire105 = $signed($unsigned((^~wire103)));
  always
    @(posedge clk) begin
      reg106 <= wire105;
      reg107 <= wire102[(1'h1):(1'h0)];
      reg108 <= (reg106[(3'h7):(1'h1)] | ((($unsigned(reg107) ?
                  $signed(wire101) : (~wire102)) ?
              (8'ha3) : $signed((reg106 >= wire101))) ?
          reg106 : reg107[(3'h4):(1'h0)]));
      reg109 <= $signed($unsigned({{$unsigned(reg108)},
          {((8'haa) >>> wire105)}}));
      reg110 <= {$unsigned($signed(reg109))};
    end
  assign wire111 = wire103;
  assign wire112 = $unsigned(((~&$signed($signed(reg108))) ?
                       {reg109, $unsigned(wire105)} : (((wire102 ?
                           (8'ha6) : reg110) < (+reg106)) <= {$unsigned(reg106),
                           ((8'hb7) + reg110)})));
  assign wire113 = $unsigned((~&(({wire103, (8'h9d)} >= (wire102 ?
                           wire105 : reg108)) ?
                       ({(8'hac)} - $signed(reg106)) : ((^~wire102) ?
                           wire103 : wire112))));
  assign wire114 = reg106;
  always
    @(posedge clk) begin
      if ((+(|(8'ha7))))
        begin
          reg115 <= wire113;
        end
      else
        begin
          reg115 <= wire111[(1'h1):(1'h0)];
          reg116 <= $unsigned({(+((~|reg106) || (~|(8'ha8))))});
          reg117 <= reg108[(5'h11):(4'he)];
        end
      if (($unsigned(wire113[(5'h12):(5'h11)]) ?
          wire114 : ($unsigned(($unsigned(reg106) ?
              $signed(reg110) : (|reg107))) ^ {wire101[(5'h12):(4'ha)]})))
        begin
          if ($signed({wire105[(4'ha):(4'ha)]}))
            begin
              reg118 <= $unsigned(wire111);
            end
          else
            begin
              reg118 <= (|reg115[(2'h2):(1'h0)]);
              reg119 <= (+($unsigned($unsigned((reg117 ?
                  reg108 : wire101))) == $signed(wire113[(1'h0):(1'h0)])));
              reg120 <= wire104[(3'h6):(2'h3)];
            end
          if ($unsigned({$unsigned(((wire113 <= (8'ha9)) ?
                  (wire104 && wire101) : reg116)),
              (reg106 << (reg110[(3'h6):(1'h0)] ?
                  (reg110 ~^ reg115) : ((7'h44) ? reg118 : wire104)))}))
            begin
              reg121 <= wire102;
              reg122 <= (^~(^~(((reg121 ?
                  (8'ha2) : reg116) >> (~^reg116)) | wire101[(4'he):(4'h8)])));
            end
          else
            begin
              reg121 <= (^reg108);
              reg122 <= reg119;
              reg123 <= $signed($signed(($unsigned((reg108 | (8'hb7))) ?
                  wire111[(3'h4):(3'h4)] : reg106[(4'h8):(1'h0)])));
              reg124 <= (-(~wire112));
            end
          reg125 <= $signed(reg122[(3'h6):(2'h3)]);
          reg126 <= wire104;
          reg127 <= $signed($unsigned(wire114[(3'h7):(1'h1)]));
        end
      else
        begin
          reg118 <= $signed((reg124[(4'h9):(3'h4)] & $unsigned(((wire105 * reg125) <= (reg115 ?
              reg116 : (7'h44))))));
          if (((wire104 ?
              (&reg121[(3'h5):(3'h5)]) : reg121[(1'h1):(1'h1)]) >= ({{(~|wire101)}} ?
              {({wire103} ?
                      wire113 : reg109[(3'h6):(1'h1)])} : ($signed((^(8'ha3))) <= (((8'ha7) << reg121) ?
                  (^(7'h44)) : (+reg122))))))
            begin
              reg119 <= ((~(-$unsigned(wire114))) - reg108);
              reg120 <= $signed(wire113[(4'ha):(3'h6)]);
              reg121 <= (reg107[(5'h11):(1'h1)] >>> ($unsigned(reg118) ?
                  $unsigned($unsigned((reg119 ?
                      reg120 : reg122))) : $unsigned(((&reg121) ?
                      (wire114 == (8'ha8)) : $unsigned(reg119)))));
              reg122 <= ($signed(({(reg124 ?
                          reg106 : (8'hbe))} == (~&(&(8'ha1))))) ?
                  {reg108[(5'h10):(4'ha)]} : reg108[(4'hf):(4'hb)]);
            end
          else
            begin
              reg119 <= ($unsigned({$signed((reg119 && (8'ha4)))}) ?
                  (8'h9d) : (!{$signed($unsigned(reg126))}));
              reg120 <= $unsigned($unsigned($unsigned($signed($signed(wire112)))));
            end
        end
      reg128 <= wire111;
    end
  assign wire129 = (+((reg123[(3'h6):(2'h3)] - ((wire102 && reg128) ?
                       (wire101 ? wire105 : wire111) : {wire111,
                           reg125})) * ((^(|reg124)) ?
                       $unsigned((~^reg109)) : ((wire102 ? reg118 : wire102) ?
                           $signed(reg124) : (^reg123)))));
  assign wire130 = wire111[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg131 <= (8'hb0);
    end
  assign wire132 = reg109[(3'h4):(1'h1)];
  assign wire133 = $unsigned(({reg127, wire111[(1'h1):(1'h0)]} ?
                       (~(8'haa)) : (^reg128[(4'h9):(2'h3)])));
  always
    @(posedge clk) begin
      reg134 <= (~^reg116);
      if ((~^$unsigned(reg127[(4'ha):(4'h8)])))
        begin
          reg135 <= (wire130 ? {$unsigned(reg118)} : reg131[(4'hd):(4'h8)]);
        end
      else
        begin
          reg135 <= {$unsigned($signed($unsigned((^~reg131))))};
        end
      reg136 <= wire112;
      reg137 <= ($signed($unsigned(wire101)) ^ ($unsigned($unsigned((reg126 == wire103))) <<< reg118));
    end
  assign wire138 = {{$unsigned({{reg106}})},
                       (^~(reg137[(2'h2):(1'h0)] ?
                           {(reg120 ?
                                   (8'ha2) : reg136)} : reg121[(3'h6):(3'h4)]))};
  assign wire139 = reg123;
endmodule
