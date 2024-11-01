module top
#(parameter param147 = (~|((8'hb4) && ((+(~&(8'ha1))) ? ({(7'h43)} >>> {(8'ha7), (8'hbb)}) : (-(~^(8'hbf)))))), 
parameter param148 = param147)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(4'h8):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire145;
  wire [(5'h14):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire143;
  wire signed [(4'ha):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire136;
  wire signed [(4'hf):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire134;
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire138,
                 wire137,
                 wire136,
                 wire132,
                 wire134,
                 (1'h0)};
  module4 #() modinst133 (wire132, clk, wire0, wire3, wire1, wire2, (8'ha5));
  module83 #() modinst135 (.wire88(wire0), .wire87(wire2), .wire85(wire132), .clk(clk), .wire86(wire1), .wire84(wire3), .y(wire134));
  assign wire136 = $unsigned(wire1);
  assign wire137 = wire2[(4'ha):(1'h1)];
  module110 #() modinst139 (.clk(clk), .wire112(wire3), .wire113(wire134), .wire114(wire136), .wire111(wire132), .y(wire138));
  assign wire140 = ($signed($unsigned((wire3 + wire137))) >> (^(8'hb9)));
  assign wire141 = wire132;
  assign wire142 = $signed((wire132 ?
                       wire141 : (wire132 ?
                           ((wire1 ? wire1 : wire3) ?
                               (wire141 & wire0) : $signed((8'ha5))) : $unsigned($signed(wire3)))));
  assign wire143 = $signed({wire0});
  assign wire144 = wire143;
  assign wire145 = (+wire140[(3'h5):(1'h0)]);
  assign wire146 = $unsigned((|$signed((wire136 ?
                       ((7'h42) ^~ wire134) : (-wire140)))));
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire5;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire77;
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  assign y = {wire130,
                 wire108,
                 wire79,
                 wire10,
                 wire11,
                 wire19,
                 wire20,
                 wire46,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire77,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg80,
                 reg81,
                 reg82,
                 (1'h0)};
  assign wire10 = wire8[(1'h0):(1'h0)];
  assign wire11 = $signed((~|wire9));
  always
    @(posedge clk) begin
      if ((wire11 >> $signed(wire7)))
        begin
          reg12 <= wire6;
        end
      else
        begin
          reg12 <= wire6[(5'h12):(1'h1)];
          reg13 <= (({((wire5 | (7'h43)) << (wire10 ? wire5 : (8'hbe)))} ?
                  ($unsigned((&wire8)) ~^ $unsigned(wire10)) : $signed({(wire6 ?
                          wire5 : wire10),
                      {wire7}})) ?
              (&wire9[(2'h3):(1'h1)]) : (-(~(reg12 || $unsigned(reg12)))));
          if ($unsigned(($signed(($unsigned(wire8) ?
              ((8'hbd) || wire8) : $unsigned(wire9))) >> ((8'ha2) ?
              (|{wire6, wire8}) : (wire10 && $unsigned(wire10))))))
            begin
              reg14 <= wire5[(2'h2):(1'h0)];
              reg15 <= (((~|wire9) ?
                  (^~$signed((~wire7))) : (+{$unsigned(reg14)})) > (wire10[(3'h7):(3'h5)] ?
                  $unsigned((8'hbb)) : (8'ha1)));
            end
          else
            begin
              reg14 <= (($signed(wire9[(1'h1):(1'h1)]) != $unsigned(($signed(wire9) != wire5[(2'h2):(1'h1)]))) >> {$unsigned($signed($unsigned(reg13))),
                  reg13[(1'h1):(1'h1)]});
            end
        end
      reg16 <= ((^~$unsigned($signed((wire8 + wire11)))) <= (^~$signed((((7'h41) ?
              reg13 : wire11) ?
          (wire11 ? wire5 : wire7) : $signed(reg12)))));
      reg17 <= $signed($unsigned(wire8));
      reg18 <= $unsigned((8'h9c));
    end
  assign wire19 = wire11[(2'h2):(1'h0)];
  assign wire20 = $signed(($signed(((wire6 >> reg15) - ((8'hab) ?
                          (8'hbe) : (8'hb7)))) ?
                      ($unsigned((wire9 < reg17)) ?
                          ((reg12 + wire9) & (8'ha1)) : (^~(wire9 ?
                              wire7 : wire7))) : (({reg16} ?
                          (+wire11) : $signed(wire8)) ~^ wire6)));
  module21 #() modinst47 (wire46, clk, wire7, reg16, wire19, reg15, reg17);
  assign wire48 = reg18[(3'h5):(2'h3)];
  assign wire49 = wire9;
  assign wire50 = (&{{wire19[(4'h9):(2'h3)],
                          ((wire20 ? wire9 : wire46) >= (reg13 < wire11))},
                      wire10});
  assign wire51 = (~^$unsigned($signed((7'h42))));
  assign wire52 = (&$signed((wire9 ?
                      wire11[(2'h2):(2'h2)] : $unsigned(reg17))));
  assign wire53 = ($unsigned(wire19) ? reg12 : reg18);
  module54 #() modinst78 (wire77, clk, reg15, wire5, wire9, wire10);
  assign wire79 = wire77[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg80 <= {(($unsigned((reg15 ?
              wire77 : reg12)) <= (~(wire10 ~^ (7'h42)))) || $signed(($signed(wire20) - $unsigned(wire7)))),
          (+(wire8[(4'hb):(4'hb)] & ($signed(wire5) <= (wire11 ~^ wire79))))};
      reg81 <= (+($signed(($signed((7'h43)) ?
              (wire7 >= wire50) : $unsigned((7'h41)))) ?
          (((wire19 ? wire53 : wire5) ~^ (reg80 >> reg16)) >= ($signed(wire77) ?
              (8'h9d) : $signed(wire53))) : ($signed((wire49 * reg12)) ?
              (~&wire5) : $signed((wire52 == wire11)))));
      reg82 <= ($signed({wire10, wire79}) ?
          $unsigned(wire5) : ($signed(wire48[(3'h6):(1'h0)]) ?
              $unsigned($unsigned((wire46 ?
                  reg14 : wire7))) : {{(reg18 > wire49)}}));
    end
  module83 #() modinst109 (wire108, clk, wire50, wire52, wire5, reg17, wire77);
  module110 #() modinst131 (wire130, clk, reg13, reg16, wire52, wire53);
endmodule

module module110
#(parameter param129 = ((~&(~^({(8'haf), (8'hbe)} >>> (-(8'hb2))))) ? (-({{(8'ha0)}} ? (^((8'ha5) ? (8'haf) : (8'h9e))) : (((8'ha8) ? (8'haf) : (8'ha3)) <<< ((7'h41) ? (8'hb5) : (7'h42))))) : (8'hbb)))
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire114;
  input wire signed [(5'h13):(1'h0)] wire113;
  input wire [(4'he):(1'h0)] wire112;
  input wire [(4'hc):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(2'h2):(1'h0)] wire126;
  wire [(3'h4):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire [(4'hc):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire121;
  wire [(4'hf):(1'h0)] wire115;
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg116 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire115,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire115 = $signed($signed(wire112[(4'ha):(2'h2)]));
  always
    @(posedge clk) begin
      reg116 <= (({(wire115[(4'hc):(1'h1)] ^~ {wire115})} ?
          (~^(^{wire115, wire111})) : $signed((wire115 ?
              $unsigned(wire113) : wire113))) - ($unsigned($signed(wire111[(4'h9):(4'h9)])) ?
          wire111 : $unsigned((^~wire113[(4'h9):(1'h0)]))));
      reg117 <= $unsigned((~&(wire115 << wire113[(3'h4):(2'h3)])));
      reg118 <= ((((~&(!wire114)) <<< {(reg116 - wire115),
              (reg116 != reg117)}) ?
          wire112[(3'h6):(2'h3)] : wire111) >>> (&{(|(wire111 + wire113))}));
      reg119 <= (((wire111[(4'ha):(4'h8)] ?
                  $unsigned({(7'h42)}) : ((-wire113) ^ $signed(wire113))) ?
              (reg116 ?
                  ((wire114 || reg118) | wire112) : (reg117 == reg116[(3'h5):(3'h5)])) : (((wire112 ^~ wire114) ?
                  $unsigned(wire115) : (reg117 ?
                      wire111 : (8'hbf))) <<< reg118[(3'h5):(2'h2)])) ?
          (($unsigned((reg117 || wire113)) > ($signed(wire112) * {wire111,
                  wire111})) ?
              (|wire113[(4'hb):(4'h9)]) : wire112[(1'h0):(1'h0)]) : wire114[(4'he):(3'h6)]);
      reg120 <= ((&$unsigned({(&wire113),
          {(8'ha9)}})) + $signed({((-reg116) != $signed(reg116)),
          (wire114[(2'h2):(2'h2)] ~^ {wire113})}));
    end
  assign wire121 = (((^$unsigned((reg116 ?
                       wire112 : wire112))) <<< reg116) || (($signed((reg116 << wire113)) ?
                       ($signed(wire113) >> $unsigned(reg120)) : (reg119 - $signed(reg118))) + (wire114[(2'h3):(2'h3)] ^~ $signed(((8'ha4) ?
                       (8'ha8) : wire113)))));
  assign wire122 = $unsigned(reg119[(1'h1):(1'h1)]);
  assign wire123 = $unsigned(((reg117 >>> {$unsigned((8'had))}) ?
                       wire121 : (8'ha8)));
  assign wire124 = ($signed(wire123[(3'h5):(2'h2)]) & ({$unsigned(((8'hb4) ~^ (8'hb4))),
                           wire113[(3'h5):(3'h5)]} ?
                       {reg120,
                           (&(reg119 ? (8'hbe) : wire113))} : $signed(reg118)));
  assign wire125 = (reg119[(2'h2):(2'h2)] ?
                       $unsigned(reg118) : $signed({(~|((7'h44) ?
                               wire115 : wire113))}));
  assign wire126 = {$signed((|$signed(wire112[(3'h5):(1'h1)]))),
                       ({$signed((wire115 ? wire111 : reg117)),
                           $unsigned(wire113[(4'he):(4'hb)])} <<< ($unsigned(wire111) * $unsigned(((8'ha2) - wire112))))};
  assign wire127 = ((&($unsigned({reg118,
                           (8'hb9)}) << (wire112[(3'h5):(3'h4)] || (wire126 ?
                           wire121 : reg120)))) ?
                       (8'ha5) : wire111);
  assign wire128 = wire115[(1'h0):(1'h0)];
endmodule

module module83
#(parameter param107 = ((~((&{(8'haa)}) ? {{(8'hae)}, ((8'hb1) << (8'hbf))} : ((-(8'h9e)) >>> ((8'ha9) ? (8'hac) : (8'hb5))))) ? (8'hb9) : (-(^{((8'h9c) ? (8'hac) : (8'hb6)), ((8'hbf) ~^ (8'ha5))}))))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire88;
  input wire [(4'h9):(1'h0)] wire87;
  input wire signed [(3'h4):(1'h0)] wire86;
  input wire [(2'h3):(1'h0)] wire85;
  input wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire106;
  wire signed [(4'h9):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire102,
                 wire92,
                 wire91,
                 reg104,
                 reg103,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg90,
                 reg89,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg89 <= wire84[(1'h0):(1'h0)];
      reg90 <= reg89[(4'he):(3'h7)];
    end
  assign wire91 = $signed(wire85);
  assign wire92 = wire88;
  always
    @(posedge clk) begin
      if ((!wire85[(2'h3):(1'h1)]))
        begin
          reg93 <= $signed($unsigned(reg89[(4'ha):(3'h4)]));
          reg94 <= wire92;
          reg95 <= (8'hbf);
          if ($signed(($signed(((+wire88) ? wire92[(3'h5):(1'h0)] : {wire86})) ?
              $signed($unsigned($unsigned(reg90))) : {reg93,
                  ((reg95 ^~ wire91) & wire87)})))
            begin
              reg96 <= $unsigned($unsigned(reg90[(2'h2):(1'h0)]));
              reg97 <= (((8'ha1) ?
                  $unsigned(wire92) : reg89[(3'h4):(1'h0)]) * wire86[(2'h3):(2'h2)]);
              reg98 <= reg89[(1'h0):(1'h0)];
              reg99 <= wire84;
              reg100 <= $signed(reg94);
            end
          else
            begin
              reg96 <= {$signed(((^(+reg96)) ?
                      $unsigned((8'h9f)) : (~|wire91))),
                  ($unsigned((reg98 != (wire91 ?
                      reg96 : reg99))) * wire84[(1'h1):(1'h1)])};
              reg97 <= wire86;
              reg98 <= $signed((((8'had) ?
                  $unsigned({reg96}) : ({wire86} < $signed(reg98))) > wire85[(1'h0):(1'h0)]));
              reg99 <= wire92;
              reg100 <= $unsigned($unsigned(({{reg99}, reg94} ?
                  ($signed(wire84) ~^ wire91[(2'h3):(1'h0)]) : $signed($unsigned(reg100)))));
            end
          reg101 <= ({(7'h43)} ?
              $signed($signed($unsigned(reg100[(1'h0):(1'h0)]))) : {reg94[(2'h3):(2'h3)]});
        end
      else
        begin
          if (((!(&({wire85} < reg99[(4'h8):(3'h6)]))) * wire85[(2'h3):(2'h2)]))
            begin
              reg93 <= reg96;
              reg94 <= (!$unsigned((wire87[(1'h1):(1'h0)] ?
                  ({wire86} ?
                      $signed(wire92) : {reg89, wire88}) : $signed((8'hbe)))));
              reg95 <= (&wire85);
            end
          else
            begin
              reg93 <= $unsigned(($signed((reg90 >> wire85)) ?
                  {(reg98 ^~ reg89[(4'hb):(4'hb)]),
                      $unsigned((wire85 ?
                          reg93 : wire91))} : $unsigned(wire85[(1'h1):(1'h0)])));
              reg94 <= ((wire84 ?
                      reg101 : (|$signed((wire84 ? reg95 : wire87)))) ?
                  {$signed(((&reg96) >= (~reg94))),
                      wire84[(3'h4):(1'h1)]} : $unsigned($unsigned(reg100)));
              reg95 <= $signed($signed(reg96));
              reg96 <= {(~&$unsigned({reg100[(3'h6):(1'h0)], $signed(reg97)}))};
            end
          if (reg97)
            begin
              reg97 <= $signed(((($unsigned(reg93) ?
                      reg98 : reg97[(4'hc):(3'h4)]) ?
                  (~^$unsigned(reg97)) : (reg94 & wire92)) == reg97[(4'h8):(2'h3)]));
              reg98 <= wire84[(2'h2):(1'h0)];
              reg99 <= wire91;
              reg100 <= ((&$signed({(reg95 | (7'h40))})) ?
                  $unsigned($signed($unsigned((~|reg101)))) : ((~|$signed(reg90[(3'h5):(1'h1)])) > {{{wire86},
                          ((8'hba) << reg90)},
                      ({wire91} ? (reg89 ? reg98 : wire87) : (!(8'hbd)))}));
              reg101 <= ($unsigned($signed((8'hba))) ?
                  $unsigned($unsigned(reg95[(1'h1):(1'h0)])) : $unsigned($signed($signed($signed(reg99)))));
            end
          else
            begin
              reg97 <= {((~&$unsigned($signed(wire86))) ?
                      wire86[(2'h3):(1'h0)] : (((^reg95) < (wire86 == reg93)) ?
                          $signed({wire87, reg96}) : reg90))};
              reg98 <= reg89;
            end
        end
    end
  assign wire102 = (&$unsigned(reg93));
  always
    @(posedge clk) begin
      reg103 <= ($signed(wire92[(1'h1):(1'h1)]) ?
          (reg95 * reg96[(4'h8):(4'h8)]) : {(((reg97 < reg94) + $unsigned(wire86)) < ((^wire91) > $unsigned(reg101)))});
      reg104 <= reg103[(1'h1):(1'h1)];
    end
  assign wire105 = ($unsigned($signed((~|reg103[(1'h1):(1'h1)]))) && reg100);
  assign wire106 = reg98;
endmodule

module module54
#(parameter param75 = ((((-(8'hb0)) || (~{(8'ha6), (8'hb7)})) ? ((((8'ha4) <<< (8'hb0)) < (+(8'hb9))) ? {{(8'ha2)}} : (((8'hbc) ^ (8'had)) ? ((8'hb9) ? (8'hb1) : (8'hb9)) : ((8'ha1) ? (8'hb5) : (8'h9c)))) : ({((8'hb9) ? (7'h44) : (7'h43)), {(8'hbc)}} ^ (~&(~|(7'h43))))) ? ((|(+((8'ha1) || (8'hb0)))) ? (((~^(8'haa)) ? (~^(8'hb4)) : ((7'h44) ? (8'ha3) : (8'ha0))) ? (!(8'ha0)) : {((8'hb0) ? (8'hb7) : (7'h40)), (8'hae)}) : ((((8'hbd) | (8'ha7)) && (8'hb3)) ? ({(7'h44), (7'h44)} ? {(8'hbf)} : ((8'hbd) + (8'ha7))) : ((+(8'ha4)) | (~(8'had))))) : (^(~&{((7'h44) > (8'ha4)), (^~(7'h42))}))), 
parameter param76 = (^{param75}))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire58;
  input wire [(5'h11):(1'h0)] wire57;
  input wire [(5'h15):(1'h0)] wire56;
  input wire signed [(3'h4):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire59 = wire57[(3'h6):(2'h3)];
  assign wire60 = $unsigned((wire58 ? wire59 : wire55));
  assign wire61 = ($unsigned($signed(($signed((8'ha4)) && $signed(wire58)))) ~^ $signed($unsigned({(wire58 ?
                          wire55 : wire56)})));
  assign wire62 = $unsigned((wire56[(1'h0):(1'h0)] ?
                      $signed((^$unsigned((7'h42)))) : wire58));
  assign wire63 = (((~&(-wire62[(3'h7):(3'h4)])) && $signed((8'h9f))) ?
                      ($signed(wire57) ?
                          $unsigned($unsigned($signed(wire56))) : $signed(((|wire59) ?
                              wire55 : (&(8'hbc))))) : (+wire59));
  assign wire64 = wire56;
  assign wire65 = wire64[(4'h9):(2'h2)];
  assign wire66 = (wire55[(3'h4):(1'h0)] ?
                      wire62[(4'ha):(2'h3)] : (wire63[(3'h7):(1'h1)] ?
                          (!wire56) : {{wire65[(3'h4):(1'h1)],
                                  {wire56, wire62}}}));
  always
    @(posedge clk) begin
      reg67 <= $signed({(wire58[(3'h4):(1'h0)] ?
              wire66 : $unsigned((wire62 && wire63))),
          $signed(wire65[(4'hb):(3'h4)])});
      reg68 <= wire58;
    end
  always
    @(posedge clk) begin
      reg69 <= ((8'h9e) ?
          wire59 : (wire61[(1'h0):(1'h0)] ?
              $unsigned(((wire62 ? wire64 : wire56) ?
                  $unsigned(wire63) : wire66[(1'h0):(1'h0)])) : wire66[(2'h2):(2'h2)]));
    end
  assign wire70 = wire55;
  assign wire71 = (^(wire56 << (wire59 ?
                      (~^$unsigned(wire62)) : ({(8'ha3), reg67} ?
                          {(8'ha4), wire62} : (&reg67)))));
  assign wire72 = wire58;
  assign wire73 = wire64;
  assign wire74 = {((wire73[(3'h6):(3'h4)] ?
                              $signed((wire62 != reg68)) : (reg68 ?
                                  (~|wire55) : $signed(wire59))) ?
                          (~&wire72) : $signed((wire60[(1'h0):(1'h0)] != (~|wire55)))),
                      {(wire59 ?
                              ($signed(wire65) ?
                                  {wire72} : (wire55 ~^ wire72)) : {wire60[(2'h2):(2'h2)]})}};
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire26;
  input wire [(3'h7):(1'h0)] wire25;
  input wire [(4'ha):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire28,
                 wire27,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire27 = $unsigned((-$signed((&$signed(wire23)))));
  assign wire28 = ($signed(wire25) ? wire23 : wire24);
  always
    @(posedge clk) begin
      reg29 <= $signed($signed(($unsigned(wire24[(2'h2):(1'h1)]) ?
          $signed((-wire25)) : $unsigned((wire26 ? wire28 : (8'hb5))))));
      reg30 <= {((!wire24[(3'h6):(2'h2)]) ?
              (^~(^{wire28, wire25})) : (((wire22 != wire25) ?
                      (|wire27) : ((8'hb3) ^ wire24)) ?
                  ((~&wire28) + (wire22 >= wire23)) : (((8'hab) ?
                      (8'ha6) : wire23) > $signed(wire23)))),
          (((7'h42) != wire28[(3'h4):(1'h0)]) ?
              $signed((^~(wire22 ? wire27 : wire27))) : ($signed((wire22 ?
                  (8'ha0) : (8'hb4))) >= ((8'ha4) ?
                  (wire24 >>> wire22) : {wire24})))};
      reg31 <= $unsigned(wire28[(2'h3):(1'h1)]);
      reg32 <= (wire23 <= {wire27});
      if ($signed(((~|$signed(reg32[(3'h4):(2'h3)])) ?
          wire22[(1'h1):(1'h1)] : (~((reg31 ? wire25 : wire24) ?
              $unsigned(wire22) : $unsigned(reg29))))))
        begin
          reg33 <= (($signed((7'h44)) ?
              wire22 : $unsigned((8'hba))) + $unsigned($signed(reg30)));
          reg34 <= (~(^~$signed((reg29[(3'h4):(2'h3)] ?
              (wire22 ? wire24 : wire25) : $signed((8'hbd))))));
        end
      else
        begin
          reg33 <= $unsigned(((^~($signed(wire28) ?
                  (wire22 ? (8'ha1) : reg34) : (&wire25))) ?
              {((wire26 || wire22) >> $signed(wire26))} : reg29[(1'h0):(1'h0)]));
          reg34 <= (+((^~wire27[(4'hb):(2'h3)]) ?
              {reg30,
                  wire28[(3'h6):(3'h6)]} : $unsigned(wire23[(5'h10):(4'ha)])));
          if ($signed((-reg29[(3'h4):(2'h2)])))
            begin
              reg35 <= ((~^(&(^reg30[(2'h2):(1'h1)]))) >>> (~&wire24[(2'h3):(2'h2)]));
              reg36 <= ($signed((7'h43)) & ({reg33[(2'h2):(1'h1)],
                  (^~{wire25, (8'h9c)})} >= (8'ha4)));
              reg37 <= $signed({$unsigned(({reg30, wire24} ?
                      $signed(reg31) : wire26[(4'hc):(3'h6)]))});
            end
          else
            begin
              reg35 <= $unsigned((~|{((reg33 ? reg32 : (8'haa)) ?
                      (reg32 ? reg35 : (7'h44)) : $unsigned(reg31))}));
              reg36 <= $signed(reg33);
              reg37 <= {reg32[(3'h5):(1'h0)], $unsigned({(wire26 == wire23)})};
            end
        end
    end
  assign wire38 = $signed(wire26);
  assign wire39 = reg29;
  assign wire40 = (~^(wire25[(1'h1):(1'h1)] | {(~|$unsigned(wire22)),
                      $signed((&wire26))}));
  assign wire41 = (8'hba);
  assign wire42 = $unsigned(((reg32 ?
                      $unsigned(wire41) : {$signed(wire25),
                          $signed(reg34)}) ^ {(wire40 ^ $signed(reg32))}));
  assign wire43 = (8'h9c);
  assign wire44 = wire22[(2'h3):(2'h3)];
  assign wire45 = $signed(reg36[(4'hc):(3'h7)]);
endmodule
