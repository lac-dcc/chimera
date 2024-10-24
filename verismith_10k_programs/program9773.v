module top
#(parameter param125 = ((~^(~|((~|(8'ha9)) ? ((8'ha4) ? (7'h42) : (8'hbf)) : {(8'hb9)}))) || ({(!((8'ha2) ? (8'hb2) : (8'hb0)))} <<< ((|((8'hba) ? (8'ha8) : (8'ha1))) * (7'h43)))), 
parameter param126 = {param125, (~^((((8'hae) | param125) ? (~(8'had)) : param125) ? param125 : (-(param125 < (8'ha9)))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire123;
  wire [(4'he):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire119;
  wire signed [(3'h6):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire116;
  wire signed [(3'h7):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire [(3'h5):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire103;
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire4,
                 wire103,
                 reg114,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire4 = ((&($signed($signed(wire1)) ?
                         {$signed(wire0),
                             wire3[(3'h4):(1'h1)]} : $signed($unsigned(wire3)))) ?
                     $signed(wire2[(2'h2):(1'h1)]) : $unsigned(($unsigned((~|wire1)) ?
                         (~|wire2[(4'he):(3'h7)]) : wire0)));
  module5 #() modinst104 (.y(wire103), .wire6(wire4), .clk(clk), .wire7(wire2), .wire8(wire3), .wire9(wire0), .wire10(wire1));
  assign wire105 = (~^wire0);
  assign wire106 = {wire4[(4'ha):(2'h3)]};
  assign wire107 = $signed(wire3[(4'h8):(3'h6)]);
  assign wire108 = (|$signed((+((wire1 <= wire4) <<< $unsigned(wire106)))));
  always
    @(posedge clk) begin
      reg109 <= wire105;
      reg110 <= $signed($unsigned(($signed($signed(wire103)) * wire103)));
      reg111 <= {(!wire108[(5'h12):(4'hf)]), $signed(wire107)};
      reg112 <= reg111;
    end
  assign wire113 = wire107[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg114 <= wire4;
    end
  assign wire115 = (-wire113[(4'h9):(3'h5)]);
  assign wire116 = reg112;
  assign wire117 = (^reg110[(4'h9):(3'h6)]);
  assign wire118 = (wire4 ?
                       ($signed(wire3[(4'ha):(3'h7)]) | wire3[(3'h4):(1'h1)]) : wire115[(2'h3):(2'h3)]);
  assign wire119 = wire105;
  assign wire120 = wire106;
  assign wire121 = ((&(((~wire1) + $unsigned(wire117)) == wire107[(3'h4):(2'h3)])) <= wire113[(4'h8):(1'h1)]);
  assign wire122 = $unsigned((|wire105));
  assign wire123 = wire119;
  assign wire124 = wire107[(3'h5):(2'h2)];
endmodule

module module5
#(parameter param102 = (((^~((~(8'hb8)) ^ ((7'h42) ? (8'hbf) : (8'had)))) ? (+(((8'hb0) <<< (8'ha6)) > {(7'h43)})) : (^~{((8'ha8) || (8'ha0))})) ? ((^~{(-(8'hba)), ((8'hb3) ? (8'hb6) : (7'h41))}) ? (8'ha3) : (((~&(8'hb1)) | ((7'h41) ? (7'h42) : (8'h9c))) ? (8'hbc) : ({(8'h9c), (7'h41)} ? (!(8'ha9)) : (8'hbe)))) : (!((8'hb4) + (((8'ha7) || (8'h9d)) ? ((8'hb2) ? (7'h43) : (8'hbc)) : ((8'hb7) ? (8'haa) : (7'h43)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire99;
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  assign y = {wire101,
                 wire61,
                 wire40,
                 wire39,
                 wire38,
                 wire99,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
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
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire7)
        begin
          reg11 <= (^wire8[(1'h1):(1'h1)]);
          reg12 <= ((wire9 == ($signed((|reg11)) ?
                  ($signed(wire9) >>> (wire6 >= wire7)) : ($signed(wire6) ?
                      (7'h44) : ((8'hb2) ? wire9 : wire9)))) ?
              (($signed($signed(reg11)) || wire6[(2'h3):(1'h1)]) ?
                  $signed((wire9[(3'h4):(3'h4)] ?
                      (wire9 ?
                          wire9 : wire10) : $signed(wire10))) : wire8[(4'hc):(4'h9)]) : $unsigned($unsigned($unsigned((wire8 ?
                  wire9 : reg11)))));
          reg13 <= wire8[(2'h3):(1'h0)];
          reg14 <= {wire7, wire6};
        end
      else
        begin
          reg11 <= (~|{wire6[(4'hc):(4'h8)],
              ((wire8 > $unsigned(reg12)) + ((^wire7) <= (reg14 > wire8)))});
          reg12 <= ((^~$unsigned(reg14[(3'h4):(3'h4)])) < wire9[(2'h2):(1'h1)]);
        end
      if ($signed(wire9))
        begin
          reg15 <= (+{(~(~(reg11 >= wire6))), wire8[(4'hc):(4'ha)]});
          reg16 <= ((~^(wire9[(5'h10):(4'h9)] >>> (+{wire6}))) <= {$unsigned((~^$unsigned(reg15)))});
          reg17 <= reg13;
          if ((wire7[(4'hb):(2'h3)] >>> (reg15[(3'h7):(3'h7)] ?
              (&(7'h43)) : $signed(($unsigned((8'hb6)) | $signed(reg11))))))
            begin
              reg18 <= ($signed((&(~&(8'ha5)))) ?
                  reg14 : (+($unsigned((reg16 > wire6)) ?
                      ((reg16 ? reg13 : wire9) ?
                          (&reg11) : (&wire9)) : (~|(&reg14)))));
              reg19 <= ($unsigned(reg13[(1'h1):(1'h0)]) * $unsigned($unsigned((wire7 + ((8'h9f) ?
                  wire9 : reg16)))));
              reg20 <= ({$unsigned($signed((~reg16))),
                      (reg18[(3'h5):(3'h5)] || wire6[(1'h1):(1'h0)])} ?
                  (~&(reg17[(2'h3):(2'h2)] ?
                      ((~&reg17) != reg12) : wire10[(1'h1):(1'h1)])) : $unsigned(wire9[(4'h9):(1'h1)]));
              reg21 <= $unsigned(wire9);
            end
          else
            begin
              reg18 <= ($signed(($signed(reg21) ?
                      (^(reg17 ? wire8 : reg16)) : (reg12 ?
                          $signed(reg21) : wire6[(4'h8):(2'h3)]))) ?
                  $signed(wire8) : $signed(($unsigned(reg14) ?
                      $unsigned((reg15 ? (8'hba) : reg11)) : (8'h9c))));
            end
          if (($signed($unsigned({(reg12 ? reg15 : reg16),
                  ((8'hba) ? wire7 : wire8)})) ?
              (($signed({reg19}) ?
                      ({reg12} * $unsigned(reg16)) : $unsigned((reg11 <<< (8'ha9)))) ?
                  $signed(((~reg16) ?
                      (reg16 ?
                          (8'ha0) : (8'hac)) : (8'hba))) : (reg14[(4'h9):(3'h7)] ?
                      (&(8'hb8)) : (~$unsigned((8'hab))))) : ((reg12[(4'hb):(4'hb)] <= reg18[(3'h5):(1'h0)]) <<< reg16[(1'h1):(1'h0)])))
            begin
              reg22 <= $unsigned(reg15[(4'hb):(3'h4)]);
              reg23 <= ($unsigned(reg16[(1'h0):(1'h0)]) ?
                  (reg19 + (({(8'ha4), (8'hb4)} ?
                          wire10[(1'h1):(1'h1)] : (-reg16)) ?
                      (&(^reg18)) : (^~reg17[(1'h1):(1'h1)]))) : $unsigned(reg17));
            end
          else
            begin
              reg22 <= wire8[(4'hc):(4'hc)];
              reg23 <= ({reg22[(1'h0):(1'h0)]} ? (7'h42) : $unsigned(reg18));
              reg24 <= reg12[(3'h4):(2'h3)];
              reg25 <= (&(^reg13));
              reg26 <= reg23[(4'h9):(2'h2)];
            end
        end
      else
        begin
          if (($unsigned(($unsigned((reg16 >> reg20)) ^~ (~&{wire6}))) > $unsigned((reg21[(5'h13):(4'hc)] ?
              reg21[(5'h14):(5'h12)] : $unsigned((|(8'haa)))))))
            begin
              reg15 <= (($signed((|reg20[(1'h0):(1'h0)])) >= (|reg14)) >= $unsigned($unsigned(reg25[(3'h6):(1'h0)])));
              reg16 <= (((~^((wire10 >= (8'hb2)) >> $unsigned(wire10))) ?
                  (($unsigned(reg12) ?
                      (reg11 ? reg18 : wire9) : (~^wire7)) < ({reg19} ?
                      reg17[(1'h0):(1'h0)] : (reg13 ?
                          reg23 : reg25))) : reg17[(1'h1):(1'h0)]) != ($unsigned($signed((reg20 << (7'h42)))) ?
                  wire7[(2'h3):(1'h1)] : {reg19[(1'h1):(1'h1)]}));
              reg17 <= $unsigned(((+$unsigned((reg21 || reg23))) ?
                  reg25[(3'h6):(3'h6)] : reg22[(3'h4):(2'h3)]));
              reg18 <= $unsigned($signed(reg23[(3'h4):(1'h0)]));
            end
          else
            begin
              reg15 <= (($unsigned(reg19[(3'h4):(2'h2)]) ^~ $signed(wire9)) <<< $signed((8'h9c)));
              reg16 <= $unsigned(reg14);
              reg17 <= $unsigned((({$signed(reg13)} ?
                  ($unsigned(wire9) ?
                      reg13 : ((8'ha0) ?
                          reg23 : wire10)) : (!reg16[(2'h2):(1'h0)])) >= {(~|$unsigned(reg14))}));
              reg18 <= {reg17,
                  ($signed($signed(((8'ha9) & reg22))) ?
                      ($signed($signed((8'ha8))) ?
                          ((8'h9e) | (!(8'h9f))) : (~&{reg18,
                              reg18})) : reg14[(1'h0):(1'h0)])};
            end
        end
      reg27 <= (-$unsigned(wire9[(4'he):(2'h3)]));
      if ((!reg15[(4'hb):(3'h7)]))
        begin
          if (({reg27} >>> $unsigned($signed($signed($signed(reg20))))))
            begin
              reg28 <= ((~^reg19) ?
                  ({(^~$unsigned(reg21)),
                      $signed(((8'hb9) ?
                          reg13 : wire8))} ~^ (reg22[(2'h2):(2'h2)] ~^ ((|reg18) ?
                      (8'ha7) : (reg13 == reg11)))) : $unsigned($unsigned(($signed((7'h43)) ?
                      wire6 : wire7[(4'hc):(1'h0)]))));
              reg29 <= reg22[(3'h5):(1'h0)];
              reg30 <= reg19;
            end
          else
            begin
              reg28 <= reg11;
              reg29 <= reg27;
              reg30 <= (&$signed(wire9[(4'he):(2'h3)]));
              reg31 <= (~&$unsigned($unsigned($signed($unsigned(wire7)))));
            end
        end
      else
        begin
          reg28 <= {(({(reg19 >> reg24)} ? reg29 : reg15) ?
                  (^~wire10[(1'h0):(1'h0)]) : $unsigned((8'hb2)))};
          reg29 <= reg27;
          if (((-reg19) ?
              (+(reg30[(4'h8):(3'h5)] ?
                  {(reg26 - (7'h42))} : (reg18[(4'ha):(3'h7)] ?
                      $signed(reg31) : {reg19,
                          (8'hbc)}))) : ($unsigned($unsigned(reg20[(2'h2):(2'h2)])) ?
                  ($signed(reg12) ?
                      (reg19 * $unsigned(wire7)) : (~|{wire10})) : ((8'hb6) <<< (&(wire10 ?
                      reg25 : wire8))))))
            begin
              reg30 <= (!$unsigned((8'ha3)));
              reg31 <= $unsigned((&$signed($unsigned(reg17[(1'h0):(1'h0)]))));
              reg32 <= {reg14,
                  (&$signed({$signed(wire9), wire10[(1'h1):(1'h0)]}))};
              reg33 <= ($signed(reg12) + $unsigned($signed($signed($signed(reg21)))));
            end
          else
            begin
              reg30 <= ((~^((reg22 > (reg28 ? (8'hb6) : reg30)) ?
                      $unsigned($signed(wire7)) : (reg30[(4'hd):(2'h3)] ?
                          (+reg27) : $unsigned(reg15)))) ?
                  $signed((^reg32)) : $signed(reg30[(2'h2):(1'h0)]));
              reg31 <= (~^reg24[(1'h1):(1'h1)]);
              reg32 <= reg16[(3'h7):(2'h2)];
              reg33 <= reg20;
            end
        end
      if ((~&reg11))
        begin
          reg34 <= {$signed($signed($signed(wire8))),
              $signed((-((reg30 ? reg19 : reg13) ?
                  (^(8'haf)) : (reg21 ? wire8 : reg28))))};
        end
      else
        begin
          if (reg27[(3'h4):(3'h4)])
            begin
              reg34 <= ($signed(reg13[(2'h3):(2'h3)]) >>> {reg15[(4'h8):(4'h8)],
                  (~reg13[(4'ha):(2'h2)])});
              reg35 <= reg17[(3'h5):(1'h0)];
              reg36 <= ((reg26[(1'h1):(1'h1)] ?
                  (((reg15 ? reg26 : reg25) | $unsigned(reg33)) ?
                      ((reg19 ?
                          (8'ha5) : reg21) && $signed(reg28)) : $unsigned((reg21 > wire10))) : reg11) * (8'h9d));
              reg37 <= reg25[(4'h9):(2'h2)];
            end
          else
            begin
              reg34 <= $signed(reg13);
              reg35 <= ($signed((reg15[(2'h3):(1'h0)] ?
                  ($unsigned(reg19) ?
                      reg19 : reg34) : $unsigned(reg18))) | ((|($signed(reg31) ?
                      $unsigned(reg27) : (&reg37))) ?
                  wire6 : ((reg18[(4'hf):(4'hc)] || $signed(reg30)) ^ reg22)));
            end
        end
    end
  assign wire38 = $unsigned((~$unsigned(reg30[(4'hc):(1'h0)])));
  assign wire39 = ($unsigned(reg13) * (wire6 ?
                      ((^(reg14 ^ wire8)) ?
                          $signed(((8'ha1) ?
                              reg26 : reg32)) : $unsigned((reg20 ?
                              (8'hab) : wire8))) : (&{$signed(reg30),
                          reg25[(4'hc):(4'h9)]})));
  assign wire40 = reg33;
  module41 #() modinst62 (.y(wire61), .wire42(reg21), .wire45(wire39), .clk(clk), .wire43(reg20), .wire44(reg34));
  module63 #() modinst100 (.y(wire99), .wire64(reg26), .wire65(reg34), .wire67(reg25), .wire66(wire7), .wire68(reg27), .clk(clk));
  assign wire101 = (!((-$unsigned((~&reg25))) ?
                       reg29[(3'h5):(1'h1)] : $signed($unsigned((reg27 * reg31)))));
endmodule

module module63  (y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire68;
  input wire [(4'hd):(1'h0)] wire67;
  input wire signed [(4'hf):(1'h0)] wire66;
  input wire [(4'hf):(1'h0)] wire65;
  input wire [(3'h5):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(5'h12):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire69;
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire69,
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
                 (1'h0)};
  assign wire69 = wire64;
  always
    @(posedge clk) begin
      reg70 <= (-wire66);
      reg71 <= (wire67[(1'h0):(1'h0)] < (wire68 ?
          wire66[(3'h6):(2'h3)] : (8'hab)));
      if (reg70)
        begin
          reg72 <= ((($signed((wire67 ?
                      wire69 : wire66)) > {reg70[(3'h4):(3'h4)]}) ?
                  (~|(8'hb8)) : reg70) ?
              $unsigned(({wire69[(3'h5):(3'h5)]} ^ $signed(wire64))) : ($unsigned($signed((|wire64))) == $unsigned(wire64[(1'h1):(1'h0)])));
          reg73 <= (((7'h44) ?
                  ($unsigned($signed(reg70)) >>> wire64) : ({$unsigned(reg72),
                      $signed(wire65)} && $unsigned(reg72[(2'h2):(1'h0)]))) ?
              ($unsigned($unsigned($signed(wire64))) >= $unsigned($unsigned(wire65))) : $signed($signed((|(reg72 == reg70)))));
        end
      else
        begin
          reg72 <= reg71;
          reg73 <= ($signed(wire64[(2'h2):(2'h2)]) && wire66);
          reg74 <= (8'hb2);
          reg75 <= (8'ha3);
          reg76 <= reg74[(2'h2):(1'h0)];
        end
      reg77 <= (({{wire66, (wire68 ? wire65 : reg71)},
          ({wire68} ~^ $signed(wire67))} | {(-(&reg72))}) - ($signed((~^$signed(wire68))) ?
          wire67 : (($signed(wire68) == (wire64 != reg72)) - ($signed(reg76) ?
              (reg71 ? reg71 : wire64) : $unsigned(wire68)))));
    end
  always
    @(posedge clk) begin
      reg78 <= $unsigned((&$unsigned(reg77[(2'h2):(1'h1)])));
      reg79 <= (+{wire68[(3'h6):(1'h0)], reg73[(4'h8):(3'h4)]});
      reg80 <= reg73[(3'h7):(3'h6)];
      reg81 <= $unsigned($unsigned($unsigned(reg74)));
    end
  assign wire82 = reg78;
  assign wire83 = $signed(({reg71} ~^ {wire65[(2'h2):(2'h2)]}));
  assign wire84 = $unsigned($signed({($signed(wire83) | reg78[(2'h2):(1'h0)]),
                      $signed((wire67 || reg80))}));
  assign wire85 = {wire64[(1'h0):(1'h0)], (^~reg71[(1'h0):(1'h0)])};
  assign wire86 = $unsigned($signed($signed(((+reg76) ?
                      {reg76} : $signed((8'hbb))))));
  always
    @(posedge clk) begin
      if ((~&({$signed(reg70),
          ($unsigned((8'had)) ?
              (wire69 <<< reg80) : {reg77, wire64})} <= (8'h9e))))
        begin
          if ((!(wire83 ?
              wire64[(3'h5):(2'h2)] : (^~$signed($unsigned(reg79))))))
            begin
              reg87 <= $signed($unsigned((+((reg71 ? reg77 : reg71) ?
                  reg74[(3'h4):(2'h2)] : wire82))));
              reg88 <= wire83[(3'h6):(3'h6)];
              reg89 <= $signed($unsigned((+wire68)));
              reg90 <= reg73;
            end
          else
            begin
              reg87 <= $unsigned((8'haa));
            end
          reg91 <= ($signed((reg87 + reg73)) || {{wire67,
                  (&wire85[(1'h0):(1'h0)])}});
          reg92 <= reg72;
        end
      else
        begin
          if ($signed($unsigned($unsigned($signed((wire85 > reg73))))))
            begin
              reg87 <= {(^~$unsigned(reg92))};
              reg88 <= {(($unsigned($signed((8'ha4))) - ($signed(reg81) << reg89[(4'hf):(4'hf)])) | wire69[(4'h8):(3'h7)]),
                  reg76};
            end
          else
            begin
              reg87 <= ($signed(reg72[(4'h9):(3'h4)]) ?
                  $signed((8'hb8)) : reg87[(3'h7):(3'h4)]);
              reg88 <= reg88[(4'hc):(4'hb)];
              reg89 <= wire64;
            end
          reg90 <= {(|(~^$signed($signed(reg72)))),
              $unsigned({{reg71[(3'h6):(1'h0)], (reg74 != wire84)}})};
        end
      if ((^~($unsigned(reg71) ?
          (&((reg91 >= wire65) + wire67)) : $signed(((^~reg77) ?
              (~&reg77) : (|reg92))))))
        begin
          reg93 <= wire66;
          reg94 <= (^~($unsigned(reg70) ?
              (((reg79 ? reg79 : wire64) ?
                      (wire66 ? reg87 : wire64) : $unsigned(reg76)) ?
                  {reg89[(5'h14):(4'hb)]} : $signed(reg79[(4'h8):(3'h6)])) : ((~^(reg77 ?
                  (8'ha7) : reg71)) - $signed(reg91))));
          reg95 <= $signed(($unsigned((reg90[(3'h6):(3'h5)] | reg81)) ?
              (!$signed((reg81 ? reg72 : reg78))) : reg77[(2'h2):(1'h1)]));
        end
      else
        begin
          reg93 <= reg92;
        end
      reg96 <= (^~reg71[(3'h4):(1'h1)]);
    end
  assign wire97 = {(-(~&reg77))};
  assign wire98 = wire67;
endmodule

module module41
#(parameter param59 = ((({(~|(8'hb8))} ? {(~(8'hb3)), ((8'hbe) >>> (7'h44))} : (8'ha1)) ? {((&(8'ha3)) ^ ((8'haf) ? (8'hb0) : (8'hba))), (((8'haa) ? (8'ha6) : (8'hb2)) <= ((8'haf) ? (8'ha0) : (8'hac)))} : (8'ha9)) >>> ((({(8'hb4), (7'h42)} < ((8'ha3) == (8'ha6))) ? (((8'hb4) ? (8'hab) : (8'ha4)) ? (~(8'hba)) : ((8'hb6) - (8'ha4))) : (((8'hbd) == (8'hab)) >> ((8'ha6) && (8'ha4)))) * (^~((+(8'ha8)) ? (!(8'ha7)) : (!(7'h43)))))), 
parameter param60 = (8'hb4))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire45;
  input wire [(5'h15):(1'h0)] wire44;
  input wire signed [(3'h5):(1'h0)] wire43;
  input wire [(3'h5):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire48,
                 wire47,
                 wire46,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire46 = $unsigned(($unsigned({wire42[(3'h4):(1'h0)],
                      (wire45 ? wire43 : wire42)}) * wire42));
  assign wire47 = $signed({$unsigned((~wire43[(1'h0):(1'h0)]))});
  assign wire48 = $unsigned(wire47);
  always
    @(posedge clk) begin
      reg49 <= $unsigned($unsigned({wire46}));
      reg50 <= wire42;
      reg51 <= (((+(8'ha9)) >> {wire47[(2'h2):(1'h0)]}) << $unsigned(((reg49[(3'h4):(1'h0)] == wire42) ?
          wire43[(2'h2):(1'h1)] : $signed($unsigned(wire42)))));
      reg52 <= {wire47[(4'hf):(3'h6)], reg50};
      reg53 <= $unsigned({$signed(wire48[(3'h4):(2'h3)])});
    end
  assign wire54 = {$unsigned(reg52[(3'h7):(3'h6)]), wire46};
  assign wire55 = ({({$signed(wire48)} < ($unsigned(wire42) + wire42))} <<< $unsigned(wire54[(2'h3):(2'h2)]));
  assign wire56 = $signed($signed($unsigned({(reg51 & wire55)})));
  assign wire57 = $unsigned(({wire47, (wire42[(3'h4):(1'h1)] > wire55)} ?
                      (&({wire48} >= $unsigned(wire54))) : $signed((~^$unsigned(wire47)))));
  assign wire58 = wire56[(4'ha):(3'h6)];
endmodule
