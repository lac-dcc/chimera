module top
#(parameter param95 = (-{((((8'hbc) ? (8'haa) : (8'hbe)) >>> (~|(8'hb7))) ? (-((8'ha2) <<< (7'h44))) : (-((8'ha3) ? (8'hb5) : (8'ha5))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire87,
                 wire75,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire11,
                 wire4,
                 reg89,
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
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (wire1 ?
                     ($unsigned(((~^wire2) || (8'hbb))) ~^ (wire1 ?
                         ((+wire2) * $signed(wire3)) : (wire0 ?
                             $unsigned(wire0) : (wire0 != wire3)))) : wire1);
  always
    @(posedge clk) begin
      if (({($unsigned((wire4 > (8'haa))) > ({(7'h43)} ?
              (wire0 ?
                  wire3 : wire1) : $signed((8'hac))))} <<< $unsigned((((|(8'hb4)) ?
              (8'hb5) : $unsigned((8'hb1))) ?
          {((8'ha6) || (7'h43))} : $signed((~wire3))))))
        begin
          if ($unsigned({wire2, {($signed(wire0) * ((8'hb1) < wire0))}}))
            begin
              reg5 <= $unsigned(wire3);
              reg6 <= $signed($signed((-$unsigned((~wire1)))));
            end
          else
            begin
              reg5 <= ($signed(((+reg6) ?
                  wire4[(1'h0):(1'h0)] : wire3[(3'h6):(2'h2)])) <<< {{wire0},
                  wire0});
              reg6 <= (reg6[(4'hc):(4'h9)] ?
                  ((&$signed($unsigned(reg5))) ?
                      (($signed((8'hb5)) & wire2) && $signed($signed(reg5))) : ({(&reg6)} ?
                          $signed(reg6) : {$signed(reg6),
                              $unsigned(wire4)})) : $signed(reg6[(4'hb):(3'h6)]));
              reg7 <= (^~{$unsigned($unsigned((wire3 >> wire1)))});
              reg8 <= reg5[(2'h3):(2'h3)];
            end
        end
      else
        begin
          reg5 <= reg6;
        end
      reg9 <= ($signed($unsigned(reg8[(3'h5):(2'h3)])) <= wire1[(4'h8):(2'h3)]);
      reg10 <= $signed(wire3[(3'h7):(3'h5)]);
    end
  assign wire11 = (~^wire2[(2'h3):(2'h3)]);
  module12 #() modinst64 (.wire15(reg10), .wire16(wire0), .wire14(wire11), .clk(clk), .wire13(reg8), .y(wire63));
  assign wire65 = (~^(($signed(wire0[(4'hf):(4'hf)]) ?
                          {wire11[(3'h4):(2'h3)]} : $unsigned($unsigned(wire2))) ?
                      reg9 : wire2));
  assign wire66 = $signed(($unsigned((~$unsigned(reg5))) ?
                      ((|$signed(wire2)) >> (|(!(8'hbf)))) : reg10[(2'h3):(1'h0)]));
  assign wire67 = wire1[(1'h0):(1'h0)];
  assign wire68 = wire63;
  always
    @(posedge clk) begin
      if ({({$signed((reg9 ? wire2 : wire68))} ?
              $unsigned({(wire67 <= wire68)}) : $signed(({wire2} && (|reg8)))),
          wire67[(1'h1):(1'h0)]})
        begin
          reg69 <= $signed(reg5);
          reg70 <= wire68;
        end
      else
        begin
          reg69 <= ($unsigned(wire2) ?
              ($signed((~^$signed(wire66))) ?
                  $signed({{wire2},
                      $unsigned((8'hb2))}) : (~|((~|wire2) > (~reg6)))) : $unsigned($signed($unsigned((wire1 > reg5)))));
          reg70 <= $signed(wire67);
        end
      reg71 <= ({reg9[(3'h4):(3'h4)]} == ((wire66[(2'h2):(2'h2)] ?
          reg9 : $signed($signed((8'hb8)))) & ((8'ha2) ^~ ((reg10 ?
              reg6 : (8'hb4)) ?
          reg9[(1'h0):(1'h0)] : (wire3 | reg7)))));
      reg72 <= (reg71[(4'h8):(1'h1)] >= $unsigned($unsigned(wire0[(5'h15):(4'h9)])));
      reg73 <= wire2[(1'h0):(1'h0)];
      reg74 <= (($signed($signed({(8'hb4), (8'hbf)})) ?
          (!(reg71 ?
              (wire68 ?
                  reg70 : wire67) : (reg10 == wire66))) : ($unsigned((wire11 <<< (8'hb5))) ?
              reg72[(4'hd):(1'h0)] : ((reg72 ?
                  wire68 : reg7) >> wire11))) && {wire63});
    end
  assign wire75 = reg69;
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg76 <= (wire1[(2'h3):(1'h1)] ? $signed(wire67) : wire66);
        end
      else
        begin
          reg76 <= wire66;
          reg77 <= ($signed((+(reg10[(4'hc):(4'ha)] || (^reg10)))) <= (~{$unsigned(reg70[(5'h10):(4'hd)])}));
        end
      reg78 <= reg74[(2'h2):(1'h0)];
      if ((-reg9))
        begin
          if (wire3)
            begin
              reg79 <= {{$signed(($signed((8'hab)) ?
                          $unsigned((8'hbb)) : $unsigned(wire63))),
                      $unsigned(reg69)},
                  wire3[(4'h9):(2'h3)]};
              reg80 <= {wire65, $signed(reg10)};
              reg81 <= (reg69 ? $unsigned((^reg10)) : $signed((|(~^(^~reg7)))));
            end
          else
            begin
              reg79 <= $signed((~^reg73));
              reg80 <= wire1;
              reg81 <= reg7[(2'h3):(2'h3)];
              reg82 <= $signed(reg10[(2'h3):(2'h3)]);
            end
          reg83 <= (8'ha3);
          reg84 <= $signed(($signed((reg5[(4'hc):(3'h7)] + reg76[(1'h1):(1'h1)])) ?
              $unsigned((((7'h40) == reg83) ?
                  $unsigned((8'hab)) : (reg77 ?
                      reg77 : reg73))) : (((wire1 != reg7) ~^ (wire4 * (8'haa))) ?
                  (8'h9c) : (-reg10))));
          reg85 <= ($signed(wire65[(2'h3):(2'h2)]) ?
              $unsigned($signed(($unsigned(reg9) >= reg7[(1'h0):(1'h0)]))) : $signed($unsigned($signed((^reg73)))));
          reg86 <= ($unsigned((reg74 > {$signed(wire4),
              $unsigned(reg78)})) * $unsigned((wire66 ?
              ($signed((8'ha2)) ~^ $signed(wire2)) : ($signed(reg73) || (reg74 ^~ wire3)))));
        end
      else
        begin
          reg79 <= wire66[(3'h4):(3'h4)];
        end
    end
  assign wire87 = $signed(reg82);
  assign wire88 = $unsigned($signed(reg8[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg89 <= reg8[(3'h4):(3'h4)];
    end
  assign wire90 = (+(reg70 ?
                      $unsigned($unsigned($signed((8'hb9)))) : $unsigned((^(reg84 ~^ wire1)))));
  assign wire91 = $unsigned(wire68[(2'h3):(1'h1)]);
  assign wire92 = reg7[(2'h3):(1'h0)];
  assign wire93 = wire63;
  assign wire94 = (reg79 == ((reg76[(2'h3):(2'h2)] <= (^(~|reg84))) > (~&($signed(reg79) ?
                      reg69 : $unsigned(wire1)))));
endmodule

module module12
#(parameter param62 = ({((8'hb7) < (((8'haa) ? (8'hb9) : (8'ha8)) ? (~|(8'hb8)) : (-(8'ha4)))), (-((^(8'hbe)) ? {(8'ha1), (7'h41)} : ((8'hb9) ? (8'hbe) : (8'haf))))} <= ((~(((7'h42) <= (8'hac)) & (-(8'ha3)))) ? (&(((8'hb9) <<< (8'hb5)) ? {(7'h44)} : {(8'hbb)})) : (7'h40))))
(y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire42;
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire42,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire17 = (wire13[(4'h8):(2'h3)] ?
                      (~^(&wire14)) : wire15[(2'h3):(2'h2)]);
  assign wire18 = wire16[(1'h0):(1'h0)];
  assign wire19 = {{((8'ha2) ? (wire13 > $unsigned(wire13)) : wire17)}};
  assign wire20 = wire19[(1'h0):(1'h0)];
  assign wire21 = $signed((wire13[(4'h9):(3'h6)] ^ (&$signed(wire18))));
  assign wire22 = ({($signed(wire17[(1'h0):(1'h0)]) < wire13[(5'h10):(1'h1)])} ?
                      $unsigned($signed((!$unsigned(wire16)))) : wire13[(3'h5):(3'h4)]);
  module23 #() modinst43 (wire42, clk, wire22, wire20, wire19, wire13, wire16);
  assign wire44 = wire22[(4'he):(3'h7)];
  assign wire45 = wire13;
  assign wire46 = ($unsigned((wire45[(3'h7):(3'h7)] + $signed((+wire45)))) && $signed($unsigned($signed({wire17}))));
  assign wire47 = ({($unsigned(wire45) ?
                          ((wire15 ?
                              wire17 : wire45) | (wire22 || wire45)) : wire46)} ^~ (7'h40));
  assign wire48 = wire17[(1'h0):(1'h0)];
  assign wire49 = (wire15[(4'hd):(2'h2)] ?
                      {((|(wire44 ? wire20 : wire22)) && {wire13,
                              (wire47 > wire16)})} : {({wire22[(3'h6):(1'h1)]} ?
                              ((wire22 ?
                                  (8'hbd) : wire22) <<< (^~(8'hbf))) : $signed(((8'hae) ~^ wire22))),
                          wire18[(3'h5):(3'h5)]});
  assign wire50 = $unsigned((^$signed(($signed(wire47) && wire42[(1'h1):(1'h1)]))));
  assign wire51 = (~(~|$signed($signed((wire48 + (8'hb8))))));
  assign wire52 = ($signed($unsigned(((wire45 << wire18) ?
                          $signed((7'h44)) : wire45))) ?
                      (wire14 ?
                          ((wire20 != (^~(7'h43))) ?
                              (wire45[(1'h0):(1'h0)] ?
                                  (wire42 + wire16) : (wire13 > wire17)) : wire50[(3'h6):(3'h6)]) : $unsigned((wire20[(3'h6):(3'h5)] <<< $unsigned(wire16)))) : ((!wire13[(3'h7):(1'h1)]) >> wire45[(1'h0):(1'h0)]));
  assign wire53 = {wire14};
  assign wire54 = (~^$signed($signed(wire15[(4'he):(2'h3)])));
  always
    @(posedge clk) begin
      reg55 <= $unsigned((~|(~|$signed(wire45))));
      reg56 <= ($unsigned((~|(((8'ha4) ^ wire51) ?
          (~^wire16) : wire22[(2'h3):(2'h3)]))) || ((($signed((7'h40)) <<< wire13[(4'hb):(2'h3)]) >>> $signed((wire51 ?
              wire17 : wire48))) ?
          $signed(wire20[(1'h0):(1'h0)]) : wire54[(4'hb):(4'hb)]));
      reg57 <= $unsigned(wire17[(4'hb):(2'h3)]);
      reg58 <= (^~$signed($signed($unsigned(((8'hbc) ? (8'hb6) : reg57)))));
      reg59 <= $unsigned($signed((&((wire19 ? reg56 : wire13) >> wire15))));
    end
  assign wire60 = wire44[(3'h5):(1'h1)];
  assign wire61 = $unsigned(wire47);
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire28;
  input wire [(3'h6):(1'h0)] wire27;
  input wire [(5'h14):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg34,
                 (1'h0)};
  assign wire29 = (+wire26[(5'h12):(4'ha)]);
  assign wire30 = (8'hb1);
  assign wire31 = $signed($unsigned((($signed(wire24) ?
                          wire24[(4'he):(4'hd)] : $signed(wire30)) ?
                      ($unsigned((8'hb0)) ?
                          {wire26} : (wire26 <<< wire28)) : $signed($unsigned(wire26)))));
  assign wire32 = ($unsigned({(8'ha3), $signed(wire29)}) << ({((wire31 ?
                                  wire25 : wire31) ?
                              wire26[(3'h6):(2'h2)] : ((7'h41) ?
                                  (8'ha1) : wire25))} ?
                      ($signed(wire29[(4'hb):(3'h4)]) ?
                          $unsigned((^wire26)) : $unsigned((8'ha6))) : ($signed($signed(wire28)) && (+(-wire27)))));
  assign wire33 = ((^($signed({wire32, wire25}) || wire27[(3'h5):(1'h1)])) ?
                      (8'hb4) : $signed(wire25));
  always
    @(posedge clk) begin
      reg34 <= (!wire29[(5'h10):(4'hb)]);
    end
  assign wire35 = (7'h42);
  assign wire36 = wire26;
  assign wire37 = (wire25[(4'hb):(3'h5)] ?
                      {(($unsigned(wire27) ?
                                  (wire33 - wire35) : wire24[(3'h4):(3'h4)]) ?
                              (wire24[(1'h1):(1'h1)] ?
                                  (wire29 + wire29) : $unsigned(wire33)) : $unsigned(((8'hb7) ?
                                  wire24 : wire27)))} : {$signed(reg34[(1'h1):(1'h1)])});
  assign wire38 = $unsigned((+(~|(~(~wire28)))));
  assign wire39 = (~(wire27 ?
                      $unsigned((&((8'hb5) ?
                          wire31 : wire32))) : (+$unsigned($unsigned(wire30)))));
  assign wire40 = (8'hba);
  assign wire41 = (|(wire38 ?
                      ($signed((wire37 ? (8'ha2) : wire36)) || (reg34 ?
                          $signed((8'ha6)) : ((8'haa) & wire33))) : {({reg34,
                                  (8'hba)} ?
                              wire31 : (^~(8'h9e))),
                          $unsigned($unsigned(wire24))}));
endmodule
