module top
#(parameter param112 = (&{{((^~(8'ha6)) ? (^(8'hb2)) : ((8'ha1) ? (8'hac) : (8'ha1)))}, {(^{(8'h9c), (8'hb8)})}}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire108;
  wire [(2'h2):(1'h0)] wire107;
  wire signed [(4'hd):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire104;
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 (1'h0)};
  module5 #() modinst105 (.wire7(wire4), .wire10(wire1), .wire9(wire3), .y(wire104), .clk(clk), .wire6(wire0), .wire8(wire2));
  assign wire106 = $unsigned(wire3);
  assign wire107 = wire3[(4'hd):(3'h4)];
  assign wire108 = (($unsigned((wire4 ? (^wire4) : (wire4 > wire106))) ?
                           $signed($signed($signed(wire3))) : (wire2 == {(wire104 != wire104)})) ?
                       (^~$unsigned($signed((^~(8'hae))))) : (&{$unsigned(wire107)}));
  assign wire109 = ((($unsigned((wire1 ? wire2 : (8'ha8))) ?
                           wire104 : (8'hb3)) * $unsigned(($unsigned(wire107) <= wire106))) ?
                       (|wire104) : $unsigned(((^~(!wire107)) ?
                           $unsigned((~^wire104)) : (-(!wire0)))));
  assign wire110 = ($unsigned({(wire1[(4'h9):(2'h3)] ?
                               (~|wire1) : $unsigned(wire4)),
                           $signed((~^wire107))}) ?
                       {$signed($unsigned($signed((8'hb8))))} : (wire108[(3'h7):(2'h3)] << ($unsigned(wire108) ?
                           (wire108 >>> $unsigned(wire108)) : (wire1 == (wire107 ?
                               wire106 : wire106)))));
  assign wire111 = wire108[(4'hf):(2'h2)];
endmodule

module module5
#(parameter param102 = ({((~(~(8'hab))) ? ((!(8'ha1)) ? ((8'h9c) <= (8'ha3)) : {(8'ha4)}) : (~((8'ha3) ? (8'hb1) : (8'had))))} ? (((~^(~&(8'hbf))) ? ((^~(8'ha5)) - ((8'hae) ? (8'hb4) : (8'hbe))) : (((8'h9e) <= (8'hbb)) - {(8'hbc), (8'hb6)})) ? {(((8'hae) ? (7'h42) : (7'h43)) && (^(8'hbf))), {(8'h9c), ((8'ha1) ? (8'hb0) : (8'h9f))}} : ((8'hb2) ? ((-(8'hb5)) ? (^(8'haf)) : (~(8'hbb))) : (|((8'hb5) >= (8'h9d))))) : ((|(((8'hb0) ? (7'h40) : (8'ha2)) ? (!(8'ha1)) : (8'hb6))) ? {({(8'hbf), (7'h43)} && ((8'hb0) ? (8'ha4) : (8'hbc)))} : {({(8'had), (7'h41)} ? ((7'h44) & (8'ha2)) : ((8'h9e) ? (8'had) : (8'hbf)))})), 
parameter param103 = (^(&(param102 ? param102 : (^~(~param102))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire6;
  input wire [(4'h9):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire68;
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire68,
                 reg101,
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
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire11 = $signed($unsigned(wire9[(4'ha):(2'h2)]));
  assign wire12 = {($signed((((8'hb6) ? (8'ha0) : wire7) ?
                              (wire8 * wire11) : $unsigned(wire11))) ?
                          $signed(wire10) : $signed((8'hb5)))};
  assign wire13 = $unsigned({($unsigned((wire10 ? (8'ha2) : (8'haa))) ?
                          {(wire7 ? (7'h40) : wire12),
                              $unsigned(wire9)} : ($signed((8'h9e)) ?
                              wire7[(1'h0):(1'h0)] : wire9[(3'h4):(1'h1)])),
                      ({$signed(wire10), $unsigned(wire10)} ?
                          ((&wire11) < {(8'hbb),
                              wire11}) : (wire7[(2'h2):(1'h1)] << (~|(7'h42))))});
  assign wire14 = wire13;
  assign wire15 = (^({wire7[(1'h0):(1'h0)]} > $unsigned((~|wire13[(2'h2):(2'h2)]))));
  assign wire16 = (wire8[(1'h0):(1'h0)] <<< wire14[(3'h5):(1'h0)]);
  module17 #() modinst69 (.wire22(wire13), .wire20(wire7), .clk(clk), .y(wire68), .wire18(wire15), .wire21(wire14), .wire19(wire9));
  always
    @(posedge clk) begin
      reg70 <= (8'hbd);
      reg71 <= (-$signed(($signed($signed(wire11)) >>> {$signed(wire7)})));
      reg72 <= wire9[(4'h9):(3'h5)];
      reg73 <= $signed((7'h40));
      reg74 <= (^~wire16[(2'h3):(2'h3)]);
    end
  assign wire75 = (8'haf);
  assign wire76 = (^(($unsigned((wire7 ?
                      wire11 : (8'ha6))) && $signed($unsigned(wire75))) > (wire7 ?
                      ($unsigned(wire12) ?
                          (reg73 >>> wire11) : wire68[(1'h0):(1'h0)]) : wire13[(4'hf):(1'h0)])));
  assign wire77 = wire16;
  assign wire78 = $unsigned((reg71[(2'h2):(1'h0)] ?
                      wire9 : (((wire68 ? (7'h42) : wire77) ?
                          (~|wire12) : $signed((8'ha7))) & $signed(((8'ha0) ?
                          wire11 : reg71)))));
  assign wire79 = reg73;
  always
    @(posedge clk) begin
      if (wire68[(2'h2):(1'h1)])
        begin
          reg80 <= (&(~&wire77));
          reg81 <= (^~(8'hbc));
          reg82 <= $signed($signed({((wire12 >= reg70) ?
                  (wire14 ? (8'hab) : wire76) : (reg80 == wire12))}));
          reg83 <= $signed($unsigned(((wire8[(1'h1):(1'h1)] ^~ wire16[(1'h0):(1'h0)]) ?
              $unsigned((wire79 ? reg81 : wire77)) : ((reg74 ~^ (8'hbe)) ?
                  (!reg82) : (reg70 & (8'h9e))))));
        end
      else
        begin
          if (((-wire15) + (8'hb6)))
            begin
              reg80 <= $signed(wire77);
              reg81 <= reg73;
              reg82 <= reg73;
            end
          else
            begin
              reg80 <= $signed(wire6);
              reg81 <= ($signed($unsigned(((-wire14) ?
                      $unsigned(reg72) : (~&reg71)))) ?
                  ((&(~^wire16[(1'h0):(1'h0)])) ?
                      (|wire79[(3'h6):(2'h3)]) : $unsigned((&wire11))) : $unsigned((~&(reg72[(1'h0):(1'h0)] * (&reg72)))));
              reg82 <= $signed((({(wire9 ? (8'ha1) : wire14)} ~^ wire6) ?
                  {$unsigned((wire9 ?
                          reg74 : wire6))} : $unsigned(((^wire76) & (wire6 ?
                      reg80 : wire78)))));
              reg83 <= $unsigned((wire9 || (&wire6)));
              reg84 <= $unsigned($unsigned(reg80));
            end
          reg85 <= (&((~^$unsigned(reg71[(3'h6):(1'h1)])) ?
              ((reg72[(1'h1):(1'h0)] << wire13[(5'h11):(2'h2)]) & wire16) : (reg72[(2'h2):(1'h0)] << ($signed(reg71) ?
                  (&wire76) : (wire12 >> wire68)))));
        end
      if (wire79[(1'h0):(1'h0)])
        begin
          reg86 <= {((8'hb1) == ($unsigned($signed(wire75)) <= (wire12[(4'h8):(1'h1)] ^ wire11)))};
          reg87 <= ($unsigned({(+$signed(wire79)),
              {(wire6 ? reg84 : wire6)}}) | reg85);
          reg88 <= (~|$signed({wire7[(4'h9):(3'h6)],
              ($signed(reg70) ? (wire76 <= reg82) : $unsigned(wire14))}));
        end
      else
        begin
          reg86 <= (~^(~$unsigned($signed((wire68 ? reg86 : wire10)))));
          reg87 <= $unsigned(reg70);
        end
      if ($unsigned({reg84}))
        begin
          reg89 <= $signed(wire13[(2'h2):(1'h1)]);
          if (wire9)
            begin
              reg90 <= ($unsigned($signed({reg70[(2'h3):(2'h3)]})) ?
                  $unsigned($unsigned($signed({(8'ha7),
                      wire75}))) : (($unsigned(reg87[(1'h0):(1'h0)]) ?
                          ($unsigned((8'ha1)) ?
                              (~^reg70) : (reg82 + reg83)) : reg87[(1'h0):(1'h0)]) ?
                      (reg88 > $unsigned((reg89 <= wire75))) : $unsigned((~^(reg88 ^~ reg80)))));
              reg91 <= $signed($unsigned((($unsigned(wire11) ?
                  (8'hac) : reg84[(4'he):(3'h6)]) & (reg70 ?
                  $unsigned(reg71) : (+reg86)))));
              reg92 <= (reg89[(4'hf):(3'h5)] ?
                  $unsigned($unsigned($unsigned($signed(reg70)))) : ($signed({$unsigned((8'hac)),
                      wire75}) && {$signed((+reg74)),
                      (reg91[(1'h0):(1'h0)] ?
                          $unsigned((8'h9c)) : $signed(wire76))}));
              reg93 <= {$signed(($unsigned(((8'hb4) ? wire7 : reg73)) ?
                      reg88[(3'h6):(2'h2)] : {(reg70 ? reg81 : wire7),
                          reg86}))};
              reg94 <= reg84;
            end
          else
            begin
              reg90 <= {(({reg86[(1'h1):(1'h0)]} ?
                      reg88[(1'h0):(1'h0)] : reg73[(4'he):(4'hc)]) ^~ wire7)};
              reg91 <= reg81[(3'h7):(3'h4)];
              reg92 <= wire12;
              reg93 <= (reg92[(5'h11):(2'h2)] ?
                  $unsigned($unsigned(wire6[(2'h3):(2'h3)])) : $signed((wire75[(1'h1):(1'h0)] ?
                      {$unsigned(wire68),
                          (~|reg70)} : (wire10 >>> (reg91 * wire12)))));
              reg94 <= $unsigned({($signed($unsigned(wire12)) <<< $signed((-reg80)))});
            end
          if ($signed(reg82[(5'h14):(3'h6)]))
            begin
              reg95 <= ($unsigned(reg83[(1'h0):(1'h0)]) <= $signed(((&$signed(wire9)) != ({reg89,
                      wire11} ?
                  $unsigned(reg81) : reg87[(2'h2):(1'h1)]))));
              reg96 <= (($unsigned((wire8[(1'h0):(1'h0)] ^~ wire78[(2'h2):(1'h0)])) ^ reg81) ?
                  ((((8'h9c) ?
                      wire14 : (&reg89)) != $unsigned($unsigned(reg80))) >> ($signed((~&reg89)) ?
                      $unsigned(wire7[(3'h7):(3'h7)]) : {reg87[(3'h4):(3'h4)],
                          {reg72, reg71}})) : (reg91 ?
                      $unsigned(wire78[(1'h0):(1'h0)]) : ((^~$signed(wire10)) ?
                          {$signed(wire16)} : {$signed(reg73),
                              $signed((8'hb0))})));
              reg97 <= (wire16 ^~ ({wire77} ?
                  {wire6,
                      ((&wire75) ? (reg95 << (8'hb4)) : (^~wire15))} : reg91));
              reg98 <= (^~reg91);
            end
          else
            begin
              reg95 <= reg87[(1'h1):(1'h1)];
              reg96 <= reg84[(3'h7):(3'h6)];
              reg97 <= wire68;
            end
          reg99 <= (wire79 != wire12[(5'h15):(4'h9)]);
        end
      else
        begin
          reg89 <= {$unsigned((!(|(|wire75))))};
          reg90 <= (~((+((reg97 ? reg98 : reg85) ? {reg96, (8'hac)} : wire78)) ?
              (((wire7 ? wire15 : wire9) >= (&wire11)) ^ ((!wire11) ?
                  wire78[(4'ha):(4'ha)] : (wire14 ?
                      reg83 : wire14))) : (-$signed(reg99))));
          if (($unsigned(((|(+(7'h42))) | ((~&wire11) ?
                  (reg70 ? wire7 : wire13) : (reg85 ? reg85 : reg87)))) ?
              wire75 : (+($unsigned($unsigned((8'h9d))) ?
                  $unsigned(wire76) : ($signed(reg95) ^~ {reg98})))))
            begin
              reg91 <= $signed(((reg98 != (wire11 ?
                      wire13[(3'h5):(1'h1)] : (reg71 ? reg89 : (8'hb2)))) ?
                  (&((reg85 >>> wire14) && (~^reg96))) : {(~^reg81)}));
            end
          else
            begin
              reg91 <= wire75;
              reg92 <= $unsigned($unsigned((reg84[(4'hf):(1'h1)] ?
                  {(^reg93)} : $unsigned(wire78[(3'h6):(1'h1)]))));
            end
          reg93 <= wire13;
          reg94 <= reg94;
        end
      reg100 <= {reg88};
      reg101 <= ((wire16[(2'h3):(1'h0)] ?
              $unsigned(((wire77 | reg89) ?
                  (reg89 <= wire8) : ((8'hac) ?
                      (7'h41) : (8'hac)))) : reg85[(2'h2):(2'h2)]) ?
          $unsigned(reg95[(4'h9):(3'h5)]) : ({reg85,
                  (!(reg96 ? (8'hb5) : wire8))} ?
              reg82[(4'hb):(1'h0)] : reg100[(3'h6):(2'h3)]));
    end
endmodule

module module17
#(parameter param66 = (~&{(~^((~&(8'h9c)) ? (&(8'ha1)) : (8'ha1)))}), 
parameter param67 = {((param66 & ((!param66) + (-(7'h40)))) && (((param66 ^~ param66) ? param66 : param66) | ((param66 ? param66 : param66) ? (param66 || (8'hbd)) : (param66 + param66))))})
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire22;
  input wire signed [(4'ha):(1'h0)] wire21;
  input wire [(4'h9):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire34,
                 wire24,
                 wire23,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire23 = wire20;
  assign wire24 = wire23[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg25 <= (~((|(+(wire20 ^~ wire20))) || $signed(wire24)));
    end
  always
    @(posedge clk) begin
      reg26 <= wire23;
      reg27 <= (((&wire22) >> {$unsigned((wire20 ? wire22 : wire24)),
          $signed((|wire18))}) <<< (|($signed((7'h42)) ?
          $unsigned(wire18) : ($unsigned(wire23) >>> (wire22 ?
              wire22 : (8'h9f))))));
      reg28 <= wire19;
    end
  always
    @(posedge clk) begin
      reg29 <= $unsigned($signed((((~^wire18) ?
          (reg28 >>> reg27) : (|wire19)) > $unsigned((wire19 ?
          reg27 : reg28)))));
      reg30 <= {(^(8'hbf))};
      reg31 <= $signed($signed(reg26));
      reg32 <= reg31[(4'h9):(4'h9)];
      reg33 <= reg32;
    end
  assign wire34 = {{$signed($signed(wire20))},
                      {(~|((~&reg29) < reg30[(4'hc):(4'hc)])),
                          $unsigned((+(wire23 ? reg27 : wire21)))}};
  always
    @(posedge clk) begin
      reg35 <= (|reg27);
    end
  always
    @(posedge clk) begin
      reg36 <= wire19;
      if ($unsigned(((~$signed(reg25[(4'hd):(4'h9)])) != reg33[(3'h6):(3'h4)])))
        begin
          reg37 <= $unsigned((8'haa));
          if ($unsigned((((8'hb7) > $signed($signed(reg28))) & (|((wire23 || reg30) ?
              (&reg27) : $signed(reg35))))))
            begin
              reg38 <= $unsigned($unsigned((&$signed(wire23[(3'h6):(1'h1)]))));
            end
          else
            begin
              reg38 <= {$unsigned(reg25[(3'h6):(3'h6)])};
              reg39 <= (~|{wire19, reg37});
            end
          if (wire34)
            begin
              reg40 <= wire19[(2'h2):(1'h1)];
              reg41 <= (reg29 | (($signed((&reg33)) ?
                  reg36 : (^(reg30 ? reg31 : wire21))) >= ($signed((8'hb2)) ?
                  reg40 : $signed({reg33}))));
              reg42 <= (~|reg33);
              reg43 <= reg40[(3'h7):(2'h2)];
            end
          else
            begin
              reg40 <= {(reg30 ? (8'hbc) : (~^wire24)),
                  $signed(wire34[(2'h3):(2'h2)])};
            end
          reg44 <= reg28[(1'h1):(1'h1)];
        end
      else
        begin
          reg37 <= (+$unsigned(reg27));
        end
    end
  assign wire45 = $signed($unsigned(wire21));
  assign wire46 = reg32;
  assign wire47 = (-wire45[(3'h7):(3'h6)]);
  assign wire48 = ((|{(wire23 << reg42[(3'h6):(1'h0)]),
                          (reg29[(4'h9):(2'h2)] == (reg39 ?
                              wire23 : (8'ha9)))}) ?
                      $unsigned({$unsigned(reg32[(1'h0):(1'h0)])}) : $unsigned($unsigned($unsigned($unsigned(reg35)))));
  assign wire49 = {reg40, $unsigned($unsigned(reg43))};
  assign wire50 = reg33;
  always
    @(posedge clk) begin
      if (reg38)
        begin
          reg51 <= ((+$signed((~^(~(8'hb0))))) < (+(^reg41[(3'h5):(2'h3)])));
          if (($unsigned((((reg28 ? (8'hb2) : reg28) ?
              $unsigned(reg31) : reg42[(3'h7):(2'h3)]) <<< (&$unsigned(reg29)))) < $unsigned(reg29)))
            begin
              reg52 <= $signed(reg40[(4'hc):(1'h1)]);
              reg53 <= {$signed($unsigned($signed((wire47 + (8'hb1))))),
                  wire24[(3'h6):(3'h4)]};
              reg54 <= reg43[(1'h1):(1'h0)];
            end
          else
            begin
              reg52 <= $unsigned(($unsigned(((~|wire22) ?
                      reg37 : $signed(reg42))) ?
                  $unsigned((^(reg44 ?
                      (8'h9d) : (8'ha2)))) : (reg36[(4'h8):(1'h1)] != reg31[(3'h6):(3'h4)])));
              reg53 <= $signed((!{$signed((wire23 == reg25))}));
              reg54 <= {(((~|(wire18 ^~ (8'ha4))) ^ $unsigned((reg29 ?
                          wire24 : reg52))) ?
                      (reg32[(5'h11):(4'ha)] ?
                          wire48[(1'h1):(1'h0)] : $signed((reg36 ?
                              wire19 : (8'hbb)))) : (!reg26[(3'h6):(3'h4)])),
                  (reg32[(4'hc):(3'h6)] ?
                      (^~(^~(reg25 ?
                          wire23 : reg35))) : wire49[(2'h2):(2'h2)])};
              reg55 <= $unsigned(reg51[(3'h5):(1'h1)]);
              reg56 <= reg55;
            end
          reg57 <= ((~^(~&wire23)) ?
              $signed(($signed(reg44[(5'h14):(3'h4)]) ?
                  {reg40} : $unsigned($signed(reg33)))) : ($unsigned(reg32[(3'h5):(2'h3)]) >= (~(-$signed(reg37)))));
          reg58 <= (wire22 ?
              wire45 : (((reg41 >>> wire47[(1'h1):(1'h0)]) <<< (reg36[(3'h6):(1'h0)] | {reg28,
                      reg38})) ?
                  (7'h42) : reg41[(4'h8):(1'h1)]));
          reg59 <= (((reg56[(4'h8):(3'h4)] ^ reg33[(3'h5):(1'h1)]) ?
                  reg51 : reg53) ?
              (&$unsigned(((reg26 ? wire24 : wire24) ?
                  reg33[(4'h9):(3'h5)] : reg52[(3'h4):(2'h3)]))) : reg56[(3'h5):(3'h5)]);
        end
      else
        begin
          reg51 <= reg31[(2'h2):(1'h1)];
          reg52 <= reg43[(3'h7):(2'h3)];
          reg53 <= $signed((8'ha3));
        end
      reg60 <= $signed($signed($unsigned({reg25})));
      reg61 <= ($signed($unsigned(((~|reg32) <<< (reg41 ?
          reg38 : reg53)))) >> $unsigned(reg35));
      reg62 <= reg58;
      reg63 <= $signed($unsigned(wire23[(1'h1):(1'h1)]));
    end
  assign wire64 = $signed(wire46);
  assign wire65 = ((~&{$signed((reg59 ? reg56 : (8'hb9)))}) ?
                      (^(wire48 + (reg30[(1'h1):(1'h1)] ^ (reg31 ?
                          reg25 : wire20)))) : ((!$signed((reg61 ?
                          wire34 : wire23))) ^ $unsigned((8'ha9))));
endmodule
