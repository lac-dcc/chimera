module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h255):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire107;
  wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire105;
  reg [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(5'h13):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire111,
                 wire107,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire105,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
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
                 reg114,
                 reg113,
                 reg112,
                 reg110,
                 reg109,
                 reg108,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = ((($unsigned($unsigned((8'ha8))) << wire3[(4'h8):(3'h4)]) ?
                     wire0 : $unsigned(((wire1 ? wire1 : wire2) ?
                         (wire0 ?
                             wire2 : (8'ha2)) : $signed(wire1)))) < (wire1 != (~&wire3[(3'h6):(2'h3)])));
  assign wire5 = wire0[(1'h0):(1'h0)];
  assign wire6 = (-(wire1 ?
                     ((wire5[(1'h0):(1'h0)] - wire1[(4'h9):(4'h9)]) | (~$signed(wire3))) : (~&(!wire0))));
  assign wire7 = ($unsigned(wire1) ?
                     ($unsigned(({wire2, wire4} ? (8'hbf) : (~|(8'ha0)))) ?
                         wire0[(2'h3):(1'h1)] : {$signed((wire5 >> wire6))}) : (|(($signed(wire3) == $unsigned((8'h9c))) ~^ (8'h9c))));
  assign wire8 = $unsigned(($signed(wire2[(2'h2):(2'h2)]) + $signed((!(wire7 ?
                     wire5 : wire0)))));
  assign wire9 = (^$signed((8'ha1)));
  assign wire10 = wire4;
  always
    @(posedge clk) begin
      reg11 <= ({wire7[(4'ha):(1'h0)]} != $unsigned(($signed(wire2) == ((~wire7) ?
          wire4[(1'h1):(1'h1)] : $unsigned(wire0)))));
      reg12 <= {wire0};
      reg13 <= wire10;
      reg14 <= $signed((~|(wire2 && $unsigned(wire9[(1'h1):(1'h1)]))));
      reg15 <= ((-$signed($signed($signed(reg11)))) ?
          ((($signed(reg14) << $signed(reg13)) & ($signed(wire2) >>> (wire8 ^~ wire7))) ?
              $signed(wire8) : (~|(|(wire10 >>> (8'haf))))) : (wire9[(4'h8):(4'h8)] ^~ $signed($unsigned(wire5[(2'h2):(2'h2)]))));
    end
  module16 #() modinst106 (.wire19(reg14), .wire17(wire2), .wire20(reg15), .wire18(wire5), .clk(clk), .wire21(wire4), .y(wire105));
  assign wire107 = wire3;
  always
    @(posedge clk) begin
      if (reg14)
        begin
          reg108 <= wire0;
        end
      else
        begin
          reg108 <= (wire4 && {reg11, reg108});
        end
      reg109 <= (((!({wire10} != $unsigned(wire6))) ?
          reg13[(3'h5):(3'h5)] : wire1[(3'h7):(3'h4)]) >>> ((+$unsigned($signed((8'had)))) ^ (+wire5)));
      reg110 <= wire107[(4'hb):(2'h2)];
    end
  assign wire111 = wire105;
  always
    @(posedge clk) begin
      if (wire5)
        begin
          if (wire6[(3'h5):(3'h5)])
            begin
              reg112 <= $signed($unsigned(reg11[(5'h10):(4'hb)]));
              reg113 <= reg15;
              reg114 <= $signed($signed(($unsigned((wire7 ~^ reg112)) == wire4)));
              reg115 <= $unsigned(({($unsigned(reg12) ?
                      wire3[(2'h2):(2'h2)] : wire2),
                  (wire0[(1'h1):(1'h1)] ?
                      $unsigned(wire105) : $signed(reg114))} > reg109[(1'h1):(1'h0)]));
              reg116 <= ({reg13} ?
                  (^(((+wire7) && (^reg114)) || (!{(8'hb4)}))) : $unsigned(({(8'hbf)} & wire107[(1'h1):(1'h1)])));
            end
          else
            begin
              reg112 <= $signed((($signed((~|(8'h9d))) - (wire111[(2'h2):(2'h2)] > ((8'ha1) ?
                  wire2 : wire111))) || reg115));
              reg113 <= (8'ha9);
              reg114 <= ($signed($signed(($unsigned(reg114) <= $signed(reg114)))) ?
                  (!$unsigned(reg113[(4'ha):(2'h3)])) : $unsigned(wire0[(2'h3):(1'h0)]));
              reg115 <= wire10[(2'h2):(2'h2)];
            end
          reg117 <= ($signed(reg12[(1'h1):(1'h0)]) ?
              reg109 : (~&(((wire6 & reg14) ?
                      $unsigned((8'hbc)) : (wire10 | wire111)) ?
                  ((8'hbb) ? (wire7 <= reg14) : reg116) : wire7)));
        end
      else
        begin
          reg112 <= {wire0[(1'h1):(1'h0)]};
          reg113 <= (^~($signed($signed((reg110 & reg11))) ?
              reg108 : wire5[(3'h5):(1'h0)]));
          reg114 <= (~&$unsigned({reg11}));
          reg115 <= (8'hbd);
        end
      reg118 <= reg114;
      if ($signed($signed({reg112})))
        begin
          if (wire4)
            begin
              reg119 <= $unsigned((~|(8'hae)));
              reg120 <= ({{reg108[(1'h1):(1'h1)],
                      ((^~reg118) ?
                          (reg13 ? wire7 : reg109) : wire111[(1'h0):(1'h0)])},
                  reg116} <= $signed($signed((+(|wire3)))));
            end
          else
            begin
              reg119 <= (^{(~^$signed(reg118))});
              reg120 <= (reg113[(4'hd):(4'ha)] && $unsigned($unsigned(($unsigned(reg118) ~^ (~&reg11)))));
              reg121 <= ((^reg115) == $signed(($unsigned(wire0[(2'h3):(2'h3)]) ^~ ((wire7 ?
                  reg114 : reg115) | reg113))));
            end
          if (reg112[(4'he):(3'h5)])
            begin
              reg122 <= ($signed((reg14 - $signed($signed(wire7)))) && ((~|wire7[(4'hb):(4'h9)]) | {$signed((reg108 ?
                      wire7 : reg121)),
                  $signed((reg14 ? reg14 : (8'had)))}));
              reg123 <= ((~&(wire0 ^ reg116)) ?
                  {($unsigned((wire8 || reg15)) >>> ($signed(wire0) << wire107[(2'h2):(1'h1)])),
                      reg14[(3'h7):(1'h1)]} : wire9[(4'hd):(3'h4)]);
              reg124 <= (~|$unsigned(($unsigned((^reg14)) ?
                  reg117 : (reg13 >= $signed(reg110)))));
            end
          else
            begin
              reg122 <= reg115;
              reg123 <= ($signed($signed(reg109[(1'h1):(1'h0)])) ?
                  ((reg15[(1'h1):(1'h1)] != reg124) <= (~&{wire105})) : $signed(wire6[(3'h5):(3'h5)]));
              reg124 <= $signed($unsigned(reg116));
            end
          reg125 <= wire8[(2'h3):(1'h0)];
        end
      else
        begin
          if ({$unsigned(($unsigned($signed((8'h9f))) ?
                  $unsigned($signed(reg119)) : ($unsigned((8'ha8)) | reg123[(5'h11):(4'hf)]))),
              (~&wire105[(4'hb):(4'h8)])})
            begin
              reg119 <= $signed($signed(wire0[(2'h3):(1'h1)]));
              reg120 <= (8'ha7);
              reg121 <= $unsigned($unsigned(reg119));
              reg122 <= (wire1 <<< (^~{wire10, $unsigned((wire2 & reg11))}));
              reg123 <= wire107;
            end
          else
            begin
              reg119 <= reg14[(3'h5):(1'h0)];
            end
          reg124 <= $signed(($signed(reg113[(1'h0):(1'h0)]) ? reg113 : wire10));
          reg125 <= reg13[(5'h11):(3'h7)];
          if ((~|(($signed($unsigned(reg15)) | ((wire0 ?
                  wire10 : (7'h41)) & (-wire4))) ?
              wire2 : $unsigned(reg11[(4'h8):(3'h4)]))))
            begin
              reg126 <= $unsigned(reg114);
              reg127 <= ($signed($signed($signed((-wire10)))) - {(reg113[(4'ha):(3'h4)] ?
                      reg126 : reg126[(3'h5):(3'h5)])});
              reg128 <= $unsigned(($unsigned((+wire105[(4'hf):(3'h4)])) <= $signed(((reg122 | wire5) ?
                  (+wire2) : (~wire107)))));
            end
          else
            begin
              reg126 <= $unsigned($unsigned(reg123));
              reg127 <= reg125[(3'h4):(1'h0)];
              reg128 <= $signed(wire1);
            end
        end
    end
  assign wire129 = {reg108};
  assign wire130 = (wire1 ?
                       (^~(wire10 & $signed(reg108[(1'h1):(1'h0)]))) : (~^{(~^$signed((8'hb4)))}));
  assign wire131 = (-((8'hb7) ? wire10 : (~&reg125)));
  always
    @(posedge clk) begin
      reg132 <= $unsigned(reg117[(4'he):(4'he)]);
      reg133 <= $unsigned(((|$signed(reg110[(1'h0):(1'h0)])) ?
          (reg126[(2'h3):(2'h2)] - $unsigned($signed(wire6))) : $unsigned(reg14)));
      reg134 <= (-{($signed($signed(wire131)) - reg115[(2'h2):(2'h2)])});
      if (reg119[(1'h1):(1'h1)])
        begin
          if ((wire9 ?
              {(-($unsigned(wire9) ?
                      $signed(wire111) : (reg108 ? reg126 : wire3))),
                  (reg125[(3'h4):(3'h4)] ?
                      ((!reg108) ?
                          (wire2 ?
                              (8'hbb) : reg124) : $signed(reg132)) : {wire5[(3'h6):(3'h4)]})} : reg115))
            begin
              reg135 <= $signed((~&{({reg116} - $signed(reg125)), wire9}));
              reg136 <= reg11[(2'h2):(2'h2)];
              reg137 <= reg134[(3'h5):(1'h0)];
            end
          else
            begin
              reg135 <= $unsigned(((~reg133) ?
                  ((reg13[(3'h5):(2'h3)] ?
                      reg132 : (wire10 <= reg109)) != ($signed(reg132) >> $signed(reg121))) : (reg108[(2'h2):(1'h1)] >= $signed((reg15 ?
                      reg11 : wire2)))));
              reg136 <= {$unsigned($signed(($unsigned(reg117) >> reg120)))};
              reg137 <= {($unsigned(wire130[(3'h6):(3'h5)]) && (~(~^reg123[(1'h0):(1'h0)]))),
                  (~^(8'ha1))};
              reg138 <= (~(!$signed(reg120)));
              reg139 <= $signed($signed(((-(reg13 ? reg132 : (7'h40))) ?
                  $signed($unsigned(wire8)) : $signed($signed(reg119)))));
            end
          reg140 <= $signed(reg116);
          reg141 <= wire130[(3'h4):(1'h1)];
          reg142 <= {(~^$unsigned(($signed(reg118) ?
                  $unsigned(wire5) : wire4[(3'h4):(2'h3)]))),
              (({reg117[(4'ha):(3'h7)]} ?
                  wire6 : $unsigned(reg120[(3'h6):(3'h6)])) != reg110)};
          reg143 <= {(reg108[(1'h1):(1'h1)] ?
                  $unsigned(reg137[(3'h4):(1'h0)]) : {(+$unsigned(reg112)),
                      ($signed(reg121) ?
                          reg136[(1'h1):(1'h0)] : (wire2 ? wire6 : (8'h9d)))})};
        end
      else
        begin
          if ($signed(reg108))
            begin
              reg135 <= ($signed((~{wire129[(2'h3):(1'h0)]})) & ((^reg126[(3'h4):(3'h4)]) >= $unsigned(wire9)));
              reg136 <= $unsigned($signed(wire7[(4'hb):(2'h2)]));
              reg137 <= $unsigned($unsigned(reg142));
              reg138 <= $unsigned($unsigned((reg115[(4'hd):(3'h5)] << reg138[(3'h4):(3'h4)])));
            end
          else
            begin
              reg135 <= $unsigned($unsigned(wire5));
              reg136 <= wire6[(2'h2):(1'h1)];
              reg137 <= ($unsigned(reg12[(2'h2):(2'h2)]) ?
                  $signed({reg119[(2'h2):(1'h1)],
                      reg133[(4'hc):(4'hc)]}) : ({{(wire5 <= reg110),
                          reg14[(5'h10):(4'ha)]}} >> reg134));
              reg138 <= (8'haf);
            end
        end
    end
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire signed [(2'h3):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire [(4'he):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire22;
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire22,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire22 = (&wire18[(1'h1):(1'h0)]);
  module23 #() modinst45 (.wire26(wire21), .clk(clk), .wire25(wire19), .y(wire44), .wire24(wire22), .wire27(wire17));
  assign wire46 = ((~&$unsigned($unsigned($unsigned((8'ha3))))) && ($unsigned($signed(wire17)) ^~ ($signed(wire20[(1'h1):(1'h0)]) - {$signed(wire19)})));
  assign wire47 = (wire44[(5'h10):(4'ha)] != (+{wire19[(4'hf):(4'hf)],
                      wire22[(1'h0):(1'h0)]}));
  assign wire48 = (~(wire21 ?
                      {((wire18 >> wire47) >= $signed(wire46))} : wire20));
  assign wire49 = (wire47[(2'h3):(2'h3)] * (~wire20[(2'h2):(2'h2)]));
  assign wire50 = $unsigned(({$unsigned((wire49 ?
                          wire44 : (8'hab)))} == wire19));
  assign wire51 = (((~^wire46[(3'h4):(2'h3)]) <= (wire17 ? wire49 : wire47)) ?
                      $signed((((~|wire47) && $signed(wire18)) || {$signed(wire50)})) : (!($unsigned((wire20 ?
                          wire49 : wire17)) - wire44[(4'hf):(4'hf)])));
  assign wire52 = ($signed($unsigned(wire20[(1'h1):(1'h0)])) == (~&$unsigned(((wire19 ?
                          wire47 : wire50) ?
                      (&wire47) : (wire46 - wire22)))));
  module53 #() modinst89 (.y(wire88), .wire57(wire47), .clk(clk), .wire55(wire51), .wire56(wire49), .wire54(wire17));
  assign wire90 = ($signed((&($signed(wire50) + $signed(wire48)))) + wire52[(2'h2):(1'h1)]);
  assign wire91 = $signed($unsigned((!(wire18 ?
                      {wire20} : (wire22 ? (8'hb8) : wire22)))));
  assign wire92 = (&$signed($signed($unsigned(wire51[(1'h0):(1'h0)]))));
  assign wire93 = {(~(wire52[(1'h1):(1'h0)] ^ wire19))};
  assign wire94 = (wire47 >>> $signed((~&wire47[(2'h3):(1'h0)])));
  assign wire95 = (~&{($unsigned((|wire46)) <<< (^~(8'hae)))});
  always
    @(posedge clk) begin
      reg96 <= $unsigned(wire88);
      reg97 <= (~|wire22);
      reg98 <= $signed(($unsigned($signed({wire52})) && $unsigned(((|wire91) ?
          (wire18 ^ wire17) : $signed(wire19)))));
    end
  assign wire99 = (~^wire92);
  assign wire100 = wire95[(2'h2):(1'h1)];
  assign wire101 = $unsigned($unsigned($unsigned($signed($unsigned((8'had))))));
  assign wire102 = (($unsigned((wire94 ?
                               $signed((8'ha4)) : (wire93 ?
                                   (8'hb6) : wire91))) ?
                           $signed(wire18[(3'h5):(3'h5)]) : ({{wire93, wire92},
                               {(8'hb3)}} != wire21)) ?
                       {wire52} : (wire92 || wire47[(3'h6):(3'h5)]));
  assign wire103 = ((8'hb3) <<< $signed(($unsigned(wire90[(1'h1):(1'h0)]) ^~ $unsigned((reg96 ^~ (8'ha6))))));
  assign wire104 = (8'hb1);
endmodule

module module53
#(parameter param87 = ({((&((7'h44) | (8'ha1))) && {{(8'hbb)}}), (|(((8'ha3) << (8'ha5)) <<< {(8'hb0)}))} ? ((((8'haa) | ((8'hb9) ? (8'hbd) : (7'h42))) ? {((7'h43) ? (8'had) : (8'hb7))} : (((8'ha5) != (8'hb9)) >>> (!(8'ha4)))) ? ((&(8'ha9)) + (((8'ha8) ? (7'h40) : (8'hab)) ? (|(8'ha4)) : ((8'ha9) ? (8'hbd) : (8'had)))) : (~&(((8'h9d) ? (8'hbf) : (8'hb0)) << ((8'ha8) & (8'hb6))))) : ((((-(8'hb4)) != ((8'h9d) - (8'h9d))) >>> (8'hb8)) <= (-({(8'haf), (8'had)} | (&(7'h44)))))))
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire57;
  input wire signed [(4'hf):(1'h0)] wire56;
  input wire [(3'h6):(1'h0)] wire55;
  input wire signed [(4'he):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire71;
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire79,
                 wire73,
                 wire72,
                 wire71,
                 reg82,
                 reg81,
                 reg80,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg58 <= ({(~|($unsigned(wire54) * $signed(wire55)))} ?
          wire57[(4'h9):(4'h8)] : ($signed(wire57) ?
              ((+(~^wire56)) ^~ ({wire56} ?
                  wire57[(3'h5):(2'h3)] : {wire54, wire56})) : wire56));
      if (($signed((wire57[(4'ha):(1'h1)] ?
          (-wire56[(2'h3):(1'h1)]) : (^((8'hbe) * reg58)))) ^ $unsigned(wire54[(3'h7):(2'h2)])))
        begin
          reg59 <= $unsigned({$unsigned(wire57),
              (~({reg58} ^~ $signed(reg58)))});
          reg60 <= ($unsigned($signed(((wire54 >> wire55) + (7'h40)))) ?
              (~$unsigned(wire55[(1'h1):(1'h0)])) : reg59);
        end
      else
        begin
          if ($signed($unsigned((+reg59))))
            begin
              reg59 <= $signed((-$signed((-((8'ha6) ? wire54 : reg58)))));
              reg60 <= wire57;
              reg61 <= wire54[(4'he):(4'h8)];
              reg62 <= {wire56};
            end
          else
            begin
              reg59 <= ($unsigned($signed(({wire56, wire57} ?
                      $unsigned(reg62) : $unsigned(reg60)))) ?
                  ((wire55 <<< ($signed(wire55) ?
                          $unsigned(reg62) : (wire56 ~^ reg58))) ?
                      reg62 : $signed({reg61[(3'h5):(1'h0)],
                          $unsigned(reg59)})) : wire56[(3'h7):(1'h1)]);
              reg60 <= reg59[(4'h8):(1'h1)];
              reg61 <= reg62;
              reg62 <= (reg61[(2'h3):(2'h2)] > $signed((((reg60 ?
                      (8'ha5) : reg58) && $unsigned(wire57)) ?
                  $signed((wire56 ^ reg61)) : ((reg60 > reg60) + (wire54 || reg60)))));
            end
          reg63 <= (-{wire57[(3'h5):(3'h4)]});
          reg64 <= (8'h9d);
          reg65 <= wire56[(4'hf):(3'h4)];
        end
      reg66 <= $unsigned((^~$unsigned((~|(reg62 ? wire54 : wire56)))));
      reg67 <= ($signed($unsigned(wire57)) >> wire57);
    end
  always
    @(posedge clk) begin
      reg68 <= (+($signed({(~|reg67)}) ?
          ($signed(reg58) > reg66[(1'h0):(1'h0)]) : ((reg67[(1'h0):(1'h0)] ?
                  $signed(reg65) : reg63[(3'h7):(1'h0)]) ?
              {$unsigned(reg61), $unsigned(wire54)} : wire56)));
      if (reg59)
        begin
          reg69 <= (wire56[(1'h1):(1'h1)] & $signed(($unsigned(((8'hb2) >>> reg62)) ~^ ({wire57} ~^ reg60[(4'ha):(3'h6)]))));
        end
      else
        begin
          reg69 <= $unsigned(wire56[(4'hb):(1'h0)]);
          reg70 <= ($signed((8'hbf)) ^~ $signed((wire55[(3'h6):(1'h1)] ?
              $signed((^~reg65)) : $signed((wire57 ? reg66 : reg61)))));
        end
    end
  assign wire71 = (~^(!$unsigned(($signed(reg65) ~^ (reg70 ^ reg58)))));
  assign wire72 = (8'ha5);
  assign wire73 = (($unsigned((reg64 >= $unsigned(reg63))) - wire57) >>> {$unsigned(wire57),
                      wire72});
  always
    @(posedge clk) begin
      reg74 <= $signed(reg63[(4'hc):(2'h2)]);
      reg75 <= {reg67,
          ($unsigned((((8'ha7) ?
              (8'hb6) : (8'ha8)) != reg61[(2'h3):(2'h3)])) >= ($signed((^~(7'h42))) == ({(7'h43),
                  reg70} ?
              $signed(wire56) : (reg67 ? reg65 : wire71))))};
      reg76 <= $unsigned((^wire55));
      reg77 <= reg62;
      reg78 <= reg74[(5'h13):(2'h2)];
    end
  assign wire79 = (~&reg78[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg80 <= ((($unsigned(reg61[(1'h1):(1'h0)]) ?
          $unsigned({reg78}) : ((8'ha8) ?
              (reg59 ?
                  (8'haf) : (8'hbd)) : (~&wire73))) > (&wire55)) > $unsigned({(&(&reg78))}));
      reg81 <= $unsigned((~^$unsigned(($unsigned(reg65) || reg80))));
      reg82 <= reg60[(4'hb):(1'h0)];
    end
  assign wire83 = (reg77[(3'h6):(1'h0)] ?
                      $unsigned({$unsigned((^~reg69))}) : wire71[(1'h0):(1'h0)]);
  assign wire84 = {(|$unsigned(($signed(wire55) ? (!reg77) : {(8'hac)}))),
                      ((((reg77 == wire79) ?
                                  ((8'hab) ^~ reg65) : $unsigned(reg64)) ?
                              (^~reg70) : ((reg66 >= reg60) <<< $unsigned(reg70))) ?
                          ({(8'ha9)} == reg61[(2'h2):(1'h0)]) : (|$signed((-wire79))))};
  assign wire85 = (({$signed(reg67[(2'h2):(2'h2)])} >> wire57[(2'h2):(2'h2)]) ?
                      ({$unsigned((wire84 <= reg81)), wire54[(3'h7):(3'h4)]} ?
                          reg82 : $unsigned(reg58[(4'hb):(4'ha)])) : (($unsigned(reg80) + (!(reg63 < reg80))) ?
                          (((^~reg69) ?
                              reg78 : ((8'hb2) ?
                                  wire73 : reg63)) > {$unsigned(reg74),
                              {wire56}}) : {(^(wire71 ? wire84 : reg68))}));
  assign wire86 = (8'ha8);
endmodule

module module23
#(parameter param42 = {({{((7'h42) ~^ (8'hb7)), ((8'hbf) <= (7'h42))}} ^~ (8'hbd)), {({((8'ha8) >= (8'hb3)), {(8'ha3)}} ? {((8'ha5) ^~ (8'ha2))} : ({(7'h44)} < ((8'ha1) ^ (8'hba))))}}, 
parameter param43 = ((&((+(+param42)) & {(^~param42), (param42 ? param42 : param42)})) & ((~|((param42 && param42) ? ((8'h9c) ? param42 : param42) : {param42, param42})) ? (^param42) : param42)))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire27;
  input wire [(3'h6):(1'h0)] wire26;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire29,
                 wire28,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire28 = (+wire25[(3'h5):(2'h3)]);
  assign wire29 = (~^$unsigned($unsigned(wire26)));
  always
    @(posedge clk) begin
      if (wire29)
        begin
          reg30 <= (wire25 ?
              $unsigned($signed(($unsigned(wire29) && ((8'hac) ?
                  wire25 : wire24)))) : (&$unsigned(wire28[(4'he):(4'hc)])));
          reg31 <= {$signed((wire29[(2'h2):(1'h0)] <= $signed(wire27[(2'h2):(1'h0)])))};
        end
      else
        begin
          reg30 <= (~((8'hbb) ? (^reg30) : wire24[(1'h0):(1'h0)]));
          reg31 <= (wire25[(1'h0):(1'h0)] <<< (wire28[(4'hf):(4'h9)] ?
              $signed((^~(-reg30))) : reg31));
          reg32 <= $unsigned(wire26[(3'h6):(3'h6)]);
        end
      reg33 <= wire28;
      reg34 <= ((wire27 ^~ (8'had)) <= $signed($signed($unsigned((~|wire26)))));
      reg35 <= wire27[(2'h3):(2'h3)];
      if (wire28)
        begin
          reg36 <= ($signed(reg31[(4'hb):(2'h3)]) ?
              wire25 : $unsigned({(reg30[(4'ha):(4'h8)] <= reg34)}));
        end
      else
        begin
          reg36 <= $unsigned((^~(8'h9c)));
        end
    end
  assign wire37 = {wire26};
  assign wire38 = {$unsigned((8'hb9))};
  assign wire39 = wire25;
  assign wire40 = $unsigned($signed(((|$signed(wire37)) >> {(wire38 ?
                          reg36 : wire28),
                      (^~wire26)})));
  assign wire41 = ($unsigned($signed({$signed(wire27)})) & ((^wire26[(3'h4):(1'h1)]) < {reg32[(1'h1):(1'h0)]}));
endmodule
