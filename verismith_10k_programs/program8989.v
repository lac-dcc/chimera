module top
#(parameter param141 = ((((((8'hbc) ? (8'ha3) : (7'h42)) ~^ ((8'ha1) << (8'hac))) ? (((8'ha6) <= (8'ha1)) >> (8'hb7)) : (((7'h42) >>> (8'hbc)) ? {(8'hb3)} : (8'hb4))) ? (~^((^~(8'hab)) ? ((8'hba) ? (8'ha2) : (8'hb7)) : ((8'hb4) ? (8'hb9) : (8'hbe)))) : ({(8'hb9), {(8'hae), (8'ha0)}} && (8'hb3))) ? (8'haf) : {{(~&(8'ha9)), (((8'ha0) ? (8'h9c) : (8'ha5)) << ((8'haf) ? (8'haa) : (8'ha9)))}}), 
parameter param142 = param141)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire140;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire138;
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  assign y = {wire140,
                 wire5,
                 wire6,
                 wire84,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire101,
                 wire102,
                 wire103,
                 wire138,
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
                 (1'h0)};
  assign wire5 = $signed(wire0[(1'h1):(1'h1)]);
  assign wire6 = (8'hb2);
  module7 #() modinst85 (.wire10(wire3), .wire8(wire5), .clk(clk), .y(wire84), .wire9(wire6), .wire11(wire0));
  assign wire86 = $unsigned(wire4[(3'h7):(1'h1)]);
  assign wire87 = ((wire4[(2'h2):(2'h2)] ?
                      $signed(((&wire2) <<< {wire6,
                          wire86})) : $signed($unsigned($unsigned(wire3)))) & (8'hb5));
  assign wire88 = $signed($unsigned((~&($signed(wire84) ?
                      $unsigned(wire5) : (wire87 ? wire1 : wire84)))));
  assign wire89 = $unsigned(($signed({wire6}) * $unsigned($unsigned($unsigned(wire6)))));
  always
    @(posedge clk) begin
      reg90 <= ($unsigned({(-(wire0 ? wire3 : (8'hb1))),
              ($signed(wire6) || wire86[(3'h5):(2'h3)])}) ?
          (wire3[(4'hc):(3'h5)] ?
              wire89[(5'h10):(2'h2)] : ($unsigned((wire2 ?
                  wire88 : wire87)) >= $signed($unsigned((7'h44))))) : (($unsigned((-(8'hb5))) + $unsigned((wire87 ?
                  wire4 : wire5))) ?
              wire2 : ({$signed(wire3), (wire0 ? wire2 : wire5)} ?
                  (((8'hb7) >= wire89) ?
                      wire89 : wire0[(4'ha):(1'h1)]) : ($unsigned((8'hba)) + $signed(wire89)))));
      if (reg90[(2'h3):(1'h0)])
        begin
          reg91 <= (|(~|{wire88[(2'h2):(1'h1)], (wire86 >= (~wire3))}));
        end
      else
        begin
          reg91 <= (reg90[(3'h5):(1'h0)] >= (reg90[(2'h2):(1'h0)] ?
              ($unsigned((wire87 + wire1)) ?
                  wire6[(1'h1):(1'h1)] : (reg91[(4'h8):(3'h7)] ?
                      ((8'ha6) * wire86) : {wire89})) : (~wire1[(3'h6):(2'h2)])));
          reg92 <= $signed(wire0[(4'hc):(4'h8)]);
        end
      reg93 <= ((!(reg91 ?
          wire5[(4'hc):(2'h2)] : wire1)) == (($signed((~|reg92)) ?
              ((|reg92) != reg90) : $signed(wire1[(3'h5):(2'h2)])) ?
          wire87[(4'hd):(1'h0)] : $signed(wire84)));
      reg94 <= (^$signed({((reg92 ^~ wire88) ?
              wire3[(5'h10):(3'h6)] : {reg90, wire1})}));
      reg95 <= ((&$signed(wire89)) ?
          wire1 : (wire84 >>> $signed($unsigned({wire0}))));
    end
  always
    @(posedge clk) begin
      reg96 <= $unsigned(((((^reg91) ? $unsigned(reg94) : (wire5 ~^ wire6)) ?
              ($signed((8'hb2)) <<< wire86) : $signed(wire1[(3'h6):(2'h2)])) ?
          (~(~^wire86)) : wire89[(2'h2):(2'h2)]));
      reg97 <= wire4[(3'h7):(3'h7)];
      reg98 <= (^(~^($unsigned((reg95 ? reg96 : wire4)) ?
          $signed($signed(wire3)) : {wire88, (~reg91)})));
      reg99 <= (|$unsigned((~|(7'h44))));
      reg100 <= (&{{(~&{reg93})},
          $signed(($unsigned(reg93) <<< reg92[(1'h1):(1'h1)]))});
    end
  assign wire101 = $signed({(((8'had) ? {wire0} : (~reg97)) * (8'ha4))});
  assign wire102 = $unsigned(wire6);
  assign wire103 = $unsigned(($unsigned(wire101) ?
                       $unsigned((|wire5)) : (reg98 ?
                           $signed(reg90[(4'h8):(3'h7)]) : (wire1 == $signed(reg95)))));
  module104 #() modinst139 (.wire105(wire88), .y(wire138), .wire109(reg100), .clk(clk), .wire108(wire84), .wire107(wire0), .wire106(reg98));
  assign wire140 = reg93[(1'h0):(1'h0)];
endmodule

module module104
#(parameter param136 = (8'h9e), 
parameter param137 = {(~^(param136 ? (~&((8'hb6) & param136)) : (&(param136 ? param136 : param136))))})
(y, clk, wire105, wire106, wire107, wire108, wire109);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire105;
  input wire signed [(4'ha):(1'h0)] wire106;
  input wire signed [(5'h15):(1'h0)] wire107;
  input wire [(4'h9):(1'h0)] wire108;
  input wire signed [(3'h7):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire128;
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg117 = (1'h0);
  assign y = {wire135,
                 wire131,
                 wire130,
                 wire110,
                 wire111,
                 wire128,
                 reg134,
                 reg133,
                 reg132,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 (1'h0)};
  assign wire110 = (!$signed(wire106));
  assign wire111 = (^~($unsigned($signed(wire108)) ?
                       wire110[(3'h7):(3'h6)] : $unsigned((|(!wire107)))));
  always
    @(posedge clk) begin
      if (wire106)
        begin
          reg112 <= wire105[(1'h0):(1'h0)];
          reg113 <= ({{$unsigned((+reg112)), (-wire109[(1'h0):(1'h0)])},
                  wire111[(3'h7):(3'h7)]} ?
              reg112 : $signed(wire106));
          if (($signed((((wire110 ^~ reg113) == wire106[(3'h4):(1'h1)]) | reg113)) < ({$signed(wire110[(3'h5):(3'h5)]),
              (-$signed(wire108))} <= wire106)))
            begin
              reg114 <= wire108;
              reg115 <= $unsigned(reg113[(3'h6):(1'h1)]);
            end
          else
            begin
              reg114 <= (^(+(~|{wire105[(3'h4):(2'h2)]})));
            end
        end
      else
        begin
          if ({wire109[(2'h2):(2'h2)],
              ((|$unsigned((wire109 != wire107))) ?
                  (~{{(8'hbc), wire106},
                      $signed(wire110)}) : (reg114[(1'h0):(1'h0)] * (8'hbc)))})
            begin
              reg112 <= ((^~{(reg114[(2'h3):(1'h1)] ? (8'ha8) : reg113),
                  reg114[(2'h2):(1'h0)]}) != wire109[(2'h3):(1'h0)]);
            end
          else
            begin
              reg112 <= (!(wire111 <<< ((8'ha0) <= wire105)));
            end
        end
      reg116 <= (wire105 ^~ reg112[(1'h1):(1'h0)]);
      reg117 <= $signed(wire108);
    end
  module118 #() modinst129 (wire128, clk, wire107, reg114, reg113, reg117);
  assign wire130 = ($signed(wire108) ^~ {($unsigned((7'h44)) ?
                           reg114 : wire106)});
  assign wire131 = (wire110 ?
                       (&(!{(reg116 ? (7'h41) : reg112),
                           reg115[(4'ha):(3'h5)]})) : reg114);
  always
    @(posedge clk) begin
      reg132 <= wire106;
      reg133 <= reg116[(4'hc):(1'h1)];
      reg134 <= (^reg117[(2'h2):(1'h0)]);
    end
  assign wire135 = $unsigned($signed(wire107[(3'h7):(3'h5)]));
endmodule

module module7
#(parameter param82 = (&(&(~|{((8'hb0) ^ (8'hae))}))), 
parameter param83 = ({({(~param82), (param82 == param82)} ? {(8'had), (!param82)} : ((param82 ~^ param82) && (param82 | param82)))} ? (~((8'hb7) >>> (&(param82 << param82)))) : param82))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire33;
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  assign y = {wire80,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 reg39,
                 (1'h0)};
  module12 #() modinst34 (wire33, clk, wire9, wire10, wire8, wire11);
  assign wire35 = (|(~&((~^{wire9}) ?
                      $unsigned((wire11 ? wire10 : wire10)) : (wire9 ?
                          $signed(wire11) : $signed(wire11)))));
  assign wire36 = (wire10 ?
                      wire11[(3'h7):(3'h6)] : (wire11[(4'hb):(2'h3)] <<< wire35[(4'h9):(3'h5)]));
  assign wire37 = ((($unsigned($unsigned((7'h40))) | (&$unsigned(wire9))) || wire36[(1'h0):(1'h0)]) ?
                      $unsigned({wire33}) : ((wire36[(1'h1):(1'h0)] ?
                          $signed($unsigned(wire35)) : ((~|wire36) ?
                              wire35 : $unsigned(wire33))) <= (|wire35[(4'h9):(3'h4)])));
  assign wire38 = wire9;
  always
    @(posedge clk) begin
      reg39 <= wire33;
    end
  assign wire40 = wire36[(3'h4):(1'h1)];
  assign wire41 = $unsigned(wire9[(2'h2):(2'h2)]);
  assign wire42 = (^wire36);
  assign wire43 = $unsigned(reg39);
  module44 #() modinst81 (wire80, clk, wire11, wire43, wire41, wire35);
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire signed [(4'h8):(1'h0)] wire46;
  input wire [(2'h2):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire61,
                 wire60,
                 wire59,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire49 = wire45;
  assign wire50 = wire46[(1'h0):(1'h0)];
  assign wire51 = ((8'haf) || wire48);
  assign wire52 = $signed((-$unsigned($signed((wire49 ? wire45 : wire47)))));
  always
    @(posedge clk) begin
      if ((~^(-$unsigned(((!wire45) == $unsigned(wire45))))))
        begin
          reg53 <= wire48[(4'hd):(3'h5)];
          reg54 <= {$signed(((wire46 >>> reg53) ?
                  ($signed(wire47) >>> wire45[(1'h0):(1'h0)]) : $signed($unsigned(wire47)))),
              reg53[(4'hd):(4'hb)]};
          reg55 <= ((($signed((+wire49)) ?
                  (~^(reg53 ?
                      reg53 : wire51)) : ((wire51 ^~ wire49) >> $unsigned(wire46))) ?
              ($signed(wire52[(3'h6):(3'h4)]) ^ ($signed(wire48) ?
                  wire50[(4'h9):(3'h5)] : wire47)) : $signed((~&wire46[(3'h4):(1'h0)]))) & $signed(wire48));
          reg56 <= $unsigned(wire45[(2'h2):(1'h0)]);
        end
      else
        begin
          reg53 <= {((wire45 >= $signed($unsigned(wire51))) >> $signed((-(reg53 > reg55)))),
              {reg55}};
          reg54 <= $signed(wire49);
        end
      reg57 <= (wire50[(3'h6):(2'h2)] ?
          (8'h9f) : $unsigned(($signed((wire50 ^ wire49)) & wire49[(3'h4):(1'h0)])));
      reg58 <= reg54;
    end
  assign wire59 = ((reg54 >> $unsigned({wire48, (~|wire47)})) ?
                      $unsigned(wire52[(1'h0):(1'h0)]) : wire46);
  assign wire60 = $unsigned($unsigned(wire49));
  assign wire61 = $signed({(wire50[(4'hc):(3'h4)] ~^ (~^wire52[(4'h9):(3'h7)])),
                      reg56});
  always
    @(posedge clk) begin
      reg62 <= $signed($signed(((((8'hb5) && wire51) ?
          reg53 : (reg58 ? wire48 : wire50)) + wire60)));
      reg63 <= $unsigned(reg54[(4'hc):(2'h3)]);
      reg64 <= $unsigned((((~&(reg55 | reg54)) - ($unsigned(wire61) != reg54)) ?
          (reg58 << (&$signed(reg54))) : wire52));
      reg65 <= {wire50};
      reg66 <= (8'hb3);
    end
  assign wire67 = {reg64};
  assign wire68 = $unsigned(($unsigned(wire60) && reg64));
  assign wire69 = reg66;
  assign wire70 = ((wire48 ?
                      wire45[(1'h1):(1'h1)] : $unsigned(($unsigned(wire69) <<< (|wire51)))) - wire59);
  assign wire71 = (($signed($signed((reg58 ? reg66 : wire49))) ?
                          $unsigned($unsigned((~&wire46))) : (~^(~^reg55))) ?
                      $signed(wire48[(5'h11):(4'he)]) : $unsigned($signed((+(reg55 > reg65)))));
  always
    @(posedge clk) begin
      reg72 <= wire69[(2'h3):(2'h2)];
      reg73 <= {$signed($signed({(wire59 << reg72), wire52[(4'he):(1'h1)]})),
          wire52[(1'h0):(1'h0)]};
      reg74 <= ($signed($signed((^wire68))) ? wire48 : wire47);
      reg75 <= ((((wire68 ?
          (wire59 > reg73) : (&reg73)) || reg53) >= $signed($signed($signed(wire45)))) || (wire70[(2'h3):(2'h2)] ?
          (reg55[(1'h0):(1'h0)] >= $signed($signed(wire69))) : reg72[(3'h7):(2'h3)]));
    end
  always
    @(posedge clk) begin
      reg76 <= $signed((|{{(reg62 ? reg63 : wire50)}}));
    end
  assign wire77 = ((reg66 ?
                      reg55[(1'h1):(1'h1)] : (((reg57 <<< wire52) ?
                          (wire61 ?
                              (7'h44) : reg54) : $unsigned(reg66)) << $signed($signed(reg55)))) < ((wire47 ?
                          (~^reg64) : (+$unsigned(reg65))) ?
                      (+(reg54[(1'h0):(1'h0)] & wire61)) : ($unsigned((wire45 <<< reg72)) != $signed(reg58[(4'hf):(4'hf)]))));
  assign wire78 = $signed($signed(({$signed(reg65)} >= $unsigned({wire59,
                      wire46}))));
  assign wire79 = ($unsigned((reg75 == wire71)) ^ ($signed({$unsigned((7'h41)),
                          $unsigned((8'hbf))}) ?
                      (|$unsigned($signed(wire68))) : (8'hbe)));
endmodule

module module12
#(parameter param31 = {{{(^~((8'hb0) <= (8'h9d)))}, {(((8'h9c) == (7'h42)) > ((8'ha4) + (8'ha5))), {((8'ha2) - (8'h9e))}}}, (&(~|({(8'had)} ^~ (-(8'hb7)))))}, 
parameter param32 = (((((param31 ? param31 : param31) < (param31 ? param31 : param31)) <<< param31) & param31) >> param31))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire17 = wire16;
  assign wire18 = wire14;
  assign wire19 = {$signed({wire13[(1'h0):(1'h0)]}), wire16[(1'h1):(1'h1)]};
  assign wire20 = (((wire14 ? (8'hba) : wire16) ?
                      wire14[(3'h5):(1'h1)] : $unsigned((~wire14[(2'h2):(1'h1)]))) - (|(-wire14)));
  assign wire21 = $signed((+$signed((7'h40))));
  assign wire22 = $signed((wire19 ? {wire16[(1'h0):(1'h0)]} : $signed(wire20)));
  always
    @(posedge clk) begin
      reg23 <= (-wire14);
      reg24 <= $unsigned(({{wire14}} - $signed((wire21[(3'h4):(1'h1)] ?
          (reg23 ? wire14 : wire19) : wire16[(1'h1):(1'h1)]))));
      reg25 <= wire20;
      reg26 <= $signed(wire17[(2'h2):(1'h1)]);
    end
  assign wire27 = wire17;
  assign wire28 = (-{reg23[(2'h2):(2'h2)], reg23[(3'h5):(2'h3)]});
  assign wire29 = $signed(wire14);
  assign wire30 = $signed((wire17 || $unsigned(({wire17} ~^ reg26[(2'h3):(1'h1)]))));
endmodule

module module118
#(parameter param127 = (-(8'hb5)))
(y, clk, wire122, wire121, wire120, wire119);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire122;
  input wire [(4'hb):(1'h0)] wire121;
  input wire signed [(4'hb):(1'h0)] wire120;
  input wire [(4'hc):(1'h0)] wire119;
  wire signed [(2'h3):(1'h0)] wire126;
  wire signed [(5'h11):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  assign y = {wire126, wire125, wire124, wire123, (1'h0)};
  assign wire123 = $unsigned(wire119);
  assign wire124 = (7'h40);
  assign wire125 = wire122;
  assign wire126 = $signed($unsigned($unsigned((+$signed(wire121)))));
endmodule
