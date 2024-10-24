module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  assign y = {wire105,
                 wire103,
                 wire23,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  assign wire5 = (^~wire3);
  assign wire6 = wire1;
  assign wire7 = (^~wire3);
  assign wire8 = $unsigned(((^$unsigned($signed(wire2))) < $signed(wire0)));
  assign wire9 = $unsigned(wire5);
  assign wire10 = $signed({$unsigned($signed((-wire0)))});
  assign wire11 = (^((7'h41) ? $unsigned(wire2[(2'h3):(2'h3)]) : (~|(8'ha6))));
  assign wire12 = ({$unsigned($unsigned((~wire5))), wire4} ?
                      (^~$unsigned($unsigned((^(8'ha0))))) : wire11[(1'h1):(1'h1)]);
  assign wire13 = $signed(($signed($signed($signed(wire4))) ?
                      $signed(wire5) : ((~^(wire7 ?
                          wire10 : wire3)) << {(&wire6)})));
  always
    @(posedge clk) begin
      reg14 <= {((&wire7[(1'h0):(1'h0)]) >= (wire9 ?
              (~&$signed((7'h43))) : wire6))};
      if ($unsigned($signed($signed((wire4[(3'h5):(2'h3)] ?
          reg14[(3'h5):(3'h5)] : reg14)))))
        begin
          if (($signed((wire9 <<< ((wire9 != wire13) ?
              wire13 : (wire5 & wire13)))) >>> wire7))
            begin
              reg15 <= (wire13 <<< wire0);
            end
          else
            begin
              reg15 <= {(($signed({wire9, (8'hb1)}) ?
                      $unsigned((+reg15)) : wire9[(1'h0):(1'h0)]) > ((wire3[(5'h11):(2'h2)] ?
                          wire13 : {wire0}) ?
                      (-wire10) : wire12[(3'h4):(2'h2)]))};
              reg16 <= ($signed(reg14) >= {{($unsigned(wire1) ?
                          (~|wire4) : $unsigned(wire2)),
                      $signed($unsigned(wire3))},
                  wire1});
              reg17 <= $unsigned($signed(((wire1[(5'h10):(3'h6)] ?
                  wire7 : $unsigned(wire1)) <<< (wire2[(3'h4):(1'h1)] >= ((8'ha2) * reg15)))));
              reg18 <= $signed((8'hb9));
              reg19 <= $unsigned((~^(8'h9c)));
            end
          reg20 <= (wire10[(4'he):(4'h9)] <<< (((+(^reg14)) ?
              (~|$unsigned(wire6)) : ({(8'hb8), wire3} != (wire6 ?
                  wire12 : (8'ha1)))) ^ (wire12 | ({reg16} ?
              {(8'hb9)} : (wire10 < wire10)))));
        end
      else
        begin
          reg15 <= ($signed(wire4) ?
              $signed((~wire7[(1'h0):(1'h0)])) : reg17[(5'h11):(4'hd)]);
          reg16 <= wire8;
        end
      reg21 <= $unsigned((^~reg20));
      reg22 <= wire0[(5'h14):(5'h11)];
    end
  assign wire23 = (&(reg15 ~^ (+(&(wire0 ^~ wire13)))));
  module24 #() modinst104 (wire103, clk, reg20, reg15, reg22, wire2, wire7);
  assign wire105 = (+$signed($unsigned($unsigned((wire12 ? wire23 : reg14)))));
endmodule

module module24
#(parameter param101 = ({((~^{(8'ha1), (8'hbc)}) ? ((~|(8'ha9)) ? {(8'h9f)} : ((8'h9d) <<< (8'haa))) : (8'ha9))} | ((^(((8'h9c) ? (7'h41) : (8'hac)) || ((8'ha6) ? (7'h43) : (8'ha6)))) ? (({(8'ha7), (8'ha4)} || (~^(8'hb7))) ? (^(^(8'hb7))) : (((8'hb2) ? (8'hbc) : (7'h43)) ? ((8'ha9) ? (8'haa) : (8'hac)) : {(7'h43), (8'haf)})) : (8'haf))), 
parameter param102 = ((~^(8'ha7)) ? ((((param101 & param101) ? param101 : (param101 + param101)) >>> ((param101 ? (7'h40) : param101) ? ((8'ha7) + param101) : ((8'hb5) + param101))) ? (&(~&param101)) : (param101 ? (~|param101) : ((param101 > param101) ? (param101 << param101) : ((8'hbc) <<< param101)))) : ({param101} >= (((param101 ? param101 : param101) ? param101 : (param101 ? param101 : param101)) ~^ ({param101} == (&param101))))))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h275):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire29;
  input wire signed [(4'h9):(1'h0)] wire28;
  input wire signed [(5'h10):(1'h0)] wire27;
  input wire [(4'ha):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire30;
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire70,
                 wire69,
                 wire67,
                 wire42,
                 wire41,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
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
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 (1'h0)};
  assign wire30 = ((^~$signed($unsigned((wire28 ?
                      wire26 : (8'h9e))))) ~^ wire25[(3'h6):(2'h3)]);
  assign wire31 = $unsigned(wire26[(2'h2):(2'h2)]);
  assign wire32 = $unsigned({($unsigned(wire27) - $unsigned({wire25})),
                      (wire28 * $unsigned(wire30[(1'h1):(1'h0)]))});
  assign wire33 = {((wire26 ?
                          $signed(((8'ha4) * wire28)) : $unsigned((wire29 ?
                              wire31 : wire27))) ^~ (-$signed($unsigned(wire25))))};
  assign wire34 = ($signed(wire31[(2'h2):(1'h1)]) >> wire26);
  assign wire35 = wire33;
  assign wire36 = $unsigned($signed($unsigned((~$signed(wire33)))));
  always
    @(posedge clk) begin
      reg37 <= (8'h9f);
      reg38 <= $signed({{{wire31[(3'h6):(1'h1)], $unsigned(wire27)},
              (wire26 <= (~&(8'hbc)))},
          wire29});
      reg39 <= {$unsigned((wire28 ?
              $unsigned($unsigned(wire29)) : $signed(wire26))),
          (~&(($signed((8'hbd)) ? wire34[(4'hb):(3'h6)] : wire28) - wire27))};
      reg40 <= ((((-$unsigned(wire33)) == (wire28[(1'h1):(1'h1)] <<< (reg38 < wire36))) ?
              wire29[(2'h3):(1'h0)] : wire27) ?
          (((reg37 ?
                  ((8'hae) ?
                      wire28 : wire35) : wire26[(4'ha):(3'h7)]) + (((8'hb0) ^~ (8'hb9)) <<< (~&reg38))) ?
              $signed($signed(((7'h42) * wire35))) : $signed((~wire29))) : wire30);
    end
  assign wire41 = ((^~(($unsigned(reg37) != {reg39, wire30}) ?
                      wire31 : wire31[(3'h6):(3'h4)])) ^~ wire33);
  assign wire42 = (&{((^~(|wire28)) ? (|$signed(wire34)) : wire26)});
  always
    @(posedge clk) begin
      reg43 <= reg40;
      reg44 <= $signed(wire32[(5'h12):(4'he)]);
      reg45 <= wire34[(5'h13):(3'h7)];
      if (wire36)
        begin
          reg46 <= ({(wire35 ?
                      ($unsigned((8'ha6)) & (reg39 ?
                          wire31 : wire41)) : (~^wire27[(4'hc):(1'h1)]))} ?
              $unsigned($unsigned(reg40)) : {reg40[(3'h6):(3'h4)]});
          reg47 <= reg40[(1'h0):(1'h0)];
          reg48 <= ((-(^~($signed(wire34) ? (-reg37) : {reg39}))) << reg40);
          reg49 <= (wire34 != ((~|$unsigned($signed((8'had)))) ?
              reg38 : ({(reg47 ? wire33 : (8'hba))} != ((^(8'hbe)) ?
                  $signed(wire27) : $signed(wire36)))));
          reg50 <= (($unsigned(($signed(reg43) ?
                  (wire33 <= reg44) : {reg44})) + reg49) ?
              wire31 : reg39[(3'h5):(3'h5)]);
        end
      else
        begin
          reg46 <= $unsigned((~|$signed(wire35)));
          reg47 <= (wire27[(2'h2):(1'h1)] ?
              (7'h41) : ((reg47 ? (|(&wire31)) : (-(|reg50))) ?
                  $unsigned((~reg37[(3'h4):(2'h3)])) : $unsigned(reg39)));
        end
      reg51 <= (~^$signed((((~|(8'hb1)) >>> reg45) == {(-wire27), (~wire32)})));
    end
  module52 #() modinst68 (.wire56(wire32), .y(wire67), .wire53(reg44), .wire54(wire31), .wire57(wire36), .clk(clk), .wire55(wire25));
  assign wire69 = $unsigned($signed(reg39));
  assign wire70 = $unsigned(reg37);
  always
    @(posedge clk) begin
      reg71 <= (reg37 >>> ({(reg49 ? (wire28 <= (7'h44)) : (reg39 & wire41)),
              $unsigned(wire28[(3'h6):(1'h0)])} ?
          wire26[(1'h0):(1'h0)] : {$signed({wire26, reg46})}));
      if (((^~((~|{reg50}) ?
          $unsigned($unsigned(wire32)) : ((~|reg39) * wire27))) ^ ($signed((^~(wire35 ?
              wire36 : reg46))) ?
          reg50 : (|{reg38, (wire25 - wire30)}))))
        begin
          if (wire67[(4'hc):(3'h5)])
            begin
              reg72 <= $signed($unsigned((8'hbf)));
              reg73 <= wire67[(2'h2):(1'h1)];
            end
          else
            begin
              reg72 <= $signed((~|wire27[(4'hd):(4'h8)]));
              reg73 <= (+((((~|reg37) > $signed(wire34)) ^ {(7'h41)}) && ((~&(+wire27)) >> (wire42 ?
                  (wire67 ? reg73 : reg71) : $unsigned(reg44)))));
            end
          if ($unsigned(((|wire27[(3'h6):(1'h0)]) ?
              ((^wire32[(3'h7):(1'h0)]) < $signed(wire27[(4'h8):(2'h3)])) : $unsigned(($unsigned((8'ha8)) ?
                  (~&(8'hb2)) : reg51[(4'he):(4'h8)])))))
            begin
              reg74 <= (~|wire26);
              reg75 <= ((($unsigned((wire42 ?
                  wire36 : reg51)) <<< $unsigned(reg40[(1'h0):(1'h0)])) < (reg74 ?
                  wire31[(3'h4):(3'h4)] : reg50[(3'h7):(2'h2)])) + (reg47[(3'h7):(3'h4)] ?
                  ((!$unsigned(reg71)) >>> $signed($signed(wire32))) : reg51));
              reg76 <= {(~((wire69[(2'h2):(1'h0)] != wire69[(2'h3):(1'h0)]) ?
                      (-(wire28 ~^ reg44)) : {wire31, {reg44, reg71}})),
                  $unsigned($unsigned((((8'hba) ?
                      reg38 : (8'haa)) & $signed(reg40))))};
            end
          else
            begin
              reg74 <= {(reg43[(4'h9):(3'h6)] ?
                      (~&($unsigned((8'ha0)) > $unsigned(reg49))) : (~|$signed(wire25[(1'h0):(1'h0)]))),
                  ({(7'h43), (&wire34[(4'ha):(3'h7)])} == $signed(((~|(8'h9e)) ?
                      $unsigned((8'hbc)) : reg49)))};
              reg75 <= ({$signed((&{reg71})), reg75} ?
                  ($unsigned($unsigned({(8'hbb), wire32})) ?
                      $signed(((^~reg73) ?
                          (reg44 << (8'hbd)) : (wire32 + wire42))) : ((^((8'hab) + (8'hab))) != wire30)) : {(wire25[(4'h8):(3'h7)] ?
                          {reg73[(4'hd):(4'h9)],
                              (~|reg38)} : $signed((-reg51)))});
              reg76 <= $unsigned($signed(wire32));
              reg77 <= {wire41[(4'ha):(2'h2)],
                  $unsigned((-((reg38 ? reg71 : wire35) || wire26)))};
              reg78 <= $unsigned(($signed((!(wire26 ? wire42 : reg46))) ?
                  $unsigned(reg45) : (!wire70)));
            end
        end
      else
        begin
          if ($signed(($signed(reg51[(3'h4):(1'h1)]) ?
              (($signed(reg74) ?
                  $unsigned((8'hbb)) : {wire33}) | $unsigned($unsigned(wire27))) : (($unsigned(wire33) - {wire67}) ?
                  reg38[(4'he):(2'h2)] : wire32[(4'hb):(4'h9)]))))
            begin
              reg72 <= (((reg50 >> wire31[(3'h6):(3'h4)]) ^~ (-$signed($signed(reg73)))) * (7'h40));
              reg73 <= $signed(wire32[(4'hd):(3'h5)]);
              reg74 <= $unsigned(wire67[(4'hd):(3'h6)]);
            end
          else
            begin
              reg72 <= $signed(($signed((reg46 >> $unsigned((8'haa)))) ?
                  (reg72 >>> (&(8'ha7))) : wire29[(1'h0):(1'h0)]));
            end
        end
      reg79 <= $unsigned($unsigned($unsigned(($signed(wire27) && (!reg43)))));
      if (({wire26, (!(|(8'haf)))} ?
          $signed(reg49[(3'h7):(3'h7)]) : $unsigned((wire26 ?
              {{wire41, wire70}} : reg38))))
        begin
          if (($unsigned({(-(~^(8'hb7))),
                  ({reg75, reg51} * wire25[(1'h1):(1'h0)])}) ?
              reg40[(1'h0):(1'h0)] : $unsigned((wire69 ?
                  (^$unsigned(reg49)) : ((reg74 ~^ (8'ha1)) ^ (~|wire35))))))
            begin
              reg80 <= reg40;
              reg81 <= $unsigned(reg80[(2'h2):(2'h2)]);
              reg82 <= (-wire26);
            end
          else
            begin
              reg80 <= wire28;
              reg81 <= {reg71};
            end
          if (wire32)
            begin
              reg83 <= $unsigned((($unsigned($unsigned(reg44)) ?
                  wire30 : wire42) >= $signed($unsigned($signed(wire25)))));
              reg84 <= $unsigned(reg43[(4'h8):(3'h4)]);
              reg85 <= reg81;
              reg86 <= ({$unsigned((reg37 >> reg51)),
                      $signed({(|reg73), (reg81 ? reg51 : reg44)})} ?
                  wire70[(3'h6):(3'h4)] : (reg78 ?
                      $unsigned(((reg40 ? reg39 : wire70) - (reg80 ?
                          (8'h9e) : reg85))) : $signed((|wire35))));
              reg87 <= reg85[(2'h2):(2'h2)];
            end
          else
            begin
              reg83 <= (&$unsigned((|((reg76 ? reg72 : wire35) ~^ (wire29 ?
                  wire27 : wire27)))));
              reg84 <= $signed($signed(({$unsigned((8'hae)),
                  ((8'hb7) ? reg40 : reg82)} - ((wire36 ? (8'hb3) : wire41) ?
                  reg46[(4'ha):(3'h6)] : (wire27 != reg80)))));
            end
          if ($unsigned((&reg84[(4'hb):(1'h1)])))
            begin
              reg88 <= (($unsigned(reg82) || $unsigned((8'hb7))) ?
                  $signed(((8'hb9) << $unsigned(reg81))) : ((wire28 ?
                      reg51 : (reg39 ?
                          ((8'hba) | (7'h44)) : wire31[(2'h3):(1'h0)])) < wire29[(2'h3):(2'h3)]));
              reg89 <= (|$unsigned((($signed(reg72) ^ (-wire27)) ?
                  $signed({reg75}) : wire69)));
            end
          else
            begin
              reg88 <= ((&reg47[(1'h1):(1'h0)]) != wire26);
              reg89 <= ($unsigned(reg46) ?
                  reg38[(1'h1):(1'h1)] : $unsigned(($signed((reg79 > wire41)) ?
                      reg74[(3'h5):(3'h5)] : wire25)));
              reg90 <= (reg75 ^ reg44);
            end
          reg91 <= (-reg51[(4'ha):(3'h7)]);
          if ($unsigned({reg87, $signed((reg72 ? $signed(reg84) : (~reg90)))}))
            begin
              reg92 <= reg71;
              reg93 <= ($unsigned((((reg48 | reg89) ?
                      reg73 : (wire34 > wire31)) <= (reg88[(4'h8):(2'h3)] ?
                      reg44[(3'h4):(3'h4)] : (~wire33)))) ?
                  $unsigned($signed((~|wire26))) : (((((8'haf) & reg87) >> $signed(wire32)) >> $signed((reg85 >> reg78))) ?
                      wire28[(3'h5):(3'h4)] : reg86[(3'h5):(1'h1)]));
              reg94 <= wire30[(1'h1):(1'h1)];
              reg95 <= (wire28[(2'h2):(2'h2)] >>> $signed((reg44 ?
                  (&$unsigned((8'ha4))) : ($unsigned(reg74) ?
                      $unsigned(reg51) : (reg92 ? reg78 : reg91)))));
              reg96 <= (wire25 * (reg40[(3'h6):(3'h6)] >> (reg83[(3'h5):(1'h1)] ?
                  $signed({(8'hb0), reg45}) : (reg79[(4'h8):(3'h6)] ?
                      (~(8'hb6)) : {reg46}))));
            end
          else
            begin
              reg92 <= ((+$signed(wire69[(3'h4):(2'h3)])) ?
                  $unsigned(($unsigned((~&reg90)) ?
                      $unsigned((reg92 ^ reg95)) : {$unsigned((7'h41)),
                          (reg82 <<< reg83)})) : ($unsigned(((reg80 ?
                      (8'hb1) : wire34) ^ (^~wire29))) * {$unsigned((|(8'hab))),
                      reg50[(1'h0):(1'h0)]}));
              reg93 <= ((($signed($unsigned(reg85)) ?
                      {(reg77 == (8'hb6)), $signed(reg81)} : {(!wire70)}) ?
                  (wire25 ?
                      (wire42[(1'h0):(1'h0)] <= $unsigned(wire28)) : (((8'haa) ^ wire34) << (reg92 ^~ reg81))) : ((reg96[(1'h0):(1'h0)] && $signed(reg43)) & (reg96 - (wire33 ?
                      reg74 : reg84)))) || $unsigned($unsigned((reg73[(3'h4):(3'h4)] && reg86))));
              reg94 <= (|(~^((~|(reg75 - wire41)) ?
                  $unsigned((wire32 > wire36)) : $signed((wire67 ?
                      reg76 : wire33)))));
              reg95 <= $unsigned(reg83[(5'h10):(5'h10)]);
              reg96 <= {{$signed((reg72 && (wire36 != reg89)))},
                  ({reg38} == ((8'hb3) * $unsigned((^reg77))))};
            end
        end
      else
        begin
          reg80 <= (reg75 ~^ wire70[(2'h2):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      reg97 <= {reg38, $unsigned($unsigned(((^~reg48) >> (reg73 ~^ (7'h42)))))};
    end
  assign wire98 = wire30;
  assign wire99 = reg89[(1'h1):(1'h1)];
  assign wire100 = $unsigned((~|({(reg85 ~^ reg49), $signed(reg84)} ?
                       ($signed(reg86) ?
                           (reg94 ? wire26 : (8'ha0)) : reg72) : wire29)));
endmodule

module module52
#(parameter param65 = (((({(8'h9c)} ? ((7'h41) || (8'ha3)) : (|(7'h43))) != {((8'haa) ? (7'h43) : (8'h9e))}) ^~ (({(8'h9d)} & (~|(8'ha9))) ^ ({(8'hb3), (8'hb0)} ? {(8'hb3), (8'hbe)} : {(8'hba), (8'hb7)}))) < ((~^(^~{(8'hb3), (8'ha4)})) && ({((8'ha3) && (8'ha0)), ((8'ha6) ? (7'h40) : (8'hb7))} & (~&((8'hb3) ^ (8'ha0)))))), 
parameter param66 = (((^~((param65 ? param65 : (8'hac)) ? (-param65) : (~param65))) ? param65 : (!((param65 ? (7'h41) : param65) ? {param65, param65} : param65))) ? ({(param65 ? (param65 ? param65 : param65) : param65), (~^param65)} >> ((param65 >> (param65 ? (8'ha1) : param65)) ? (param65 || (param65 ? param65 : (8'hb3))) : (~|(param65 ? param65 : param65)))) : ((8'hb9) ? param65 : ((|{param65, param65}) ? {param65} : (~|param65)))))
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  input wire [(4'ha):(1'h0)] wire55;
  input wire signed [(3'h5):(1'h0)] wire54;
  input wire [(3'h4):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire58;
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  assign y = {wire62, wire61, wire60, wire58, reg64, reg63, reg59, (1'h0)};
  assign wire58 = $signed(wire54[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg59 <= wire54[(2'h3):(2'h3)];
    end
  assign wire60 = wire58;
  assign wire61 = $unsigned($signed($unsigned(((wire55 ? (8'hb6) : wire54) ?
                      ((7'h41) * wire54) : (-(8'hbf))))));
  assign wire62 = ({($signed({wire61}) ?
                              (wire61 ?
                                  (~|(8'h9f)) : $unsigned(wire54)) : wire58[(3'h5):(3'h4)])} ?
                      {($signed((wire56 ? wire57 : (8'haf))) ?
                              $signed((wire57 ?
                                  wire54 : wire54)) : $signed({(8'ha6),
                                  wire55}))} : $signed(reg59));
  always
    @(posedge clk) begin
      reg63 <= wire55;
      reg64 <= $signed((((-{wire60, (8'hb0)}) ?
          $unsigned((8'ha2)) : ({wire62} ?
              $unsigned(wire61) : wire56[(1'h0):(1'h0)])) == $unsigned(reg63)));
    end
endmodule
