module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire157;
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire19,
                 wire20,
                 wire21,
                 wire157,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  assign wire4 = (|(wire0[(4'h8):(2'h3)] == {(+wire1), wire2}));
  assign wire5 = wire2[(3'h4):(1'h0)];
  assign wire6 = (+((((wire5 ? (8'hb7) : wire5) ? wire5 : $unsigned(wire5)) ?
                     $unsigned(((7'h40) + wire2)) : (8'ha6)) == (~^{(wire0 ?
                         wire3 : wire0)})));
  assign wire7 = ((8'ha0) ?
                     (8'h9f) : $signed($signed(($signed(wire5) < (wire3 <= wire3)))));
  assign wire8 = (~&(((~(~&wire0)) ? wire4[(1'h1):(1'h1)] : wire5) ?
                     (^((8'ha9) ^ (wire6 >= (8'ha4)))) : (wire7 << (wire3 ?
                         ((8'ha5) != wire6) : $unsigned(wire3)))));
  assign wire9 = (~|$signed((((+wire0) ~^ $unsigned(wire8)) + (wire6[(2'h3):(2'h3)] ^~ (wire8 ?
                     wire6 : wire5)))));
  always
    @(posedge clk) begin
      reg10 <= $unsigned((~&wire4[(4'h8):(2'h3)]));
      reg11 <= wire1[(3'h4):(2'h2)];
      reg12 <= wire0[(4'hc):(4'h8)];
      if (reg11[(3'h5):(1'h1)])
        begin
          reg13 <= ((wire9 ?
                  ((~^wire0) ^~ (wire1[(2'h2):(2'h2)] <= $signed(wire2))) : wire0) ?
              $signed((wire4[(4'ha):(1'h1)] ?
                  (|$unsigned(wire3)) : $signed((~|wire8)))) : (&wire9[(3'h6):(2'h2)]));
          reg14 <= (wire5[(2'h2):(2'h2)] ?
              {(wire3 == wire3), wire2[(1'h1):(1'h1)]} : wire5);
          if ($unsigned((|$signed(reg12))))
            begin
              reg15 <= {reg12[(5'h10):(4'hc)],
                  {(reg11[(3'h6):(3'h4)] ?
                          $signed((wire1 | reg12)) : reg14[(4'ha):(1'h0)]),
                      (reg11 ~^ wire5)}};
              reg16 <= $unsigned((^~(|$signed($unsigned(wire1)))));
            end
          else
            begin
              reg15 <= (reg10 ~^ reg10[(2'h2):(1'h0)]);
              reg16 <= ((|{((-wire0) < $signed(wire3)),
                      (~(wire7 ? wire5 : reg10))}) ?
                  (wire7 << (~&wire0)) : wire9[(4'he):(4'ha)]);
              reg17 <= $unsigned((^(+(^~(reg12 ? wire0 : wire9)))));
              reg18 <= reg17;
            end
        end
      else
        begin
          reg13 <= (&(8'h9c));
          if ($signed({(-wire6[(2'h3):(2'h2)]),
              {($unsigned((8'hbb)) << wire1), wire2}}))
            begin
              reg14 <= (-(wire1 > ($unsigned($signed(wire3)) ?
                  $unsigned(((8'hb4) ? wire0 : wire9)) : (8'hb0))));
              reg15 <= $signed({wire7[(1'h1):(1'h1)]});
            end
          else
            begin
              reg14 <= $unsigned((wire1 + wire7));
              reg15 <= $signed(((8'hb0) ^ reg15));
            end
          reg16 <= wire7[(3'h6):(3'h6)];
          reg17 <= $signed($unsigned($unsigned((((8'hbe) ? reg18 : wire8) ?
              (wire1 ? wire0 : reg12) : (reg10 ^~ (7'h44))))));
        end
    end
  assign wire19 = {$signed($unsigned((&(~|reg12)))),
                      $signed({wire3[(1'h0):(1'h0)]})};
  assign wire20 = $signed($unsigned((reg13 != $unsigned($unsigned(reg16)))));
  assign wire21 = ((+(({(8'hae), reg15} ~^ (^reg10)) ?
                      $signed({wire20,
                          wire8}) : wire9)) <= (+(-$unsigned((wire8 == (8'hb5))))));
  module22 #() modinst158 (.wire25(reg16), .clk(clk), .wire23(wire21), .y(wire157), .wire24(reg12), .wire26(reg14));
endmodule

module module22
#(parameter param156 = {(8'ha8), ((~&(&((7'h44) ? (8'h9e) : (7'h40)))) ? (((8'ha2) <= (+(8'ha2))) ^~ {((8'ha5) ? (8'h9f) : (8'had)), (~&(8'hb8))}) : ((((8'hbf) ~^ (8'ha8)) << ((8'hb3) == (8'hae))) ? (~^((8'had) < (7'h40))) : (((8'ha8) || (8'h9d)) ? ((8'hb3) ? (8'hb2) : (7'h43)) : ((8'haa) ? (8'hb3) : (8'hbf)))))})
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire24;
  input wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire155;
  wire signed [(4'hc):(1'h0)] wire121;
  wire [(5'h12):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire153;
  assign y = {wire155,
                 wire121,
                 wire40,
                 wire28,
                 wire27,
                 wire42,
                 wire43,
                 wire81,
                 wire153,
                 (1'h0)};
  assign wire27 = (~|$unsigned(wire24[(3'h6):(3'h4)]));
  assign wire28 = (wire23 == ($signed((&$unsigned(wire26))) ?
                      wire27 : ((wire24 ?
                              wire26[(3'h5):(2'h3)] : $signed(wire23)) ?
                          wire25 : {(wire27 != wire26),
                              wire26[(3'h6):(3'h4)]})));
  module29 #() modinst41 (wire40, clk, wire27, wire26, wire24, wire25, wire23);
  assign wire42 = $signed((|wire24));
  assign wire43 = ($signed((8'hb5)) ?
                      wire24 : $signed((((^~wire40) >> (wire28 < wire28)) ?
                          ((8'hb0) ?
                              wire24[(4'he):(1'h0)] : $signed(wire27)) : (^(-wire23)))));
  module44 #() modinst82 (.wire48(wire28), .wire45(wire23), .wire47(wire25), .y(wire81), .clk(clk), .wire49(wire43), .wire46(wire24));
  module83 #() modinst122 (.wire88(wire40), .wire86(wire81), .wire85(wire25), .y(wire121), .wire84(wire28), .clk(clk), .wire87(wire23));
  module123 #() modinst154 (wire153, clk, wire27, wire43, wire40, wire25, wire28);
  assign wire155 = $signed(wire153[(3'h4):(2'h2)]);
endmodule

module module123
#(parameter param152 = ((-{((~|(8'hb6)) & ((8'hbc) ? (8'ha8) : (8'ha0))), (((8'ha8) == (8'hb8)) ^ {(8'hb7), (7'h41)})}) ? (!((((7'h44) <= (8'hb5)) - {(8'hbe)}) < ({(8'hac)} >>> ((8'hbb) > (8'hb1))))) : {((~^((8'hb4) != (8'hba))) >> ((-(8'hbf)) ? {(8'hbc)} : (^~(8'ha8)))), (!(((8'ha0) ? (8'hb5) : (8'haf)) || (^(8'ha0))))}))
(y, clk, wire128, wire127, wire126, wire125, wire124);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire128;
  input wire [(2'h3):(1'h0)] wire127;
  input wire [(5'h12):(1'h0)] wire126;
  input wire signed [(4'hc):(1'h0)] wire125;
  input wire signed [(4'hc):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire145;
  wire [(5'h15):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  wire [(3'h7):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire138;
  wire signed [(3'h6):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire133;
  wire signed [(3'h5):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire129;
  reg signed [(2'h3):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  assign y = {wire147,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire131,
                 wire130,
                 wire129,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg146,
                 reg132,
                 (1'h0)};
  assign wire129 = $unsigned($unsigned(wire127));
  assign wire130 = (wire127[(1'h0):(1'h0)] ?
                       (^{({wire126} ?
                               wire129[(4'hd):(3'h4)] : $unsigned((8'ha1)))}) : $signed($unsigned($unsigned({wire126}))));
  assign wire131 = $unsigned((wire130[(3'h5):(3'h5)] ?
                       wire130[(4'h9):(1'h0)] : (($unsigned(wire126) << wire126[(5'h12):(1'h1)]) ?
                           $signed($unsigned(wire126)) : ((wire129 ?
                                   wire127 : (8'hb6)) ?
                               {wire127, wire126} : (wire128 ?
                                   (8'hb2) : wire128)))));
  always
    @(posedge clk) begin
      reg132 <= $unsigned($unsigned((wire128[(2'h3):(2'h2)] >= ({(8'ha3)} ?
          (wire125 ? wire125 : wire128) : wire127))));
    end
  assign wire133 = (^~{$signed($unsigned((wire130 != wire130))),
                       wire130[(3'h7):(3'h4)]});
  assign wire134 = $signed({$signed(wire124), $unsigned(wire127)});
  assign wire135 = {(^$signed(((wire133 ? wire126 : wire126) | (wire129 ?
                           wire127 : wire130)))),
                       (-{wire129})};
  assign wire136 = $unsigned(((~&$unsigned((^~wire128))) <<< ($signed((wire131 <<< wire126)) ?
                       ((wire130 ^ wire128) == $unsigned(wire127)) : $signed($signed(wire128)))));
  assign wire137 = $signed((~&wire130[(4'hb):(3'h7)]));
  assign wire138 = {(wire126[(2'h3):(2'h3)] ?
                           wire133 : $signed($unsigned(wire127))),
                       $unsigned(({(wire130 || wire127), wire128} ?
                           $signed(wire129) : (wire137 ?
                               wire130[(3'h4):(1'h0)] : (wire136 >= (8'ha4)))))};
  assign wire139 = wire134[(2'h2):(1'h0)];
  assign wire140 = $unsigned((wire128 && wire136));
  assign wire141 = $signed((wire133 ?
                       (&wire136[(1'h0):(1'h0)]) : $signed(($signed(wire131) == (~(8'hbd))))));
  assign wire142 = ((($signed($signed(wire129)) + $signed({wire136})) ?
                       $signed($unsigned((^~(8'h9d)))) : $unsigned(wire124[(3'h6):(1'h0)])) + ((((^~wire127) + $signed(wire127)) ?
                       (wire124[(1'h1):(1'h1)] == (wire134 ?
                           wire141 : wire134)) : (((8'had) ?
                               wire129 : wire127) ?
                           (reg132 ?
                               wire127 : wire139) : $signed(wire140))) >= ({$unsigned(reg132),
                       (~&(8'ha7))} ~^ wire134)));
  assign wire143 = $unsigned($signed(($unsigned(wire130) ?
                       $signed(((8'ha4) ?
                           wire130 : wire129)) : $unsigned((wire125 - wire141)))));
  assign wire144 = (($unsigned((^wire135[(4'h9):(3'h4)])) ~^ wire128[(3'h4):(2'h3)]) ?
                       $signed((!wire125[(4'hb):(3'h7)])) : wire130);
  assign wire145 = (wire141 - $signed($signed(reg132[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg146 <= (8'hb5);
    end
  assign wire147 = $unsigned((wire140[(2'h2):(1'h0)] ^~ ($signed((wire141 ?
                           wire137 : reg132)) ?
                       (!$signed(wire140)) : $signed(wire124))));
  always
    @(posedge clk) begin
      reg148 <= wire143;
      reg149 <= ((wire124[(4'hb):(1'h0)] ?
              ((wire137[(3'h5):(3'h5)] ?
                  $signed(wire125) : $signed(wire140)) ^~ (!wire142[(2'h2):(1'h0)])) : $unsigned((wire136[(2'h3):(2'h2)] ?
                  wire147[(1'h1):(1'h0)] : wire131))) ?
          (|(((|wire124) + (wire138 ? reg132 : (7'h40))) ?
              $signed({(8'h9d)}) : wire139[(5'h10):(4'h8)])) : (~|wire139[(5'h10):(3'h5)]));
      reg150 <= wire130[(4'ha):(2'h2)];
      reg151 <= $signed((8'hbc));
    end
endmodule

module module83
#(parameter param120 = (|((~|(~|(^~(8'hb5)))) != (~^(((8'h9e) ? (8'hbf) : (8'h9c)) ? ((8'hbd) >= (8'h9e)) : ((8'hbc) ? (8'ha0) : (8'hb5)))))))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire88;
  input wire signed [(3'h7):(1'h0)] wire87;
  input wire [(4'he):(1'h0)] wire86;
  input wire signed [(5'h12):(1'h0)] wire85;
  input wire [(4'h9):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire119;
  wire [(4'hb):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(4'h8):(1'h0)] wire89;
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
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
                 (1'h0)};
  assign wire89 = (8'hba);
  assign wire90 = ((wire84 ?
                      (^(8'ha1)) : wire88[(4'h9):(1'h1)]) >= $signed($unsigned((wire88[(2'h3):(2'h2)] ?
                      (wire87 + wire85) : $signed((8'ha5))))));
  assign wire91 = (!($signed(wire84[(3'h7):(1'h1)]) * (~(wire86[(3'h5):(2'h2)] ~^ (7'h44)))));
  assign wire92 = $unsigned(($signed($unsigned((wire86 < (8'hbf)))) ?
                      (wire86[(2'h3):(2'h2)] ?
                          $unsigned((wire88 ?
                              wire86 : wire86)) : wire90) : $signed(wire85[(4'hd):(4'h9)])));
  assign wire93 = $signed(wire88);
  assign wire94 = wire88;
  assign wire95 = wire90[(1'h1):(1'h1)];
  assign wire96 = wire93[(3'h4):(3'h4)];
  assign wire97 = (^($signed($signed((wire89 >= wire84))) ?
                      {$signed((|wire88))} : wire84[(4'h9):(3'h6)]));
  always
    @(posedge clk) begin
      reg98 <= wire84;
      if ((!wire96))
        begin
          reg99 <= (~&((-$unsigned(wire84[(4'h8):(3'h4)])) ^~ $unsigned(wire90)));
        end
      else
        begin
          reg99 <= reg99[(3'h7):(1'h1)];
          if ((wire87 - (8'hab)))
            begin
              reg100 <= wire94[(4'hb):(4'h8)];
            end
          else
            begin
              reg100 <= (~^(|wire97[(4'he):(1'h0)]));
              reg101 <= ((($signed($signed((8'ha0))) | $unsigned((&wire96))) ?
                      $unsigned(wire85) : ($signed(wire97) >> $signed(reg99[(5'h12):(5'h12)]))) ?
                  $signed($unsigned(((wire95 ?
                      reg99 : wire91) == $signed(wire90)))) : ((~$unsigned((~&wire91))) ?
                      (8'hb1) : {wire88, {((8'hac) <= wire91), (~&wire96)}}));
            end
          reg102 <= ({$unsigned(reg100[(1'h0):(1'h0)]),
              ((8'h9c) ?
                  (reg100[(3'h5):(3'h5)] >>> $unsigned((8'hab))) : $signed((wire90 ?
                      wire92 : wire90)))} * (reg98[(3'h7):(3'h7)] >> wire94[(1'h1):(1'h0)]));
          reg103 <= (~&$unsigned(wire88[(1'h0):(1'h0)]));
        end
      reg104 <= ((7'h43) ?
          ({$unsigned((wire93 ? (8'hbf) : wire90)),
              (~(wire89 ? reg102 : wire89))} >>> ($unsigned(((8'hac) ?
                  wire95 : reg101)) ?
              ((8'hb0) ?
                  $signed(wire85) : {wire94}) : wire97)) : $signed(wire96[(2'h3):(1'h0)]));
      reg105 <= (~$signed((wire96 ?
          ($unsigned(wire97) >> $unsigned(wire95)) : wire88)));
    end
  always
    @(posedge clk) begin
      reg106 <= $unsigned($unsigned((($signed(wire96) ?
              ((8'hbf) ? wire92 : reg105) : {wire96}) ?
          $signed(wire92) : $unsigned((wire86 ? reg98 : wire92)))));
      if (wire86[(4'ha):(3'h6)])
        begin
          if ((&((~|(~|reg100)) ?
              (($signed(wire93) < (|wire90)) ? reg102 : wire96) : wire95)))
            begin
              reg107 <= $unsigned(wire96);
              reg108 <= wire97[(3'h6):(2'h3)];
            end
          else
            begin
              reg107 <= (wire95[(3'h7):(3'h7)] ?
                  (^(((reg107 ? (8'hac) : wire90) ?
                      (8'ha7) : wire84[(4'h9):(3'h5)]) > (^$unsigned(wire91)))) : (-(reg105 <<< (~(~wire88)))));
              reg108 <= (~^(8'h9f));
              reg109 <= wire87;
              reg110 <= (reg105 - $signed(reg109[(2'h3):(2'h3)]));
            end
          reg111 <= $signed($signed(reg106[(2'h3):(2'h2)]));
          reg112 <= (((&(^$unsigned(reg106))) ^~ $unsigned(reg101[(3'h5):(3'h5)])) ?
              ((|$signed($unsigned(wire87))) ?
                  wire88 : $signed($unsigned($signed(reg106)))) : (wire97[(1'h0):(1'h0)] ?
                  (reg101[(3'h4):(2'h2)] ?
                      {wire84,
                          (wire96 > wire93)} : reg102[(2'h2):(1'h0)]) : (reg111[(3'h6):(2'h3)] ~^ ({reg101,
                          reg100} ?
                      (8'hbd) : reg100))));
          reg113 <= (~|$unsigned(wire91[(1'h1):(1'h0)]));
        end
      else
        begin
          reg107 <= {$unsigned($signed(wire85[(5'h10):(5'h10)])),
              reg111[(3'h7):(1'h0)]};
        end
      reg114 <= wire89;
      reg115 <= $unsigned((+($unsigned((8'ha5)) ?
          (wire95[(2'h3):(1'h0)] ? $unsigned(wire86) : (~|wire85)) : (((8'hb0) ?
                  reg104 : reg103) ?
              reg107[(3'h6):(3'h6)] : ((8'hb1) ? reg106 : reg99)))));
    end
  assign wire116 = (((($signed(reg107) ?
                       (wire86 ?
                           wire90 : reg100) : (^reg100)) || {wire84}) * reg101) * (^(8'hab)));
  assign wire117 = reg110;
  assign wire118 = (~^$unsigned(($unsigned((reg104 ?
                       wire84 : wire89)) | (&((8'h9c) + reg99)))));
  assign wire119 = $signed({wire90, wire93});
endmodule

module module44  (y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire49;
  input wire [(5'h10):(1'h0)] wire48;
  input wire [(4'hf):(1'h0)] wire47;
  input wire [(5'h13):(1'h0)] wire46;
  input wire [(4'hf):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire53;
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire62,
                 wire61,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg60,
                 reg59,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= wire49[(3'h5):(2'h2)];
      reg51 <= (((reg50 ?
          (wire47[(4'hf):(4'hd)] != (wire49 & wire46)) : $signed((wire48 ?
              wire48 : wire47))) || wire49[(4'h8):(3'h6)]) < {$unsigned((|(reg50 ?
              wire46 : wire49))),
          {wire48[(4'he):(3'h6)], wire49}});
      reg52 <= ((~^{wire45}) ? wire45 : (~|$unsigned(wire46[(4'ha):(4'h9)])));
    end
  assign wire53 = (reg51[(4'hd):(4'hc)] | (reg51[(4'ha):(4'h9)] ?
                      $signed(wire47[(4'hf):(3'h4)]) : (-$unsigned(wire47))));
  assign wire54 = (!($signed((wire49[(3'h4):(1'h1)] ?
                          wire45[(3'h6):(3'h6)] : (-wire53))) ?
                      $unsigned((~^wire46[(4'h8):(4'h8)])) : wire48));
  assign wire55 = reg52;
  assign wire56 = (^~$signed($signed($unsigned($signed(wire49)))));
  assign wire57 = (^(8'hbb));
  assign wire58 = $unsigned($signed($unsigned(({(8'haa)} <= reg51[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg59 <= ($unsigned($unsigned(reg52)) ? reg51[(4'hd):(3'h7)] : wire49);
      reg60 <= (8'h9c);
    end
  assign wire61 = wire56;
  assign wire62 = (+{wire56[(4'hb):(1'h0)],
                      $signed({(wire57 ? wire47 : wire45),
                          ((8'h9f) - wire57)})});
  always
    @(posedge clk) begin
      reg63 <= wire56;
      reg64 <= $signed((+(($unsigned(wire45) >= (wire58 ? (8'haf) : (7'h44))) ?
          $unsigned($signed((8'h9f))) : wire49)));
      reg65 <= ($unsigned((reg64 || wire46[(5'h10):(3'h5)])) ?
          $signed($unsigned($signed((8'h9c)))) : $unsigned(((wire49[(4'h8):(3'h6)] << wire58[(4'hc):(3'h4)]) ?
              (wire62[(2'h3):(2'h2)] ?
                  $unsigned(reg60) : $signed(reg63)) : {(wire57 ?
                      wire46 : (8'hbf)),
                  (wire45 && reg63)})));
    end
  always
    @(posedge clk) begin
      reg66 <= (wire47 <<< {(+wire49), wire48[(4'hf):(4'hc)]});
      reg67 <= (((reg60 ?
              wire48[(4'hb):(4'hb)] : ($signed((7'h42)) <<< (wire48 ^~ wire57))) ?
          (($signed(wire62) ?
              {reg65,
                  reg63} : (-(8'hb9))) == reg66) : wire57) << (-wire54[(1'h0):(1'h0)]));
      if ({((($signed(wire53) & (&(8'ha5))) - {(^~wire46)}) ~^ (~&((wire53 ^ reg52) ^ (&(8'h9d)))))})
        begin
          reg68 <= (~(reg59[(5'h13):(1'h1)] ?
              wire55 : ((reg64 << reg52[(1'h0):(1'h0)]) ?
                  ((&reg52) - (^wire55)) : ((wire47 << wire49) ?
                      (8'ha8) : reg64[(5'h15):(5'h13)]))));
        end
      else
        begin
          reg68 <= wire61[(4'hc):(4'h8)];
          if (({wire46, reg65} ? (&($unsigned((^~reg63)) + wire46)) : wire45))
            begin
              reg69 <= $unsigned((wire58[(4'hc):(4'ha)] > $signed((^reg67))));
              reg70 <= ({reg65,
                  $unsigned(((reg68 ?
                      reg65 : reg51) - wire57[(1'h1):(1'h1)]))} ~^ ($signed($unsigned((wire46 ?
                      wire62 : (8'hae)))) ?
                  ($unsigned((reg68 ^ wire53)) < (~^reg60)) : wire46));
            end
          else
            begin
              reg69 <= reg52[(1'h1):(1'h0)];
              reg70 <= (((~|wire57[(3'h5):(1'h0)]) ?
                  {$signed(reg63),
                      reg70} : $unsigned(wire48)) == reg68[(5'h12):(5'h11)]);
              reg71 <= $unsigned(reg65);
              reg72 <= $unsigned(((-($unsigned(reg67) << wire56[(2'h2):(1'h1)])) ?
                  reg69 : (($signed((8'hb4)) ?
                      wire54[(4'h9):(1'h1)] : reg60) | ($signed(wire45) ?
                      (reg60 < wire53) : {reg67}))));
            end
          reg73 <= (reg65 ? reg70[(2'h2):(1'h1)] : wire46);
          reg74 <= (~&((reg67[(3'h6):(2'h3)] & ({wire56, wire49} ?
              $signed(wire45) : reg71[(4'hb):(4'ha)])) || $unsigned((^~((8'hb6) | reg72)))));
        end
      reg75 <= $signed(((wire49 ^ wire55) == $signed({reg51, (-(8'ha8))})));
    end
  assign wire76 = wire45[(3'h4):(2'h3)];
  assign wire77 = reg72;
  assign wire78 = wire48;
  assign wire79 = wire58[(4'hd):(2'h2)];
  assign wire80 = (((|$unsigned((wire55 ? wire62 : wire56))) ?
                          wire61[(4'hc):(3'h6)] : (({wire45} * reg72) ?
                              $signed(reg64) : ({reg66, reg59} ?
                                  {wire53, reg60} : wire58))) ?
                      (!(8'ha8)) : reg72);
endmodule

module module29
#(parameter param39 = ({(^~(((8'hbc) ~^ (8'had)) ? (!(8'ha1)) : ((8'hab) && (7'h42)))), {((~|(8'had)) >>> (&(8'h9c)))}} ? {(8'h9d)} : ({(((8'hbd) << (8'ha4)) >>> ((8'hb4) * (8'ha9)))} > {(((7'h43) ? (8'ha1) : (8'hb7)) ? ((8'h9e) <= (7'h43)) : ((8'h9c) + (8'haa)))})))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h22):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire [(3'h6):(1'h0)] wire33;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(3'h4):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  assign y = {wire38, wire37, wire36, wire35, (1'h0)};
  assign wire35 = ((~^wire34) ?
                      {wire34,
                          ($signed(wire34) ?
                              ($signed((8'hb3)) ?
                                  {(8'hb5)} : wire30[(2'h3):(1'h0)]) : ((~wire32) ?
                                  (^(8'haf)) : {wire34}))} : (~&((((8'hbb) >= wire33) << wire33[(3'h6):(2'h3)]) ~^ wire34)));
  assign wire36 = (~|$signed((~&($unsigned(wire30) == ((8'ha1) ?
                      wire34 : wire30)))));
  assign wire37 = (({wire36[(4'ha):(1'h0)],
                          ($signed(wire36) ?
                              wire30[(1'h0):(1'h0)] : $signed(wire34))} ?
                      {((wire31 ? (8'hbe) : wire36) ? (8'ha7) : (7'h43)),
                          wire31} : {wire36,
                          (wire34 ?
                              wire36 : (!(8'hbd)))}) | $signed($unsigned($unsigned((wire31 == wire35)))));
  assign wire38 = wire31[(3'h5):(3'h4)];
endmodule
