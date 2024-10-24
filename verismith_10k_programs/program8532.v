module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire96,
                 wire95,
                 wire92,
                 wire91,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire6,
                 wire5,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
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
                 reg94,
                 reg93,
                 reg90,
                 (1'h0)};
  assign wire5 = $signed(($signed($unsigned($unsigned(wire4))) && (($unsigned(wire2) >> (wire2 - wire3)) ?
                     ((wire2 ?
                         wire1 : wire0) ~^ (wire0 | wire3)) : (^~$signed(wire4)))));
  assign wire6 = $unsigned((~^wire3));
  module7 #() modinst86 (.clk(clk), .wire11(wire4), .wire10(wire3), .wire9(wire6), .wire8(wire2), .y(wire85));
  assign wire87 = $unsigned($unsigned(((((8'hb4) ? wire5 : wire5) ?
                          $unsigned(wire0) : wire4[(4'he):(3'h5)]) ?
                      wire3 : ({wire0} ?
                          (wire6 ? wire6 : (8'ha3)) : {(8'hb6), (8'ha4)}))));
  assign wire88 = {((8'h9e) + (wire2[(5'h12):(5'h10)] * $unsigned($unsigned(wire3)))),
                      {(!(&$signed(wire1)))}};
  assign wire89 = wire87[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg90 <= (wire1 <<< wire87[(1'h0):(1'h0)]);
    end
  assign wire91 = (|((wire4[(2'h3):(1'h0)] < ($unsigned(wire85) ?
                      (wire87 || wire89) : (wire2 << wire5))) ~^ ((-((8'hbb) == wire6)) + wire3)));
  assign wire92 = wire1[(4'hc):(4'ha)];
  always
    @(posedge clk) begin
      reg93 <= (wire6 ?
          ((~&{reg90, ((8'ha5) * wire6)}) ?
              ((~|(wire1 >>> wire4)) ?
                  wire2 : (+$signed((7'h41)))) : ($signed($unsigned(wire92)) * {wire87[(2'h3):(2'h2)]})) : wire89[(1'h1):(1'h1)]);
      reg94 <= {wire92[(3'h5):(2'h2)], wire1[(3'h4):(1'h0)]};
    end
  assign wire95 = $unsigned($unsigned({$unsigned((+reg94))}));
  assign wire96 = (((^~wire91) ? wire85 : reg94) ~^ (^~wire91[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ((-(^$unsigned($unsigned($signed(wire1))))))
        begin
          reg97 <= {(^~($signed(wire1) ?
                  reg90[(4'hf):(4'hb)] : (^~(^~wire85))))};
        end
      else
        begin
          reg97 <= {$unsigned((-{$signed(wire96)}))};
          reg98 <= reg97;
          reg99 <= (&$unsigned({$signed($unsigned(wire4)),
              ((wire0 <<< wire89) ? $unsigned(wire95) : (wire6 >>> wire6))}));
          reg100 <= wire89[(1'h0):(1'h0)];
          if ((+reg97))
            begin
              reg101 <= $unsigned($signed(reg93));
              reg102 <= $signed(reg97);
              reg103 <= $unsigned(wire4[(4'hb):(1'h0)]);
              reg104 <= {reg94};
              reg105 <= wire91[(1'h1):(1'h0)];
            end
          else
            begin
              reg101 <= $unsigned(reg101);
              reg102 <= (-({wire89[(1'h0):(1'h0)]} ?
                  $signed(reg103[(4'hf):(4'hd)]) : ($signed(reg101) ?
                      $unsigned(wire87[(1'h1):(1'h1)]) : ((^reg102) << wire96))));
              reg103 <= wire88;
            end
        end
      reg106 <= ((-({(reg99 ?
                  reg99 : (8'haa))} * $unsigned(wire92[(1'h0):(1'h0)]))) ?
          wire96[(2'h3):(1'h1)] : {((reg99 | reg99) ?
                  $signed($signed(reg97)) : $unsigned((+(8'ha0))))});
      if ((((^wire2) + (|((reg103 || wire85) + reg90))) ?
          reg106[(4'h9):(3'h5)] : $signed((8'hbe))))
        begin
          reg107 <= wire85[(3'h5):(2'h3)];
          reg108 <= $signed(($signed(((|reg102) ?
                  (^reg102) : reg104[(4'he):(4'h9)])) ?
              $signed(reg100[(4'ha):(3'h7)]) : $unsigned((~|reg106[(4'hb):(4'h9)]))));
          reg109 <= reg103[(4'h9):(4'h8)];
          reg110 <= ($signed(((((7'h41) * (8'haf)) ?
              wire88[(1'h1):(1'h0)] : (reg103 ?
                  wire0 : (8'hb1))) <<< {(8'ha6)})) <= ($unsigned($unsigned((reg109 ?
                  reg99 : wire88))) ?
              {$signed({reg93})} : ({(wire0 * reg94), {wire4, wire95}} ?
                  (reg109[(1'h0):(1'h0)] ?
                      reg102[(3'h5):(2'h3)] : {reg90,
                          reg90}) : ($signed(wire96) ?
                      (reg106 ? reg90 : reg93) : reg93))));
          reg111 <= $unsigned(reg106[(3'h6):(1'h1)]);
        end
      else
        begin
          reg107 <= (wire89 + $unsigned(reg102));
        end
      if ((reg103 ^ reg109))
        begin
          if ((^~wire1))
            begin
              reg112 <= (wire85 || (^~$unsigned($signed($signed(reg101)))));
              reg113 <= (wire87 ?
                  $signed(wire1) : $signed(($signed(wire91[(2'h2):(1'h1)]) & (reg100 ^~ $signed(wire4)))));
              reg114 <= ((^~(~|wire92)) ?
                  (~^($signed($unsigned(reg107)) - {$signed((8'ha9)),
                      (wire3 ? wire5 : wire91)})) : reg106);
            end
          else
            begin
              reg112 <= $signed({{wire0}, reg109[(4'h8):(3'h5)]});
              reg113 <= {(8'hb3)};
            end
          if (reg106[(4'hb):(4'hb)])
            begin
              reg115 <= ({reg106, reg106} >>> $signed((+reg111)));
              reg116 <= $unsigned(($unsigned($signed((reg114 != reg104))) << (-(8'hb2))));
              reg117 <= reg114[(4'hb):(1'h1)];
            end
          else
            begin
              reg115 <= ({$unsigned((wire88 != reg117[(4'hd):(1'h1)])),
                  (~&$unsigned({wire89}))} <= reg101);
            end
        end
      else
        begin
          reg112 <= $signed(reg101);
          reg113 <= $signed(reg114[(4'hc):(3'h6)]);
          reg114 <= $signed({reg111[(4'hc):(4'h8)]});
        end
    end
  assign wire118 = $signed({{$signed($unsigned(reg110))}});
  assign wire119 = $signed(($signed((&(~^wire96))) && $unsigned($signed({(8'hab),
                       (7'h41)}))));
  assign wire120 = ((~$signed(reg115[(4'ha):(1'h1)])) >> $signed((({(8'h9f),
                               (8'hab)} ?
                           $unsigned(reg113) : (+wire88)) ?
                       $unsigned($unsigned(reg105)) : (-wire95))));
endmodule

module module7
#(parameter param83 = {{(~^(~&((7'h40) ? (7'h43) : (8'hb5))))}, (~&(8'haa))}, 
parameter param84 = param83)
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire50;
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  assign y = {wire70,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire50,
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
                 reg56,
                 (1'h0)};
  assign wire12 = $signed(($unsigned(wire11) ?
                      (wire9[(3'h6):(1'h1)] ?
                          $signed($signed(wire11)) : ({wire11,
                              wire10} < {wire10,
                              wire9})) : $signed(($unsigned((7'h42)) && $unsigned(wire9)))));
  assign wire13 = $signed((-wire11[(5'h10):(2'h3)]));
  assign wire14 = wire12[(3'h6):(3'h4)];
  assign wire15 = (wire11[(4'he):(4'hb)] > wire9[(4'hb):(1'h1)]);
  module16 #() modinst51 (.wire20(wire13), .wire21(wire10), .clk(clk), .wire17(wire11), .y(wire50), .wire19(wire15), .wire18(wire14));
  assign wire52 = $unsigned($signed(wire14));
  assign wire53 = (^~(-((^~((8'h9d) | (8'hb0))) <<< wire50)));
  assign wire54 = (~^(|wire13));
  assign wire55 = (&{$signed(((wire10 * wire14) ?
                          $signed(wire12) : wire15[(3'h7):(2'h2)])),
                      wire54[(4'hf):(4'hc)]});
  always
    @(posedge clk) begin
      reg56 <= (-wire54);
    end
  module57 #() modinst71 (.wire61(wire13), .wire58(wire52), .wire59(wire11), .y(wire70), .wire60(wire50), .clk(clk));
  always
    @(posedge clk) begin
      reg72 <= (7'h43);
      reg73 <= $unsigned($signed(($signed($signed(wire54)) ?
          $signed((~^reg56)) : wire11[(4'he):(4'hc)])));
      if ((!(($signed($unsigned((8'ha6))) ?
          (wire11[(4'h9):(1'h0)] ^ (wire10 >= wire12)) : $unsigned({reg73})) + $unsigned(wire53))))
        begin
          reg74 <= {reg56, $signed({$signed(wire8)})};
        end
      else
        begin
          reg74 <= ((8'hb4) >= $signed((-$unsigned(wire9))));
        end
      reg75 <= $unsigned(reg56[(2'h2):(1'h0)]);
      reg76 <= $unsigned($signed($unsigned(((wire54 ? reg73 : wire9) ?
          {wire50} : $signed(wire50)))));
    end
  always
    @(posedge clk) begin
      reg77 <= ({$signed(((reg76 ~^ wire9) ?
              (reg72 ? (8'hbc) : wire9) : wire11[(1'h1):(1'h0)]))} >>> reg73);
      reg78 <= (wire50 ?
          ((~((^~reg73) ? $unsigned(wire9) : ((8'hb7) && (8'hbf)))) ?
              reg74 : (|wire55)) : ($signed(({wire12,
              (8'had)} ^ reg76)) <<< (wire53 ?
              $unsigned(wire54[(4'hd):(3'h7)]) : {reg74})));
      if (wire11)
        begin
          reg79 <= ((7'h40) > (wire9 ?
              (^(wire10 == (&wire13))) : $signed((&(reg76 ?
                  wire11 : wire70)))));
          reg80 <= $signed(wire14[(3'h6):(2'h3)]);
          reg81 <= ({((!$unsigned(wire14)) ?
                      (!$signed(wire10)) : $signed(wire15[(3'h5):(2'h2)])),
                  $signed(wire50)} ?
              $signed(({(8'hbb), ((7'h42) == (8'ha9))} ?
                  $signed({wire12,
                      (8'ha5)}) : wire54[(4'hd):(3'h7)])) : $signed(($unsigned({reg74}) << reg80)));
          reg82 <= (((^~wire14[(3'h5):(3'h5)]) ?
                  $unsigned(($signed(reg78) << $signed(wire54))) : (^(reg76[(1'h0):(1'h0)] ?
                      $signed(wire52) : wire8))) ?
              $unsigned((wire53[(4'ha):(3'h5)] ?
                  $unsigned(reg73) : $signed($signed(reg73)))) : $unsigned(wire70[(1'h1):(1'h0)]));
        end
      else
        begin
          reg79 <= wire14[(2'h2):(1'h1)];
          reg80 <= (^~wire50);
        end
    end
endmodule

module module57  (y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire61;
  input wire [(3'h5):(1'h0)] wire60;
  input wire signed [(2'h3):(1'h0)] wire59;
  input wire [(2'h2):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire62;
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 (1'h0)};
  assign wire62 = (^{$unsigned(({wire58, (8'ha0)} == (&wire60)))});
  assign wire63 = $signed($unsigned(wire60[(2'h2):(1'h1)]));
  assign wire64 = $signed(($unsigned($signed((|wire58))) >>> (((&wire58) ?
                      (wire59 ?
                          (8'ha8) : wire61) : $signed(wire58)) >> ((wire63 ?
                      wire59 : wire63) << wire58[(1'h1):(1'h1)]))));
  assign wire65 = $unsigned($signed((($unsigned(wire61) ?
                      (wire61 ?
                          wire62 : wire59) : $signed(wire61)) <<< ((wire60 ?
                          wire64 : wire63) ?
                      (~&(8'ha2)) : $signed(wire59)))));
  assign wire66 = wire61[(1'h0):(1'h0)];
  assign wire67 = (wire66[(1'h1):(1'h1)] ?
                      ($unsigned(wire64[(4'h9):(3'h4)]) + $signed($signed(wire58))) : ({wire61[(4'hb):(1'h1)]} | (8'ha1)));
  assign wire68 = ($signed({wire59}) >= wire60);
  assign wire69 = (~^(~^wire67));
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire21;
  input wire [(3'h6):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire22 = (8'hae);
  assign wire23 = wire20[(2'h2):(1'h0)];
  assign wire24 = ((wire20[(3'h6):(3'h5)] != wire17) || wire23);
  assign wire25 = $signed({wire22, wire24[(3'h6):(3'h5)]});
  assign wire26 = wire17[(2'h3):(1'h0)];
  assign wire27 = $unsigned((+(8'hb8)));
  always
    @(posedge clk) begin
      reg28 <= (8'hbb);
      reg29 <= (!(8'hb2));
      if (wire27[(4'hb):(3'h4)])
        begin
          reg30 <= wire21[(3'h6):(3'h4)];
          if ($signed(wire24))
            begin
              reg31 <= {wire21};
              reg32 <= $signed((^reg28[(1'h0):(1'h0)]));
              reg33 <= $unsigned(reg29[(1'h1):(1'h0)]);
              reg34 <= $signed(($signed($unsigned($unsigned(wire22))) ?
                  $unsigned((|(&wire24))) : reg32[(3'h5):(3'h5)]));
              reg35 <= ($unsigned(wire21[(4'hb):(2'h3)]) <<< (!$signed((^~(reg30 == reg34)))));
            end
          else
            begin
              reg31 <= {(!$unsigned({(wire20 ? reg31 : reg29), (8'hb8)}))};
              reg32 <= reg30[(2'h3):(1'h0)];
            end
          reg36 <= (reg35[(1'h1):(1'h0)] || ((($signed(wire22) >>> (wire18 ?
                  (8'h9f) : reg31)) || (^~(8'ha9))) ?
              wire22[(3'h4):(1'h1)] : ($signed(wire25[(1'h0):(1'h0)]) << {reg29})));
        end
      else
        begin
          reg30 <= ((+reg31) ~^ wire27);
        end
    end
  assign wire37 = {wire17[(2'h3):(2'h2)], wire22[(3'h4):(3'h4)]};
  assign wire38 = wire23[(4'hc):(2'h2)];
  assign wire39 = wire18;
  assign wire40 = (wire24[(5'h10):(3'h5)] < (~$unsigned(reg33)));
  assign wire41 = wire20;
  assign wire42 = $unsigned($signed((~wire25)));
  assign wire43 = wire24;
  assign wire44 = wire37;
  assign wire45 = (wire19[(3'h5):(3'h4)] ?
                      reg36[(4'he):(4'h9)] : (~|($unsigned(reg31[(1'h0):(1'h0)]) >> wire39[(5'h13):(4'he)])));
  assign wire46 = ($unsigned({$unsigned((reg36 ? reg32 : reg32)),
                          $signed($unsigned(wire25))}) ?
                      (($unsigned($signed(reg35)) ?
                          ($signed(wire43) ~^ wire18) : (+wire39)) & $unsigned((~|reg34))) : (($unsigned($signed((8'hba))) >= wire21) != {$unsigned((reg34 ?
                              wire22 : wire45))}));
  assign wire47 = (~&($unsigned($signed(wire38[(4'h8):(1'h1)])) ?
                      (((reg32 ? wire27 : wire21) ?
                              wire42[(1'h0):(1'h0)] : (wire17 ?
                                  reg34 : (8'hb5))) ?
                          (reg34 << ((8'hbe) > reg28)) : $unsigned(wire27[(4'hb):(1'h1)])) : $signed($signed((wire38 + reg31)))));
  assign wire48 = {{wire38[(4'h8):(3'h4)]}};
  assign wire49 = (&(((-(^~wire21)) ^ $unsigned((&wire21))) ^~ $unsigned((wire37 & (reg36 || wire25)))));
endmodule
