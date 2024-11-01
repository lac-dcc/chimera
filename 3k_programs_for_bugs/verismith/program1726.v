module top
#(parameter param116 = (&(8'h9d)), 
parameter param117 = ((&((&(~^param116)) ? {param116, (-param116)} : (8'haa))) | (param116 ^ param116)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(5'h13):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire115,
                 wire113,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = ($unsigned($signed(((wire2 * wire1) <<< $signed(wire4)))) ?
                     $unsigned(wire0[(2'h3):(2'h3)]) : {(!(~|$unsigned(wire0))),
                         $unsigned(wire2)});
  assign wire6 = $unsigned(wire3);
  assign wire7 = wire3;
  always
    @(posedge clk) begin
      reg8 <= $signed($unsigned($unsigned((8'hb1))));
      reg9 <= wire4;
    end
  assign wire10 = $signed($unsigned((8'ha9)));
  always
    @(posedge clk) begin
      reg11 <= ($signed((((~^wire0) > wire0[(1'h1):(1'h0)]) >>> wire0)) ?
          ($unsigned($unsigned($unsigned(wire6))) ?
              $unsigned($unsigned(wire5)) : wire3[(4'hc):(3'h5)]) : $unsigned((!((^~(8'hb3)) ?
              (wire7 > wire4) : $signed((8'ha2))))));
      if (wire3[(2'h2):(2'h2)])
        begin
          reg12 <= (wire3[(3'h5):(2'h3)] ?
              $unsigned((~^(!(wire3 >> wire2)))) : (reg8 ?
                  (8'ha5) : ((~&reg11) ?
                      (!$unsigned(wire2)) : wire4[(4'hb):(4'hb)])));
          reg13 <= $unsigned($signed(wire7[(2'h3):(1'h1)]));
          reg14 <= wire10;
          reg15 <= (|$unsigned($signed(wire10)));
          reg16 <= $unsigned({$signed({{wire4, wire2},
                  (wire4 ? reg8 : wire10)}),
              (((reg13 ? wire2 : reg15) ?
                  (wire7 + wire0) : (reg11 && wire5)) >> reg14[(3'h6):(1'h1)])});
        end
      else
        begin
          reg12 <= reg11[(1'h0):(1'h0)];
        end
    end
  assign wire17 = $signed((wire5 + $signed(reg13)));
  assign wire18 = (wire6[(3'h4):(1'h1)] & (|$unsigned(reg13)));
  assign wire19 = wire6[(3'h5):(2'h3)];
  assign wire20 = wire7[(3'h6):(3'h6)];
  assign wire21 = wire20[(3'h7):(2'h3)];
  assign wire22 = $unsigned((wire5[(3'h4):(2'h3)] ?
                      (+$unsigned($signed(reg15))) : (+reg13[(1'h1):(1'h1)])));
  assign wire23 = {({($signed(wire18) ? $signed(reg15) : $unsigned(wire4))} ?
                          (+wire3[(1'h1):(1'h1)]) : $unsigned(wire22)),
                      $signed(reg16)};
  assign wire24 = wire7;
  module25 #() modinst114 (.wire26(wire24), .clk(clk), .y(wire113), .wire28(wire1), .wire27(wire5), .wire29(wire10));
  assign wire115 = {reg12};
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire29;
  input wire [(4'hf):(1'h0)] wire28;
  input wire signed [(4'hb):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire30;
  reg [(4'hc):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  assign y = {wire95,
                 wire93,
                 wire30,
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
                 (1'h0)};
  assign wire30 = $unsigned($signed((~|(wire28 | $unsigned(wire28)))));
  module31 #() modinst94 (wire93, clk, wire26, wire29, wire30, wire28);
  assign wire95 = $signed($signed($unsigned(($signed(wire26) >= (wire93 ?
                      (8'h9d) : (8'hbb))))));
  always
    @(posedge clk) begin
      reg96 <= (wire93[(3'h6):(2'h2)] ?
          (~wire28) : {(~((8'hb2) != $signed(wire28)))});
      if (wire93[(3'h5):(1'h1)])
        begin
          reg97 <= {wire27};
          reg98 <= ((^~$signed(reg97[(3'h4):(1'h0)])) ?
              $unsigned(wire93) : {{(wire26[(4'h8):(2'h2)] > (|wire93))},
                  (wire27[(3'h7):(3'h7)] * $signed({wire26, wire30}))});
        end
      else
        begin
          reg97 <= wire30[(3'h7):(2'h2)];
          reg98 <= wire93[(2'h3):(2'h3)];
        end
      reg99 <= (~|(wire93[(1'h0):(1'h0)] ?
          $unsigned(wire27[(4'h9):(3'h4)]) : wire29[(3'h7):(2'h3)]));
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((wire26 ? $signed((reg98 << wire26)) : reg96))))
        begin
          reg100 <= (wire95[(3'h5):(3'h4)] ^~ (($signed((&reg99)) >> $unsigned(wire95[(4'hc):(4'hc)])) ?
              (-reg97) : reg96[(4'hf):(4'ha)]));
        end
      else
        begin
          reg100 <= (^wire27[(3'h4):(2'h2)]);
          if (($unsigned($signed((~^(^~reg96)))) != (+($signed({wire28,
              reg99}) ^ $unsigned({wire27})))))
            begin
              reg101 <= wire30;
              reg102 <= $unsigned(((~wire26) != wire30));
              reg103 <= (&$unsigned(($unsigned(reg100) ^ ({wire26} & (&(8'ha3))))));
            end
          else
            begin
              reg101 <= $unsigned($signed(($signed((~^(8'hac))) ?
                  (reg100 ?
                      {wire28} : wire26[(5'h11):(2'h3)]) : reg98[(1'h0):(1'h0)])));
              reg102 <= ((reg96[(2'h3):(1'h1)] == (wire28[(4'hf):(4'hf)] <<< ($signed(wire30) != reg97))) + $unsigned($unsigned((7'h41))));
              reg103 <= wire28[(4'hb):(1'h1)];
            end
          if (($signed(({reg103} * ($signed(reg96) ?
              (7'h42) : (reg101 >= wire26)))) ^ $unsigned(reg97[(3'h5):(1'h1)])))
            begin
              reg104 <= reg100;
            end
          else
            begin
              reg104 <= $signed(wire95[(4'h9):(1'h1)]);
              reg105 <= ({$signed($unsigned($unsigned(reg97)))} <<< (+{{reg97[(3'h4):(2'h2)]},
                  wire28}));
              reg106 <= (^(wire28[(1'h0):(1'h0)] >= ($signed($unsigned((8'hac))) ?
                  ((reg97 ^ wire27) == (wire95 ?
                      reg103 : wire27)) : (~|(~&reg98)))));
              reg107 <= (wire30[(3'h5):(2'h2)] ?
                  $signed((reg106[(3'h6):(3'h5)] ^ (+$signed(wire26)))) : {({reg97[(4'h9):(3'h6)],
                              $signed((8'ha9))} ?
                          ((reg99 ~^ wire93) ?
                              ((8'had) && reg102) : {reg101}) : ((|reg102) ?
                              $unsigned(reg104) : (wire93 ~^ wire93)))});
              reg108 <= reg102[(2'h2):(2'h2)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg109 <= wire93[(2'h3):(1'h1)];
      reg110 <= (+wire95[(4'hc):(2'h2)]);
      reg111 <= $signed(wire26[(3'h4):(1'h0)]);
      reg112 <= $unsigned(($signed(((~|reg107) ~^ $signed(wire93))) || reg107));
    end
endmodule

module module31
#(parameter param91 = ((({((8'ha7) ? (8'hac) : (8'hb1)), ((8'hb7) + (8'ha5))} ? (-((8'hbe) - (7'h40))) : (((8'hbb) ? (8'hb7) : (8'hb4)) ^ {(8'ha5), (8'haf)})) ? {({(8'hb7), (8'ha2)} ? (&(8'hb3)) : {(8'hbc), (7'h41)})} : {(((8'h9f) || (8'h9d)) >>> (^~(8'hb0)))}) ? (-((&(8'hae)) == ((~|(8'hb3)) ? ((8'had) ? (8'hbc) : (8'hb7)) : (~(8'haf))))) : (^~({(&(7'h40))} ^ (((7'h44) ? (8'hbe) : (8'ha6)) ? ((8'hba) ? (8'hb2) : (8'ha6)) : ((8'haa) ? (8'hb8) : (7'h42)))))), 
parameter param92 = (^~(^(~((~|param91) == param91)))))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h258):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire35;
  input wire signed [(3'h7):(1'h0)] wire34;
  input wire [(4'ha):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire42,
                 wire41,
                 wire38,
                 wire37,
                 wire36,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
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
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire36 = (^~wire34);
  assign wire37 = (!(wire35 ~^ wire32));
  assign wire38 = wire35;
  always
    @(posedge clk) begin
      reg39 <= (~^({{(wire33 > wire36)},
          $signed($signed(wire32))} >> (~^(wire36 ?
          (wire36 << wire32) : ((8'h9d) ? (8'ha2) : wire38)))));
      reg40 <= ((^~wire32) ? $signed(wire37) : wire38[(2'h3):(2'h2)]);
    end
  assign wire41 = wire38;
  assign wire42 = wire38;
  always
    @(posedge clk) begin
      reg43 <= wire41;
      reg44 <= (((&reg43) + wire36) ?
          ({(~&(~&(8'haa)))} + (((wire42 ?
              wire37 : wire42) <= ((8'haa) - wire33)) <= $signed((wire41 ^~ reg39)))) : $unsigned((wire41[(1'h0):(1'h0)] != $signed(((8'hb7) ?
              reg40 : reg39)))));
      reg45 <= (reg39 ?
          $unsigned({(-$signed(wire33)), (&$signed(wire32))}) : {wire38,
              $signed(reg39[(5'h10):(4'hf)])});
      if ($unsigned({((|wire41) ? $unsigned((8'hbe)) : (|reg43)),
          $signed(reg44[(2'h3):(1'h1)])}))
        begin
          if (wire41)
            begin
              reg46 <= wire37;
              reg47 <= $unsigned(((((reg39 ? wire38 : wire41) ?
                      (wire36 ? wire42 : wire42) : reg43) ?
                  $unsigned((^~wire38)) : $signed((wire42 ?
                      wire42 : wire34))) + ({wire32} ^ (+(wire33 ^~ (8'hb7))))));
              reg48 <= ({(&reg47[(4'h9):(2'h3)]), reg45} ?
                  reg43 : (~reg39[(5'h13):(3'h6)]));
              reg49 <= $unsigned((!{{(&(8'ha1)), (~&wire42)},
                  (reg43[(3'h5):(3'h5)] ?
                      (reg43 > (8'ha6)) : reg45[(3'h4):(1'h0)])}));
            end
          else
            begin
              reg46 <= wire36[(3'h6):(3'h4)];
              reg47 <= wire41[(1'h1):(1'h0)];
              reg48 <= reg40[(1'h0):(1'h0)];
              reg49 <= $unsigned((-$signed(reg39[(2'h3):(1'h1)])));
            end
          if ((({{$signed(wire38)}, $unsigned($signed(wire41))} ?
                  $unsigned($unsigned(wire35)) : wire33[(2'h3):(1'h0)]) ?
              (~|$unsigned((^(-reg44)))) : wire41[(1'h1):(1'h1)]))
            begin
              reg50 <= wire41;
            end
          else
            begin
              reg50 <= (wire42 ?
                  ((~^(&wire42)) >> wire35[(2'h3):(1'h0)]) : reg40[(4'hb):(4'h8)]);
            end
          reg51 <= wire37[(4'hc):(3'h6)];
          reg52 <= reg47[(4'he):(2'h2)];
          reg53 <= reg39;
        end
      else
        begin
          if ((&((~|((-reg44) <= (reg52 < wire37))) ?
              (reg47 ? (-reg47) : reg53) : $signed((~&(^wire42))))))
            begin
              reg46 <= (((~|reg53[(3'h7):(2'h2)]) >> (~&{(wire36 ?
                      wire36 : reg48),
                  (+wire35)})) < {$unsigned(($signed(reg40) ?
                      (reg47 ? wire38 : reg52) : $unsigned(wire42))),
                  ((^(reg47 & wire42)) << reg48[(4'ha):(2'h3)])});
              reg47 <= $signed(reg50[(1'h0):(1'h0)]);
              reg48 <= $unsigned(((~^((-(8'hbb)) ?
                  (~wire35) : {wire33,
                      wire35})) && $unsigned((&(reg49 ^~ (8'hb6))))));
              reg49 <= (!$unsigned((^{wire42[(4'h8):(2'h3)], reg49})));
            end
          else
            begin
              reg46 <= (({$unsigned($unsigned((7'h42)))} ?
                  reg39[(5'h12):(5'h11)] : (reg50 ?
                      ((8'ha1) ?
                          $unsigned(reg40) : reg52) : $signed({wire42}))) >> wire42);
              reg47 <= {reg48[(2'h2):(2'h2)],
                  ({reg53[(3'h6):(1'h0)],
                      (&(reg53 ? reg49 : wire38))} || (reg46[(1'h1):(1'h0)] ?
                      {(~|reg47)} : $unsigned($unsigned(reg51))))};
              reg48 <= (reg44[(2'h3):(1'h0)] ?
                  (reg50 ^~ (wire42[(4'hd):(4'hc)] ?
                      ((~wire35) ? reg46 : (wire36 ? reg45 : reg44)) : {reg44,
                          reg43[(3'h6):(1'h0)]})) : {$unsigned(reg53[(3'h4):(1'h0)])});
              reg49 <= ((($signed(reg43[(4'h8):(2'h3)]) ?
                      $signed((wire34 ? wire33 : reg49)) : reg50) ?
                  (8'haa) : ($unsigned($signed((8'hbc))) ?
                      $unsigned(reg53[(3'h5):(2'h3)]) : $unsigned((~&wire35)))) >> $unsigned($unsigned(wire37[(4'hc):(3'h7)])));
            end
          if ((reg47 ? $signed(wire37[(4'h9):(3'h4)]) : reg52[(5'h11):(4'h8)]))
            begin
              reg50 <= (+reg44);
              reg51 <= (8'hba);
              reg52 <= reg44[(2'h2):(1'h1)];
              reg53 <= ({reg48[(2'h3):(2'h2)], reg46[(1'h1):(1'h0)]} ?
                  (7'h42) : wire34);
              reg54 <= ({(reg46[(2'h2):(2'h2)] ?
                          wire35[(1'h1):(1'h1)] : ((reg47 ? wire41 : reg48) ?
                              $unsigned((8'ha7)) : (wire33 ?
                                  reg45 : wire36)))} ?
                  (+$signed((|{wire41}))) : $signed($signed(wire33[(3'h6):(3'h4)])));
            end
          else
            begin
              reg50 <= $unsigned({wire42[(4'hd):(3'h4)]});
              reg51 <= {((^wire32[(1'h0):(1'h0)]) | reg51[(1'h0):(1'h0)]),
                  (+wire36[(3'h4):(3'h4)])};
              reg52 <= $unsigned(wire34);
              reg53 <= $signed(wire41[(1'h1):(1'h0)]);
            end
          if ((!((~$signed((-(8'had)))) ? (|wire36[(4'hb):(2'h3)]) : wire32)))
            begin
              reg55 <= $unsigned((~^$signed(wire37[(2'h2):(1'h0)])));
              reg56 <= {({reg47, $unsigned(reg46)} + $signed(reg51))};
              reg57 <= (reg40 ?
                  {$signed((wire35 <= $signed(reg44))),
                      $unsigned(reg54[(3'h6):(2'h3)])} : (|reg50));
              reg58 <= (((-(8'hae)) ?
                  reg56[(4'he):(2'h2)] : $signed(wire34)) && ($signed($signed($unsigned(reg45))) ^ $signed((~|$signed(reg44)))));
              reg59 <= ((({(reg46 ? wire32 : reg51),
                          (wire38 ? wire36 : reg55)} ?
                      $signed(reg39[(3'h6):(3'h5)]) : wire32) ^ reg40) ?
                  $signed(wire41[(2'h2):(1'h0)]) : ($unsigned((|reg54[(1'h0):(1'h0)])) ?
                      $signed((!(|reg49))) : wire42));
            end
          else
            begin
              reg55 <= $unsigned((8'hbb));
              reg56 <= $unsigned(reg47);
              reg57 <= ((7'h44) ?
                  (+(reg44 <= reg39)) : ($signed((!(~|reg53))) >>> ((^~wire34) - $signed((reg39 ?
                      reg46 : reg59)))));
              reg58 <= ((wire34[(2'h2):(2'h2)] > reg47) << (!(|({wire36,
                      wire38} ?
                  (reg47 != reg49) : reg40[(4'h9):(3'h6)]))));
            end
          reg60 <= $unsigned($unsigned($signed(reg44)));
        end
      reg61 <= $unsigned($signed(wire34));
    end
  assign wire62 = wire32;
  assign wire63 = reg49[(3'h6):(2'h3)];
  assign wire64 = (~^reg61);
  assign wire65 = (reg53[(4'hb):(3'h7)] ?
                      $signed((($unsigned((8'ha1)) << (-wire38)) ?
                          $unsigned((reg58 ?
                              reg57 : wire64)) : wire32[(1'h0):(1'h0)])) : wire37);
  assign wire66 = {wire38[(3'h6):(2'h2)], {$signed(wire37[(4'ha):(4'h8)])}};
  assign wire67 = (reg49[(1'h0):(1'h0)] << (^~reg43));
  always
    @(posedge clk) begin
      reg68 <= ($signed($unsigned(reg39)) >= (+$unsigned(wire36[(1'h0):(1'h0)])));
      reg69 <= wire37[(1'h0):(1'h0)];
      reg70 <= wire66[(5'h10):(4'h9)];
      reg71 <= $signed(wire38[(3'h5):(3'h4)]);
      reg72 <= reg50;
    end
  always
    @(posedge clk) begin
      reg73 <= reg44;
      if ($signed(wire32))
        begin
          reg74 <= wire66[(2'h3):(2'h3)];
        end
      else
        begin
          if ($signed($unsigned($unsigned($signed(wire64[(2'h3):(2'h3)])))))
            begin
              reg74 <= (reg51 >>> (~$signed($unsigned((8'hb1)))));
              reg75 <= $unsigned({(reg61[(4'h8):(3'h7)] ~^ $signed({wire35})),
                  (((&wire42) ? $signed(reg46) : {reg71}) ?
                      $signed(((8'had) == reg51)) : $unsigned(wire67))});
              reg76 <= (reg75 == reg43);
              reg77 <= reg51[(1'h0):(1'h0)];
              reg78 <= wire36;
            end
          else
            begin
              reg74 <= (-($unsigned({(wire67 >= reg52)}) ?
                  ($unsigned((wire38 >>> reg68)) ?
                      $signed(reg70) : ((wire62 ^~ (8'ha0)) ?
                          (7'h40) : reg44)) : (!($unsigned(reg59) & wire65[(1'h0):(1'h0)]))));
              reg75 <= $unsigned((~|reg69[(1'h0):(1'h0)]));
              reg76 <= $unsigned({wire41});
              reg77 <= wire66[(3'h7):(2'h2)];
            end
          reg79 <= {(((-(reg54 ? (8'ha3) : reg49)) ?
                      (~&(reg40 << reg61)) : (!(~|reg71))) ?
                  $signed({reg58}) : reg53[(4'hb):(4'h8)]),
              wire63};
          if (((~&$unsigned($signed((reg49 ?
              wire65 : reg61)))) << $unsigned($signed(({reg50, reg44} ?
              $signed(wire41) : reg79)))))
            begin
              reg80 <= (-(wire64[(4'ha):(1'h0)] - (({(8'ha6),
                      reg75} != reg46[(1'h0):(1'h0)]) ?
                  reg46 : ($signed(reg58) >>> reg52))));
              reg81 <= $unsigned({$unsigned((~^(wire34 > reg80))),
                  reg75[(3'h4):(1'h1)]});
            end
          else
            begin
              reg80 <= reg70[(2'h2):(1'h0)];
              reg81 <= reg55;
              reg82 <= $unsigned(reg40);
            end
          if ({$unsigned(reg53), (~$signed(reg80))})
            begin
              reg83 <= reg71;
              reg84 <= $signed($signed({{(8'hba), (wire65 && (8'ha4))}}));
            end
          else
            begin
              reg83 <= $unsigned(((!(wire33 >>> $signed(reg53))) ?
                  reg40 : reg51[(2'h2):(2'h2)]));
              reg84 <= (~&$signed(reg46));
              reg85 <= (|wire62);
              reg86 <= $signed((reg51 ?
                  reg77 : $signed($signed(wire66[(4'hc):(3'h6)]))));
            end
        end
      reg87 <= ($signed(wire42) ?
          (~$signed((reg44[(2'h2):(2'h2)] == $signed(reg47)))) : ((~^$unsigned(reg48[(1'h0):(1'h0)])) | {($signed(reg45) ?
                  reg86[(4'hb):(1'h0)] : reg49)}));
    end
  assign wire88 = {{($unsigned($unsigned(wire41)) >>> {$unsigned(reg71)})},
                      $unsigned((^~$unsigned($signed(reg85))))};
  assign wire89 = reg59;
  assign wire90 = {{$signed(reg52[(5'h13):(3'h5)])}, reg52[(3'h7):(2'h2)]};
endmodule
