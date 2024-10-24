module top
#(parameter param188 = {((({(8'ha5)} != ((8'hbb) ? (8'hbd) : (8'hac))) ? {(!(7'h43))} : (!(^~(8'haf)))) + ((((8'hb3) ? (8'ha8) : (8'hb6)) >> ((7'h43) ? (8'hb4) : (7'h42))) ? (~&(~&(8'haa))) : (~((8'ha9) ? (8'hb9) : (8'hb5)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire186;
  wire signed [(4'hb):(1'h0)] wire185;
  wire signed [(3'h5):(1'h0)] wire184;
  wire signed [(3'h7):(1'h0)] wire183;
  wire signed [(4'hf):(1'h0)] wire181;
  wire [(5'h13):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire59;
  assign y = {wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire181,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
                 (1'h0)};
  module5 #() modinst60 (wire59, clk, wire3, wire4, wire0, wire2);
  assign wire61 = $signed($signed({((wire4 <<< wire59) ?
                          {wire59, wire59} : $signed(wire2)),
                      wire1}));
  assign wire62 = wire59;
  assign wire63 = (!(((&wire3) ?
                          $signed($signed(wire4)) : (~|{wire61, wire62})) ?
                      (^wire4[(4'ha):(4'ha)]) : $signed(wire0)));
  module64 #() modinst182 (.wire67(wire61), .clk(clk), .y(wire181), .wire68(wire62), .wire65(wire2), .wire66(wire4));
  assign wire183 = $unsigned($unsigned((-$signed((wire3 & wire1)))));
  assign wire184 = wire181;
  assign wire185 = ({{wire183, ((^~wire184) >>> (wire183 & (8'hac)))}} ?
                       ($unsigned((^~$signed(wire3))) ~^ $unsigned((wire181[(4'hc):(4'ha)] ?
                           (^wire1) : (|wire183)))) : wire59[(2'h2):(1'h1)]);
  assign wire186 = $unsigned((wire0[(3'h6):(1'h0)] ?
                       wire59[(1'h0):(1'h0)] : wire62));
  assign wire187 = ($unsigned((wire185[(4'ha):(1'h1)] <= wire186)) <= $unsigned($unsigned(wire59[(1'h1):(1'h0)])));
endmodule

module module64
#(parameter param180 = (~&({{((8'ha4) ? (8'hbe) : (8'hb2)), ((8'h9c) ? (7'h40) : (7'h41))}, (((8'hbd) != (8'ha0)) ? (8'hb5) : ((8'ha4) - (8'ha0)))} ? ((((8'hb2) <= (8'ha2)) > ((8'hbe) >>> (8'haa))) ? {(+(8'hb0))} : (((7'h44) < (8'ha0)) << ((8'ha4) ? (7'h44) : (8'hb0)))) : (~|{((8'hb1) ^ (8'hb7)), ((8'hb0) ? (8'ha3) : (8'ha2))}))))
(y, clk, wire65, wire66, wire67, wire68);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire65;
  input wire [(4'hb):(1'h0)] wire66;
  input wire signed [(5'h11):(1'h0)] wire67;
  input wire [(5'h15):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire119;
  wire [(5'h14):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire121;
  wire signed [(3'h4):(1'h0)] wire122;
  wire [(4'hf):(1'h0)] wire123;
  wire [(3'h6):(1'h0)] wire124;
  wire signed [(3'h5):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire178;
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  assign y = {wire69,
                 wire70,
                 wire91,
                 wire93,
                 wire94,
                 wire95,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire178,
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
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire69 = $unsigned({$unsigned(((wire66 ~^ wire68) ~^ {wire66})),
                      ((-(^(8'h9c))) ? wire65 : wire68[(5'h15):(4'hd)])});
  assign wire70 = (^($unsigned($signed({(8'hb1),
                      wire66})) | ($signed((wire66 <= (8'hb0))) - (!$unsigned((8'hb9))))));
  always
    @(posedge clk) begin
      reg71 <= wire66;
      reg72 <= ((8'ha8) ^ wire69[(3'h4):(1'h1)]);
      reg73 <= ($unsigned($unsigned(((wire68 ?
              (8'hb5) : wire70) | $signed(reg72)))) ?
          (wire68 ?
              (wire66 ?
                  (|(~^reg71)) : {wire70}) : $unsigned(($signed(wire70) == (~|(8'hba))))) : wire70);
      reg74 <= $signed(($unsigned(wire69) ?
          (~^reg72[(2'h2):(2'h2)]) : {(!$unsigned(wire65))}));
    end
  module75 #() modinst92 (wire91, clk, wire69, reg73, wire65, reg71);
  assign wire93 = wire68[(5'h12):(4'h8)];
  assign wire94 = wire67[(3'h6):(3'h6)];
  assign wire95 = ((^wire94) <= ((wire66 ?
                          $unsigned((-wire65)) : $unsigned($signed(wire70))) ?
                      ({(-wire91)} ?
                          {(wire67 ? wire68 : reg74),
                              $signed(wire66)} : ({wire69, wire69} & (wire68 ?
                              wire67 : wire93))) : $signed($signed((wire93 <<< wire68)))));
  always
    @(posedge clk) begin
      if (($signed(((+$signed(wire91)) ?
              $unsigned(wire68[(4'hb):(1'h1)]) : (wire65[(4'ha):(4'h9)] && wire65[(4'hb):(3'h4)]))) ?
          {(!reg72)} : ($unsigned((^(^wire91))) ?
              $signed($signed((|reg73))) : $unsigned($signed((+reg74))))))
        begin
          if ((~|($signed(($unsigned(wire95) <<< (~wire91))) ?
              {({wire67} + $signed(reg73))} : ($unsigned((wire69 + wire65)) >> (8'ha5)))))
            begin
              reg96 <= (&wire70[(1'h1):(1'h1)]);
              reg97 <= {($signed((((7'h41) ? reg71 : wire69) ?
                      (reg74 & wire95) : $signed(wire65))) << $unsigned(((wire66 <= (8'hb0)) == (~^(8'h9f))))),
                  wire93};
              reg98 <= ($signed((wire93[(1'h1):(1'h1)] >= $signed({wire93,
                      wire93}))) ?
                  $unsigned($unsigned({wire91, (|wire91)})) : wire91);
              reg99 <= wire70[(3'h6):(3'h4)];
              reg100 <= (~^(|wire67[(3'h4):(1'h1)]));
            end
          else
            begin
              reg96 <= reg99[(5'h12):(3'h7)];
              reg97 <= (reg72 < $unsigned((wire65[(4'h9):(3'h4)] >>> $signed(wire68))));
            end
          if ((|$signed({$signed($signed(wire95))})))
            begin
              reg101 <= reg100;
            end
          else
            begin
              reg101 <= (reg97 ?
                  ((~^reg100[(3'h7):(1'h0)]) ?
                      (&((^~wire93) ^~ wire70[(4'ha):(4'h8)])) : ((wire66 ?
                          reg96 : reg99[(5'h14):(4'h9)]) >= $signed($signed(reg101)))) : wire94);
              reg102 <= ($signed(reg98[(3'h6):(3'h6)]) ?
                  wire70[(2'h2):(2'h2)] : $unsigned(reg101));
              reg103 <= ((~^{{(reg97 <<< reg102),
                      wire69}}) >> reg96[(1'h1):(1'h1)]);
              reg104 <= $unsigned($signed((((~^(8'hb3)) ?
                  reg74[(3'h6):(1'h0)] : reg73) != $signed($signed((8'hab))))));
              reg105 <= wire91;
            end
          if (({(wire95[(2'h3):(2'h2)] ^ (wire93 ?
                      $unsigned(reg101) : (&wire66))),
                  (wire70 | (7'h42))} ?
              wire94[(3'h4):(3'h4)] : wire70))
            begin
              reg106 <= ((+reg102) | $unsigned(wire68));
            end
          else
            begin
              reg106 <= (^~$signed(wire68[(1'h1):(1'h1)]));
              reg107 <= (+(+wire68));
              reg108 <= wire93[(4'h8):(3'h6)];
            end
          if ((^~$unsigned($signed($signed((+reg104))))))
            begin
              reg109 <= $unsigned(($unsigned($unsigned({wire94})) ?
                  (reg107[(3'h6):(2'h2)] ~^ $signed(wire94)) : ({$signed(wire65),
                      $unsigned((8'hb7))} > ($signed(wire68) && (reg102 + (8'hb4))))));
              reg110 <= $signed(reg99[(4'hc):(2'h3)]);
              reg111 <= $unsigned(reg97);
              reg112 <= ((~|$signed((8'hbf))) << $signed(($unsigned((~^(8'hb6))) <<< $signed(wire65[(4'ha):(3'h7)]))));
              reg113 <= {wire67,
                  $unsigned((($signed(reg100) ?
                      (reg74 >= reg99) : wire68[(5'h14):(3'h5)]) >>> reg112))};
            end
          else
            begin
              reg109 <= wire66;
            end
          reg114 <= (~|reg107);
        end
      else
        begin
          if ($unsigned($signed(wire66)))
            begin
              reg96 <= (~^({reg104[(3'h5):(3'h5)],
                  wire66} == (&$unsigned($signed(wire68)))));
              reg97 <= {wire69[(3'h5):(3'h4)],
                  ($unsigned($unsigned(((8'hb6) ? (8'hb2) : wire94))) ?
                      $unsigned((+reg109)) : ($signed($signed(reg102)) ?
                          $unsigned(reg98[(2'h2):(1'h1)]) : $unsigned($signed((7'h40)))))};
            end
          else
            begin
              reg96 <= ($signed(wire68[(5'h13):(4'hf)]) ?
                  reg74[(3'h4):(1'h1)] : reg97);
            end
          reg98 <= (~|wire91);
          if (($signed((reg111[(2'h2):(2'h2)] ? reg106 : {reg104})) >>> wire94))
            begin
              reg99 <= (~wire95);
              reg100 <= wire93;
              reg101 <= (~^(7'h40));
            end
          else
            begin
              reg99 <= (~{$signed((8'hb8))});
            end
          reg102 <= (reg100[(3'h6):(1'h0)] ? reg96[(1'h1):(1'h0)] : (~|wire91));
        end
      reg115 <= ({reg104[(4'hc):(4'ha)]} ?
          (-reg104) : (reg112[(3'h7):(2'h2)] ?
              $unsigned((reg100 & reg114)) : ($unsigned($unsigned(reg98)) ?
                  {$signed(wire67)} : wire94)));
      reg116 <= ((((!$signed((8'ha4))) ?
          reg99 : wire67[(4'ha):(2'h2)]) <= $signed(wire65)) ^~ ((~($signed(wire69) != wire68[(5'h10):(1'h1)])) ?
          $signed($signed(wire70)) : ({reg106, reg103} ?
              ($signed((7'h44)) ?
                  {reg106,
                      (8'ha8)} : reg112[(3'h7):(3'h6)]) : $unsigned((~reg96)))));
      reg117 <= ((!wire93[(4'h8):(3'h4)]) ?
          (wire93 != wire94) : $unsigned($signed((reg97 ?
              ((8'hb8) ? reg99 : reg100) : (^~reg112)))));
    end
  assign wire118 = $signed({(!($signed(reg71) ?
                           $unsigned(reg112) : reg115[(4'ha):(3'h7)])),
                       (!{reg102})});
  assign wire119 = $signed($unsigned($unsigned($signed((^(8'had))))));
  assign wire120 = reg96;
  assign wire121 = $signed({reg111[(2'h2):(1'h1)]});
  assign wire122 = (8'hb7);
  assign wire123 = ({$signed(reg109),
                       $signed($unsigned($signed((7'h40))))} <<< {((&$signed((8'ha1))) || (~{(8'h9c),
                           reg74}))});
  assign wire124 = {(+(reg72[(2'h3):(1'h0)] && {((8'ha0) + reg106)}))};
  assign wire125 = $unsigned(((($unsigned(wire123) ?
                           reg73[(3'h6):(1'h0)] : $signed(reg97)) + reg104) ?
                       $signed((wire118[(1'h0):(1'h0)] + {(8'h9d),
                           reg110})) : (|$unsigned((wire93 ?
                           wire122 : (8'hb1))))));
  assign wire126 = (8'hbd);
  module127 #() modinst179 (.wire128(reg103), .wire132(reg101), .y(wire178), .wire129(wire67), .clk(clk), .wire131(wire123), .wire130(wire118));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h280):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg54,
                 reg53,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg21,
                 reg20,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((&wire8))
        begin
          reg10 <= wire6;
          reg11 <= ($unsigned($signed($unsigned(wire9))) != wire7[(2'h3):(1'h0)]);
          if (wire6[(1'h0):(1'h0)])
            begin
              reg12 <= $signed(reg10);
            end
          else
            begin
              reg12 <= $signed($unsigned(reg10));
            end
          if ((~^(|($signed($unsigned(reg11)) & wire9[(2'h2):(1'h0)]))))
            begin
              reg13 <= ((~$signed({reg11[(4'ha):(2'h3)]})) >> $signed(((~^wire6[(3'h7):(3'h6)]) ?
                  (^~$unsigned(reg12)) : reg10)));
            end
          else
            begin
              reg13 <= (&{wire8[(1'h0):(1'h0)]});
              reg14 <= (|wire9[(2'h3):(1'h1)]);
              reg15 <= (reg13 ?
                  ((($unsigned(reg11) ~^ reg13) ?
                      ($signed((8'hb5)) ?
                          (+wire7) : ((8'hb3) * wire9)) : {reg12[(4'ha):(3'h6)],
                          (reg13 >> wire6)}) ^ (|((8'hbd) ?
                      reg11 : $signed(reg14)))) : reg12);
              reg16 <= ((!reg14) == reg15[(3'h4):(1'h0)]);
            end
          if ((^($signed((((8'hbd) ?
              reg10 : (8'ha8)) <<< $signed((8'ha7)))) <= (wire7 ?
              wire7[(1'h1):(1'h1)] : reg12))))
            begin
              reg17 <= $signed($unsigned((reg12 ?
                  {(reg11 > wire6),
                      (reg10 ?
                          (8'ha9) : reg13)} : (reg15[(5'h11):(4'h8)] != (|reg14)))));
            end
          else
            begin
              reg17 <= (~|(^($signed(reg11) > ($unsigned(reg11) * ((8'h9c) || wire9)))));
              reg18 <= ((reg17 & {((!(8'hb1)) ?
                          (reg12 ? wire6 : wire6) : reg17),
                      (reg14 ? {(8'h9f), (8'hac)} : (reg14 ^ reg17))}) ?
                  reg15 : $unsigned((~&{(wire6 ? wire8 : reg17),
                      $signed(wire7)})));
              reg19 <= {(!(|$signed($unsigned(reg16)))),
                  $unsigned(($unsigned(reg15[(1'h0):(1'h0)]) ?
                      {$unsigned((8'ha0))} : (reg15[(5'h11):(4'h9)] && (reg18 ?
                          reg16 : (8'hab)))))};
              reg20 <= (~|{reg19, wire6[(2'h2):(1'h0)]});
              reg21 <= ($unsigned(reg12[(4'he):(2'h3)]) | (&(wire7[(1'h0):(1'h0)] ?
                  {$signed(reg15)} : {(~|reg16)})));
            end
        end
      else
        begin
          reg10 <= reg11;
          reg11 <= $signed($unsigned((~^$unsigned(reg17[(4'h8):(4'h8)]))));
          reg12 <= $unsigned((^~reg19[(3'h4):(2'h2)]));
          reg13 <= (|reg19[(4'hf):(2'h2)]);
        end
    end
  assign wire22 = {reg13[(3'h6):(2'h2)],
                      ($unsigned(reg19[(3'h5):(3'h4)]) ?
                          ({(reg10 ? reg14 : reg11), (reg13 || wire7)} ?
                              reg14[(3'h7):(3'h6)] : {(+reg15),
                                  $unsigned((8'h9d))}) : $unsigned((-(reg19 ?
                              reg10 : reg13))))};
  assign wire23 = $unsigned(wire8[(1'h1):(1'h1)]);
  assign wire24 = ($unsigned($signed(reg16)) - reg20);
  assign wire25 = ($signed($signed({(wire6 ? reg15 : wire24),
                      reg10[(3'h6):(1'h0)]})) >> ((8'hbf) ~^ $unsigned(reg16[(2'h3):(1'h1)])));
  assign wire26 = (reg13[(3'h6):(1'h1)] <= ($unsigned({{reg20}}) ?
                      $signed((~&(reg18 ?
                          reg21 : reg12))) : {(reg11[(3'h7):(3'h4)] ?
                              (~^reg14) : $signed(reg13))}));
  assign wire27 = (wire23[(3'h7):(1'h1)] ? wire7 : wire22);
  always
    @(posedge clk) begin
      reg28 <= (-wire27);
      reg29 <= $unsigned(wire26[(4'he):(4'h8)]);
      reg30 <= wire26;
      if ((^~(~&reg30)))
        begin
          reg31 <= ($unsigned(reg18) ~^ $unsigned((((reg19 ?
              wire25 : reg19) <= (reg29 ? reg11 : (8'hbd))) - (!(reg16 ?
              reg17 : (7'h42))))));
        end
      else
        begin
          reg31 <= (wire27 ?
              reg28 : $signed((($unsigned((8'h9c)) ?
                      reg12 : (wire27 ? wire26 : reg15)) ?
                  $signed($signed((8'h9e))) : $unsigned((+(8'hb5))))));
          if ({wire27,
              (~&((~(reg30 ? reg18 : reg30)) || $signed(((8'h9d) ?
                  reg11 : (8'hab)))))})
            begin
              reg32 <= ((^$unsigned(((|reg17) >> wire27))) ?
                  (({(reg28 >> reg28), (reg15 + reg12)} ?
                      (^~reg15[(4'hc):(3'h4)]) : reg11) >> $unsigned((wire7[(3'h7):(3'h5)] ?
                      $unsigned((8'hb0)) : (8'hb0)))) : ($unsigned(({(8'hb8)} ?
                      {wire8} : (wire6 ?
                          (7'h43) : reg20))) || (({reg15} << (reg21 && reg17)) > (8'hb9))));
            end
          else
            begin
              reg32 <= (^~(reg12 & (reg16 != reg12[(4'ha):(3'h4)])));
              reg33 <= ((reg19[(4'hb):(1'h0)] ?
                  $signed((8'hb1)) : $unsigned((wire24 | (~&reg16)))) ~^ (({(wire25 >= reg29)} <= (+reg19)) - $signed((wire27 && (~|wire26)))));
            end
        end
    end
  assign wire34 = {($signed(($unsigned(reg17) != {reg33, reg11})) ?
                          wire27 : ((-(-wire22)) ?
                              reg31[(3'h6):(3'h5)] : ($unsigned(reg11) + reg12))),
                      reg29[(4'hc):(4'hc)]};
  assign wire35 = {($unsigned((reg29[(4'hc):(3'h7)] ?
                          (reg11 ~^ reg29) : $signed(wire24))) >> reg13),
                      ($signed(($signed(reg20) ?
                              reg28[(3'h5):(1'h0)] : (~|reg12))) ?
                          (^~wire8[(4'h9):(1'h1)]) : (7'h43))};
  assign wire36 = reg19;
  assign wire37 = (wire26 <<< $signed({(-$signed(reg19))}));
  assign wire38 = ($signed(wire6) >= (8'hb5));
  assign wire39 = reg13;
  always
    @(posedge clk) begin
      reg40 <= $unsigned(((^((^~reg28) ? $unsigned(reg29) : $unsigned(reg11))) ?
          (reg17[(5'h14):(3'h4)] ?
              $signed((reg15 ?
                  wire36 : reg15)) : (^(^reg16))) : (~|reg15[(2'h3):(1'h0)])));
      reg41 <= (((~|(&$signed(wire39))) >= {$signed((wire38 > wire24))}) <= $signed(($unsigned($signed(reg16)) ?
          (&(reg32 ? reg31 : reg13)) : {(|wire39)})));
      if ($unsigned((~^((^(8'hb2)) + reg14))))
        begin
          reg42 <= $signed((reg19 << (&(~&(reg30 | wire22)))));
          reg43 <= ({$unsigned($unsigned(wire22)),
              wire6} || (~&$unsigned((+reg40[(1'h1):(1'h1)]))));
          reg44 <= reg30;
        end
      else
        begin
          if ($unsigned((wire38[(4'ha):(3'h7)] >>> {(^$unsigned(reg18))})))
            begin
              reg42 <= $unsigned($unsigned(reg30));
              reg43 <= reg12[(3'h7):(2'h3)];
            end
          else
            begin
              reg42 <= $unsigned($signed($unsigned(reg17[(5'h13):(3'h6)])));
              reg43 <= (($unsigned(((^(8'hbb)) ? reg42 : (~(7'h43)))) ?
                      $unsigned($signed((8'ha0))) : reg11) ?
                  reg29 : (($signed(reg10[(5'h10):(3'h5)]) * $unsigned(reg11[(4'ha):(3'h4)])) <= {((reg11 ?
                              reg18 : (8'ha7)) ?
                          reg16 : wire7[(1'h1):(1'h0)])}));
              reg44 <= (~&$signed(((wire7[(2'h3):(2'h2)] - (-wire37)) < reg20[(1'h1):(1'h0)])));
              reg45 <= wire7;
              reg46 <= ($signed($unsigned($unsigned((reg19 * (8'hb4))))) != reg17[(2'h2):(1'h1)]);
            end
          reg47 <= (+{wire25[(5'h11):(4'hc)],
              ((reg15[(2'h2):(2'h2)] ? $signed(wire9) : $signed((8'ha7))) ?
                  wire9[(4'hd):(3'h7)] : (reg29[(3'h7):(2'h2)] - ((8'hb0) ?
                      reg15 : reg42)))});
          if (((^~reg41[(3'h5):(1'h0)]) ?
              (wire37[(1'h0):(1'h0)] ?
                  ((~wire26) ?
                      (reg20 ?
                          (wire22 < reg13) : (~(7'h41))) : ($unsigned(wire26) ?
                          (reg13 >= wire26) : $signed(wire7))) : ($unsigned((8'ha5)) << (!reg41[(1'h1):(1'h0)]))) : {wire25}))
            begin
              reg48 <= $signed($signed({$signed((reg30 << reg43))}));
              reg49 <= $signed((&$unsigned(reg10[(4'he):(4'h8)])));
            end
          else
            begin
              reg48 <= (~^$signed((($signed(reg49) ?
                  wire24[(2'h3):(2'h2)] : (8'hb4)) || {wire38[(4'h8):(3'h4)]})));
              reg49 <= ((^$unsigned($unsigned((~&wire7)))) ?
                  wire36 : ({$unsigned((|wire9))} ?
                      $signed(wire8) : {wire6, $signed((wire25 == reg11))}));
              reg50 <= (8'hb3);
            end
          if ({(~{({(8'ha9)} >= $signed(wire8))})})
            begin
              reg51 <= $signed(reg48);
            end
          else
            begin
              reg51 <= (({(~{reg15})} - $unsigned(((reg43 ? reg19 : reg41) ?
                  $unsigned(wire36) : (~^(8'hb7))))) - (($signed($unsigned(wire8)) ?
                  $unsigned($signed(reg33)) : $unsigned({reg12})) > reg43[(1'h0):(1'h0)]));
            end
          reg52 <= {$signed($unsigned(((8'h9f) ? $unsigned(reg10) : {reg44})))};
        end
      reg53 <= ({reg49[(2'h3):(1'h1)], {$unsigned({reg44, reg51})}} >>> wire34);
      reg54 <= (8'hbe);
    end
  assign wire55 = $unsigned((($signed($signed(wire9)) != {(reg45 * reg53)}) >= $unsigned({(reg44 ~^ reg41),
                      $unsigned(wire7)})));
  assign wire56 = ((~&reg47) << $signed(reg12[(3'h7):(2'h3)]));
  assign wire57 = {reg46};
  assign wire58 = $signed(wire57);
endmodule

module module127
#(parameter param177 = ({(((-(8'hb0)) + ((7'h44) + (8'hac))) == {((7'h43) << (8'ha2))})} ? (((&{(8'hb2)}) ? (((8'hb5) ? (8'hb2) : (8'haf)) ? {(8'hb7)} : ((8'hb2) || (8'hbb))) : (((8'ha3) ? (8'ha7) : (8'hae)) < ((8'ha2) ? (8'ha1) : (8'h9f)))) ? (-({(8'hab)} >> (~(7'h40)))) : (~{(~&(8'ha8)), (~&(7'h44))})) : ((!(((7'h44) ? (7'h43) : (8'hab)) ? (|(8'hae)) : ((8'hba) >= (8'ha3)))) ? (((~^(7'h40)) ? {(8'hb0)} : (+(8'had))) ^ (|(!(8'ha8)))) : {(((8'hb3) || (8'h9f)) ? (+(8'hb8)) : ((8'ha9) != (8'ha3)))})))
(y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'h1f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire132;
  input wire signed [(4'hf):(1'h0)] wire131;
  input wire signed [(4'h9):(1'h0)] wire130;
  input wire [(4'he):(1'h0)] wire129;
  input wire [(5'h13):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire176;
  wire [(3'h7):(1'h0)] wire175;
  wire signed [(2'h2):(1'h0)] wire174;
  wire signed [(3'h4):(1'h0)] wire150;
  wire [(4'hd):(1'h0)] wire148;
  wire signed [(4'hf):(1'h0)] wire147;
  wire signed [(4'hc):(1'h0)] wire146;
  wire [(4'hd):(1'h0)] wire145;
  wire signed [(2'h3):(1'h0)] wire144;
  wire signed [(3'h4):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire136;
  wire signed [(3'h6):(1'h0)] wire135;
  wire [(4'he):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire133;
  reg signed [(3'h7):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(2'h2):(1'h0)] reg169 = (1'h0);
  reg [(4'he):(1'h0)] reg168 = (1'h0);
  reg [(3'h4):(1'h0)] reg167 = (1'h0);
  reg [(5'h13):(1'h0)] reg166 = (1'h0);
  reg [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(4'h9):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(4'hc):(1'h0)] reg161 = (1'h0);
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'he):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire150,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
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
                 reg149,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire133 = wire128[(5'h13):(3'h5)];
  assign wire134 = wire132;
  assign wire135 = (~|(^~{($signed((8'hba)) & $signed(wire131)),
                       $unsigned((wire132 ? wire128 : (7'h42)))}));
  assign wire136 = (((+({wire128} || (wire135 ? wire135 : wire132))) ?
                           $unsigned((wire128[(5'h11):(2'h3)] ?
                               $unsigned(wire135) : wire135)) : $unsigned(wire131)) ?
                       $unsigned(wire128) : $unsigned($unsigned((8'hae))));
  always
    @(posedge clk) begin
      reg137 <= (8'ha1);
      reg138 <= reg137;
      reg139 <= {($signed($unsigned(((8'h9e) ? wire136 : wire131))) ?
              $signed(reg137[(1'h0):(1'h0)]) : (wire134 ?
                  ((reg137 ? wire129 : wire129) ?
                      (|wire133) : $unsigned(reg138)) : wire133[(4'h8):(1'h1)]))};
      reg140 <= {(8'hb5), wire132[(3'h7):(3'h4)]};
      reg141 <= $signed($signed(wire135));
    end
  assign wire142 = ($signed((8'hb3)) || (^~{($signed(wire128) ?
                           $unsigned(reg141) : (8'ha8))}));
  assign wire143 = {reg141[(1'h0):(1'h0)],
                       {{(~wire131[(4'hb):(2'h3)])},
                           $unsigned(($unsigned(wire135) ?
                               (wire128 ?
                                   wire142 : wire128) : (reg140 <= wire130)))}};
  assign wire144 = wire136[(1'h0):(1'h0)];
  assign wire145 = wire142[(1'h1):(1'h1)];
  assign wire146 = reg138[(4'hc):(3'h6)];
  assign wire147 = {$unsigned(($unsigned($signed(wire143)) > ((wire135 * wire129) ?
                           $signed(reg140) : reg137)))};
  assign wire148 = wire133[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg149 <= reg141;
    end
  assign wire150 = {$unsigned(wire142[(4'h9):(4'h9)])};
  always
    @(posedge clk) begin
      reg151 <= wire143[(1'h0):(1'h0)];
      reg152 <= wire144;
      reg153 <= (-$unsigned(wire128));
      if ((~|(8'hb9)))
        begin
          if (((+wire135[(2'h2):(1'h0)]) ? wire150 : {reg138[(3'h4):(1'h0)]}))
            begin
              reg154 <= wire150[(1'h1):(1'h1)];
              reg155 <= reg137[(3'h6):(3'h6)];
              reg156 <= (~^{$signed($signed($signed(wire134))),
                  ((&wire133) != reg139[(4'hc):(4'h8)])});
              reg157 <= wire150;
            end
          else
            begin
              reg154 <= wire142[(2'h2):(1'h1)];
              reg155 <= (^~(({(wire131 >> reg149), (8'ha9)} ?
                  $signed(((8'ha8) ?
                      (7'h42) : reg152)) : ((reg153 << wire131) ^ wire131[(4'h9):(3'h4)])) - $unsigned($signed((reg151 ?
                  wire136 : reg156)))));
              reg156 <= ($unsigned(($unsigned(wire130[(2'h2):(1'h0)]) >>> wire148)) >> (($signed(wire144) ?
                      wire134[(2'h2):(1'h1)] : $signed({wire135})) ?
                  {(+$signed(reg138)),
                      $signed(wire145)} : $signed((-(wire136 | wire147)))));
              reg157 <= wire130;
              reg158 <= (|{{$unsigned($unsigned(wire145)),
                      wire134[(4'hb):(4'h9)]},
                  ($unsigned($signed((8'hae))) ^~ $signed((reg137 + reg154)))});
            end
          reg159 <= ((wire136 ?
                  (^~$signed($signed(wire150))) : $unsigned({(wire143 ?
                          reg151 : reg154)})) ?
              wire150[(1'h0):(1'h0)] : (wire130[(3'h5):(2'h2)] ^~ $signed($unsigned($signed(reg138)))));
          if (wire130[(3'h7):(3'h5)])
            begin
              reg160 <= ((~^(8'hb3)) ?
                  (~($signed(reg139[(1'h1):(1'h1)]) ?
                      $unsigned(wire142[(3'h4):(2'h2)]) : reg158)) : wire146[(4'h9):(3'h6)]);
              reg161 <= ($signed($unsigned((^~(reg137 | wire144)))) < ((~$unsigned(reg138[(4'hb):(4'ha)])) >> ({{wire150,
                      wire150},
                  ((8'ha4) ? wire128 : reg154)} + reg138[(3'h7):(3'h4)])));
            end
          else
            begin
              reg160 <= $signed(reg155[(2'h3):(1'h0)]);
              reg161 <= reg159;
              reg162 <= {$unsigned(reg149)};
              reg163 <= (wire132[(3'h4):(2'h3)] ^~ (8'hb5));
              reg164 <= wire145;
            end
          reg165 <= $signed(wire130);
        end
      else
        begin
          if ((((~^($signed(reg156) ? $signed(reg160) : $signed(wire145))) ?
                  ($signed((reg149 ~^ reg153)) ?
                      wire147[(4'h8):(3'h7)] : ((!(8'hae)) ?
                          (reg141 ? reg153 : wire132) : (reg164 ?
                              wire131 : reg151))) : (wire146[(3'h4):(1'h0)] < (8'ha4))) ?
              (~&(wire143 ?
                  ((reg138 ?
                      wire129 : reg161) < ((8'ha1) == (8'ha6))) : $signed((reg165 ?
                      reg160 : reg151)))) : wire136))
            begin
              reg154 <= reg141;
              reg155 <= (^~(8'hb5));
              reg156 <= $signed((|reg162));
            end
          else
            begin
              reg154 <= $unsigned({(+((reg160 ^~ (8'ha1)) ?
                      (-wire142) : wire145))});
              reg155 <= ((8'hbc) != (($signed((wire128 ? wire132 : reg141)) ?
                  (&reg164[(3'h5):(1'h0)]) : ((wire128 ? wire143 : (8'hb9)) ?
                      wire131 : (^(8'hb9)))) && $unsigned((-$unsigned(reg160)))));
              reg156 <= {reg160[(2'h2):(1'h0)]};
              reg157 <= reg140[(3'h6):(3'h6)];
            end
        end
      reg166 <= wire146[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if (wire131[(4'h8):(2'h3)])
        begin
          reg167 <= {$unsigned((~|$unsigned((8'hb8))))};
          if ($signed($unsigned($signed(wire129[(3'h4):(3'h4)]))))
            begin
              reg168 <= {((^(reg160 ?
                      reg138[(3'h4):(1'h1)] : (reg154 | reg149))) * {(((8'haf) ?
                          wire131 : wire132) < wire148[(4'h8):(2'h2)])}),
                  $unsigned((~^($unsigned(wire146) ?
                      wire129[(1'h0):(1'h0)] : wire147)))};
              reg169 <= (!{(^((reg160 ? reg152 : (8'haa)) ?
                      {(8'hac)} : (8'h9c)))});
              reg170 <= reg151[(1'h0):(1'h0)];
              reg171 <= (!reg170[(3'h5):(2'h3)]);
            end
          else
            begin
              reg168 <= ((&reg170) ?
                  ((wire130[(3'h5):(1'h1)] == $unsigned((wire132 - reg139))) ?
                      reg169[(2'h2):(1'h1)] : reg152[(4'hd):(4'hc)]) : (!wire136[(5'h11):(5'h11)]));
              reg169 <= (+(8'h9d));
            end
        end
      else
        begin
          reg167 <= reg153[(1'h1):(1'h0)];
          reg168 <= ((wire146 ?
                  $unsigned(((^wire136) ?
                      (wire148 >>> wire142) : reg168[(3'h5):(2'h3)])) : ($unsigned((wire129 + reg141)) ?
                      $signed($signed(wire135)) : (~&(~|reg138)))) ?
              {wire142[(4'hd):(4'h9)]} : wire146[(4'hc):(2'h3)]);
          reg169 <= $unsigned($signed((($signed(wire145) ?
              $signed(reg152) : reg140) ~^ reg149)));
        end
      reg172 <= $signed($signed((^~({reg151} ?
          wire145[(4'h8):(2'h2)] : $unsigned((8'ha8))))));
      reg173 <= wire129[(4'hc):(1'h1)];
    end
  assign wire174 = reg159;
  assign wire175 = {(reg155[(4'hc):(2'h3)] ?
                           (^~((reg163 - (8'hac)) ?
                               reg138[(4'hf):(1'h1)] : (^wire145))) : wire133[(2'h2):(1'h1)]),
                       reg140};
  assign wire176 = wire129[(4'he):(4'ha)];
endmodule

module module75
#(parameter param89 = (({(((8'hbc) ? (8'hbc) : (8'hbc)) * ((8'hae) * (7'h40)))} ? (&({(8'hba), (8'haf)} ? (~^(8'hb1)) : (~(8'hba)))) : (-(((8'hbf) < (8'ha1)) ? {(8'ha5)} : ((8'ha3) >> (8'ha5))))) - (8'ha1)), 
parameter param90 = ({(((~(8'hac)) << (~^param89)) ? (!(param89 ? param89 : param89)) : ((param89 > param89) ? (&param89) : (|param89)))} ? (^(^~((~|(8'ha0)) ? (&(8'ha7)) : {param89}))) : {param89}))
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire79;
  input wire signed [(3'h6):(1'h0)] wire78;
  input wire signed [(4'hd):(1'h0)] wire77;
  input wire signed [(5'h10):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire81;
  wire [(4'h8):(1'h0)] wire80;
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  assign y = {wire81,
                 wire80,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire80 = wire78;
  assign wire81 = (($unsigned(wire77) ?
                          wire80[(1'h0):(1'h0)] : $signed($unsigned((wire76 * wire77)))) ?
                      (({(wire79 ? wire79 : (8'hbe)), (^(8'h9c))} ?
                          (|$unsigned((8'ha3))) : $unsigned(wire80[(3'h4):(1'h1)])) >= $signed(wire76)) : (~^$unsigned($signed(wire76[(4'ha):(3'h7)]))));
  always
    @(posedge clk) begin
      reg82 <= (wire77[(2'h2):(1'h1)] >> wire77);
      reg83 <= (wire78 ?
          $signed((((wire77 ?
              reg82 : wire77) == wire78[(2'h3):(1'h0)]) + wire80)) : ((+wire79[(2'h2):(1'h1)]) & {wire79}));
    end
  always
    @(posedge clk) begin
      reg84 <= ($signed(((!{wire80, wire81}) == (wire81[(1'h0):(1'h0)] ?
              reg82[(3'h6):(3'h5)] : (wire80 || (8'ha5))))) ?
          (($unsigned((reg83 ?
              reg83 : wire81)) ^ $signed((|wire78))) << (wire76[(3'h4):(3'h4)] && ($signed((8'haf)) || $signed((8'hb8))))) : ((wire77 ?
              wire80[(3'h6):(2'h3)] : {wire80}) & (!((~|wire80) >>> reg82))));
      reg85 <= $signed($unsigned($unsigned(wire78[(1'h0):(1'h0)])));
      reg86 <= $unsigned(((wire78 == wire79) ?
          (&({wire80, wire78} ?
              (reg82 ^ (8'h9e)) : $signed(wire78))) : ({$signed(reg82)} ?
              ((wire77 ?
                  wire77 : wire81) <<< $unsigned((8'ha4))) : (~|(~^wire81)))));
      reg87 <= {($unsigned(wire78) ?
              $signed($unsigned(wire76[(3'h7):(3'h6)])) : ({(reg86 ?
                          reg85 : wire76)} ?
                  (wire76[(4'hb):(4'hb)] ?
                      $signed(wire81) : wire78[(1'h1):(1'h0)]) : wire80[(3'h5):(3'h4)]))};
      reg88 <= (~^(wire81[(1'h0):(1'h0)] ^ wire77));
    end
endmodule
