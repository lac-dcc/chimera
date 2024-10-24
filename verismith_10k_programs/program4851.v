module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire145;
  wire signed [(5'h13):(1'h0)] wire144;
  wire [(4'h9):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire122;
  wire [(4'hc):(1'h0)] wire123;
  wire signed [(3'h7):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire142;
  wire [(4'hc):(1'h0)] wire147;
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire120,
                 wire6,
                 wire5,
                 wire4,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire127,
                 wire142,
                 wire147,
                 reg150,
                 reg149,
                 (1'h0)};
  assign wire4 = wire3[(1'h0):(1'h0)];
  assign wire5 = (+wire1[(4'hc):(4'hb)]);
  assign wire6 = wire2;
  module7 #() modinst121 (.wire8(wire2), .clk(clk), .wire12(wire4), .y(wire120), .wire9(wire5), .wire10(wire6), .wire11(wire1));
  assign wire122 = ({($signed(wire6) ^~ ({wire0, wire0} ^ (wire120 ?
                           wire5 : wire1))),
                       (8'hb1)} >> ((((wire0 & wire4) ?
                       $signed(wire120) : (-wire6)) <<< ($signed(wire3) ?
                       wire2[(4'hd):(3'h6)] : $signed(wire3))) <= ($signed(wire5[(5'h11):(2'h3)]) < $signed($unsigned(wire1)))));
  assign wire123 = ({wire6} ?
                       (~&$unsigned($unsigned($signed(wire122)))) : ($unsigned($unsigned(wire3[(5'h10):(3'h5)])) < wire6[(4'h9):(1'h1)]));
  assign wire124 = wire1[(3'h6):(2'h2)];
  assign wire125 = $signed({($unsigned($signed(wire2)) ?
                           (~$signed(wire0)) : (((8'hb7) ? wire3 : wire4) ?
                               (~^(8'hb0)) : wire2[(3'h5):(1'h1)]))});
  assign wire126 = $unsigned((^wire123));
  assign wire127 = (((wire1[(4'h8):(1'h1)] == $signed(((8'hb7) ?
                               (8'haf) : wire6))) ?
                           (|(~&(wire122 ?
                               wire120 : wire6))) : $unsigned(((&wire126) ?
                               $signed(wire120) : wire122))) ?
                       $unsigned({((wire123 ?
                               wire122 : (8'hb2)) > {wire6})}) : wire5);
  module128 #() modinst143 (.y(wire142), .wire130(wire4), .wire132(wire127), .wire131(wire3), .wire129(wire6), .wire133(wire125), .clk(clk));
  assign wire144 = (wire4[(4'h9):(1'h0)] ?
                       ($unsigned($signed((~^wire125))) ?
                           $signed(wire3[(4'ha):(1'h0)]) : $signed(($signed(wire120) <<< (~&wire3)))) : wire123[(4'h9):(1'h0)]);
  module89 #() modinst146 (.wire90(wire120), .clk(clk), .wire93(wire142), .wire91(wire0), .wire94(wire125), .wire92(wire123), .y(wire145));
  module17 #() modinst148 (wire147, clk, wire145, wire144, wire125, wire2, wire1);
  always
    @(posedge clk) begin
      reg149 <= ((+(wire122 ?
          ({wire144, (8'ha7)} ?
              wire0[(4'hb):(1'h0)] : $signed(wire122)) : (wire6[(4'hd):(1'h0)] ?
              ((8'hb4) ?
                  wire125 : wire5) : (wire124 ^ (8'ha9))))) > $unsigned(((wire6 - ((8'ha2) >> wire0)) == (|wire144))));
      reg150 <= $unsigned((((wire120[(3'h5):(3'h5)] * wire1[(4'ha):(4'h9)]) ?
              $signed(wire122) : (wire2[(2'h2):(1'h1)] < (wire120 ?
                  wire4 : (8'hb1)))) ?
          (((wire144 ? wire147 : wire123) ?
              (wire5 ?
                  wire2 : wire125) : wire145) | ((wire142 ~^ wire2) != (7'h41))) : $unsigned(wire125[(3'h5):(1'h1)])));
    end
endmodule

module module128  (y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire133;
  input wire [(5'h13):(1'h0)] wire132;
  input wire signed [(3'h7):(1'h0)] wire131;
  input wire signed [(4'hb):(1'h0)] wire130;
  input wire [(3'h4):(1'h0)] wire129;
  wire signed [(4'hb):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire [(4'he):(1'h0)] wire138;
  wire [(4'he):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire134;
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 (1'h0)};
  assign wire134 = wire133;
  assign wire135 = {wire133,
                       (+$unsigned((((8'hbe) ? wire133 : wire133) ?
                           wire131 : (7'h42))))};
  assign wire136 = $signed(wire134[(2'h2):(2'h2)]);
  assign wire137 = wire134[(1'h1):(1'h0)];
  assign wire138 = wire130[(3'h6):(3'h6)];
  assign wire139 = (8'ha3);
  assign wire140 = $unsigned($unsigned($signed(((wire135 ? wire139 : wire138) ?
                       $unsigned((8'ha0)) : wire134))));
  assign wire141 = $unsigned(wire131);
endmodule

module module7
#(parameter param119 = (^((8'hbf) ? ((((8'ha4) ? (8'haf) : (8'hb1)) * ((8'h9c) != (8'h9e))) ? (8'hb0) : (~^((8'h9f) ^~ (8'hb7)))) : ((((7'h40) ? (8'hb6) : (8'ha9)) ~^ (!(8'ha1))) && (((8'ha1) - (8'h9c)) ? ((8'ha2) - (8'hbb)) : ((8'hb5) ? (8'ha0) : (8'hb7)))))))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(4'ha):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(5'h13):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire114;
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire14,
                 wire15,
                 wire16,
                 wire54,
                 wire56,
                 wire57,
                 wire58,
                 wire83,
                 wire85,
                 wire86,
                 wire114,
                 reg88,
                 reg87,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= (~&wire12);
    end
  assign wire14 = (($signed(((wire12 ? wire11 : wire10) ?
                          $signed(wire12) : reg13[(1'h0):(1'h0)])) + reg13) ?
                      wire11[(5'h12):(4'ha)] : wire9[(2'h2):(2'h2)]);
  assign wire15 = ($signed($unsigned({(+wire14), (wire10 ? wire10 : wire14)})) ?
                      (^{$unsigned(wire12[(3'h6):(2'h3)])}) : {($unsigned(wire9) ?
                              (reg13[(1'h0):(1'h0)] ?
                                  $signed(wire9) : $signed((8'h9e))) : ({wire11} <<< (~|reg13))),
                          $unsigned(($signed(wire11) ~^ $signed(wire14)))});
  assign wire16 = wire12;
  module17 #() modinst55 (wire54, clk, wire15, reg13, wire9, wire16, wire10);
  assign wire56 = (wire14 << ((8'h9f) > ({((8'ha8) ? wire54 : wire14)} ?
                      {$unsigned((8'had))} : ((wire9 >= wire10) && $signed(wire54)))));
  assign wire57 = $unsigned($signed($unsigned((~^{wire56}))));
  assign wire58 = $signed($signed($signed(($unsigned(wire8) * wire9[(3'h5):(1'h1)]))));
  module59 #() modinst84 (wire83, clk, wire56, wire11, wire15, wire8);
  assign wire85 = wire14[(3'h5):(3'h5)];
  assign wire86 = reg13[(4'ha):(4'ha)];
  always
    @(posedge clk) begin
      reg87 <= wire83;
      reg88 <= reg13[(2'h2):(1'h1)];
    end
  module89 #() modinst115 (.clk(clk), .wire92(wire86), .wire94(wire54), .wire90(wire85), .y(wire114), .wire93(wire16), .wire91(wire11));
  assign wire116 = $unsigned(wire12[(2'h2):(1'h1)]);
  assign wire117 = {(^~wire116)};
  assign wire118 = $signed(wire14[(3'h4):(2'h3)]);
endmodule

module module89
#(parameter param112 = (|(~|(!((8'haa) <= ((8'hb4) - (8'hba)))))), 
parameter param113 = (~&(+(8'haf))))
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire94;
  input wire signed [(5'h15):(1'h0)] wire93;
  input wire signed [(4'hc):(1'h0)] wire92;
  input wire [(4'hc):(1'h0)] wire91;
  input wire signed [(4'h9):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire108;
  wire [(2'h3):(1'h0)] wire107;
  wire signed [(4'hd):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  assign y = {wire111,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire96,
                 wire95,
                 reg110,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire95 = $unsigned({$signed({wire92[(4'h9):(2'h3)], (^~wire90)})});
  assign wire96 = $signed(wire91);
  always
    @(posedge clk) begin
      reg97 <= $unsigned(({wire93[(4'h9):(3'h6)], $signed((wire96 == wire94))} ?
          $unsigned(wire93[(4'hb):(3'h4)]) : wire94));
      reg98 <= $signed((({wire91,
          (^reg97)} <<< $signed($unsigned((8'ha0)))) ^~ wire90));
    end
  always
    @(posedge clk) begin
      reg99 <= ((((((8'ha7) < wire94) || wire90[(3'h7):(1'h0)]) ?
              $unsigned(wire93) : ($signed(reg98) <= (wire92 ?
                  (8'ha7) : wire91))) ?
          (|($unsigned(wire94) <= (reg98 << wire93))) : {wire91[(4'h8):(2'h3)]}) >= (wire94 ?
          $unsigned(({wire94} == (|wire91))) : $signed(({wire91} ?
              (wire93 ? reg97 : wire92) : $signed(wire93)))));
      if ((|(8'hb6)))
        begin
          reg100 <= $signed(((7'h41) >= reg98[(4'hb):(2'h3)]));
          reg101 <= ($signed($signed((wire96 << (wire95 <= wire95)))) ?
              (reg98[(2'h3):(1'h0)] * (($signed(wire96) ?
                  {wire93} : $unsigned(reg98)) - (wire95 >>> wire92[(3'h6):(3'h5)]))) : wire96);
        end
      else
        begin
          reg100 <= (reg99[(1'h0):(1'h0)] > reg100[(4'hb):(2'h2)]);
          if ({wire94[(2'h3):(2'h3)]})
            begin
              reg101 <= $unsigned(((-$unsigned({wire93, (8'ha6)})) ?
                  $unsigned({(~&(8'ha1))}) : (-(~|(wire95 ?
                      wire90 : wire95)))));
              reg102 <= wire94;
              reg103 <= (((8'hb0) ?
                  ((reg102 ? $unsigned(wire93) : reg98) ?
                      wire93[(1'h0):(1'h0)] : ({wire92, wire96} ?
                          reg97 : (~|reg100))) : (~&{(-(8'h9e)),
                      $signed(wire94)})) <= $unsigned((reg99[(1'h0):(1'h0)] > reg102)));
              reg104 <= reg101;
            end
          else
            begin
              reg101 <= ((~^($signed(wire94) << $signed($signed(wire92)))) ?
                  (^~(^reg98)) : (wire91[(2'h3):(2'h3)] >> ((reg99[(2'h3):(2'h2)] ?
                          (wire91 * wire96) : $unsigned(reg102)) ?
                      (7'h40) : ((reg104 >> reg97) - (wire94 ?
                          (8'ha2) : wire93)))));
              reg102 <= wire90;
              reg103 <= reg101[(2'h3):(2'h2)];
              reg104 <= $signed($unsigned({reg101}));
              reg105 <= ($unsigned(reg97[(4'hb):(4'h8)]) * (($unsigned((~|reg100)) ?
                      $signed(reg97[(4'he):(4'h9)]) : $signed((reg102 == wire90))) ?
                  $signed((8'ha4)) : wire96[(4'ha):(1'h0)]));
            end
        end
    end
  assign wire106 = wire95;
  assign wire107 = $signed(reg99);
  assign wire108 = $unsigned((wire106 ?
                       {wire94[(3'h4):(1'h1)]} : (reg104 ?
                           $unsigned(reg102[(2'h3):(1'h1)]) : ({wire93,
                               wire94} ^ {wire92}))));
  assign wire109 = $unsigned($unsigned($unsigned(($signed(reg104) ?
                       $unsigned(wire93) : ((7'h43) ? (8'hb7) : wire91)))));
  always
    @(posedge clk) begin
      reg110 <= reg99[(2'h2):(2'h2)];
    end
  assign wire111 = $signed({(~|reg99[(1'h1):(1'h0)]), reg102[(2'h2):(2'h2)]});
endmodule

module module59
#(parameter param82 = (((+(((7'h42) ? (8'hb7) : (8'h9e)) <<< {(7'h43)})) >= (({(8'h9d), (8'hbc)} ? {(8'hae)} : (8'hb0)) ? (&{(8'ha1)}) : (+(^(8'hbf))))) ? (((^((8'ha8) <<< (8'hab))) && (&(^(8'h9d)))) || ((&{(8'h9d)}) && ((-(8'hbe)) ? {(8'hb8), (8'hb8)} : (~^(8'ha0))))) : (((((8'hbf) ? (8'hbb) : (8'ha6)) ? ((8'hb9) && (8'ha0)) : ((8'ha6) ? (8'haa) : (8'h9c))) ~^ ({(8'h9f)} <= ((8'h9f) >> (7'h40)))) || (~|(((8'hb7) + (8'h9d)) ^~ ((8'ha6) >>> (8'hb3)))))))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire63;
  input wire [(4'h8):(1'h0)] wire62;
  input wire [(4'hf):(1'h0)] wire61;
  input wire [(5'h14):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire64;
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire64 = ((|wire62[(1'h0):(1'h0)]) | (wire62[(2'h2):(1'h1)] ?
                      {$signed(wire62[(3'h5):(1'h1)]),
                          $unsigned(wire63)} : wire60[(4'he):(4'h9)]));
  assign wire65 = wire64;
  assign wire66 = ({(8'ha7)} | {({(wire64 ? (8'ha8) : wire63)} ^ wire64),
                      ({(wire63 ? wire63 : (8'hb9)),
                              ((8'hac) ? (8'hb1) : wire64)} ?
                          (8'hab) : (~^(wire60 ? (8'haa) : wire64)))});
  assign wire67 = (~^((-(((8'had) ? wire65 : wire60) ?
                      wire61 : (wire60 <= (8'haf)))) << wire66[(3'h6):(2'h3)]));
  assign wire68 = ((({(wire60 << wire66), $signed(wire66)} ?
                          ({wire66} & (wire63 - wire67)) : ($signed(wire65) && (wire66 ?
                              wire62 : wire66))) ~^ (((~^wire63) ?
                              (~^wire66) : wire61[(2'h2):(1'h1)]) ?
                          wire66[(3'h4):(1'h1)] : (wire67 & wire62[(1'h1):(1'h0)]))) ?
                      wire63 : (wire65[(4'h9):(4'h9)] && (8'ha4)));
  assign wire69 = wire65;
  assign wire70 = wire68;
  assign wire71 = ({(|(^~$signed(wire64)))} - {$unsigned(((8'hae) ?
                          (~wire62) : $signed(wire62))),
                      {wire60[(4'he):(4'hb)]}});
  assign wire72 = ($unsigned(wire67[(3'h5):(3'h4)]) ^~ {{(+(wire63 + wire67))},
                      ((wire69[(1'h1):(1'h1)] & $unsigned(wire63)) >> wire71)});
  assign wire73 = $signed(wire65[(3'h7):(3'h7)]);
  always
    @(posedge clk) begin
      reg74 <= (($unsigned(wire64) ?
              $unsigned($unsigned($signed((8'ha0)))) : (wire73 ~^ $signed((wire72 ?
                  wire71 : wire63)))) ?
          {(wire63 ?
                  {(wire66 ? wire72 : wire62)} : ($unsigned((8'hb0)) ?
                      ((8'hb6) == wire62) : $unsigned(wire66))),
              ($unsigned((&wire73)) ?
                  (wire69 << {wire62, wire71}) : ($signed(wire68) ?
                      wire68[(4'h9):(4'h9)] : (~|(8'hb2))))} : (&wire68));
      reg75 <= reg74;
      reg76 <= wire60[(4'h8):(3'h7)];
      if (($signed(($signed($signed(wire68)) || wire72)) ?
          (^~($signed({wire62}) ?
              ((!reg74) && (wire60 ? (8'ha4) : wire68)) : {$signed(reg74),
                  wire63[(4'ha):(4'ha)]})) : (~^$signed((^$signed(wire63))))))
        begin
          reg77 <= reg76[(4'hb):(4'h8)];
          reg78 <= (((wire68 ?
              (~&((8'ha2) - wire65)) : (^(+wire65))) << wire66[(1'h0):(1'h0)]) && (~&($signed(wire65) >> ($signed(wire71) | $unsigned(wire66)))));
        end
      else
        begin
          reg77 <= (~|({$signed($unsigned(wire63)),
              $signed($unsigned(reg78))} == wire63));
          reg78 <= (reg78 == wire71[(3'h5):(1'h1)]);
          reg79 <= (((&wire60[(2'h2):(2'h2)]) ?
                  wire66 : ($unsigned($unsigned(reg74)) & ({(8'ha1)} ?
                      (wire61 == wire63) : (wire71 ? wire62 : wire73)))) ?
              (reg75[(3'h6):(3'h6)] ?
                  reg78 : (wire64 ?
                      $unsigned(wire66[(2'h2):(1'h1)]) : $unsigned(wire69))) : $unsigned($signed(((wire71 ?
                      (8'hba) : wire60) ?
                  $signed(reg75) : $signed(wire72)))));
          reg80 <= wire66;
          reg81 <= wire62[(1'h1):(1'h0)];
        end
    end
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire21;
  input wire [(5'h13):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire28;
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  assign y = {wire53,
                 wire38,
                 wire37,
                 wire30,
                 wire29,
                 wire28,
                 reg52,
                 reg51,
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
                 reg39,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= (8'hb0);
      reg24 <= {wire18[(2'h3):(1'h1)], (^~{wire18[(2'h2):(2'h2)]})};
      reg25 <= $signed($unsigned(wire20[(3'h6):(3'h6)]));
      reg26 <= $unsigned($unsigned(wire22));
      reg27 <= ($unsigned((wire18[(1'h1):(1'h0)] & $unsigned(reg24))) ?
          {$unsigned($unsigned((wire20 >= reg23)))} : ($signed(reg25[(5'h15):(5'h13)]) != (|(~|wire18[(2'h2):(1'h1)]))));
    end
  assign wire28 = $unsigned(($signed($signed(reg23[(2'h3):(1'h0)])) ?
                      ((wire20[(5'h10):(4'hd)] ?
                              wire21[(4'he):(4'h9)] : $unsigned((8'had))) ?
                          $unsigned(reg25) : wire18) : (7'h44)));
  assign wire29 = reg23[(2'h2):(2'h2)];
  assign wire30 = wire28[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg31 <= wire22[(4'h8):(3'h4)];
      reg32 <= reg25;
      reg33 <= wire28;
      if ((reg25[(5'h11):(3'h7)] ?
          (~&({$signed(wire20),
              wire18} >> $unsigned(wire29[(3'h7):(3'h4)]))) : {(~&$unsigned((reg32 ?
                  (8'ha1) : reg27)))}))
        begin
          reg34 <= $signed(((wire18[(3'h4):(2'h2)] & (^~$signed(reg25))) ?
              (^~wire20) : {wire29, wire20[(2'h2):(1'h0)]}));
          reg35 <= wire28;
          if ($unsigned((reg32 ?
              ($unsigned((reg32 >= reg33)) ?
                  $unsigned(reg25[(4'hb):(3'h4)]) : (reg34 * $signed(reg25))) : wire20)))
            begin
              reg36 <= {reg31, wire18[(2'h3):(1'h0)]};
            end
          else
            begin
              reg36 <= (~reg27);
            end
        end
      else
        begin
          reg34 <= $signed((!{($unsigned(wire21) == $unsigned(wire30)),
              ($unsigned(reg31) << (&wire29))}));
        end
    end
  assign wire37 = ($unsigned($signed(reg23)) ? wire29 : reg27);
  assign wire38 = ((-reg26) ?
                      (&(8'hbb)) : $unsigned($unsigned(wire30[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg39 <= (8'ha1);
      if ((($unsigned(wire30) ?
          ($signed(reg27) ?
              reg27[(2'h2):(1'h1)] : ((wire20 ?
                  reg26 : (8'ha8)) <<< (wire18 >= (8'hac)))) : (+reg26)) + wire20[(5'h13):(3'h7)]))
        begin
          if ((($unsigned($signed((~&reg35))) >>> wire19) <<< (reg23 || reg23)))
            begin
              reg40 <= $unsigned(reg32[(4'ha):(2'h3)]);
              reg41 <= wire18;
              reg42 <= $unsigned((-$unsigned(reg31[(1'h0):(1'h0)])));
            end
          else
            begin
              reg40 <= $signed($signed($unsigned($signed(wire28))));
              reg41 <= ($unsigned(wire28[(4'h9):(3'h4)]) ?
                  reg36 : (((wire28 != {(8'hb7), (8'ha9)}) ?
                      ($unsigned((7'h42)) ^ (wire37 == (8'hb4))) : $signed(wire20)) <= {(8'hba)}));
              reg42 <= (reg34 == (7'h42));
              reg43 <= (8'hb3);
            end
          reg44 <= (~reg39[(3'h4):(3'h4)]);
        end
      else
        begin
          reg40 <= $unsigned((^~$signed(reg40[(3'h5):(2'h3)])));
          reg41 <= (^~($signed(($signed(wire38) ?
                  (wire20 ? wire28 : reg40) : reg31)) ?
              $unsigned($signed($unsigned(wire29))) : {((8'hbb) ?
                      reg31 : $unsigned(reg34)),
                  $unsigned(wire19)}));
          reg42 <= reg39[(1'h1):(1'h0)];
          if ((^~$signed((wire19[(1'h1):(1'h0)] ^ (+(wire18 ?
              reg42 : reg24))))))
            begin
              reg43 <= $signed(({wire38[(2'h2):(2'h2)],
                  $unsigned({wire22})} >> (reg35 ~^ wire22)));
              reg44 <= ({($unsigned({(8'ha2)}) && (!wire18))} ?
                  wire38[(4'hd):(4'hb)] : wire37[(4'ha):(4'ha)]);
              reg45 <= ({($unsigned((wire37 ? reg34 : reg35)) ?
                      (((8'ha9) ?
                          reg44 : reg44) >= $unsigned((8'hbe))) : (reg43 ?
                          (reg40 >> reg23) : reg39[(4'hb):(1'h0)])),
                  ($signed($unsigned(reg27)) ?
                      wire19 : reg23[(3'h4):(2'h2)])} == ((((reg34 ?
                      wire30 : reg44) ^ $unsigned((8'hbc))) ?
                  $unsigned((~&reg26)) : wire19[(4'h8):(3'h7)]) && ($signed((~&(7'h42))) ?
                  wire30[(2'h2):(1'h0)] : wire37)));
              reg46 <= reg34[(3'h4):(1'h1)];
              reg47 <= $unsigned($signed(wire38[(2'h3):(1'h1)]));
            end
          else
            begin
              reg43 <= (^reg39);
              reg44 <= $signed((~^(~^($signed((8'hbf)) ?
                  (reg33 ? reg39 : reg47) : wire29))));
              reg45 <= (8'hae);
            end
          if ((&wire28))
            begin
              reg48 <= (8'ha4);
            end
          else
            begin
              reg48 <= $unsigned((wire22[(4'h9):(3'h6)] != $unsigned((wire28[(4'hd):(3'h4)] && ((8'hb8) ~^ wire29)))));
              reg49 <= {$unsigned(reg24), $signed((!reg41))};
              reg50 <= $signed($signed(reg32));
              reg51 <= reg42[(3'h5):(3'h5)];
              reg52 <= (+$unsigned(reg46[(3'h4):(3'h4)]));
            end
        end
    end
  assign wire53 = (reg24 ~^ wire30[(1'h1):(1'h1)]);
endmodule
