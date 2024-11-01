module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire140;
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg4 = (1'h0);
  assign y = {wire15,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire140,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire2[(2'h2):(2'h2)])))
        begin
          reg4 <= wire2;
        end
      else
        begin
          reg4 <= ($signed(($signed((!(8'h9c))) - ((wire1 ?
                  wire1 : reg4) * wire2[(1'h1):(1'h1)]))) ?
              $unsigned(wire1) : $signed((wire1 + wire0[(1'h0):(1'h0)])));
        end
      reg5 <= (wire0[(3'h4):(2'h2)] ?
          $unsigned($signed($signed($unsigned(wire3)))) : ((((reg4 ~^ wire1) >> (reg4 ?
                  wire3 : wire3)) ?
              $signed(wire2[(3'h4):(2'h2)]) : $signed((wire1 ^ (8'hab)))) ^~ $unsigned((+$signed(reg4)))));
      reg6 <= $signed($unsigned(wire1[(1'h0):(1'h0)]));
      if ({$unsigned(reg4)})
        begin
          reg7 <= $unsigned(wire3);
          reg8 <= {$unsigned((^$signed((wire1 < wire3)))),
              (^~(reg7 + ((~&reg6) ?
                  (reg6 >> wire1) : (reg7 ? wire3 : reg4))))};
        end
      else
        begin
          reg7 <= (($signed(wire1) ?
                  $signed(($signed(reg4) + (wire1 ~^ reg8))) : reg8[(3'h5):(1'h1)]) ?
              $signed((reg4[(1'h0):(1'h0)] ?
                  (~^{wire3}) : ($signed((7'h44)) != $signed((8'ha1))))) : (wire1[(2'h2):(2'h2)] ?
                  $signed(reg4) : wire0));
        end
      reg9 <= reg6[(4'hb):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg10 <= (reg4 && (($unsigned((^~wire0)) ?
              ((reg5 ? wire0 : (7'h41)) ?
                  (wire0 != wire1) : (wire2 ^~ reg6)) : (reg4 ?
                  (~|wire3) : reg8)) ?
          $signed((reg8 ?
              ((8'hac) ^~ reg7) : reg8[(4'he):(1'h1)])) : ((8'hae) << {$signed(wire1)})));
      reg11 <= wire0[(3'h4):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg12 <= (~|(~|{$signed((!reg10))}));
      if ($unsigned(reg12))
        begin
          reg13 <= ({$unsigned($unsigned((~&reg4))),
                  ((((8'hb2) >= reg12) ? (reg12 * reg10) : reg9) ^~ ((reg12 ?
                          reg11 : reg11) ?
                      ((7'h44) ~^ reg12) : $unsigned(reg6)))} ?
              ({{(wire1 ? reg12 : reg5), $unsigned(reg10)},
                      $unsigned((reg9 <= reg7))} ?
                  {((reg6 - wire2) ?
                          $signed(wire0) : wire3[(2'h3):(1'h1)])} : (~|wire2[(2'h3):(2'h2)])) : reg12[(2'h3):(1'h0)]);
          reg14 <= $signed(wire3[(3'h5):(1'h0)]);
        end
      else
        begin
          reg13 <= $unsigned($signed($unsigned(({wire1, reg8} ?
              $unsigned((7'h43)) : $unsigned(reg7)))));
        end
    end
  assign wire15 = reg8;
  always
    @(posedge clk) begin
      reg16 <= reg10;
      reg17 <= reg9[(1'h0):(1'h0)];
      reg18 <= (reg12 ^ $signed((reg14[(4'hc):(4'h9)] ?
          (^$signed(reg16)) : ($signed((8'ha3)) ?
              (reg7 ^~ reg10) : (wire15 ? reg13 : (8'hae))))));
      reg19 <= reg10[(3'h4):(2'h3)];
    end
  assign wire20 = (~&reg5[(4'hc):(2'h3)]);
  assign wire21 = (reg11 ?
                      {$signed((wire15 ? {reg5} : (~&reg16))),
                          ($signed($unsigned(reg14)) <<< reg19[(3'h5):(3'h5)])} : (((8'hb5) ?
                          ($signed(reg14) < reg4[(2'h2):(1'h1)]) : $signed(reg13)) << {$unsigned(reg9)}));
  assign wire22 = reg4;
  assign wire23 = ((((&$unsigned((8'hb1))) ?
                          $unsigned((+wire1)) : $signed(reg17)) ?
                      reg17 : ($unsigned((reg11 ? reg8 : wire2)) ?
                          (~(~|reg13)) : reg12[(4'ha):(3'h6)])) | ($unsigned(($signed(reg11) ?
                      (reg17 ?
                          wire22 : (8'hb2)) : (8'hb9))) <<< $signed((((8'hb6) ?
                          reg10 : (8'hb2)) ?
                      (reg5 < (8'hbd)) : (^~reg11)))));
  assign wire24 = $unsigned((+reg5[(1'h1):(1'h0)]));
  module25 #() modinst141 (wire140, clk, wire21, reg10, wire2, wire0, reg14);
endmodule

module module25
#(parameter param138 = (^~(((^((8'ha5) <<< (8'hb3))) != (((8'h9c) ? (8'ha5) : (8'h9f)) * ((8'hba) ? (7'h40) : (8'ha8)))) << (8'h9e))), 
parameter param139 = {((&{((7'h41) ? param138 : param138)}) && param138)})
(y, clk, wire26, wire27, wire28, wire29, wire30);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire26;
  input wire [(4'h8):(1'h0)] wire27;
  input wire signed [(4'hf):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire137;
  wire signed [(4'h9):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire135;
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  assign y = {wire137,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire57,
                 wire59,
                 wire60,
                 wire64,
                 wire135,
                 reg63,
                 reg62,
                 reg61,
                 reg35,
                 (1'h0)};
  assign wire31 = ((($signed({wire27}) >>> wire30) ?
                      $signed(({wire27, (8'h9e)} ?
                          wire29[(1'h1):(1'h0)] : (wire28 ?
                              (8'hac) : wire26))) : wire28) < ($signed((-((8'hbf) ?
                      wire28 : wire29))) != ($unsigned(wire26) || (~wire29))));
  assign wire32 = (^~$signed(((!wire30[(3'h6):(1'h0)]) <<< (^~$signed(wire30)))));
  assign wire33 = {wire28[(4'h8):(3'h6)], $signed((^wire28))};
  assign wire34 = (8'hbd);
  always
    @(posedge clk) begin
      reg35 <= (wire33[(4'hf):(4'he)] ?
          wire34[(3'h4):(2'h2)] : (~^((&(!wire26)) < (!wire32))));
    end
  assign wire36 = $unsigned((~&$unsigned(wire33)));
  assign wire37 = (wire31[(2'h3):(1'h0)] ?
                      (&($unsigned(((8'hb3) ~^ wire29)) <= wire28)) : ($signed((|$signed(wire34))) ?
                          ($signed(((8'ha1) & (7'h44))) ?
                              $signed(wire27) : ($unsigned(wire27) ?
                                  $unsigned(wire32) : wire26[(3'h5):(1'h1)])) : $signed(((wire28 ?
                              wire28 : wire34) ~^ $unsigned(wire28)))));
  assign wire38 = ((wire31[(4'h9):(2'h2)] < wire30) <= (+$signed(wire32)));
  assign wire39 = $signed((wire31[(3'h7):(3'h4)] == (~(~&wire28))));
  assign wire40 = wire32;
  assign wire41 = (wire39 == wire38[(1'h1):(1'h0)]);
  module42 #() modinst58 (.y(wire57), .wire46(wire26), .wire45(wire34), .wire44(wire38), .clk(clk), .wire43(wire31));
  assign wire59 = (wire27 ^ ($signed((+(wire28 ^~ wire27))) | $signed(((wire26 ?
                          wire31 : wire32) ?
                      (wire40 ? (7'h43) : wire30) : $unsigned(wire36)))));
  assign wire60 = ({(+((wire37 ? wire32 : wire57) ?
                          (wire37 ? wire30 : wire26) : (~&wire37))),
                      wire40} > (^~wire27));
  always
    @(posedge clk) begin
      reg61 <= ((~|wire36) ?
          (wire57 <= wire37) : (^~({(wire32 ~^ (7'h43)),
              $signed(wire33)} ^~ (|wire59[(2'h2):(1'h1)]))));
      reg62 <= (|((~|wire34[(4'h9):(1'h1)]) < wire41));
      reg63 <= wire37[(4'h8):(2'h2)];
    end
  assign wire64 = (~|(reg62[(3'h5):(2'h2)] >= {$signed($signed((8'hba))),
                      (^~(|wire40))}));
  module65 #() modinst136 (.wire69(wire59), .wire70(reg61), .wire68(reg63), .y(wire135), .clk(clk), .wire67(wire39), .wire66(wire60));
  assign wire137 = wire38[(2'h3):(1'h1)];
endmodule

module module65
#(parameter param133 = ((-((((8'hb8) ? (8'ha3) : (8'hba)) ^ ((8'haa) ? (7'h41) : (7'h41))) < (((8'hab) ? (8'ha4) : (8'hbf)) << (^~(8'hbf))))) ? ((~|(+((8'hb8) < (8'ha4)))) ? {((~|(8'hb2)) ? ((8'hb1) >> (8'hbf)) : ((8'ha8) | (8'h9e)))} : ((((8'hac) ? (8'hbd) : (8'haa)) <= ((8'h9c) == (8'hb1))) <<< (&((8'hb6) ? (8'hbe) : (8'hbd))))) : (^~(({(8'ha3), (8'ha5)} ? ((8'ha4) ? (8'haa) : (8'haf)) : ((8'hbd) ? (7'h41) : (8'ha2))) * (8'hb4)))), 
parameter param134 = param133)
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h28f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire70;
  input wire [(3'h6):(1'h0)] wire69;
  input wire [(5'h13):(1'h0)] wire68;
  input wire [(4'hf):(1'h0)] wire67;
  input wire signed [(4'hb):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire71;
  reg [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire97,
                 wire96,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire71,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
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
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg99,
                 reg98,
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
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire71 = $unsigned(($signed(((&wire69) ?
                      ((8'hac) ?
                          wire68 : wire66) : wire68[(1'h1):(1'h0)])) < $signed((wire67 ?
                      {wire66, wire69} : (wire70 >>> wire70)))));
  always
    @(posedge clk) begin
      if ($signed((~&$signed((~^wire70[(3'h4):(2'h2)])))))
        begin
          reg72 <= $signed(($signed(((wire69 - wire67) ^ $signed(wire66))) ?
              $unsigned((~|wire71)) : ($signed($signed(wire71)) <<< $unsigned(wire67[(4'h9):(3'h7)]))));
          reg73 <= (wire71 ?
              (((!(~|wire66)) ?
                      $unsigned(((8'hb8) < wire71)) : ($unsigned(wire70) <= (wire69 ?
                          wire71 : reg72))) ?
                  ($unsigned($signed(wire69)) >>> wire67) : (|(&reg72))) : ((($signed(wire68) + $signed((8'ha9))) ?
                  wire68[(1'h0):(1'h0)] : ((wire68 > (8'h9e)) ?
                      $signed(wire71) : $signed(wire71))) ^ {$unsigned({wire71}),
                  ($unsigned(wire67) ? (^~wire71) : wire70)}));
          reg74 <= ($signed((!(|(wire71 ?
              wire68 : (8'haa))))) < $unsigned(((8'ha6) ?
              wire67 : $unsigned({(8'ha9)}))));
        end
      else
        begin
          reg72 <= (8'hb1);
          reg73 <= reg74[(2'h2):(1'h1)];
          reg74 <= $unsigned(((^~wire71[(3'h4):(3'h4)]) ?
              {(^~(&reg72))} : ($signed({wire70}) && (wire67 >= reg74[(4'h9):(4'h8)]))));
          reg75 <= (wire67 > wire69[(3'h4):(3'h4)]);
          reg76 <= (~^$unsigned({(~^reg75)}));
        end
      reg77 <= ($signed((((reg72 >> reg76) ?
              (wire66 && (8'hb3)) : wire71) && $unsigned(wire71))) ?
          wire68 : (-(~|$unsigned((wire71 * (8'haa))))));
    end
  assign wire78 = reg76[(2'h3):(1'h1)];
  assign wire79 = wire78;
  assign wire80 = reg72[(3'h7):(1'h0)];
  assign wire81 = (($unsigned((^(reg75 & wire79))) ?
                          {$signed((reg73 == (8'hba))),
                              (^~(wire70 + reg76))} : (~{(wire66 >= wire68)})) ?
                      {wire78} : ($unsigned($unsigned($signed(reg75))) && (reg74 < $signed(wire71))));
  assign wire82 = (($signed((wire68[(4'hc):(4'h9)] ?
                      (~^(8'ha6)) : (~|wire78))) == ($unsigned(((8'hb4) ?
                          (8'hb1) : reg75)) ?
                      ((8'haf) == wire68) : $unsigned((8'hb4)))) <= {$signed(($signed(wire78) > $signed(wire79))),
                      $signed(reg76)});
  assign wire83 = $unsigned((reg73 < (^~$unsigned(((8'h9e) | wire82)))));
  always
    @(posedge clk) begin
      reg84 <= $signed(wire66[(4'ha):(3'h4)]);
      reg85 <= ($signed($signed($unsigned((reg74 ^~ wire66)))) ?
          wire71 : (8'haa));
      reg86 <= {reg84, {$signed($signed((reg76 != reg73)))}};
      if ($unsigned(reg77))
        begin
          reg87 <= $unsigned(($signed($unsigned(reg72[(3'h5):(3'h4)])) << reg73));
          reg88 <= ((($signed((wire68 >>> wire82)) + (+$signed(wire68))) <= wire71[(4'he):(2'h2)]) ?
              reg77[(2'h2):(2'h2)] : wire67[(2'h2):(1'h0)]);
          if (($signed($signed(wire69[(3'h5):(2'h2)])) ?
              $unsigned((!(+{wire66}))) : wire67[(1'h1):(1'h0)]))
            begin
              reg89 <= ($unsigned(wire78[(3'h7):(1'h1)]) ?
                  (((|(wire67 ? (8'h9c) : reg75)) ?
                          wire71 : reg75[(2'h3):(2'h3)]) ?
                      $signed(reg72) : $unsigned($signed((wire83 >>> wire67)))) : (!(!(~|$signed(wire69)))));
            end
          else
            begin
              reg89 <= (8'hb3);
              reg90 <= $unsigned($signed(($signed(wire70[(1'h0):(1'h0)]) ?
                  $signed((^reg89)) : reg85[(1'h0):(1'h0)])));
              reg91 <= (wire78[(2'h2):(1'h0)] ?
                  $signed(($unsigned($unsigned(reg72)) ?
                      wire69 : ({(8'hb7), reg87} ?
                          reg87[(4'hb):(1'h0)] : (reg85 ~^ reg88)))) : reg85);
              reg92 <= reg85;
              reg93 <= $signed((~&$signed(($unsigned(reg86) ?
                  wire69 : {reg73, reg92}))));
            end
          reg94 <= (reg84 > (8'hbe));
        end
      else
        begin
          reg87 <= wire69;
          if ($unsigned((~|(+$signed((wire83 - reg85))))))
            begin
              reg88 <= $signed((wire81 < (~&$signed((^~(8'ha5))))));
              reg89 <= (~^wire66);
              reg90 <= wire82[(1'h1):(1'h1)];
              reg91 <= ((((~^(wire69 ? wire66 : reg84)) && ((wire70 ?
                              wire81 : reg90) ?
                          reg85 : {wire83, wire71})) ?
                      $unsigned(wire66[(2'h2):(1'h0)]) : (-(|((7'h41) ?
                          wire81 : reg92)))) ?
                  $unsigned($signed((8'ha4))) : {$unsigned($signed(reg92[(1'h1):(1'h0)])),
                      reg73});
            end
          else
            begin
              reg88 <= $signed(wire70);
            end
          reg92 <= wire80[(3'h7):(2'h3)];
          reg93 <= wire83[(4'hb):(2'h2)];
          reg94 <= $unsigned($unsigned($unsigned($unsigned($unsigned(reg85)))));
        end
      reg95 <= wire66;
    end
  assign wire96 = ($signed(($unsigned($unsigned(reg93)) ?
                      reg75[(3'h5):(3'h4)] : $signed({(8'ha5),
                          reg90}))) & wire79);
  assign wire97 = $unsigned($signed((8'ha5)));
  always
    @(posedge clk) begin
      reg98 <= (|(~$unsigned(reg94[(2'h3):(2'h2)])));
      reg99 <= ($signed($signed(wire96)) || ((((^~(8'hb3)) ?
                  $signed(wire68) : reg88) ?
              $unsigned((reg75 ? reg75 : reg98)) : {{wire67},
                  $unsigned(wire70)}) ?
          ({(-reg85)} ?
              ($unsigned(wire67) + $unsigned(reg74)) : wire67) : {{$unsigned(reg98),
                  $signed(reg91)},
              {reg74, ((8'hb5) ^~ reg74)}}));
    end
  assign wire100 = (~&$unsigned($signed(reg74[(4'h9):(1'h0)])));
  assign wire101 = reg77;
  assign wire102 = $signed((wire81[(3'h4):(2'h2)] || $unsigned(($unsigned((8'ha8)) > $signed((8'hb2))))));
  assign wire103 = reg91[(2'h3):(1'h0)];
  assign wire104 = {(wire80[(4'h9):(4'h9)] < $signed(((8'hba) ?
                           reg72[(2'h3):(1'h1)] : $signed(wire80)))),
                       (((8'hba) ?
                           {(reg72 <<< (8'hac)),
                               reg77[(3'h4):(1'h0)]} : ((wire66 ?
                               (8'hb5) : wire66) * (reg75 ^~ reg90))) <= (-reg88[(4'h9):(3'h4)]))};
  assign wire105 = $unsigned($unsigned(($signed(((8'hb9) > reg99)) ?
                       $signed(reg98) : ($unsigned(reg75) ?
                           (8'ha7) : (&wire80)))));
  assign wire106 = {$signed((reg98 <<< wire83))};
  assign wire107 = wire69[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg108 <= ($signed(($signed((reg89 > reg90)) << (-(~wire102)))) != (~^$unsigned($signed((wire83 || reg77)))));
      if ({{(-wire100)}, reg99})
        begin
          if (wire78)
            begin
              reg109 <= (-{$unsigned(reg88)});
              reg110 <= (~&(&$signed($signed(reg92))));
              reg111 <= reg84[(3'h5):(3'h4)];
              reg112 <= $unsigned(($unsigned(wire107) ?
                  wire71 : {(|((8'ha7) >>> reg88)), wire71[(3'h7):(1'h0)]}));
            end
          else
            begin
              reg109 <= $unsigned(wire100);
              reg110 <= reg88[(3'h5):(2'h3)];
            end
          if ($unsigned((|(reg75 ?
              $signed((reg108 << wire82)) : {reg77[(2'h3):(2'h3)],
                  (+(8'ha6))}))))
            begin
              reg113 <= (^(!(((^~(7'h43)) ^~ (|wire96)) >> ($signed(reg87) - $signed(reg88)))));
              reg114 <= ((wire81 ? wire68[(2'h2):(1'h1)] : wire100) ?
                  ($signed((|wire79[(3'h4):(2'h2)])) ?
                      $signed(((reg98 ?
                          reg98 : reg76) < $unsigned(wire82))) : (~|{$signed(reg77),
                          reg92[(1'h1):(1'h1)]})) : (reg90[(2'h2):(1'h0)] ?
                      (wire102[(4'hc):(4'ha)] ^ (8'h9c)) : reg95));
              reg115 <= ((~&($unsigned(reg90[(1'h1):(1'h1)]) >> {(reg91 != (8'ha7))})) ?
                  $signed($unsigned(reg84)) : reg109);
              reg116 <= $unsigned($unsigned($signed((reg90 ?
                  (^~reg74) : wire97))));
            end
          else
            begin
              reg113 <= (|wire102);
            end
        end
      else
        begin
          reg109 <= {$unsigned(reg99)};
          if (((wire79[(3'h7):(2'h3)] >> (~|$signed((reg98 ?
              wire107 : wire105)))) && $unsigned((reg113[(3'h5):(3'h5)] > (reg85 ?
              (~|reg110) : reg87[(2'h3):(2'h2)])))))
            begin
              reg110 <= (+(8'hb9));
              reg111 <= {($unsigned(wire80[(4'he):(4'hd)]) ?
                      reg95[(4'h9):(4'h8)] : $unsigned($signed($signed(reg114))))};
              reg112 <= {$unsigned(reg75)};
            end
          else
            begin
              reg110 <= (wire66[(4'h8):(3'h5)] >> ((~&($signed(wire101) & wire107)) >>> (~$signed((8'hbc)))));
            end
          reg113 <= $signed(reg110);
          reg114 <= wire81[(1'h1):(1'h0)];
        end
      reg117 <= wire101;
      reg118 <= (wire81 ?
          $signed($signed($unsigned((^~wire71)))) : ($unsigned(reg89) ?
              (wire68 ?
                  $signed((^~wire67)) : ($unsigned(reg95) && (+reg113))) : $signed(reg75[(5'h10):(3'h5)])));
    end
  always
    @(posedge clk) begin
      if (reg99)
        begin
          reg119 <= ($unsigned(wire106[(3'h4):(1'h1)]) < (8'hbc));
          reg120 <= $signed(reg112);
        end
      else
        begin
          reg119 <= ($signed($unsigned($signed($unsigned(wire67)))) - (!((reg118[(3'h6):(1'h0)] > (reg108 ?
              wire71 : reg119)) + reg74)));
          reg120 <= ({($signed((&(8'hb7))) <<< $signed((~|reg98)))} ?
              $signed($signed((((7'h41) ^ (8'hb2)) > (~^reg84)))) : {(8'hb1),
                  reg116});
          reg121 <= {$signed($signed((~|reg113[(4'hd):(3'h4)])))};
          if ((^((!$unsigned($signed(reg95))) <= reg90)))
            begin
              reg122 <= $unsigned($unsigned(reg89[(4'he):(3'h7)]));
              reg123 <= reg118[(3'h7):(3'h4)];
            end
          else
            begin
              reg122 <= ($signed((^~($signed(reg90) ?
                      $signed(reg99) : wire71))) ?
                  ($unsigned($unsigned(wire81)) ?
                      $signed(((8'ha8) * {wire105,
                          wire78})) : $unsigned(wire69)) : (8'h9c));
              reg123 <= reg73;
              reg124 <= (reg112 ?
                  ((!reg119[(1'h0):(1'h0)]) & $signed(((!reg113) ^ reg94))) : reg116);
              reg125 <= (~^$signed($unsigned($signed(wire82))));
              reg126 <= reg110;
            end
          if (($signed({$unsigned(wire107),
                  ($unsigned(reg114) ? $unsigned(wire97) : wire97)}) ?
              wire66[(3'h7):(2'h3)] : reg109))
            begin
              reg127 <= reg116[(2'h3):(2'h2)];
              reg128 <= (~^(reg114 ?
                  reg122[(2'h2):(1'h0)] : wire83[(1'h0):(1'h0)]));
            end
          else
            begin
              reg127 <= (~|$signed(reg77));
              reg128 <= $signed(reg121);
              reg129 <= reg127[(3'h5):(2'h2)];
              reg130 <= reg121[(2'h3):(1'h0)];
              reg131 <= (~^$unsigned((((reg77 ?
                  (7'h41) : reg121) & $signed(wire67)) < ((-(8'hb9)) ?
                  (~wire107) : (^~(8'hb6))))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg132 <= reg76[(3'h5):(3'h4)];
    end
endmodule

module module42
#(parameter param56 = ((((((8'hba) ? (8'hbf) : (8'hbe)) ? (-(7'h44)) : ((8'ha9) ? (8'hb0) : (8'h9c))) ? {((8'hb5) ? (8'ha5) : (8'h9e))} : (((8'ha8) ~^ (7'h40)) ? ((8'ha4) ? (8'hb6) : (8'hb1)) : ((8'ha6) ? (8'haf) : (8'hb6)))) ? ((((8'hb2) ? (8'hb9) : (8'ha2)) <<< (!(8'ha3))) ? (((8'hb8) ? (8'hbc) : (7'h41)) ? (^(8'hbc)) : ((8'hbb) <<< (8'ha3))) : (7'h44)) : (((8'ha3) ? (!(8'ha3)) : ((8'hb9) ? (7'h41) : (8'ha6))) >> (((8'ha8) ? (8'hbc) : (8'hbb)) ? (^(8'hb4)) : ((8'ha9) ? (8'ha2) : (8'h9d))))) ? ({({(8'hab), (8'ha2)} | ((8'hb3) ? (8'hb4) : (8'ha5)))} ? {(~|(|(8'hb3)))} : (({(8'h9e)} <= (~|(8'ha4))) ? {((7'h44) * (7'h41)), {(8'haf)}} : (^((7'h41) >>> (8'ha5))))) : (^~((8'ha3) ? ((~&(8'hba)) ? ((8'haa) & (8'hba)) : {(8'hb4)}) : (((8'hab) ? (7'h41) : (8'hbd)) ? ((7'h42) + (8'ha8)) : ((8'ha6) ? (8'hab) : (8'hac)))))))
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire46;
  input wire signed [(4'hc):(1'h0)] wire45;
  input wire signed [(3'h5):(1'h0)] wire44;
  input wire signed [(3'h6):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire47;
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 reg48,
                 (1'h0)};
  assign wire47 = $signed($signed($signed((!$signed(wire46)))));
  always
    @(posedge clk) begin
      reg48 <= wire44[(3'h4):(1'h0)];
    end
  assign wire49 = wire47[(1'h0):(1'h0)];
  assign wire50 = ($unsigned(wire49[(3'h6):(3'h5)]) || {wire44[(1'h0):(1'h0)],
                      ((+wire44) ?
                          ({wire45} < $signed((8'haf))) : (wire49 < (^~wire44)))});
  assign wire51 = $signed((+({wire47[(4'h9):(2'h2)]} ^~ ((8'h9f) ?
                      (wire50 == wire46) : wire44[(3'h5):(1'h1)]))));
  assign wire52 = reg48;
  assign wire53 = ((~^{$signed((^wire46)),
                      {{wire43, reg48},
                          $signed((8'hb2))}}) + $unsigned((wire50 ?
                      (^(reg48 ~^ wire49)) : (-$signed(wire45)))));
  assign wire54 = (wire53 || ($unsigned(wire52) >> (8'ha8)));
  assign wire55 = reg48[(3'h4):(1'h0)];
endmodule
