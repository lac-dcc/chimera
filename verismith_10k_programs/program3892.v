module top
#(parameter param135 = (((~^(8'hb8)) ~^ (^(((8'ha1) <= (8'hb0)) ? ((8'haf) >> (8'ha4)) : ((8'hae) - (8'hb3))))) ? (-(~^(|{(8'hbe)}))) : ((((~&(8'h9c)) * (~^(8'hac))) ? (|((8'haa) ? (8'hbe) : (8'hb1))) : (^(!(8'hbe)))) ? {(((8'ha2) && (8'ha0)) * ((8'ha7) ? (8'hbb) : (8'h9c)))} : {(~&{(8'h9e), (8'hb6)})})), 
parameter param136 = param135)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire132;
  wire [(4'hd):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire77;
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  assign y = {wire134,
                 wire132,
                 wire94,
                 wire88,
                 wire87,
                 wire86,
                 wire51,
                 wire53,
                 wire54,
                 wire55,
                 wire59,
                 wire77,
                 reg56,
                 reg57,
                 reg58,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 (1'h0)};
  module4 #() modinst52 (.wire7(wire0), .wire6(wire1), .wire5(wire3), .clk(clk), .wire8(wire2), .y(wire51));
  assign wire53 = $signed($unsigned(wire2));
  assign wire54 = wire2;
  assign wire55 = wire51;
  always
    @(posedge clk) begin
      reg56 <= $signed(wire51);
      reg57 <= wire53[(3'h4):(2'h3)];
      reg58 <= (((((wire51 && wire54) ? (8'hb6) : (wire54 ? wire1 : wire51)) ?
              (&wire53[(3'h6):(3'h6)]) : ((8'haf) ~^ (wire3 << wire0))) >>> wire53[(3'h5):(3'h5)]) ?
          ((($signed(reg57) << reg56) ?
              wire1[(5'h14):(4'hd)] : $signed((^~wire55))) == wire0[(3'h7):(3'h7)]) : $unsigned((!(~&wire3[(5'h10):(3'h6)]))));
    end
  assign wire59 = ($unsigned($unsigned((~((8'hba) ? wire51 : wire2)))) ?
                      {(~|$unsigned(reg58[(1'h1):(1'h0)]))} : $signed(((&$signed(wire55)) ?
                          reg56[(3'h6):(3'h5)] : ($unsigned(wire51) * (wire54 * wire51)))));
  module60 #() modinst78 (.wire63(wire54), .clk(clk), .wire62(wire3), .wire65(wire59), .wire61(wire1), .y(wire77), .wire64(wire2));
  always
    @(posedge clk) begin
      reg79 <= (&$unsigned(wire1));
    end
  always
    @(posedge clk) begin
      reg80 <= ({(~|wire55[(1'h1):(1'h1)])} >>> ($signed(((~|reg56) << $unsigned(wire53))) >= $unsigned(reg57)));
      if ($unsigned((wire2[(5'h10):(4'he)] ?
          $unsigned(((reg57 ? wire77 : wire0) ?
              {reg56, wire51} : (8'ha2))) : ((8'ha6) - wire77[(4'ha):(3'h4)]))))
        begin
          reg81 <= $unsigned((~|wire55[(4'hf):(3'h6)]));
        end
      else
        begin
          reg81 <= {$signed({(wire54[(2'h2):(2'h2)] ? (|reg80) : wire53),
                  {(wire54 | wire55)}}),
              (wire77 ?
                  (((wire2 == wire77) ? $unsigned((8'h9e)) : wire3) ?
                      $signed($unsigned(reg57)) : (reg81 ?
                          (wire51 + (8'hb4)) : $unsigned(wire59))) : reg58)};
          reg82 <= $unsigned({($unsigned($signed(wire54)) ?
                  reg80[(3'h6):(1'h0)] : ($signed(reg81) ?
                      $unsigned(wire54) : reg56)),
              (wire2 == ((~^wire1) ? (^wire77) : wire1))});
        end
      reg83 <= reg57[(2'h2):(1'h1)];
      reg84 <= wire53;
      reg85 <= (((($signed(reg80) ? {wire59} : {wire2}) ?
              reg58[(3'h7):(1'h1)] : $unsigned((reg82 >= reg56))) ~^ (~$signed((wire1 ^~ (8'ha3))))) ?
          $unsigned((reg58 > (wire1[(5'h10):(3'h4)] ?
              (~&reg84) : {reg83}))) : (8'hb8));
    end
  assign wire86 = wire1[(4'h9):(3'h7)];
  assign wire87 = (reg81 ?
                      {(((-reg81) ? wire0 : ((7'h41) || (8'hb0))) ?
                              {wire55} : (+$unsigned(wire0)))} : (&(($signed(wire55) & (^wire1)) ?
                          $unsigned(reg81[(2'h2):(1'h1)]) : wire55)));
  assign wire88 = wire59;
  always
    @(posedge clk) begin
      if ($unsigned(reg80))
        begin
          reg89 <= $unsigned(wire55[(3'h5):(2'h3)]);
          reg90 <= (^$unsigned((wire77 > wire87)));
          reg91 <= (~|($unsigned(reg80) ? (~|reg84) : reg82));
          if ((!($unsigned((+$signed(reg56))) ?
              (!$unsigned($signed(wire3))) : $unsigned(wire3))))
            begin
              reg92 <= {(reg80 << reg91)};
            end
          else
            begin
              reg92 <= wire54[(1'h1):(1'h1)];
            end
          reg93 <= (~|$unsigned((wire88 ^~ (reg57[(2'h3):(2'h2)] ?
              $unsigned(wire2) : (reg92 ? reg91 : (8'hb7))))));
        end
      else
        begin
          reg89 <= reg90;
        end
    end
  assign wire94 = wire54;
  module95 #() modinst133 (.wire97(reg90), .wire100(reg91), .wire98(reg57), .clk(clk), .y(wire132), .wire96(reg93), .wire99(reg89));
  assign wire134 = $unsigned($unsigned(((wire55[(5'h10):(4'hc)] ?
                           (~&wire87) : (reg85 > wire87)) ?
                       ((wire77 || (8'hb7)) ?
                           {reg57,
                               reg81} : (reg89 ^ reg85)) : wire94[(4'h8):(3'h6)])));
endmodule

module module95  (y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire100;
  input wire signed [(5'h15):(1'h0)] wire99;
  input wire [(4'h8):(1'h0)] wire98;
  input wire signed [(5'h11):(1'h0)] wire97;
  input wire signed [(4'hf):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire130;
  wire [(4'hd):(1'h0)] wire129;
  wire signed [(4'hf):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire126;
  wire signed [(5'h11):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire101;
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire101,
                 (1'h0)};
  assign wire101 = $unsigned(wire96[(4'h8):(3'h5)]);
  module102 #() modinst125 (wire124, clk, wire97, wire101, wire98, wire99);
  assign wire126 = ($unsigned(({(wire96 <= wire99), $signed((8'ha3))} ?
                           (~wire124[(3'h7):(1'h0)]) : wire98[(4'h8):(3'h5)])) ?
                       {(wire96[(2'h2):(1'h0)] || (~&wire101))} : (&(((wire96 || wire124) ?
                               (wire100 ?
                                   wire101 : (7'h40)) : (wire98 == wire99)) ?
                           wire100[(3'h5):(3'h4)] : $signed((-wire101)))));
  assign wire127 = (~^wire96);
  assign wire128 = ((^~(^$signed({wire100}))) + $signed($signed((&wire97[(4'hd):(1'h1)]))));
  assign wire129 = wire97;
  assign wire130 = (({wire99[(3'h4):(3'h4)], $signed((wire97 >>> (8'hbd)))} ?
                           wire100 : ((wire100[(3'h4):(1'h0)] != {wire98,
                                   wire129}) ?
                               ((~^(8'haf)) ?
                                   wire100[(4'hb):(1'h0)] : (wire127 > wire128)) : $unsigned((~|(8'hb2))))) ?
                       (|wire124[(4'h9):(4'h8)]) : (+$signed(wire97)));
  assign wire131 = wire127;
endmodule

module module60
#(parameter param76 = {((((|(8'ha1)) ? ((8'ha3) << (8'ha2)) : (8'hbf)) | ({(8'hbc), (8'hac)} ? {(8'hb2)} : (^(8'h9c)))) ? (7'h44) : (+(((8'hbd) ? (8'hb6) : (7'h41)) * {(8'hb2)}))), ((-(^~{(8'ha8)})) ^ {(^(|(8'ha4))), ({(8'hb6)} << ((8'haf) ? (7'h41) : (8'hb3)))})})
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire65;
  input wire signed [(4'hf):(1'h0)] wire64;
  input wire [(5'h13):(1'h0)] wire63;
  input wire signed [(2'h2):(1'h0)] wire62;
  input wire [(4'hc):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 (1'h0)};
  assign wire66 = (+$signed((&$unsigned((~&(8'hae))))));
  assign wire67 = wire65[(3'h6):(2'h2)];
  assign wire68 = $unsigned($signed(($unsigned((wire63 ?
                      wire65 : (8'had))) | wire61)));
  assign wire69 = (~|$signed(wire65[(4'hc):(4'ha)]));
  assign wire70 = ($unsigned({($unsigned((8'ha1)) ?
                              $signed(wire69) : $unsigned(wire61)),
                          (^~(8'hb0))}) ?
                      (^~wire67[(3'h7):(3'h4)]) : {$signed((~&wire61))});
  assign wire71 = (+(wire70[(4'ha):(3'h6)] <<< ($unsigned((8'hb2)) ?
                      $unsigned((-wire70)) : wire64[(4'h8):(1'h1)])));
  assign wire72 = ($unsigned($unsigned(((wire65 ? wire63 : wire62) ?
                      (wire61 ?
                          wire67 : wire63) : $unsigned(wire68)))) <<< {wire65});
  assign wire73 = {wire61[(3'h4):(1'h1)], $unsigned(wire63)};
  assign wire74 = wire67[(5'h10):(4'he)];
  assign wire75 = wire67[(4'h8):(2'h3)];
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire5;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire49;
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  assign y = {wire9,
                 wire10,
                 wire11,
                 wire13,
                 wire14,
                 wire15,
                 wire49,
                 reg12,
                 (1'h0)};
  assign wire9 = (($signed(((wire8 ? wire6 : wire7) && $signed(wire7))) ?
                         (wire6[(2'h2):(1'h1)] ^ wire6) : (~&{$signed(wire8),
                             {wire6, wire8}})) ?
                     ({wire6[(1'h1):(1'h0)],
                             $unsigned((wire7 ? (8'hb2) : wire7))} ?
                         wire6 : (^wire7)) : ($unsigned((~|$signed(wire6))) ?
                         (8'ha2) : wire6));
  assign wire10 = $signed((wire7 ?
                      $unsigned($signed((wire7 ?
                          (8'h9e) : wire7))) : $signed(wire5)));
  assign wire11 = $signed(wire5[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg12 <= (|(!$signed((((8'h9c) ? (8'haf) : wire5) <= {wire10}))));
    end
  assign wire13 = {(~(wire11 ?
                          (~wire8) : ((+reg12) ?
                              wire6[(2'h3):(1'h1)] : wire6[(1'h0):(1'h0)]))),
                      (-wire6[(2'h3):(1'h0)])};
  assign wire14 = (wire6[(1'h0):(1'h0)] - (~wire6[(2'h2):(1'h1)]));
  assign wire15 = (-($signed({{reg12}}) ?
                      $signed((^(wire6 != wire9))) : (&wire7)));
  module16 #() modinst50 (wire49, clk, wire7, wire15, wire10, wire8, wire6);
endmodule

module module16
#(parameter param48 = {(~|(8'ha2)), (^~((((8'ha4) * (8'h9d)) && (^(7'h44))) ~^ (-(~&(8'hb4)))))})
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= (~|(wire20[(3'h5):(1'h0)] ?
          $unsigned($unsigned((~&wire21))) : (~^(wire18 ?
              $signed(wire19) : $signed((7'h40))))));
      reg23 <= ((~&($signed($signed((8'ha6))) != wire19)) ?
          $unsigned($unsigned(wire21[(1'h1):(1'h1)])) : $unsigned((~&$signed(wire21[(3'h5):(1'h1)]))));
      if ((&wire18[(1'h1):(1'h1)]))
        begin
          reg24 <= $signed(wire18);
        end
      else
        begin
          if ((+$signed(($signed((&wire21)) * (8'hac)))))
            begin
              reg24 <= $signed((-(-(~wire21[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg24 <= ((({wire19[(4'h9):(2'h2)]} ?
                          wire20 : $signed(reg24[(1'h0):(1'h0)])) ?
                      ((wire19 - $signed(reg23)) ?
                          (reg22[(4'ha):(3'h6)] == wire19[(4'he):(3'h6)]) : $signed($unsigned((8'hb4)))) : (&reg24[(2'h2):(2'h2)])) ?
                  (wire19 ?
                      $unsigned(reg22[(1'h1):(1'h1)]) : (wire20 | $unsigned((~^reg24)))) : {wire19[(4'hb):(1'h0)],
                      $unsigned(($unsigned(wire20) ?
                          (wire17 ? wire18 : wire17) : {reg22}))});
              reg25 <= (8'hb0);
              reg26 <= reg22;
            end
          reg27 <= $signed(((8'ha0) < (((^~reg23) ?
              reg24 : {reg24, reg26}) ~^ {(~&wire17)})));
          reg28 <= {({$unsigned({(8'h9f), wire17}),
                      ($unsigned(wire18) << (reg26 ? wire18 : wire19))} ?
                  $signed(reg27) : (wire18[(5'h11):(3'h6)] > ((wire20 ?
                          reg25 : wire17) ?
                      (~^reg22) : (reg27 ? reg25 : reg27)))),
              ({wire18[(4'hb):(2'h2)]} <<< ($signed({reg23}) ^ (~|(reg24 & reg22))))};
          reg29 <= $signed(reg22[(4'hc):(3'h7)]);
        end
      reg30 <= (+reg26);
      if (($unsigned((($signed(reg30) + (reg24 ? (8'ha1) : reg28)) ?
          wire18 : reg23[(3'h5):(1'h1)])) ^~ (~&(!wire18))))
        begin
          reg31 <= reg28;
        end
      else
        begin
          if ({$signed(reg28), $signed((&$signed(reg30[(3'h4):(3'h4)])))})
            begin
              reg31 <= reg23[(4'h8):(2'h3)];
            end
          else
            begin
              reg31 <= reg22[(3'h6):(1'h0)];
              reg32 <= $unsigned($signed(((^~(+reg31)) ~^ $unsigned({reg31}))));
            end
          if (((reg31 ? wire17[(4'hb):(1'h0)] : (^wire21)) ?
              {$signed(wire20[(3'h4):(1'h0)])} : reg31))
            begin
              reg33 <= wire18;
              reg34 <= ((({(reg25 ? (8'ha9) : reg23)} * {{reg33, wire20},
                      (~&reg25)}) ^ $signed((~|(~|wire19)))) ?
                  wire21 : $unsigned($unsigned(((reg23 ? reg26 : reg23) ?
                      (^wire18) : $unsigned((8'ha8))))));
              reg35 <= (^(!(~^(^(^reg24)))));
            end
          else
            begin
              reg33 <= (+{(~|$unsigned(reg23))});
            end
          if (reg30[(3'h4):(2'h2)])
            begin
              reg36 <= ((~&(-($signed((8'hb0)) ?
                  ((8'ha5) ?
                      reg22 : reg23) : reg31))) || wire19[(3'h4):(1'h1)]);
            end
          else
            begin
              reg36 <= (~&reg23[(3'h4):(2'h3)]);
              reg37 <= $unsigned({reg25});
              reg38 <= ({wire20[(1'h0):(1'h0)]} - (reg22[(5'h10):(4'h8)] & (8'hba)));
              reg39 <= (^(~&((~&(7'h42)) ?
                  $signed(reg35[(5'h12):(3'h6)]) : reg37[(5'h11):(1'h1)])));
              reg40 <= $signed({(8'hae)});
            end
          if ((^(reg25 ?
              ($unsigned($unsigned(reg26)) ?
                  (!reg22[(4'hb):(4'h8)]) : ((&reg37) + (reg27 ?
                      (8'haf) : (8'hac)))) : $signed(reg36[(2'h3):(1'h1)]))))
            begin
              reg41 <= ((reg24 ^ (!reg29[(5'h11):(5'h10)])) ?
                  ((+((reg36 < (8'ha5)) ?
                          (reg27 ? reg31 : reg38) : $unsigned(reg25))) ?
                      (~(reg39[(3'h7):(3'h7)] ?
                          $signed(reg33) : {reg29})) : $unsigned(reg40)) : (8'hbc));
              reg42 <= (^reg26[(4'hc):(3'h6)]);
              reg43 <= ($unsigned(($signed((!reg24)) <<< $signed((|reg41)))) ?
                  reg41[(1'h0):(1'h0)] : (wire19[(5'h11):(2'h3)] + (+(^$unsigned((8'h9c))))));
            end
          else
            begin
              reg41 <= $signed({$unsigned((|(+(8'hbe)))),
                  reg32[(3'h7):(2'h3)]});
              reg42 <= reg37;
              reg43 <= (((~^($signed(reg34) + $unsigned((8'hbb)))) && {$unsigned((reg38 <<< (8'hb1))),
                  $signed(wire19)}) << $signed(wire21));
            end
          reg44 <= reg36[(2'h2):(1'h1)];
        end
    end
  assign wire45 = ({(reg36 || $signed($unsigned(reg28))),
                          (reg22 >>> (reg40[(4'h8):(3'h5)] ?
                              (reg24 ?
                                  reg34 : reg23) : reg23[(3'h5):(3'h4)]))} ?
                      $signed($unsigned(reg33)) : {reg29[(4'he):(3'h7)]});
  assign wire46 = $signed($signed(reg42));
  assign wire47 = reg28[(2'h2):(1'h0)];
endmodule

module module102
#(parameter param122 = (((|(((8'hb8) + (8'hba)) >= {(8'ha1), (8'hb3)})) >> ((((8'hba) ? (8'hbf) : (8'hbc)) | (+(8'hab))) < {((8'ha8) ? (7'h41) : (8'h9e)), ((8'hbf) ? (8'hb4) : (8'h9d))})) && ((!(((8'hab) - (8'ha3)) << ((7'h40) != (8'h9e)))) * (|(((8'ha5) - (8'hb9)) && ((8'hb0) * (8'hb0)))))), 
parameter param123 = ({param122, (-((param122 ? param122 : (7'h40)) ~^ (param122 ? param122 : param122)))} >>> param122))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire106;
  input wire [(4'hd):(1'h0)] wire105;
  input wire [(4'h8):(1'h0)] wire104;
  input wire signed [(5'h11):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire107 = (wire104 >>> (&$signed(($unsigned(wire106) ?
                       (wire104 << wire106) : (wire103 ? wire106 : wire106)))));
  assign wire108 = (wire104[(2'h2):(2'h2)] ?
                       $signed(((wire106 == $signed(wire107)) - ({wire104,
                           wire107} > wire103[(4'hb):(2'h3)]))) : (wire106[(3'h4):(1'h0)] ?
                           (-((wire103 ?
                               wire103 : wire104) ~^ wire105[(3'h7):(3'h4)])) : {wire107[(4'hb):(1'h1)],
                               (+wire104[(3'h6):(2'h2)])}));
  assign wire109 = wire104;
  assign wire110 = $unsigned(wire106);
  assign wire111 = (wire104 ?
                       {$signed(((~|(8'ha4)) ?
                               (~wire106) : (wire110 ?
                                   wire110 : (8'h9d))))} : (+{$unsigned($unsigned(wire105))}));
  always
    @(posedge clk) begin
      reg112 <= wire110;
      reg113 <= $unsigned($signed($signed(((reg112 >> wire106) != $unsigned(wire106)))));
      reg114 <= (8'hb0);
      reg115 <= (reg112[(3'h5):(3'h4)] == wire105);
    end
  assign wire116 = wire111[(5'h14):(5'h10)];
  assign wire117 = wire105[(3'h7):(3'h4)];
  assign wire118 = ($unsigned($unsigned($signed({wire107}))) || {(wire109 >> $unsigned(((8'hb6) <<< reg114))),
                       wire116[(3'h4):(1'h1)]});
  assign wire119 = $unsigned((wire103[(4'hf):(2'h3)] + wire110[(4'hb):(4'h9)]));
  assign wire120 = $signed($unsigned(wire110[(3'h5):(2'h3)]));
  assign wire121 = ((($signed(wire105) - wire108[(2'h2):(1'h1)]) < ((wire111 ?
                       wire106[(3'h5):(1'h0)] : (wire118 ?
                           wire108 : reg113)) >>> ($unsigned(wire107) <= $signed(reg114)))) == wire108);
endmodule
