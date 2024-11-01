module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire135,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = $signed((wire1 ? wire1 : $signed(wire0[(4'ha):(4'ha)])));
  assign wire5 = (^~wire1[(4'ha):(3'h6)]);
  assign wire6 = $signed(wire4);
  assign wire7 = wire3;
  assign wire8 = $signed($signed(wire5));
  always
    @(posedge clk) begin
      if (wire6)
        begin
          if ((~|(-(wire2 ^~ (8'h9e)))))
            begin
              reg9 <= wire1;
              reg10 <= ((~wire4[(2'h2):(2'h2)]) ?
                  (~|($unsigned((8'ha8)) ?
                      (+(~^wire2)) : ((^(8'hb6)) ?
                          wire3 : wire2))) : (|$signed({$unsigned(wire8)})));
              reg11 <= $signed($signed({{(wire8 ? wire2 : wire7)}}));
            end
          else
            begin
              reg9 <= ((~$unsigned(wire3)) != ($unsigned((wire0[(4'hf):(3'h6)] ^ reg10)) >>> {$signed(wire0),
                  {$unsigned(wire2), (8'hbd)}}));
              reg10 <= $signed($unsigned($signed($unsigned((~reg10)))));
              reg11 <= (wire6 ?
                  ({{{wire4}, $signed(wire5)},
                      $unsigned($signed((8'ha2)))} || ((|(wire6 ?
                      (8'ha6) : wire3)) >>> $signed((^~wire7)))) : {(((wire4 << reg11) ?
                              (-reg10) : $signed(wire4)) ?
                          reg10 : (~^(wire3 ? wire2 : wire6)))});
              reg12 <= (~wire3);
            end
          reg13 <= $unsigned(((-(wire4[(3'h4):(2'h2)] || (!wire4))) ?
              ($unsigned(reg12[(3'h5):(3'h5)]) >= $signed((8'hbb))) : $signed((reg10[(3'h7):(2'h3)] ?
                  (wire3 ? wire5 : reg12) : (wire3 ? reg12 : (8'ha9))))));
          if ((|$unsigned($unsigned($unsigned((wire8 << wire8))))))
            begin
              reg14 <= $unsigned($unsigned(reg10[(2'h3):(1'h0)]));
              reg15 <= $signed(($unsigned((^wire0[(3'h5):(3'h4)])) ?
                  $signed((~reg12)) : $signed($signed($signed(wire8)))));
              reg16 <= wire8;
            end
          else
            begin
              reg14 <= wire6;
              reg15 <= (reg9 ?
                  $unsigned(((~^$unsigned(reg9)) ?
                      (-(reg15 ?
                          reg14 : wire5)) : wire8[(4'hb):(1'h0)])) : wire1[(4'hc):(1'h0)]);
              reg16 <= $unsigned(wire5[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg9 <= wire6[(4'h9):(3'h7)];
        end
      reg17 <= reg11;
      reg18 <= $unsigned({$signed((~|(wire4 ? wire2 : wire1)))});
      reg19 <= ($signed((&$signed((+reg11)))) | (~|$unsigned(((^~reg18) ?
          (8'hae) : {wire5, reg9}))));
    end
  assign wire20 = ((wire4 ?
                      ((~(wire5 <= reg9)) ~^ $signed($unsigned((8'hbc)))) : wire5[(1'h1):(1'h1)]) * (wire7 * wire4));
  assign wire21 = wire6[(2'h2):(1'h1)];
  assign wire22 = (-(8'hab));
  assign wire23 = (wire0[(2'h2):(2'h2)] * ({(&reg13)} >= ($signed((wire6 ?
                          reg18 : wire6)) ?
                      $signed((-reg19)) : (~^reg11[(3'h4):(2'h3)]))));
  module24 #() modinst136 (.clk(clk), .wire28(wire7), .y(wire135), .wire27(reg15), .wire26(reg10), .wire25(wire23));
  assign wire137 = (wire6[(3'h6):(3'h5)] ~^ {$signed({(wire6 ? wire3 : wire8)}),
                       wire20[(3'h4):(1'h1)]});
  assign wire138 = $unsigned((reg14[(2'h2):(2'h2)] ?
                       (wire2[(1'h1):(1'h0)] ?
                           (~|{wire23,
                               wire137}) : $signed($signed(reg9))) : wire6[(1'h0):(1'h0)]));
endmodule

module module24
#(parameter param133 = (^((|(8'haf)) ? ((((8'ha3) ? (8'ha1) : (8'hb7)) == ((8'ha2) && (8'hae))) ? ({(8'hbf)} ? ((8'ha4) ? (8'ha5) : (8'hbe)) : ((8'hb7) ? (7'h40) : (8'hbe))) : (8'hb5)) : ((((8'hbe) | (8'hb5)) ? (^(8'haa)) : (^(8'hb4))) >>> (!((8'had) <<< (8'h9f)))))), 
parameter param134 = param133)
(y, clk, wire25, wire26, wire27, wire28);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire [(5'h12):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire132;
  wire [(4'h9):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(4'hf):(1'h0)] wire127;
  wire [(4'hb):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire [(4'hc):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire67;
  reg signed [(5'h15):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire69,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire67,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire29 = wire26;
  assign wire30 = $signed(wire27[(4'hb):(4'h9)]);
  assign wire31 = {{{{(~wire28)}}, $unsigned((~wire27))}};
  assign wire32 = ((&$signed(wire29[(1'h1):(1'h1)])) ?
                      wire31[(3'h5):(1'h1)] : ((({wire26} ?
                              (^~(8'haa)) : ((8'hbd) ? wire30 : wire29)) ?
                          ($unsigned(wire25) * $unsigned(wire30)) : (wire25[(2'h3):(1'h1)] ^ (~&wire25))) && $unsigned(($unsigned(wire25) != $unsigned(wire27)))));
  assign wire33 = $signed({$unsigned((!wire31[(2'h2):(1'h0)])), wire26});
  module34 #() modinst68 (.clk(clk), .wire37(wire30), .wire38(wire25), .wire36(wire28), .wire35(wire26), .wire39(wire29), .y(wire67));
  assign wire69 = (^~((!(wire31[(4'hc):(1'h1)] ?
                          (wire28 ? wire32 : wire27) : wire33)) ?
                      (((^~wire31) ? {wire27} : {wire32}) ?
                          wire29 : $signed((^~(8'hba)))) : $signed(({wire31,
                          wire32} || {wire27, wire31}))));
  module70 #() modinst103 (.wire71(wire30), .clk(clk), .wire73(wire69), .wire74(wire27), .y(wire102), .wire72(wire29));
  assign wire104 = ({{($unsigned(wire28) - ((8'hb1) & wire102))},
                           $signed($signed((~^(8'hb6))))} ?
                       ((wire32[(2'h2):(1'h0)] >= (^(|wire25))) ?
                           {$unsigned($unsigned((8'hbb))),
                               $unsigned(wire67[(2'h2):(1'h1)])} : (&(~&(wire31 - (8'haf))))) : ({(+(wire69 ?
                                   wire32 : wire67)),
                               wire28[(1'h1):(1'h0)]} ?
                           ($unsigned($unsigned(wire26)) || {$unsigned(wire69)}) : (wire33[(3'h5):(1'h0)] ?
                               $unsigned(((8'ha7) ?
                                   wire69 : wire102)) : $signed(wire67[(2'h2):(2'h2)]))));
  assign wire105 = wire26[(2'h3):(2'h2)];
  assign wire106 = $signed($unsigned((~^(wire29 ?
                       (wire25 & wire67) : $signed(wire67)))));
  assign wire107 = wire26;
  assign wire108 = (wire104[(2'h3):(2'h2)] ?
                       wire67[(3'h4):(1'h0)] : wire29[(3'h7):(2'h2)]);
  assign wire109 = wire108[(2'h2):(2'h2)];
  assign wire110 = {{((!$unsigned(wire27)) ?
                               ($unsigned(wire109) ?
                                   wire106 : ((8'ha2) <<< wire33)) : ((-wire27) ?
                                   (wire32 - wire108) : wire28)),
                           {(~(wire107 ? wire26 : wire106))}}};
  always
    @(posedge clk) begin
      if (wire102[(1'h1):(1'h1)])
        begin
          reg111 <= $signed($unsigned(wire107[(2'h3):(2'h2)]));
        end
      else
        begin
          reg111 <= ($unsigned($unsigned(wire109[(4'hf):(4'hb)])) && ($signed(wire104) << $unsigned(wire67)));
          reg112 <= ($signed({wire104}) ?
              (~&(wire25 ? wire104 : (8'ha0))) : wire33[(4'he):(2'h3)]);
        end
    end
  module113 #() modinst128 (wire127, clk, wire109, wire107, wire31, wire26);
  assign wire129 = $unsigned({(8'h9f)});
  assign wire130 = wire28;
  assign wire131 = ($signed($signed(wire107)) ?
                       (wire106 != (~^$unsigned(reg111[(4'hb):(1'h1)]))) : wire67[(1'h1):(1'h0)]);
  assign wire132 = wire28;
endmodule

module module113
#(parameter param126 = {({{{(8'h9e)}, (~&(8'haf))}} ? ((8'hab) - {((8'hab) ? (8'ha0) : (8'hae)), (~|(7'h43))}) : (^(!((7'h41) ? (8'ha8) : (8'hbd)))))})
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire117;
  input wire signed [(2'h3):(1'h0)] wire116;
  input wire [(4'h9):(1'h0)] wire115;
  input wire [(4'hf):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire125;
  wire [(4'he):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire123;
  wire signed [(5'h13):(1'h0)] wire122;
  wire [(4'ha):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire118;
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire119,
                 wire118,
                 reg121,
                 (1'h0)};
  assign wire118 = ($signed(wire117) && $signed($signed(((8'ha3) & {wire114,
                       wire116}))));
  assign wire119 = $signed(wire114[(3'h7):(3'h6)]);
  assign wire120 = $unsigned(($unsigned(((wire116 ?
                           wire115 : wire115) || wire119[(4'h8):(4'h8)])) ?
                       $unsigned(wire117[(1'h1):(1'h0)]) : wire119));
  always
    @(posedge clk) begin
      reg121 <= (~|wire115);
    end
  assign wire122 = reg121[(3'h7):(3'h7)];
  assign wire123 = ($unsigned($unsigned(({wire115} != (wire122 ?
                       wire117 : wire120)))) << (($unsigned((wire120 <<< (8'hb4))) ?
                       $signed(wire119[(4'h8):(2'h3)]) : {(wire114 ?
                               wire115 : wire118)}) & (~&$signed((8'h9e)))));
  assign wire124 = (~^((wire117 ?
                       (-$unsigned(wire116)) : (~&reg121)) * (wire123[(1'h1):(1'h0)] ?
                       {wire115[(3'h7):(2'h3)], $signed(wire122)} : wire122)));
  assign wire125 = $signed(wire120);
endmodule

module module70  (y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire74;
  input wire signed [(3'h6):(1'h0)] wire73;
  input wire signed [(5'h13):(1'h0)] wire72;
  input wire [(4'hd):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire95;
  wire [(3'h7):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg99,
                 reg98,
                 reg97,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire75 = (wire72[(3'h5):(1'h1)] ?
                      (&$unsigned(((wire72 ?
                          wire72 : wire74) - (wire73 <<< wire72)))) : (((wire73[(3'h4):(2'h3)] ?
                                  (~|wire74) : wire71) ?
                              {$unsigned(wire72),
                                  $signed(wire72)} : (|(|wire74))) ?
                          (((^wire72) < $unsigned(wire71)) ?
                              wire73 : wire74[(4'ha):(4'ha)]) : $unsigned(wire72[(4'hd):(2'h2)])));
  assign wire76 = ({$unsigned(wire72[(4'hf):(3'h7)]), wire71} != (wire74 ?
                      ({(wire73 ? wire73 : wire71)} ?
                          ((~wire73) ?
                              $unsigned(wire71) : wire71) : $signed(wire75)) : $signed(wire71[(4'hc):(3'h6)])));
  assign wire77 = (-$signed((~|($signed(wire71) == wire74[(4'hc):(3'h6)]))));
  assign wire78 = $unsigned($signed(((wire73[(3'h6):(2'h2)] ?
                      wire74[(4'ha):(1'h0)] : {wire71}) <= wire75)));
  assign wire79 = $unsigned(((($unsigned(wire72) ?
                              (wire78 ? wire76 : wire74) : (wire71 ?
                                  wire72 : (8'ha6))) ?
                          (8'hbb) : ($signed((8'haa)) > {wire76})) ?
                      (!({wire74} > {wire75})) : $signed(($unsigned((8'hb5)) ?
                          (wire72 ? wire76 : wire76) : ((8'hbc) ?
                              wire73 : wire74)))));
  assign wire80 = (wire78[(5'h10):(1'h0)] >= ((~|wire79[(5'h12):(5'h11)]) ?
                      wire74[(3'h6):(1'h1)] : $unsigned((wire73[(1'h1):(1'h0)] ~^ (7'h43)))));
  always
    @(posedge clk) begin
      reg81 <= $unsigned((~&wire75[(1'h0):(1'h0)]));
      reg82 <= $unsigned((&(|wire75[(1'h0):(1'h0)])));
      reg83 <= $unsigned(((~$unsigned(wire78)) >> $unsigned(wire78)));
    end
  assign wire84 = $unsigned(wire73[(1'h0):(1'h0)]);
  assign wire85 = $unsigned(((wire76 != reg82) ?
                      $signed(wire72) : (wire72[(4'hb):(4'h8)] || wire76)));
  assign wire86 = wire76;
  assign wire87 = (^~wire79);
  always
    @(posedge clk) begin
      reg88 <= $signed($signed((^~$signed(wire86[(4'ha):(1'h1)]))));
      reg89 <= wire75;
      reg90 <= ({$unsigned(reg89), wire77[(3'h6):(3'h4)]} ?
          {($unsigned(wire73) + wire77[(3'h6):(1'h1)]),
              ($unsigned(wire87[(3'h5):(1'h0)]) >> wire79[(4'h8):(1'h1)])} : $signed({(wire77 ?
                  (wire78 <= wire74) : $unsigned(reg81)),
              (+wire80)}));
      reg91 <= ((wire77 - ((wire86 ^~ reg82[(1'h1):(1'h0)]) >> (wire78 >> (^reg81)))) ?
          (8'h9e) : $signed((wire73 ? $signed((wire72 <<< (8'hb1))) : reg82)));
    end
  assign wire92 = {$signed($unsigned(wire86))};
  assign wire93 = (wire85[(1'h0):(1'h0)] ?
                      $unsigned(($unsigned({wire74}) != {$unsigned((8'hb1)),
                          wire75})) : wire72[(4'hd):(3'h7)]);
  assign wire94 = reg89;
  assign wire95 = ((8'hb6) != ($signed((8'hb7)) != reg83[(4'h8):(2'h2)]));
  assign wire96 = (reg82 ?
                      wire85[(3'h6):(3'h4)] : ({wire92[(1'h1):(1'h1)]} & wire87[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg97 <= ($signed($unsigned(wire78[(1'h0):(1'h0)])) ?
          (^(reg81 <<< $unsigned($unsigned(reg90)))) : wire77);
      reg98 <= (~&$signed(wire87[(3'h7):(2'h2)]));
      reg99 <= $signed((^$unsigned(($unsigned(wire95) ?
          (^wire72) : wire79[(4'hd):(4'hb)]))));
    end
  assign wire100 = ((($signed(wire75) <<< {wire95[(1'h0):(1'h0)]}) ?
                           $signed((wire84[(4'hd):(4'hc)] ?
                               wire84 : (-(8'haf)))) : $signed($unsigned($unsigned(wire94)))) ?
                       ($unsigned($signed((wire75 && reg83))) ?
                           {$signed(wire73)} : reg97) : (~|(8'ha0)));
  assign wire101 = ((~^((wire79[(4'hc):(3'h5)] ? (^~wire87) : (reg83 & reg98)) ?
                       ($unsigned(reg90) ?
                           (reg88 ?
                               wire75 : reg91) : wire77[(1'h0):(1'h0)]) : (~^reg97))) == ((8'hae) <= wire74[(3'h4):(2'h3)]));
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire39;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire signed [(4'hc):(1'h0)] wire37;
  input wire [(5'h10):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire42,
                 wire41,
                 wire40,
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
                 (1'h0)};
  assign wire40 = $signed($unsigned(wire37[(4'h8):(3'h4)]));
  assign wire41 = (!{wire36[(3'h4):(1'h0)],
                      (&({(8'hb1), wire36} ? $signed((7'h42)) : (^~wire36)))});
  assign wire42 = (-$unsigned({(wire38 ?
                          (wire39 ? wire41 : (8'hba)) : (wire37 >= wire39)),
                      $signed((wire40 ? wire39 : wire39))}));
  always
    @(posedge clk) begin
      if (wire35)
        begin
          reg43 <= wire36[(2'h2):(1'h1)];
        end
      else
        begin
          if ($signed(((8'hac) * ($signed(wire35[(4'h9):(1'h0)]) > ($unsigned((8'hb3)) >= reg43[(1'h0):(1'h0)])))))
            begin
              reg43 <= ({reg43} ?
                  wire37 : $unsigned(($unsigned(wire42) ?
                      $signed($unsigned(wire41)) : (wire42[(2'h2):(2'h2)] | {reg43}))));
              reg44 <= $unsigned($signed($unsigned(((reg43 ? wire38 : reg43) ?
                  $signed(wire36) : {wire41, wire39}))));
              reg45 <= reg43;
            end
          else
            begin
              reg43 <= wire36;
              reg44 <= reg43;
              reg45 <= wire39[(4'ha):(4'h8)];
              reg46 <= (~&wire42);
            end
          reg47 <= (!((|(wire40[(2'h2):(1'h0)] == wire40[(4'h9):(1'h0)])) - wire36));
          reg48 <= ($signed($unsigned(wire39[(3'h6):(3'h6)])) ?
              ($unsigned(wire38) ?
                  $signed({$unsigned(reg47)}) : $signed(((reg45 << reg47) ?
                      $unsigned(reg46) : $unsigned(wire37)))) : wire38[(2'h2):(1'h1)]);
          reg49 <= wire37[(2'h2):(1'h0)];
          reg50 <= (wire39[(4'hb):(1'h1)] <= reg46);
        end
      reg51 <= reg46;
      reg52 <= $unsigned(wire35[(3'h4):(3'h4)]);
    end
  assign wire53 = ($signed(((8'ha6) ?
                          ({wire41,
                              reg47} + $unsigned((8'haf))) : $unsigned((!reg45)))) ?
                      (8'hb2) : $signed(reg48[(3'h6):(3'h6)]));
  assign wire54 = reg49;
  assign wire55 = {wire36[(3'h4):(2'h3)]};
  assign wire56 = wire38[(5'h10):(2'h3)];
  assign wire57 = (reg46[(2'h3):(1'h1)] ?
                      wire39[(3'h5):(1'h1)] : {({wire35,
                              (wire53 == reg51)} * (~|wire55[(5'h12):(3'h4)])),
                          reg43});
  assign wire58 = {{(($unsigned(reg43) ^~ reg48) ?
                              wire53 : $unsigned(reg52[(1'h1):(1'h0)]))},
                      ($signed((&(wire57 ?
                          (8'hbe) : wire36))) > $signed($signed((reg48 >= (8'hb9)))))};
  assign wire59 = ($unsigned((|wire53)) ?
                      ($unsigned({{wire54}}) && reg49[(4'h8):(2'h3)]) : (~&$signed(reg46[(4'he):(3'h5)])));
  assign wire60 = $signed(reg45);
  assign wire61 = ($signed($unsigned(wire59)) ?
                      $signed(reg46[(4'hf):(1'h0)]) : {reg52,
                          $unsigned($unsigned((wire60 ? wire42 : wire40)))});
  assign wire62 = $unsigned((reg44[(1'h0):(1'h0)] ?
                      wire58[(4'h9):(4'h9)] : {(~|reg51[(4'h8):(3'h7)]),
                          wire42}));
  assign wire63 = reg48;
  assign wire64 = (~|($unsigned((8'h9f)) ?
                      reg44[(1'h1):(1'h1)] : (({wire41, wire60} ?
                              wire55[(5'h11):(4'hd)] : wire55[(5'h11):(3'h7)]) ?
                          $signed($unsigned(reg48)) : {{(8'hbd), wire62},
                              $signed(wire40)})));
  assign wire65 = $unsigned(wire54[(4'h9):(1'h0)]);
  assign wire66 = $unsigned(($signed((wire35[(4'h8):(2'h3)] ?
                          wire55[(3'h4):(1'h1)] : reg52)) ?
                      (((8'ha2) - wire58) < $unsigned(reg48)) : wire61[(2'h2):(2'h2)]));
endmodule
