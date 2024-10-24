module top
#(parameter param113 = ((({((7'h40) < (8'hba))} ? (~(|(8'ha8))) : (((8'haa) ? (7'h42) : (8'ha4)) ? ((8'hbd) ? (8'ha9) : (8'ha4)) : ((7'h40) | (8'hb8)))) || {(8'hb0)}) <= {(((~(7'h43)) << (~&(7'h43))) ^~ {(!(8'h9e)), ((8'ha3) ? (8'hbe) : (8'hb1))})}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire108,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire5,
                 reg112,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire5 = wire4[(4'ha):(1'h0)];
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg6 <= $unsigned(((wire5[(3'h6):(2'h3)] <<< wire3) ?
              $signed((-$signed(wire2))) : (8'hbe)));
          reg7 <= ($unsigned((reg6 == $unsigned((wire1 ?
              wire4 : wire4)))) ~^ reg6);
        end
      else
        begin
          reg6 <= wire2;
          reg7 <= (|($signed({$unsigned(wire4), (wire2 ? reg7 : wire4)}) ?
              $unsigned($unsigned($unsigned(wire4))) : $signed(wire0[(3'h7):(3'h7)])));
          reg8 <= wire0;
          reg9 <= $unsigned((wire2[(2'h3):(2'h2)] ?
              wire2 : ((wire4[(1'h0):(1'h0)] ?
                  $signed(wire4) : ((8'ha8) * wire3)) >= (&$unsigned(reg8)))));
        end
      reg10 <= (wire0 != ((~$unsigned(reg6[(3'h4):(1'h0)])) ~^ (($unsigned(wire0) ?
              (+wire3) : wire4) ?
          wire0 : (reg7 > (reg6 ? (8'ha0) : wire2)))));
      reg11 <= (7'h40);
      if ($unsigned((reg9[(1'h0):(1'h0)] != $unsigned(({reg9,
          reg7} ~^ $unsigned(wire2))))))
        begin
          reg12 <= reg8;
        end
      else
        begin
          reg12 <= ($unsigned(wire0) ?
              (^~(wire5[(4'hd):(2'h3)] ?
                  {(reg9 ? (8'haf) : reg7),
                      (reg7 == wire0)} : reg9[(1'h1):(1'h1)])) : $signed((!$signed($signed(reg10)))));
          reg13 <= reg11;
          reg14 <= $unsigned({wire2, $unsigned((reg13 & (8'ha1)))});
          reg15 <= $unsigned(reg7);
          reg16 <= wire3[(1'h0):(1'h0)];
        end
      reg17 <= wire0[(4'h9):(2'h3)];
    end
  assign wire18 = {{reg14}, $signed(reg10[(4'ha):(3'h5)])};
  assign wire19 = ((8'hb5) + {reg11,
                      ((((7'h43) ^~ wire2) && reg10[(5'h13):(3'h6)]) ?
                          (~|{reg11}) : $unsigned($signed((8'hba))))});
  assign wire20 = ((-((~|{wire2, reg13}) ?
                      reg6 : $signed((reg11 ? reg15 : (7'h42))))) && wire3);
  assign wire21 = (reg11[(4'h8):(3'h5)] ?
                      (^~$signed(((~wire4) ^~ $unsigned(reg10)))) : (~(-$signed((reg14 >= reg15)))));
  assign wire22 = wire1[(2'h3):(1'h1)];
  assign wire23 = wire4;
  assign wire24 = (reg10 ? reg6 : (8'hb2));
  assign wire25 = reg12;
  module26 #() modinst109 (.clk(clk), .wire31(reg12), .wire29(reg9), .wire28(wire0), .y(wire108), .wire27(reg7), .wire30(wire21));
  assign wire110 = $signed(reg10[(3'h7):(2'h3)]);
  assign wire111 = (8'ha0);
  always
    @(posedge clk) begin
      reg112 <= reg16[(3'h7):(2'h3)];
    end
endmodule

module module26
#(parameter param107 = (+(|({((8'hbb) <= (8'had))} && (~(-(8'ha2)))))))
(y, clk, wire27, wire28, wire29, wire30, wire31);
  output wire [(32'h28b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire signed [(5'h15):(1'h0)] wire28;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire signed [(4'hc):(1'h0)] wire30;
  input wire signed [(4'he):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire46;
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire32,
                 wire33,
                 wire46,
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
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire32 = $signed((8'hba));
  assign wire33 = (&(wire29 ? $unsigned($signed(wire32)) : wire30));
  module34 #() modinst47 (wire46, clk, wire30, wire31, wire29, wire32, wire27);
  assign wire48 = (~$unsigned((^~wire28)));
  assign wire49 = $unsigned((!$signed({$signed(wire32)})));
  assign wire50 = $signed({((-wire33[(4'h8):(2'h2)]) ?
                          $unsigned((!wire31)) : (8'h9e)),
                      (wire31[(3'h6):(2'h3)] >>> wire49[(3'h7):(1'h0)])});
  assign wire51 = (wire30 || ((wire31[(4'hb):(2'h2)] ?
                      wire32 : ((~^wire29) ?
                          {wire27} : wire30[(3'h5):(3'h4)])) <<< ((wire48 ?
                          (wire48 ? wire33 : wire50) : wire28) ?
                      wire29 : (wire50[(2'h3):(2'h3)] ?
                          $signed(wire50) : wire48[(3'h4):(1'h0)]))));
  always
    @(posedge clk) begin
      reg52 <= wire33;
      if ($unsigned(((^wire48[(3'h6):(1'h1)]) || (!$signed($signed(wire30))))))
        begin
          reg53 <= wire49;
        end
      else
        begin
          if ($unsigned($signed((((wire46 ? wire30 : wire46) <= (wire28 ?
              (7'h43) : wire46)) <<< (-(&wire50))))))
            begin
              reg53 <= ($unsigned(($unsigned(wire48) << ($unsigned(wire50) ^~ (wire29 & (8'hb7))))) ?
                  wire28[(4'h9):(3'h5)] : $unsigned((((wire32 >> wire28) > (8'hb3)) ?
                      (~^(wire51 >> (8'hac))) : (wire28 ?
                          $unsigned((8'h9d)) : wire49[(4'ha):(2'h3)]))));
              reg54 <= (!(!$signed((8'hbb))));
              reg55 <= (((reg54 * $unsigned($signed(wire27))) > ({(wire48 >= reg53),
                      (wire27 <<< wire29)} ?
                  (^~(|(8'hbb))) : {(reg52 ?
                          wire48 : reg52)})) >= ($unsigned({{wire33},
                      (reg54 ? wire51 : reg52)}) ?
                  (&wire33) : (reg53 >> ($unsigned(wire48) ?
                      $unsigned(wire31) : (wire51 ? wire51 : reg52)))));
            end
          else
            begin
              reg53 <= $signed($unsigned((wire51 ?
                  {(~reg55)} : {(wire30 ? (8'hb5) : reg53), {wire27}})));
              reg54 <= ($unsigned($signed(wire50[(2'h2):(2'h2)])) ?
                  wire27 : ((((7'h44) ? $unsigned((8'had)) : (~^wire49)) ?
                      (-(wire46 - wire32)) : $signed((~|wire29))) - (((8'hac) ?
                          $unsigned(wire31) : $signed(reg52)) ?
                      ($unsigned(wire29) || (~^reg55)) : {(wire33 != wire27),
                          $unsigned(wire32)})));
              reg55 <= (8'ha4);
            end
          reg56 <= (~&(({(wire27 | reg55), $signed(wire32)} ?
                  (wire28[(3'h6):(3'h6)] ?
                      (~^wire51) : wire27) : $signed($signed(wire31))) ?
              wire28 : {(-(wire28 << wire51))}));
          reg57 <= (reg54[(4'hc):(3'h6)] ?
              {$unsigned($unsigned((wire29 ?
                      reg53 : (8'haf))))} : ((&(^~(reg53 ?
                      (8'h9e) : (8'hac)))) ?
                  (reg53[(3'h7):(3'h7)] < reg52) : (($signed(wire29) ?
                      wire46 : {wire30}) >>> wire29[(4'ha):(3'h4)])));
        end
      reg58 <= ((^~(((wire29 && wire51) ? (reg53 && reg56) : wire30) ?
          ((-(8'hb5)) - (~|wire48)) : ((reg57 <= reg53) & reg53[(3'h5):(3'h5)]))) && {wire27[(3'h4):(1'h1)],
          {wire32}});
      reg59 <= wire31;
    end
  always
    @(posedge clk) begin
      reg60 <= (($unsigned($signed($unsigned(wire28))) + (wire30[(1'h0):(1'h0)] ?
          $unsigned({reg53}) : reg52[(4'hc):(3'h6)])) >= $unsigned((~reg52[(2'h3):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg61 <= (($unsigned(((wire51 * wire28) ?
              $signed(reg56) : $signed(wire33))) != reg55[(3'h7):(3'h7)]) ?
          $unsigned((($signed((8'hb3)) ? $signed(wire32) : (~&reg56)) ?
              ((wire31 ?
                  wire29 : reg60) ^~ wire30[(2'h3):(2'h2)]) : wire27[(3'h5):(2'h2)])) : reg59[(2'h2):(1'h1)]);
      if (({$signed((^(wire27 ^ reg55))), wire33[(4'h8):(2'h2)]} ?
          $unsigned(reg55) : wire28[(3'h7):(3'h5)]))
        begin
          reg62 <= ((((reg59[(4'h9):(3'h5)] || wire50) << ($signed(wire32) && reg55)) ?
              $unsigned((wire46 + (reg59 ?
                  reg52 : reg57))) : $unsigned(((reg54 + wire28) ?
                  wire32 : (~wire28)))) && wire28);
        end
      else
        begin
          reg62 <= wire29;
          if ($unsigned(wire29[(4'ha):(4'ha)]))
            begin
              reg63 <= reg59[(4'ha):(3'h5)];
              reg64 <= wire28;
              reg65 <= ($signed(wire48[(3'h6):(3'h4)]) <= (~|{(reg58[(3'h5):(3'h4)] ?
                      wire29[(4'h9):(3'h4)] : (~&reg53))}));
              reg66 <= ({((~|reg62[(2'h3):(2'h3)]) ?
                      $unsigned((reg53 <<< reg54)) : $unsigned(reg53[(4'h9):(3'h5)]))} < {reg60[(3'h7):(3'h4)],
                  $unsigned(((-reg63) != (&reg55)))});
              reg67 <= (~^(~^(~&reg61[(4'hd):(1'h0)])));
            end
          else
            begin
              reg63 <= ((~(wire48[(4'h8):(4'h8)] >>> $unsigned((~&wire49)))) | (!reg67[(4'ha):(1'h0)]));
              reg64 <= $unsigned(reg62[(2'h2):(1'h1)]);
              reg65 <= (wire33 ? $unsigned(reg52) : wire33);
              reg66 <= ($unsigned($signed($signed({(8'ha2)}))) + (^(reg67 ?
                  reg58[(1'h0):(1'h0)] : wire29)));
              reg67 <= (|$signed((wire31[(4'h8):(3'h6)] * $unsigned($unsigned(reg64)))));
            end
        end
      if ({$unsigned(($signed((8'hab)) ? $signed((~^reg64)) : (8'ha2))),
          (wire50 ? reg57 : (!$unsigned({wire30})))})
        begin
          reg68 <= ($unsigned((wire29 ? (-(~&wire32)) : reg64[(2'h3):(2'h2)])) ?
              wire28[(3'h4):(2'h2)] : {({reg56[(2'h3):(2'h3)]} ?
                      ((wire50 ? wire48 : reg65) ?
                          wire27[(4'h8):(3'h4)] : (^wire33)) : wire30)});
          reg69 <= $unsigned($unsigned(({(reg64 ?
                  wire28 : reg53)} > {$unsigned(reg57)})));
          reg70 <= ($unsigned($unsigned({(~^reg52)})) && $signed(($unsigned(reg54[(3'h6):(1'h0)]) ~^ $signed(reg55))));
          reg71 <= (-wire29);
        end
      else
        begin
          reg68 <= (~reg61);
          reg69 <= ($signed((&wire31[(4'hd):(4'hb)])) ^~ ((-wire46) ?
              $signed(((+wire31) ?
                  $signed(wire27) : (^reg66))) : $signed($signed(reg57[(1'h0):(1'h0)]))));
          reg70 <= (($unsigned(reg54) ?
              $unsigned($signed((reg53 ?
                  reg71 : wire27))) : $unsigned(wire33[(4'h9):(2'h3)])) && (|wire29));
        end
      reg72 <= (wire48 + reg68[(1'h0):(1'h0)]);
      reg73 <= $signed(({$signed((wire33 != wire48))} ?
          (~^$signed(wire33)) : $signed((8'ha9))));
    end
  always
    @(posedge clk) begin
      reg74 <= (|(($unsigned($signed(wire27)) >>> (&(wire48 << reg68))) - reg71[(4'he):(4'hb)]));
      reg75 <= {(8'hb8),
          $signed($signed(($signed(reg70) ^ reg60[(3'h7):(3'h6)])))};
    end
  always
    @(posedge clk) begin
      if ($signed(reg73[(2'h3):(1'h0)]))
        begin
          reg76 <= ({reg59[(3'h7):(3'h6)]} ?
              ($signed(((|wire29) <= (&(8'hb7)))) ?
                  (wire31[(4'h8):(1'h1)] * (&reg73[(2'h2):(2'h2)])) : $signed(((reg54 ?
                          reg61 : wire49) ?
                      {reg67} : wire28[(2'h2):(1'h1)]))) : wire51);
          if (((({(wire28 || wire51)} ?
              wire32[(3'h5):(2'h2)] : ({wire48} ?
                  {(8'hb5)} : wire51[(4'hb):(3'h5)])) * (-(~|reg72))) != $signed(($unsigned($unsigned(reg71)) << {$signed(wire28),
              $unsigned(reg63)}))))
            begin
              reg77 <= (reg69[(1'h0):(1'h0)] - (~^wire30[(4'ha):(3'h4)]));
              reg78 <= ($signed($signed((8'hb9))) >>> $signed($signed(((reg61 ?
                  wire29 : reg67) + $unsigned(reg74)))));
              reg79 <= $unsigned((&reg78));
              reg80 <= $unsigned((~$signed($unsigned((reg74 ?
                  wire33 : reg55)))));
              reg81 <= (^~reg69);
            end
          else
            begin
              reg77 <= (($unsigned(((wire27 & reg74) ^~ (^wire49))) ?
                      {(~&$unsigned(reg53))} : reg77) ?
                  (^~reg62) : ($signed(($unsigned(reg68) << wire31)) ?
                      ((~^(wire48 ? (8'ha6) : reg68)) ?
                          ((&wire28) != $signed(wire51)) : wire32) : reg75[(2'h3):(2'h3)]));
              reg78 <= wire51;
            end
        end
      else
        begin
          reg76 <= (~^(reg63 ?
              wire30[(4'hc):(4'hb)] : $signed($signed({reg59, reg76}))));
          reg77 <= $unsigned(reg79);
          if (($signed(reg69[(2'h2):(2'h2)]) == $signed((~{(^~reg52)}))))
            begin
              reg78 <= $unsigned(reg54);
              reg79 <= wire48[(3'h5):(2'h2)];
              reg80 <= {reg66[(3'h7):(2'h3)],
                  (($unsigned($signed(wire31)) ^~ reg76) ?
                      wire46[(2'h2):(2'h2)] : (|wire32[(4'hd):(3'h4)]))};
              reg81 <= (($unsigned((-(8'had))) | $signed(((reg72 ?
                      reg79 : reg54) >> reg65))) ?
                  $unsigned((^reg58[(3'h6):(3'h4)])) : (reg70[(2'h2):(1'h0)] ?
                      ((!(reg53 >= reg60)) >> $unsigned(reg65)) : $unsigned(((~reg59) ?
                          wire49[(1'h0):(1'h0)] : (wire46 ? reg66 : reg69)))));
              reg82 <= (8'had);
            end
          else
            begin
              reg78 <= (+{reg74[(4'hf):(1'h1)], reg77[(4'h8):(4'h8)]});
              reg79 <= ((|($signed(wire50) > wire46)) <= (^{((8'h9e) ?
                      (~&reg60) : ((7'h40) ? reg79 : wire33)),
                  wire28[(4'hc):(4'h9)]}));
              reg80 <= (($unsigned($signed((|(8'hb3)))) << reg61) ~^ reg58[(1'h1):(1'h0)]);
              reg81 <= reg80;
            end
          if ((($unsigned($signed((wire46 ?
                  reg68 : (8'hbe)))) ^ $signed($signed((reg61 << wire30)))) ?
              $signed(((~reg77) << $signed({wire32,
                  (8'ha5)}))) : $signed($unsigned(wire48))))
            begin
              reg83 <= $signed($unsigned((reg77[(3'h6):(2'h2)] | $signed($unsigned(reg79)))));
              reg84 <= {($signed($signed((8'haf))) ?
                      ((reg70 ?
                          (reg52 > reg60) : wire32) != $signed(reg69)) : {{((8'hbf) << reg52),
                              $unsigned(reg63)}})};
              reg85 <= $unsigned((^~(reg54[(4'hb):(3'h5)] || (&reg82))));
              reg86 <= $signed(({((reg60 * reg72) ?
                      (reg62 ^ wire33) : (reg76 <<< reg83)),
                  (-((8'h9f) ^~ reg54))} < $unsigned(($signed(reg65) ?
                  {reg65, wire27} : (reg64 >= wire50)))));
            end
          else
            begin
              reg83 <= reg78;
              reg84 <= $signed($unsigned(reg77[(5'h13):(4'hf)]));
            end
        end
      reg87 <= ((reg69 + (wire32[(3'h6):(2'h3)] ?
          (~&reg57[(1'h0):(1'h0)]) : reg69)) && (wire33 ?
          ({(wire29 >> reg75), (+wire31)} || {(&wire48),
              {wire30, reg63}}) : {$unsigned($unsigned(reg53))}));
      reg88 <= (reg81 ^~ ((~|(^reg58[(2'h3):(2'h2)])) >= reg76[(5'h11):(4'hc)]));
      reg89 <= $unsigned($signed(($signed($unsigned(reg62)) ?
          ((reg76 ? reg58 : wire28) ?
              {reg69, (8'h9f)} : $unsigned(reg57)) : $signed($signed(reg59)))));
      if ($unsigned($unsigned(reg53[(1'h1):(1'h0)])))
        begin
          if (reg57[(1'h1):(1'h1)])
            begin
              reg90 <= ($signed(reg71) ? reg66 : {reg63});
              reg91 <= $signed(reg81);
              reg92 <= (!((reg52 ^~ $unsigned(reg67[(2'h2):(1'h0)])) ?
                  ((+(!wire29)) ?
                      (^~(|reg74)) : $unsigned(reg85[(3'h4):(1'h0)])) : (wire48[(2'h3):(1'h0)] ?
                      reg64 : $signed((^reg84)))));
              reg93 <= (+(reg67[(3'h7):(3'h5)] >= reg59[(2'h2):(1'h0)]));
            end
          else
            begin
              reg90 <= $signed(reg85);
            end
          if ($signed($unsigned(reg82[(1'h1):(1'h0)])))
            begin
              reg94 <= {(~^({((8'hac) ? reg88 : wire31)} ?
                      (|$signed(reg74)) : reg89))};
              reg95 <= wire49;
              reg96 <= ((wire27 || ((^~wire27) ~^ $signed((~reg85)))) & ($signed(((reg53 ?
                      reg76 : wire27) >> wire28[(3'h5):(2'h3)])) ?
                  $unsigned(($signed(reg71) > $unsigned(reg74))) : {wire51[(4'ha):(3'h4)]}));
              reg97 <= wire30[(2'h3):(2'h2)];
              reg98 <= reg71;
            end
          else
            begin
              reg94 <= $signed((~^((-$unsigned(wire27)) ^~ reg97[(4'hb):(3'h6)])));
              reg95 <= ((~|(reg57 >> (reg71[(4'hb):(1'h0)] ?
                  (reg92 >= wire27) : (reg94 ?
                      wire27 : reg63)))) >= (!({((8'h9c) <<< reg73)} ?
                  (wire32 - {wire28}) : reg54)));
              reg96 <= reg94[(3'h5):(2'h2)];
              reg97 <= (8'hb7);
              reg98 <= reg83[(4'hb):(1'h1)];
            end
          if ({wire32[(4'h9):(4'h9)],
              (($unsigned((~&reg73)) == reg85) >> $signed($signed($unsigned(reg67))))})
            begin
              reg99 <= $signed(wire48);
              reg100 <= $unsigned(reg91);
              reg101 <= $signed((({wire29[(3'h4):(3'h4)],
                      ((7'h41) ? reg78 : reg89)} ^ $unsigned((+(8'haa)))) ?
                  ({$signed(reg95), reg85} <<< $signed({reg91,
                      reg81})) : ((wire46 ?
                      (reg52 ? (8'hb9) : reg79) : (reg84 ?
                          reg72 : reg55)) >> ((reg65 ?
                      reg71 : reg90) * $signed(reg77)))));
              reg102 <= $unsigned(((($unsigned(reg82) == $signed(reg83)) - ((reg77 >= reg54) ?
                      $unsigned(wire29) : reg75[(1'h1):(1'h1)])) ?
                  reg69 : $signed(reg52)));
            end
          else
            begin
              reg99 <= (($signed(reg88[(2'h3):(2'h2)]) ^ $signed($signed($signed((8'hb7))))) ?
                  (-($unsigned($signed(reg55)) ?
                      $unsigned($unsigned((7'h40))) : ((reg68 || reg94) - {reg60,
                          reg69}))) : ($signed((&{reg68})) ?
                      ((!$signed(reg101)) ?
                          $unsigned((~|reg90)) : $unsigned(wire31[(4'h9):(2'h2)])) : reg58));
              reg100 <= $unsigned((7'h44));
              reg101 <= {(~|(({(7'h42), (8'ha5)} || (reg68 ?
                      reg93 : reg54)) + ({reg86} ?
                      (reg94 >= reg69) : $signed(reg53)))),
                  reg54};
              reg102 <= ((~^reg55) < $signed($signed(wire51[(1'h1):(1'h0)])));
            end
        end
      else
        begin
          reg90 <= ((((~{reg90}) ?
              $unsigned($signed((8'hb5))) : wire29[(3'h4):(2'h3)]) || (!$unsigned($signed((8'hac))))) & $unsigned(reg75[(2'h2):(1'h1)]));
          reg91 <= $unsigned((({(|reg69)} ?
              reg90 : {{reg87}}) <= {($unsigned((8'ha2)) ?
                  reg84[(4'hd):(3'h5)] : $signed(reg58))}));
        end
    end
  assign wire103 = reg85;
  assign wire104 = {$signed(wire51[(1'h1):(1'h0)])};
  assign wire105 = reg61[(3'h7):(1'h1)];
  assign wire106 = $signed(((8'h9c) != $signed(reg67)));
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire39;
  input wire signed [(4'he):(1'h0)] wire38;
  input wire [(4'hb):(1'h0)] wire37;
  input wire signed [(5'h10):(1'h0)] wire36;
  input wire signed [(5'h15):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  assign y = {wire45, wire44, wire43, wire42, wire41, wire40, (1'h0)};
  assign wire40 = $unsigned(($signed((wire39[(1'h0):(1'h0)] ?
                          ((7'h41) - wire35) : wire39)) ?
                      wire39[(1'h0):(1'h0)] : (($signed(wire35) ?
                          (wire39 >>> (8'ha5)) : ((8'h9c) ^ wire37)) >= $unsigned(wire35))));
  assign wire41 = $signed(wire38[(3'h4):(2'h2)]);
  assign wire42 = $signed((wire36[(3'h6):(1'h1)] ?
                      wire39[(1'h1):(1'h0)] : $unsigned(($signed(wire35) ?
                          (wire35 ~^ wire38) : $signed(wire40)))));
  assign wire43 = $unsigned(wire38[(4'hc):(2'h3)]);
  assign wire44 = (^~$unsigned((+((wire37 != wire40) ?
                      wire40 : (wire37 ? wire38 : wire41)))));
  assign wire45 = $unsigned($unsigned(((wire37 ?
                      (-wire43) : {wire43, wire39}) == $unsigned((!wire44)))));
endmodule
