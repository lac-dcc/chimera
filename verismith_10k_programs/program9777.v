module top
#(parameter param181 = ((!((|((8'hb0) || (7'h41))) ? ((~|(7'h44)) - ((8'hb9) >>> (7'h41))) : (~^(&(7'h42))))) ? ({(((8'hbe) ? (8'ha7) : (8'ha5)) ? ((8'hb8) - (8'ha1)) : ((8'ha0) || (8'hac)))} ? ((((8'ha2) >>> (8'hbb)) ? ((8'hb9) ? (8'hb3) : (8'hba)) : ((7'h44) ? (8'hbc) : (8'h9d))) ? (^~((8'had) ? (8'ha5) : (8'ha4))) : ({(7'h42)} ? ((8'haf) && (8'ha7)) : (~&(8'h9d)))) : (7'h43)) : (~^((((7'h40) ? (8'ha7) : (7'h44)) ? (-(8'hb8)) : ((8'h9d) ? (8'ha5) : (8'h9c))) <<< (&((8'hbd) ? (8'haf) : (7'h43)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire180;
  wire signed [(4'ha):(1'h0)] wire179;
  wire [(3'h5):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire122;
  wire [(3'h6):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire177;
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire90,
                 wire4,
                 wire92,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire177,
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
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire4 = ((wire3 ?
                         $signed((-(8'h9c))) : $signed(($unsigned(wire3) ?
                             (wire1 >= wire2) : wire2))) ?
                     wire0[(4'h9):(4'h8)] : wire3);
  always
    @(posedge clk) begin
      reg5 <= $signed($unsigned($signed($unsigned(wire1))));
      reg6 <= ($unsigned({((-(8'hb3)) ?
              (wire2 > wire3) : ((8'hbf) <<< wire1))}) >>> (-(^wire0[(4'h9):(3'h4)])));
      if ($signed({((8'ha6) != $unsigned(wire4))}))
        begin
          if ((~&wire0))
            begin
              reg7 <= (~|(~&{{wire1[(2'h3):(2'h2)]}}));
            end
          else
            begin
              reg7 <= ($unsigned($signed($unsigned($signed(wire1)))) ?
                  reg5[(2'h3):(2'h3)] : reg6);
              reg8 <= wire2;
            end
        end
      else
        begin
          reg7 <= (($signed(wire3) < wire2[(2'h3):(2'h3)]) ?
              {(&(&reg5))} : $signed(wire3));
        end
      reg9 <= (&wire3[(1'h0):(1'h0)]);
      reg10 <= (reg8 || reg9);
    end
  module11 #() modinst91 (wire90, clk, reg7, wire3, wire4, wire2);
  assign wire92 = ((!($signed((wire2 ? reg8 : wire2)) < ((-(8'hb2)) ?
                          (8'hb0) : {reg10}))) ?
                      $signed($signed($signed((+wire90)))) : {{($signed(reg7) <= reg7[(3'h6):(1'h1)]),
                              $unsigned($signed(reg8))}});
  always
    @(posedge clk) begin
      if ((&$signed($signed(((wire90 ? wire4 : reg6) ? (8'hb9) : (^reg8))))))
        begin
          if (reg8[(3'h6):(2'h3)])
            begin
              reg93 <= wire3;
              reg94 <= $signed($unsigned((-wire4)));
              reg95 <= (|($unsigned({$unsigned(reg6)}) ?
                  $signed({((8'hbc) ? wire3 : reg5),
                      (8'hbe)}) : ($unsigned({wire2, (8'ha1)}) ^~ wire3)));
              reg96 <= $unsigned((~|(!((&wire92) >>> $unsigned(reg6)))));
              reg97 <= ($unsigned(wire2[(5'h12):(3'h5)]) ?
                  reg6[(3'h4):(2'h3)] : ((reg95 >>> (^$signed((8'haa)))) ?
                      reg95 : wire1[(4'he):(1'h0)]));
            end
          else
            begin
              reg93 <= (~&(reg9 + reg97[(2'h2):(1'h0)]));
              reg94 <= (&(~^$unsigned((+(^wire2)))));
              reg95 <= (&({reg8[(2'h3):(1'h0)]} ?
                  ((reg93[(1'h0):(1'h0)] & (wire0 ?
                      reg8 : (8'hba))) ^~ (-$signed(reg10))) : {$signed({(8'ha3),
                          wire90}),
                      ((~reg8) <= (8'hb9))}));
              reg96 <= reg7;
            end
          reg98 <= ((!reg5[(1'h1):(1'h1)]) ?
              $signed(reg5) : $unsigned($signed((^~(~^reg6)))));
          reg99 <= $signed(reg93[(5'h13):(1'h1)]);
          if ((!(|reg5[(2'h3):(2'h3)])))
            begin
              reg100 <= $signed($unsigned(wire2));
              reg101 <= (reg94 ?
                  ((($unsigned((8'hbd)) ?
                      (reg99 ? reg94 : wire3) : reg94) + (8'hbf)) > (|({reg96,
                          reg8} ?
                      (wire92 ?
                          reg95 : reg10) : wire2))) : $signed(reg10[(1'h1):(1'h1)]));
              reg102 <= $signed((reg95 && wire4));
              reg103 <= ($signed(((reg94 ~^ reg100) ^ $unsigned(wire3[(3'h7):(3'h5)]))) ?
                  (reg97 - reg101) : $signed(wire4[(3'h4):(2'h2)]));
            end
          else
            begin
              reg100 <= $signed({(((wire1 ? reg98 : reg98) ?
                      (8'hbf) : (wire0 <= reg8)) || wire90),
                  ((|reg103) && (^$signed(reg95)))});
            end
          reg104 <= reg5;
        end
      else
        begin
          reg93 <= reg102[(2'h3):(2'h2)];
          reg94 <= reg98;
        end
      reg105 <= (8'ha8);
      reg106 <= (8'ha6);
      if (reg99[(1'h0):(1'h0)])
        begin
          reg107 <= $unsigned((+({(~^(8'ha9))} ?
              $unsigned((8'ha3)) : reg99[(2'h2):(1'h1)])));
          reg108 <= ((((wire2[(4'hf):(4'hf)] < $signed(reg98)) >= ((reg104 & wire0) != (reg99 ?
                  (8'ha5) : reg6))) ?
              ($signed(reg10) ~^ {((8'hba) + wire0),
                  $unsigned(reg102)}) : (^~(reg103 ?
                  (reg5 * reg10) : $unsigned(wire4)))) | reg101);
          reg109 <= (~|{reg107, reg102});
          reg110 <= (reg109 ? $unsigned((^~{(wire2 < reg10)})) : reg9);
        end
      else
        begin
          reg107 <= reg98[(4'ha):(4'ha)];
          reg108 <= $unsigned({$signed($signed($signed((8'ha3)))),
              $unsigned((|(~|reg101)))});
          reg109 <= reg93;
          reg110 <= reg102;
          reg111 <= (|((wire0[(3'h4):(3'h4)] != (8'ha2)) ?
              $signed((!(|(8'hbf)))) : $unsigned(reg99[(1'h1):(1'h0)])));
        end
    end
  always
    @(posedge clk) begin
      reg112 <= $signed(reg100);
      reg113 <= (reg107[(2'h2):(1'h1)] ?
          $signed(reg108) : (+(!reg98[(2'h3):(1'h1)])));
      reg114 <= $unsigned((8'hab));
    end
  always
    @(posedge clk) begin
      reg115 <= (~(~|$signed((reg103[(3'h4):(2'h2)] != (|reg104)))));
      reg116 <= {($signed($unsigned((reg6 * reg105))) ?
              $unsigned(((reg8 ? reg109 : reg110) ?
                  wire4[(1'h1):(1'h1)] : ((8'had) | reg99))) : ((~^reg97[(1'h1):(1'h1)]) ?
                  ({(8'ha9), reg97} ?
                      $unsigned(reg6) : reg100[(2'h3):(2'h3)]) : $signed({reg6})))};
      if (($unsigned(wire2) ? reg107[(1'h0):(1'h0)] : reg93))
        begin
          reg117 <= (&$signed(reg105));
          reg118 <= (8'haa);
          reg119 <= ($unsigned(((reg100 < (8'hb2)) ?
                  $signed({reg104, wire3}) : $signed((reg117 > reg94)))) ?
              $signed(wire92[(3'h4):(1'h0)]) : (&(~^((reg6 > reg5) <= reg6))));
        end
      else
        begin
          reg117 <= (($unsigned(reg107[(2'h2):(1'h0)]) ? wire0 : (8'ha3)) ?
              $signed((reg95[(3'h4):(1'h1)] ?
                  $unsigned(((8'hbd) ?
                      reg95 : reg114)) : reg101)) : $signed(reg102[(3'h4):(2'h2)]));
          if ($signed(reg102[(3'h5):(2'h3)]))
            begin
              reg118 <= reg107;
              reg119 <= reg119[(4'ha):(4'h9)];
            end
          else
            begin
              reg118 <= ($unsigned((($unsigned(reg5) ?
                  (^~reg5) : reg106) + ((~&(7'h44)) << $signed(reg114)))) != {wire1[(4'hc):(3'h5)]});
              reg119 <= ($unsigned($signed(($signed(wire1) != {(8'ha6),
                  reg109}))) != (^(wire90 << $unsigned(reg99))));
            end
        end
    end
  assign wire120 = reg7[(2'h3):(2'h3)];
  assign wire121 = ($signed($signed({(reg99 >> reg115),
                       (reg95 ? wire120 : reg6)})) * reg113);
  assign wire122 = wire4;
  assign wire123 = reg107[(2'h2):(1'h0)];
  module124 #() modinst178 (.wire128(reg94), .wire129(reg93), .wire125(wire121), .wire126(reg110), .y(wire177), .wire127(reg118), .clk(clk));
  assign wire179 = (reg10 > (reg107 < reg6));
  assign wire180 = {($unsigned(((reg100 || wire179) ? wire177 : reg6)) ?
                           ($unsigned({reg113,
                               wire0}) >= (~&(8'hac))) : reg117[(4'h9):(3'h4)]),
                       wire3[(3'h5):(3'h4)]};
endmodule

module module124
#(parameter param175 = (^{(({(8'hbc), (8'hb9)} ^ ((8'h9c) - (8'had))) >> ({(8'hb6)} ? {(7'h41)} : ((8'hab) || (8'hb8))))}), 
parameter param176 = (~|param175))
(y, clk, wire129, wire128, wire127, wire126, wire125);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire129;
  input wire signed [(4'hd):(1'h0)] wire128;
  input wire [(5'h10):(1'h0)] wire127;
  input wire [(5'h15):(1'h0)] wire126;
  input wire [(4'hd):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire174;
  wire [(4'hc):(1'h0)] wire172;
  wire [(4'ha):(1'h0)] wire132;
  wire signed [(3'h6):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire130;
  assign y = {wire174, wire172, wire132, wire131, wire130, (1'h0)};
  assign wire130 = ({$signed(wire128[(1'h0):(1'h0)])} >> wire125);
  assign wire131 = wire128[(3'h6):(3'h6)];
  assign wire132 = (wire126 == wire126);
  module133 #() modinst173 (.y(wire172), .wire135(wire125), .wire137(wire127), .wire134(wire126), .clk(clk), .wire136(wire132));
  assign wire174 = {wire130, wire172[(4'hc):(4'hb)]};
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire50;
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire86,
                 wire26,
                 wire50,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed((~&wire12[(3'h4):(1'h1)])))
        begin
          if ({(wire14 ?
                  (^$signed((8'hb7))) : (wire14 ~^ wire15[(4'he):(2'h3)]))})
            begin
              reg16 <= (|((((8'hb7) ?
                      $signed(wire13) : (-wire12)) + wire12[(4'h8):(1'h1)]) ?
                  (({wire15} & (~^wire15)) ?
                      {$signed(wire12), $unsigned(wire15)} : ({wire13} ?
                          wire14 : $signed(wire12))) : $unsigned(($unsigned(wire12) || (wire12 ?
                      wire15 : wire15)))));
              reg17 <= (!wire14[(2'h2):(1'h1)]);
              reg18 <= (&$unsigned((^~((7'h42) ?
                  (wire13 ? wire13 : wire12) : reg16[(4'ha):(2'h2)]))));
              reg19 <= $signed((({wire13} ?
                      ($unsigned(wire12) ^ (&wire13)) : {wire12}) ?
                  wire12[(2'h3):(2'h2)] : ((~&$unsigned(wire14)) ?
                      ($unsigned(reg18) * {(7'h44)}) : $signed((|reg16)))));
            end
          else
            begin
              reg16 <= {(|reg18), $signed(reg17[(2'h2):(1'h1)])};
              reg17 <= reg17[(2'h2):(2'h2)];
            end
          reg20 <= $unsigned(wire15[(1'h1):(1'h0)]);
          reg21 <= (wire12[(3'h5):(2'h2)] && $signed(wire13));
          reg22 <= (!(({$signed(wire13), wire13} ?
                  wire12[(4'h8):(1'h1)] : $unsigned($signed(reg18))) ?
              ($signed((reg21 ? (8'hb3) : wire13)) <<< (reg18 ?
                  (reg16 ?
                      (7'h42) : wire13) : reg21)) : (|wire12[(4'h8):(4'h8)])));
          reg23 <= $signed($unsigned(reg18));
        end
      else
        begin
          reg16 <= (($signed(($signed(reg20) ?
              (wire14 ? reg19 : wire15) : $signed(wire12))) ^~ (~(wire12 ?
              (wire12 < reg16) : reg17))) <= (-wire14));
          reg17 <= (~|$signed(wire13[(2'h2):(2'h2)]));
          reg18 <= $signed(wire15[(4'hd):(2'h3)]);
          reg19 <= wire13;
          if (wire13[(1'h1):(1'h1)])
            begin
              reg20 <= (wire13[(4'h9):(3'h5)] ^~ {((~^(~^wire15)) ?
                      $signed((~&reg22)) : (reg16 << $unsigned((8'hb1)))),
                  ({wire13} ?
                      ((wire12 ? (8'hbd) : reg18) + wire15) : {(reg21 ?
                              reg20 : reg23),
                          $unsigned(reg20)})});
              reg21 <= {$unsigned({($unsigned((8'hbf)) ?
                          $signed(reg16) : (reg22 * reg20)),
                      wire14[(1'h1):(1'h0)]})};
              reg22 <= (7'h42);
              reg23 <= ($signed(reg16[(4'h9):(4'h8)]) ?
                  (~&((wire13[(4'hb):(2'h2)] ?
                      wire15 : ((8'haa) ? wire12 : (8'hbd))) + (reg22 ?
                      $unsigned(wire14) : (reg23 >> reg18)))) : reg22[(4'hc):(4'ha)]);
            end
          else
            begin
              reg20 <= {reg18[(1'h0):(1'h0)]};
              reg21 <= reg17;
              reg22 <= (wire13[(4'h9):(1'h1)] ~^ $signed($signed((+reg23[(5'h10):(4'h9)]))));
            end
        end
      reg24 <= $signed(reg20);
      reg25 <= wire13;
    end
  assign wire26 = (wire12 ^ {reg23[(5'h11):(4'hd)]});
  module27 #() modinst51 (.y(wire50), .wire29(wire26), .wire30(wire15), .clk(clk), .wire28(reg22), .wire31(reg16), .wire32(wire14));
  module52 #() modinst87 (wire86, clk, reg24, reg18, reg21, reg17, reg19);
  assign wire88 = ($unsigned(reg16[(4'h8):(3'h4)]) ^ {reg22,
                      (+{((8'h9c) ? reg22 : wire13), $unsigned(wire50)})});
  assign wire89 = {(~^$signed($signed($signed(wire26))))};
endmodule

module module52  (y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire57;
  input wire signed [(3'h4):(1'h0)] wire56;
  input wire signed [(5'h12):(1'h0)] wire55;
  input wire signed [(2'h2):(1'h0)] wire54;
  input wire signed [(4'hd):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire58;
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 reg59,
                 (1'h0)};
  assign wire58 = $signed((^~((^~$unsigned(wire53)) > (!(~|wire54)))));
  always
    @(posedge clk) begin
      reg59 <= (~&{($unsigned($signed((8'hb8))) << wire54), (7'h40)});
    end
  assign wire60 = $unsigned(wire58[(1'h0):(1'h0)]);
  assign wire61 = {(wire53 - ($unsigned($signed(wire56)) > (((7'h42) > wire55) ?
                          {wire60, wire60} : (wire58 + wire55))))};
  assign wire62 = $signed(($signed(($signed(reg59) && (~wire54))) ?
                      $signed(reg59[(3'h7):(3'h7)]) : (!(^wire60))));
  assign wire63 = ((!$signed($signed(wire54[(1'h0):(1'h0)]))) ?
                      $signed($unsigned($signed((&wire53)))) : wire54);
  assign wire64 = (~&wire62[(3'h6):(1'h1)]);
  assign wire65 = (($unsigned((wire61[(4'hd):(4'h9)] ?
                          $signed(reg59) : (wire56 ^ wire54))) >= ({((8'h9d) ?
                                  wire57 : (8'hb5))} ?
                          (reg59 ?
                              {(8'hbe)} : $unsigned(wire64)) : $unsigned((reg59 ^ wire60)))) ?
                      wire63 : $signed((($signed(wire64) <<< $unsigned(wire54)) ?
                          wire63 : (~&(&wire56)))));
  always
    @(posedge clk) begin
      if (($signed((~|(~^$unsigned(wire65)))) ?
          $signed($unsigned(($signed(reg59) + wire65))) : ({((^~wire57) ?
                  $signed(wire64) : wire63)} && {($signed(wire62) ?
                  (8'hbd) : $unsigned(reg59)),
              ({wire60} - wire56[(1'h0):(1'h0)])})))
        begin
          if (wire61[(4'hf):(3'h6)])
            begin
              reg66 <= (wire61[(4'hb):(4'ha)] ?
                  (wire57[(5'h10):(4'hd)] >> (~&{((8'ha6) && (8'ha9))})) : $signed((~&(^~$signed(wire64)))));
              reg67 <= (($signed(wire62) >> wire65) && wire58);
              reg68 <= ($signed(wire62) ?
                  ($signed($unsigned((+wire55))) ?
                      (8'ha2) : ((~$unsigned(wire54)) - (wire58[(2'h2):(2'h2)] ?
                          {reg67} : wire57))) : ((~^{$unsigned(wire60)}) ?
                      (wire61 ? wire62 : wire61[(1'h0):(1'h0)]) : wire55));
            end
          else
            begin
              reg66 <= ((wire62 >= (^~wire63[(4'ha):(2'h2)])) ?
                  wire65 : $signed($unsigned($unsigned($signed(wire54)))));
              reg67 <= $signed($unsigned(($unsigned((!wire61)) ?
                  $signed($signed(reg66)) : $signed(reg66))));
              reg68 <= $signed((~&$signed(((-wire61) ? (&reg68) : wire60))));
              reg69 <= wire60;
              reg70 <= wire56[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg66 <= {$unsigned(wire56[(2'h3):(2'h3)])};
          if (((8'hb6) ?
              $unsigned(reg59[(2'h3):(1'h1)]) : reg68[(3'h6):(3'h6)]))
            begin
              reg67 <= ((((|reg69) < $signed((wire63 > wire61))) ?
                  wire55[(4'hf):(4'ha)] : wire60) + $unsigned(((~(wire60 ?
                  wire53 : wire63)) + reg68[(3'h4):(1'h1)])));
              reg68 <= $signed((8'ha4));
              reg69 <= (wire55[(5'h11):(4'hb)] < $signed((wire63 ?
                  wire56[(1'h0):(1'h0)] : (8'hb5))));
              reg70 <= (((wire62[(3'h4):(1'h0)] ?
                      (-$unsigned(reg68)) : ((wire64 ? reg68 : reg69) ?
                          wire58 : $unsigned(wire61))) & wire58) ?
                  wire62 : $signed(wire62[(3'h5):(3'h5)]));
              reg71 <= $signed(((^wire63[(2'h3):(2'h2)]) ?
                  $unsigned((((8'hbf) >>> reg67) ?
                      $unsigned((7'h41)) : (~&reg69))) : $signed((8'ha5))));
            end
          else
            begin
              reg67 <= (($unsigned(reg70[(1'h0):(1'h0)]) ?
                  (8'haf) : (^((~|wire60) ^~ (wire64 == (7'h42))))) <= reg71);
              reg68 <= $signed(($signed(wire63[(5'h11):(5'h10)]) ?
                  $signed(reg68) : $signed(((~wire55) ?
                      ((8'hb0) ? wire56 : reg71) : $signed(reg66)))));
              reg69 <= $signed((((~^reg67) ?
                  {((8'ha1) ^~ wire53)} : $unsigned(wire58)) | $unsigned(wire55[(5'h11):(4'hc)])));
              reg70 <= $unsigned((+((~&wire54) ?
                  $signed((&wire64)) : reg68[(3'h6):(1'h1)])));
            end
        end
      reg72 <= {($signed($unsigned((wire54 ? reg59 : reg66))) ?
              {(+reg68[(3'h6):(3'h6)])} : ((~&wire55) * (8'hbd))),
          $signed((8'hb6))};
      reg73 <= ((~(($unsigned(reg68) ?
              $unsigned(wire65) : $signed(wire60)) <= $unsigned((wire65 ?
              (8'ha8) : wire64)))) ?
          (+(|reg67)) : reg67);
      reg74 <= (reg66 ? reg72 : $unsigned({reg73[(1'h0):(1'h0)], wire65}));
      if (wire60)
        begin
          reg75 <= reg59[(4'h9):(4'h9)];
          reg76 <= reg74[(4'hc):(3'h7)];
          reg77 <= wire57;
          reg78 <= ({(^~((reg76 <= reg73) ? $signed(reg67) : (8'hb2))),
                  reg66[(3'h4):(2'h2)]} ?
              $signed((7'h42)) : (reg66[(2'h3):(2'h2)] >>> wire54[(1'h0):(1'h0)]));
          reg79 <= ((wire63[(3'h4):(2'h2)] & {$signed($signed(reg68))}) * $signed(reg78[(3'h4):(1'h0)]));
        end
      else
        begin
          if ((&wire57))
            begin
              reg75 <= {($unsigned({reg69, $signed(reg70)}) < (!(^~(reg76 ?
                      reg77 : wire53)))),
                  (reg74[(4'h8):(2'h3)] ?
                      ($unsigned(reg79) ?
                          $unsigned((wire57 & reg66)) : wire64[(4'h9):(3'h7)]) : $unsigned($unsigned($signed(wire64))))};
              reg76 <= (({$unsigned((wire57 ? (8'ha8) : wire65))} ?
                  (8'hb1) : (+$signed(((8'ha2) ? reg73 : (8'ha4))))) >> wire57);
              reg77 <= reg70[(3'h4):(1'h1)];
              reg78 <= ($unsigned(($unsigned({reg72, reg66}) ?
                      (&{wire54}) : reg71[(1'h1):(1'h1)])) ?
                  (wire65[(2'h3):(2'h3)] ?
                      $unsigned(reg68) : $signed(wire56[(2'h2):(1'h1)])) : (($signed(wire57[(4'hc):(1'h0)]) >> ($signed(wire61) ~^ (wire63 ?
                          wire58 : wire57))) ?
                      (reg69 ?
                          $signed(wire56[(2'h3):(2'h2)]) : ((|wire64) < (wire53 >>> wire56))) : reg78));
              reg79 <= $unsigned(((($unsigned(wire53) ?
                      (wire62 ? reg75 : (8'haf)) : $unsigned((8'hbe))) ?
                  wire60 : $unsigned((-reg72))) == wire60[(3'h4):(1'h0)]));
            end
          else
            begin
              reg75 <= (reg68 == $signed(reg77));
            end
          reg80 <= $unsigned(($signed($unsigned(wire58)) & ($signed((~&reg66)) && wire60[(5'h14):(4'h9)])));
          reg81 <= ($unsigned((~({reg68} ?
              (|(8'ha7)) : $unsigned(reg74)))) != ($signed(($unsigned(reg70) ?
              wire65 : reg68)) >>> reg77));
          reg82 <= reg71;
          reg83 <= (((reg67 & (|(8'haf))) ~^ ({reg76[(2'h2):(1'h0)],
              wire63[(2'h3):(2'h3)]} < reg59[(4'ha):(3'h6)])) * (!(^~((^~(7'h44)) ?
              $signed(reg78) : $unsigned(wire57)))));
        end
    end
  assign wire84 = (+$signed((~|$unsigned((~|reg83)))));
  assign wire85 = wire53[(3'h6):(3'h5)];
endmodule

module module27
#(parameter param49 = (~(^~({((8'h9f) < (8'hb2)), ((8'ha5) ? (8'h9c) : (8'hbb))} ? (&(!(8'ha2))) : (8'haa)))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire32;
  input wire [(2'h3):(1'h0)] wire31;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire29;
  input wire [(5'h15):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire33 = wire29;
  assign wire34 = $signed(wire29);
  assign wire35 = (wire28[(3'h7):(3'h5)] ?
                      wire28[(5'h13):(3'h7)] : $unsigned($signed(($signed((8'ha3)) ?
                          wire28[(4'h8):(3'h6)] : wire30[(1'h1):(1'h1)]))));
  assign wire36 = $signed(wire31[(1'h0):(1'h0)]);
  assign wire37 = (wire36[(1'h0):(1'h0)] ~^ ((wire29[(1'h1):(1'h1)] ^ ({wire31} ?
                      (wire36 ? wire35 : wire30) : ((8'ha3) ?
                          wire32 : wire34))) != $signed({(~|wire29),
                      wire30[(2'h3):(1'h1)]})));
  assign wire38 = wire30[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg39 <= (8'h9f);
      reg40 <= $signed($signed($unsigned((wire37 ~^ (wire37 ?
          wire31 : (8'h9d))))));
      reg41 <= ($signed(({$unsigned(wire34),
              (~|(8'hb8))} > $unsigned((wire30 - wire30)))) ?
          {(reg39 ? reg39[(4'ha):(2'h2)] : {(^~wire29)}),
              $unsigned(((&wire38) >= (wire30 ?
                  wire34 : reg40)))} : $signed(wire31));
      reg42 <= $unsigned({$unsigned(reg41)});
      if ((($signed(wire36) ?
          wire33[(1'h1):(1'h0)] : (^~{wire28, $unsigned(wire33)})) && ({wire38,
          $signed(reg41)} || (wire33[(2'h3):(1'h0)] ?
          ($signed(wire35) ?
              ((7'h43) ?
                  wire35 : (8'hb5)) : $unsigned(wire30)) : $signed((reg39 & wire28))))))
        begin
          reg43 <= reg41;
        end
      else
        begin
          reg43 <= (((wire32 ?
              $signed({reg39,
                  (8'hb6)}) : (!wire38[(1'h1):(1'h1)])) >> wire29[(2'h2):(2'h2)]) >= wire35);
          reg44 <= ((wire28[(3'h7):(2'h3)] ?
              $signed(((wire34 ^~ wire35) ?
                  $signed(wire30) : $signed(wire30))) : ($signed((|reg40)) ?
                  $unsigned((|wire29)) : $unsigned((wire36 ?
                      wire32 : wire35)))) ~^ (^~(reg43[(2'h3):(2'h2)] * ((reg41 ^~ reg41) ?
              (wire30 < reg39) : (reg42 > reg42)))));
          reg45 <= wire30[(3'h5):(2'h2)];
        end
    end
  assign wire46 = $signed(reg40);
  assign wire47 = (~|(&(!((wire35 < (8'hab)) ?
                      (wire31 ? reg42 : wire31) : (wire32 || reg41)))));
  assign wire48 = $signed($signed(($unsigned(wire37[(4'ha):(2'h3)]) ?
                      wire29 : $unsigned((reg43 <= reg45)))));
endmodule

module module133
#(parameter param170 = (((({(8'ha0)} ? ((8'haf) ? (8'hb4) : (8'hb7)) : {(8'haa), (8'ha6)}) * (&((8'hb4) << (8'hba)))) ? ((&(+(8'hbb))) >>> ({(8'hb9)} == ((7'h41) >>> (8'ha5)))) : ((((8'hb3) ? (8'hac) : (7'h40)) >= {(8'hb4), (8'haa)}) ^~ (~|((8'hb1) ? (8'ha8) : (8'hae))))) << (-((~((8'ha3) ? (8'hb6) : (8'hb6))) ? (!{(8'haf)}) : (((7'h44) || (8'hb2)) ? ((8'hb8) >= (8'hbf)) : (8'hb5))))), 
parameter param171 = (|(((!(8'ha1)) + (!param170)) ? (((param170 | param170) ^ (param170 ~^ param170)) == (8'hb4)) : ({(param170 ? param170 : param170)} & ((param170 & param170) ? param170 : param170)))))
(y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire137;
  input wire signed [(4'ha):(1'h0)] wire136;
  input wire [(4'ha):(1'h0)] wire135;
  input wire [(5'h15):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire169;
  wire [(4'ha):(1'h0)] wire168;
  wire [(5'h10):(1'h0)] wire141;
  wire signed [(3'h5):(1'h0)] wire138;
  reg signed [(4'hb):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg165 = (1'h0);
  reg signed [(4'he):(1'h0)] reg164 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(5'h15):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(2'h2):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire141,
                 wire138,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg140,
                 reg139,
                 (1'h0)};
  assign wire138 = wire137;
  always
    @(posedge clk) begin
      reg139 <= (^((((~|wire135) ? wire136[(2'h3):(1'h0)] : $signed((8'ha2))) ?
          ((wire135 - (7'h44)) ? (^wire138) : (!wire135)) : $unsigned({(8'hb0),
              wire137})) || ($unsigned((8'hb8)) <<< ($unsigned(wire136) & (wire137 && wire135)))));
      reg140 <= {$unsigned($unsigned(($signed(reg139) ^~ $unsigned(wire137)))),
          wire137[(4'ha):(4'h9)]};
    end
  assign wire141 = $signed(wire138[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg142 <= $signed($signed($unsigned(((-wire134) ? (8'hb4) : wire138))));
      reg143 <= $signed(wire135);
      if (($signed($unsigned(($signed((8'ha7)) & {reg143}))) ?
          wire138 : wire134))
        begin
          reg144 <= {((reg142[(4'h9):(2'h2)] ^ $unsigned(reg142[(4'ha):(4'h8)])) > reg140)};
          reg145 <= $signed({({$signed(wire134)} ?
                  $signed(wire138[(2'h3):(2'h2)]) : reg143[(4'h9):(3'h6)])});
          reg146 <= wire137[(4'h8):(3'h7)];
          reg147 <= ((($unsigned($signed(wire141)) || (~(wire138 >> reg140))) ?
                  ((reg144 ? (&reg146) : (wire141 == wire134)) ?
                      {(^(8'ha3)), $unsigned(wire136)} : ((reg143 != reg144) ?
                          $unsigned(reg145) : wire141)) : wire136) ?
              (8'hbc) : {($signed($unsigned(reg140)) == wire134)});
        end
      else
        begin
          reg144 <= wire136;
          reg145 <= ($signed(reg140[(4'ha):(3'h6)]) ? reg142 : reg143);
          reg146 <= reg139[(3'h5):(3'h4)];
          if (((wire138 ~^ wire134) <<< (^$unsigned(((&wire141) <<< (reg144 ?
              wire141 : wire135))))))
            begin
              reg147 <= (8'h9f);
            end
          else
            begin
              reg147 <= reg144[(4'h9):(3'h7)];
              reg148 <= (reg143[(4'hc):(2'h3)] >>> ({reg143[(4'ha):(1'h1)],
                      $unsigned($signed((8'ha0)))} ?
                  $unsigned(reg139) : wire141[(5'h10):(2'h2)]));
              reg149 <= ((8'hae) >> (reg145[(1'h1):(1'h0)] ?
                  {wire138[(3'h4):(1'h1)]} : $signed($signed($signed(wire137)))));
              reg150 <= $unsigned((-reg149[(1'h1):(1'h1)]));
            end
        end
      reg151 <= (~^$unsigned($unsigned({reg146[(5'h12):(5'h10)]})));
    end
  always
    @(posedge clk) begin
      reg152 <= reg146;
    end
  always
    @(posedge clk) begin
      if (reg151)
        begin
          reg153 <= reg150[(4'h8):(3'h6)];
          reg154 <= (~&$unsigned(reg151[(5'h10):(2'h2)]));
          reg155 <= (($unsigned(($signed(reg146) ?
                  (reg148 ? wire137 : (7'h44)) : wire135)) ?
              reg146 : ({{reg143}, $unsigned(wire137)} ?
                  ($signed(reg151) == (wire141 == wire141)) : reg152)) | {((7'h41) ?
                  ((-reg147) * wire136[(3'h6):(3'h6)]) : (reg145 ?
                      $unsigned(reg139) : reg149[(3'h5):(2'h2)])),
              (reg140 ? $unsigned($signed(reg142)) : wire138)});
        end
      else
        begin
          if (reg142)
            begin
              reg153 <= {(~|(((reg145 < wire138) <<< $unsigned(wire135)) ^~ (((8'hbf) ?
                      reg152 : reg142) <= reg145))),
                  $unsigned((((wire137 ? reg154 : wire141) + (reg146 ?
                          reg149 : wire135)) ?
                      (-$signed(reg152)) : $unsigned({reg140, reg155})))};
              reg154 <= $unsigned(((~^(|(wire138 == (8'ha8)))) ?
                  reg152[(3'h6):(1'h1)] : reg142[(3'h7):(3'h7)]));
            end
          else
            begin
              reg153 <= $signed({reg150[(3'h4):(1'h0)],
                  (($signed(reg144) ?
                      (reg152 ?
                          reg148 : (8'haf)) : $signed(reg145)) & ((~&reg149) && (wire136 >= (8'hb7))))});
              reg154 <= reg153;
              reg155 <= ($signed(((|(reg142 ? reg140 : reg143)) ?
                      (((8'ha8) ? reg153 : reg139) <<< (reg140 ?
                          (8'hbc) : reg145)) : $signed((~^wire135)))) ?
                  $unsigned((reg139 ?
                      reg150[(2'h3):(1'h1)] : (reg154[(3'h5):(1'h1)] ^~ wire135[(3'h4):(1'h1)]))) : (&{reg151,
                      reg144[(3'h6):(1'h1)]}));
              reg156 <= reg152;
            end
          reg157 <= reg151[(4'h8):(4'h8)];
          if (((((8'hbc) && (8'hbf)) ?
              (((^~reg151) >= $signed((8'hbf))) + {wire136,
                  (~&reg147)}) : ($unsigned((reg152 < (8'ha9))) ?
                  $unsigned((^~reg143)) : $unsigned(reg152[(3'h7):(2'h3)]))) ^ (reg148 >>> (8'hba))))
            begin
              reg158 <= ({(|($unsigned(reg143) ? reg145 : (reg149 * reg145)))} ?
                  (wire141 ?
                      ((~|(reg139 ? (8'ha3) : reg154)) != {(!reg152),
                          reg149}) : $unsigned(reg142)) : $unsigned((!((reg148 > wire136) * (reg151 ?
                      reg139 : reg154)))));
            end
          else
            begin
              reg158 <= $unsigned((reg150 ?
                  (-reg142[(3'h5):(3'h4)]) : (~reg154)));
              reg159 <= (^$unsigned(reg140[(3'h5):(2'h2)]));
              reg160 <= ($unsigned($unsigned(wire135[(4'h9):(2'h2)])) ?
                  (&(7'h42)) : $unsigned($unsigned(({wire135, (7'h40)} ?
                      $unsigned(reg154) : reg143))));
              reg161 <= reg144[(1'h1):(1'h0)];
              reg162 <= (&(!{(^$unsigned(reg154)), (~^$signed(reg153))}));
            end
          if (($signed((8'hb9)) ?
              (!(((wire134 ? (8'hb9) : (7'h40)) ?
                      reg142[(2'h2):(1'h0)] : (wire136 <= reg147)) ?
                  (wire136[(2'h3):(1'h0)] <<< $unsigned(reg143)) : (!$signed(reg149)))) : ({{$signed(reg142)}} ?
                  $unsigned(wire141[(5'h10):(4'ha)]) : {wire137,
                      reg151[(4'hf):(1'h1)]})))
            begin
              reg163 <= wire137;
              reg164 <= reg154[(2'h3):(1'h0)];
            end
          else
            begin
              reg163 <= {((^~$signed($signed(reg155))) ?
                      {reg146} : $unsigned($unsigned({wire135, reg162}))),
                  ({($unsigned(reg150) >= (~^reg162))} ?
                      {(!{reg146, (8'hbd)}),
                          $signed((reg159 >= wire137))} : reg161)};
              reg164 <= (reg154[(2'h2):(1'h0)] || $signed(((8'h9d) ?
                  {reg149} : ((~&(8'ha4)) ? reg159 : reg151))));
            end
          reg165 <= reg147[(1'h1):(1'h0)];
        end
      reg166 <= $unsigned($unsigned(reg140));
      reg167 <= $signed($signed($signed(reg153)));
    end
  assign wire168 = ((reg147[(1'h0):(1'h0)] - $unsigned((reg158[(1'h0):(1'h0)] ?
                       ((7'h40) <= reg153) : {reg156}))) ^ (reg159[(1'h0):(1'h0)] * $signed($signed((reg148 ?
                       wire134 : reg139)))));
  assign wire169 = reg149[(4'h9):(3'h7)];
endmodule
