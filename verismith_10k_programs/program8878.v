module top
#(parameter param138 = (((+(((8'ha0) + (8'ha4)) != ((8'h9d) ? (8'haf) : (8'hb1)))) ? ((-((8'hbd) ? (8'ha0) : (8'hb3))) ^~ (((8'ha3) + (8'ha2)) != ((7'h43) ^~ (7'h41)))) : (^~({(8'hac), (8'haa)} * ((8'ha9) ^~ (8'hb6))))) >> (((8'hb1) >>> {((8'hb3) == (8'hba)), ((8'hb5) <= (8'hb6))}) - (({(8'hbd)} ? {(7'h41), (7'h40)} : ((8'h9c) ? (8'ha8) : (8'ha6))) ? (~{(8'hbc), (8'ha7)}) : {{(8'h9f)}}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(3'h7):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire133;
  wire [(4'hf):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire136;
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  assign y = {wire126,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 wire27,
                 wire5,
                 wire25,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire5 = ((+(&((wire2 ? wire2 : wire2) ?
                         (wire0 ? wire1 : wire3) : (wire4 ~^ wire4)))) ?
                     ((((~^wire3) - wire0[(4'h9):(3'h6)]) <= $unsigned(wire1[(3'h6):(1'h1)])) * (~$signed((wire3 ?
                         wire0 : wire4)))) : wire0[(1'h0):(1'h0)]);
  module6 #() modinst26 (wire25, clk, wire3, wire1, wire5, wire0, wire4);
  assign wire27 = wire2[(4'ha):(2'h3)];
  module28 #() modinst57 (.wire29(wire3), .wire30(wire0), .wire32(wire25), .clk(clk), .wire31(wire2), .y(wire56));
  assign wire58 = $signed((wire3 ?
                      {(wire56 ? wire4 : $signed(wire56)),
                          $unsigned((wire2 + (8'hb6)))} : $signed(wire4[(5'h11):(5'h11)])));
  assign wire59 = $unsigned((~|wire58[(3'h5):(2'h2)]));
  assign wire60 = (8'ha5);
  assign wire61 = $signed((+(^$unsigned((wire4 ^~ wire3)))));
  assign wire62 = wire0[(4'hb):(1'h1)];
  assign wire63 = $unsigned((wire62 <<< ({$signed(wire1),
                      $signed(wire56)} <= (-{wire3, wire58}))));
  assign wire64 = ($signed($signed(wire5[(4'hc):(1'h0)])) ? wire25 : (8'ha1));
  assign wire65 = (($signed($signed(wire2[(3'h4):(3'h4)])) || wire3) * $unsigned((wire62 == (wire5[(3'h7):(2'h2)] >> $unsigned(wire62)))));
  assign wire66 = $unsigned((~&$unsigned((~|(wire1 == wire58)))));
  assign wire67 = $signed($unsigned(wire62[(5'h13):(3'h5)]));
  assign wire68 = wire0;
  assign wire69 = $signed(((((&wire62) ? wire56 : (~wire61)) ?
                      {(~&wire5), $unsigned(wire66)} : ({wire61,
                          wire66} <= (~^wire2))) | wire1[(3'h6):(2'h2)]));
  assign wire70 = (wire64[(4'ha):(3'h5)] & wire65);
  module71 #() modinst127 (.wire75(wire63), .y(wire126), .clk(clk), .wire76(wire62), .wire73(wire67), .wire72(wire25), .wire74(wire4));
  always
    @(posedge clk) begin
      reg128 <= {$signed(((wire66[(3'h5):(3'h4)] < (wire59 ?
              wire67 : wire58)) ^~ wire126[(2'h2):(1'h0)]))};
      if (({$unsigned(wire67),
              (wire61 <<< $unsigned(((8'h9c) ? wire68 : wire126)))} ?
          $signed(wire61[(3'h4):(1'h1)]) : {{$unsigned(reg128[(3'h5):(1'h1)]),
                  wire61}}))
        begin
          reg129 <= $signed(($unsigned(({wire64} ?
                  {(8'ha5)} : (wire56 ? (7'h42) : (8'ha5)))) ?
              (wire58 ?
                  reg128[(2'h2):(1'h1)] : wire70[(2'h2):(1'h1)]) : wire58));
          reg130 <= (($unsigned(wire25) ? (~&wire3) : wire70[(3'h4):(2'h3)]) ?
              $unsigned((($signed(wire65) * $unsigned(wire67)) - $unsigned(wire59))) : {((~&(~wire64)) >= $signed(wire67)),
                  $signed((~^(wire3 - (8'ha1))))});
          reg131 <= $unsigned($signed((7'h41)));
          reg132 <= (|$signed(wire60[(4'hb):(2'h2)]));
        end
      else
        begin
          reg129 <= (&{{(((8'h9c) | wire27) >>> (wire62 ? wire58 : wire2))},
              $signed(((wire1 ~^ wire27) ?
                  (wire63 ? wire27 : wire58) : {(7'h44)}))});
          reg130 <= reg130;
          reg131 <= {(^{($unsigned(wire126) & (reg131 >>> (8'hac)))})};
        end
    end
  assign wire133 = wire3[(5'h15):(5'h13)];
  assign wire134 = wire27;
  assign wire135 = wire61;
  module71 #() modinst137 (wire136, clk, wire133, wire134, wire3, reg129, reg130);
endmodule

module module71
#(parameter param124 = {{(~|({(8'hbe)} ? (~^(8'hbe)) : {(8'haf), (8'ha2)})), (8'h9c)}, {((~&{(8'h9d), (8'ha4)}) && (+{(7'h40), (8'haf)}))}}, 
parameter param125 = ((8'ha8) + ((param124 <<< (param124 ? ((8'h9d) - param124) : ((8'ha4) << param124))) ? param124 : (((param124 || (8'hb2)) ? (param124 == param124) : param124) << param124))))
(y, clk, wire72, wire73, wire74, wire75, wire76);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire72;
  input wire [(4'he):(1'h0)] wire73;
  input wire [(5'h14):(1'h0)] wire74;
  input wire signed [(2'h2):(1'h0)] wire75;
  input wire [(4'hd):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire120;
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire120,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire77 = ($signed((~^wire72[(2'h3):(1'h1)])) >>> (~&(|(~|{(8'hb2),
                      wire73}))));
  assign wire78 = (wire74[(4'he):(4'hd)] ?
                      ((wire76 >> wire74) < $signed(wire74[(1'h0):(1'h0)])) : $unsigned(($unsigned($unsigned(wire75)) ?
                          (&$signed(wire76)) : wire77[(1'h0):(1'h0)])));
  assign wire79 = (+(-(~wire76)));
  assign wire80 = wire79[(4'hc):(1'h1)];
  assign wire81 = wire75[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg82 <= {((wire74[(4'hb):(3'h7)] <<< wire79[(3'h5):(1'h0)]) ?
              ((~|$unsigned((8'hb7))) ~^ $signed({wire77})) : (&{$signed(wire79),
                  $unsigned(wire75)}))};
      reg83 <= $unsigned(wire77);
      reg84 <= $unsigned($unsigned((~|{(wire75 <<< wire81)})));
      reg85 <= $signed((wire80[(2'h3):(1'h1)] ?
          reg83 : (reg82[(2'h2):(1'h1)] ?
              wire77[(1'h0):(1'h0)] : ((wire76 >= wire72) != wire80))));
    end
  assign wire86 = {$unsigned($signed($unsigned((wire74 ? reg82 : wire72))))};
  assign wire87 = (8'ha2);
  assign wire88 = $unsigned((wire78[(5'h10):(4'hd)] ?
                      ($signed((wire80 && wire79)) <<< $unsigned((reg84 ?
                          wire86 : reg84))) : ($unsigned((|wire80)) ?
                          wire73[(3'h5):(3'h5)] : $unsigned(wire73))));
  assign wire89 = $signed(((8'hb9) ? reg83 : wire87));
  assign wire90 = ((wire76 ?
                      ({$unsigned(wire77), ((8'ha6) ? wire81 : wire77)} ?
                          (|wire78[(2'h3):(1'h1)]) : wire74[(4'hc):(4'h9)]) : wire73[(2'h2):(2'h2)]) < ((8'ha6) ?
                      (~|wire86) : (wire77 ?
                          $signed((8'hbc)) : (((8'ha1) <<< wire72) ?
                              (!wire76) : (8'ha4)))));
  assign wire91 = wire73;
  assign wire92 = (($signed($signed({wire74,
                      wire87})) < $signed(wire73[(2'h2):(1'h1)])) * ($signed(((wire72 + wire89) ?
                      wire86 : (8'h9c))) >> $unsigned(({wire79} ?
                      (^wire91) : wire79[(4'h8):(3'h7)]))));
  assign wire93 = wire76[(4'hd):(1'h1)];
  assign wire94 = ((&$unsigned(((wire72 ? wire77 : wire91) ?
                      {reg83} : (reg83 >= reg84)))) && $unsigned(wire89));
  module95 #() modinst121 (wire120, clk, wire76, wire72, wire78, wire86, wire77);
  assign wire122 = $unsigned($unsigned((|$unsigned(wire81))));
  assign wire123 = ((~&$signed(wire72)) && $unsigned((~wire81)));
endmodule

module module28
#(parameter param54 = ({((!((7'h42) ? (8'hbd) : (8'hba))) ~^ (&{(7'h41)}))} ^ (-({(~|(8'haa)), {(8'h9d), (8'hb9)}} ~^ ((8'ha6) ? ((8'hae) ? (8'hbc) : (8'ha6)) : (-(8'ha1)))))), 
parameter param55 = (((8'hb0) && (((-param54) >>> (param54 ? (8'ha1) : param54)) ? param54 : {{param54}, param54})) ~^ param54))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire [(5'h11):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  assign y = {wire53, wire51, wire37, wire35, wire34, wire33, reg36, (1'h0)};
  assign wire33 = $unsigned({wire29,
                      (((wire31 ?
                          wire32 : wire32) ^~ (wire30 ^ wire31)) < wire32[(3'h4):(3'h4)])});
  assign wire34 = $signed(wire30[(3'h6):(3'h6)]);
  assign wire35 = ($unsigned(wire31[(4'hd):(3'h7)]) ?
                      $signed({$signed($unsigned(wire33))}) : wire34[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg36 <= ((&$signed(wire29)) << (($signed($signed(wire35)) ?
          (~|$unsigned(wire32)) : wire29) * (~$signed($signed(wire31)))));
    end
  assign wire37 = $unsigned($signed((~(|(~|(8'hb9))))));
  module38 #() modinst52 (wire51, clk, wire30, wire33, wire29, wire32);
  assign wire53 = wire31[(4'hd):(4'h9)];
endmodule

module module6
#(parameter param24 = (-{(|(+((8'ha7) ? (7'h41) : (8'ha8))))}))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg18,
                 (1'h0)};
  assign wire12 = (+$unsigned(wire7[(3'h5):(1'h0)]));
  assign wire13 = wire10[(3'h4):(2'h3)];
  assign wire14 = ($signed((^~(^(wire10 ?
                      (8'ha5) : wire13)))) <= $signed(((+(^~wire8)) == ((~|wire10) ~^ $unsigned(wire13)))));
  assign wire15 = $unsigned(wire13[(3'h5):(3'h5)]);
  assign wire16 = (wire7 ?
                      $signed($signed((wire10 ?
                          $signed(wire8) : wire11[(4'hf):(4'hf)]))) : wire8);
  assign wire17 = wire9[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg18 <= (((($signed(wire9) ? $unsigned((8'ha6)) : $signed(wire11)) ?
              (wire7 ? $unsigned(wire15) : (^wire16)) : $unsigned((8'ha3))) ?
          (~$signed((wire13 * wire8))) : $signed($signed($signed(wire13)))) <= (wire10 ^ $signed((((8'haf) > wire13) ?
          {wire13, wire13} : (wire9 || wire17)))));
    end
  assign wire19 = ($signed({$unsigned($unsigned((8'haf))),
                          wire9[(1'h0):(1'h0)]}) ?
                      (($unsigned((wire9 && wire10)) != ({wire12} ~^ wire11)) ?
                          ((-$unsigned(wire17)) ?
                              $unsigned((wire15 ?
                                  wire12 : wire10)) : (8'hbb)) : $signed($unsigned(wire9[(1'h1):(1'h1)]))) : {wire12[(4'h8):(3'h6)]});
  assign wire20 = $signed(wire14);
  assign wire21 = {wire11};
  assign wire22 = $signed($signed({wire7}));
  assign wire23 = (wire19[(3'h7):(2'h2)] ?
                      ($unsigned(wire14) ?
                          wire19[(1'h0):(1'h0)] : wire13[(1'h0):(1'h0)]) : wire11);
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire42;
  input wire [(3'h4):(1'h0)] wire41;
  input wire [(2'h2):(1'h0)] wire40;
  input wire signed [(4'hf):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 (1'h0)};
  assign wire43 = wire42[(1'h1):(1'h1)];
  assign wire44 = ((($unsigned((~&wire43)) ? (8'hb1) : (~&{wire39, wire42})) ?
                          (((wire43 ? wire42 : wire43) ?
                              wire39 : $signed(wire43)) ~^ wire39[(1'h1):(1'h0)]) : (&(8'hb2))) ?
                      $unsigned($signed(wire42[(3'h5):(1'h0)])) : wire41[(1'h0):(1'h0)]);
  assign wire45 = ($signed($signed(((wire41 ? wire42 : wire40) ?
                      {wire40} : $unsigned((8'hb9))))) - wire43);
  assign wire46 = $signed({({{wire45},
                          (wire42 ?
                              (8'ha8) : wire39)} && (wire42[(4'hd):(3'h7)] << $unsigned(wire42)))});
  assign wire47 = wire39;
  assign wire48 = wire41;
  assign wire49 = $signed((($unsigned($signed((8'hb6))) ^ $unsigned({wire46,
                          wire44})) ?
                      (~&$signed((^~wire41))) : (((~&wire46) - (~&wire43)) + $unsigned(((8'ha7) != (8'hb2))))));
  assign wire50 = (wire46[(4'hc):(4'hb)] ?
                      wire46[(4'hc):(2'h3)] : {(((8'hbe) ?
                                  (wire43 ~^ wire42) : wire42[(4'hb):(4'h8)]) ?
                              (|$unsigned(wire40)) : wire39[(4'he):(4'he)]),
                          wire39});
endmodule

module module95  (y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire100;
  input wire [(5'h10):(1'h0)] wire99;
  input wire signed [(5'h14):(1'h0)] wire98;
  input wire signed [(4'he):(1'h0)] wire97;
  input wire [(4'hd):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(3'h4):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire101;
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  assign y = {wire117,
                 wire113,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire102,
                 wire101,
                 reg119,
                 reg118,
                 reg116,
                 reg115,
                 reg114,
                 reg112,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire101 = wire97;
  assign wire102 = $signed((~&$unsigned((wire96 ? wire97 : wire101))));
  always
    @(posedge clk) begin
      reg103 <= wire98[(3'h4):(2'h2)];
      reg104 <= (((($unsigned(wire99) ~^ wire100[(4'h9):(4'h9)]) ?
              ((wire100 ? wire98 : reg103) ?
                  (reg103 ^~ (8'h9f)) : $signed(wire96)) : $unsigned((wire97 - wire98))) ?
          ($unsigned((wire100 ? wire102 : (7'h42))) ^ ($signed((8'hb0)) ?
              wire100[(4'h9):(3'h6)] : (~^wire96))) : wire97) || (!$signed({$signed(reg103)})));
      reg105 <= (((~&{wire97[(1'h0):(1'h0)]}) ?
          ((-wire102[(3'h5):(3'h4)]) * $unsigned((+(8'hb9)))) : ({((8'hb7) ?
                  wire99 : wire98),
              reg103[(1'h1):(1'h1)]} >> $unsigned($signed(wire102)))) - (reg103[(2'h2):(1'h0)] && $signed(((~^wire96) >>> (~^wire98)))));
      reg106 <= wire101;
      reg107 <= $unsigned((8'ha6));
    end
  assign wire108 = wire99[(3'h7):(3'h6)];
  assign wire109 = ($signed((((reg107 ?
                               (8'hbb) : wire96) <= (wire98 ^ wire98)) ?
                           {(-(8'h9d))} : ((!reg107) && wire102[(5'h12):(3'h6)]))) ?
                       {$signed(wire108[(3'h4):(2'h3)])} : reg104);
  assign wire110 = wire96;
  assign wire111 = wire109[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg112 <= $signed(wire111[(5'h10):(1'h0)]);
    end
  assign wire113 = {reg106,
                       (^~(~(wire111[(1'h0):(1'h0)] ?
                           wire102[(1'h0):(1'h0)] : {wire101})))};
  always
    @(posedge clk) begin
      reg114 <= (wire97[(2'h3):(2'h3)] || $signed($unsigned(((-(7'h41)) != wire109[(2'h3):(2'h2)]))));
      reg115 <= reg107[(4'hb):(4'hb)];
      reg116 <= $signed($unsigned($unsigned((wire99[(4'hb):(4'ha)] + (^~wire100)))));
    end
  assign wire117 = $unsigned(((~&((reg115 <= reg105) * ((8'hac) ?
                           reg112 : (8'ha8)))) ?
                       $unsigned((^(8'hae))) : ($unsigned(wire96[(4'h9):(1'h0)]) >> reg104)));
  always
    @(posedge clk) begin
      reg118 <= $signed(wire109[(3'h4):(2'h2)]);
      reg119 <= (~$signed((reg104 ? (^$unsigned(wire99)) : $unsigned(reg106))));
    end
endmodule
