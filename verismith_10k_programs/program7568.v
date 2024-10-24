module top
#(parameter param136 = (~&(+(+(+(~^(7'h40)))))), 
parameter param137 = param136)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h407):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire135;
  wire signed [(3'h7):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  wire [(4'h8):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire88,
                 wire87,
                 wire86,
                 wire59,
                 wire39,
                 wire11,
                 wire10,
                 wire9,
                 wire5,
                 wire4,
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
                 reg92,
                 reg91,
                 reg90,
                 reg89,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned($signed((+$signed((wire2 ? (8'h9d) : wire2)))));
  assign wire5 = ((({$signed(wire3)} ?
                             {$signed(wire2)} : ($signed(wire2) & $unsigned(wire2))) ?
                         $signed($unsigned((wire3 ?
                             wire3 : wire4))) : (wire3[(3'h7):(1'h0)] ?
                             $unsigned({wire1, wire3}) : (~|(-wire3)))) ?
                     $signed((8'had)) : ((8'hba) ?
                         (({(8'hb1)} ? {wire2, wire0} : wire1[(3'h6):(1'h1)]) ?
                             $signed((&wire1)) : (~|{wire3})) : $unsigned(wire4[(3'h5):(1'h0)])));
  always
    @(posedge clk) begin
      reg6 <= wire0[(1'h1):(1'h1)];
      reg7 <= wire1[(3'h4):(1'h0)];
      reg8 <= wire1[(2'h3):(2'h3)];
    end
  assign wire9 = reg8[(1'h1):(1'h0)];
  assign wire10 = $signed(wire1[(2'h3):(1'h0)]);
  assign wire11 = {(+reg6[(2'h3):(1'h1)]),
                      ((^~reg6[(1'h0):(1'h0)]) ?
                          ($unsigned((8'hb1)) + $unsigned((wire0 ?
                              reg6 : (8'h9f)))) : (~(((8'hbf) >= reg7) ?
                              $unsigned((8'hbd)) : (wire4 ? wire9 : wire9))))};
  always
    @(posedge clk) begin
      reg12 <= (wire3 ?
          ($unsigned((-(wire2 ?
              wire9 : wire9))) ~^ wire3[(2'h2):(1'h0)]) : $unsigned($signed(wire2[(3'h6):(3'h4)])));
      reg13 <= wire4[(2'h3):(2'h3)];
      reg14 <= (~&wire11[(4'h9):(2'h2)]);
      reg15 <= $signed(($signed(wire5) ?
          (({wire10, wire11} || (wire4 < wire4)) || (~|(^(8'hb3)))) : wire10));
    end
  module16 #() modinst40 (wire39, clk, reg12, reg14, wire0, wire10, reg7);
  module41 #() modinst60 (wire59, clk, wire9, wire3, reg7, wire0, wire5);
  always
    @(posedge clk) begin
      reg61 <= ($unsigned({wire10, $signed((wire11 ? reg6 : reg13))}) ?
          wire1 : (reg8 ?
              (wire39[(3'h4):(1'h1)] ^~ ($unsigned(wire39) ?
                  {wire9} : wire11)) : $signed({$signed(wire1)})));
      reg62 <= reg15[(4'h8):(4'h8)];
      reg63 <= wire59[(3'h4):(1'h0)];
      if ((|$unsigned({$signed(wire3), $unsigned((wire59 && (8'hbb)))})))
        begin
          reg64 <= (((+reg62) ?
              {$unsigned((~wire5))} : {(8'haa)}) + $unsigned($unsigned($unsigned($unsigned(reg15)))));
          reg65 <= $unsigned((^reg8));
          reg66 <= (wire11 ?
              (|($signed((8'hbc)) ?
                  ((wire59 == reg15) | $signed((8'ha7))) : (wire10 ?
                      $signed(reg61) : (reg62 - wire39)))) : reg64[(2'h3):(2'h3)]);
          reg67 <= ($signed(reg66) ?
              wire11 : ($unsigned($unsigned((reg63 ?
                  wire59 : wire9))) < ($unsigned($signed(wire3)) ?
                  reg15[(2'h3):(1'h1)] : ($unsigned(reg6) ?
                      reg63 : (wire59 ? wire9 : reg13)))));
          reg68 <= ($unsigned((wire59[(4'h9):(3'h7)] << ((reg12 ?
                      wire59 : reg14) ?
                  (wire39 + reg12) : (reg6 <= reg12)))) ?
              ($signed(reg7) - ($signed(wire10) & ($signed(reg13) ^ wire59))) : reg62);
        end
      else
        begin
          reg64 <= $signed(($signed(((reg14 ? wire5 : reg14) ?
                  (|wire2) : {reg67})) ?
              (~|(!$signed(reg67))) : ((~|reg7[(3'h4):(1'h1)]) <= (((8'hbd) >> reg68) & (8'had)))));
        end
      if ((^(reg61[(1'h1):(1'h0)] == {$signed($signed(reg6))})))
        begin
          if ((wire1 ^~ reg66[(2'h3):(2'h3)]))
            begin
              reg69 <= (($unsigned((~|$signed(reg13))) ?
                      {$unsigned(reg7), reg68} : $signed((!(reg8 > reg61)))) ?
                  (((-wire5[(4'h9):(2'h2)]) ^ ((wire11 <<< wire59) ?
                      (reg68 >> wire9) : $signed(reg13))) - (wire5 ?
                      wire0 : ((|wire5) ?
                          reg64 : (~|wire1)))) : $unsigned(wire3));
              reg70 <= ((^$signed($signed($signed(reg67)))) + wire5[(3'h6):(1'h1)]);
              reg71 <= reg65[(4'h9):(4'h9)];
            end
          else
            begin
              reg69 <= ({$unsigned((-$unsigned(reg7)))} ?
                  (8'hb5) : ($signed(reg7) ~^ ((|(~reg71)) ? wire4 : reg65)));
              reg70 <= (^~(~^(&$signed((-reg13)))));
            end
          reg72 <= reg63;
          if (reg61[(3'h6):(3'h4)])
            begin
              reg73 <= ((+(-reg64[(4'ha):(4'h8)])) ?
                  (($signed($signed(reg62)) ?
                          ((reg63 ?
                              wire9 : reg69) - (reg64 != wire3)) : $unsigned((|wire5))) ?
                      reg71 : $unsigned(((reg69 ^~ reg63) - ((8'h9d) ?
                          reg61 : reg7)))) : $unsigned((reg61 ?
                      $unsigned((reg63 <<< reg66)) : wire3[(3'h5):(3'h5)])));
              reg74 <= $signed($signed($signed(reg12)));
              reg75 <= $unsigned((8'ha9));
            end
          else
            begin
              reg73 <= reg63;
              reg74 <= (+$unsigned(wire59));
            end
          reg76 <= reg72[(4'h9):(4'h8)];
        end
      else
        begin
          reg69 <= (((($unsigned(reg74) ?
                      wire11[(3'h5):(1'h1)] : reg14) * $unsigned($unsigned(reg72))) ?
                  $signed(({wire0, reg69} ?
                      (reg63 && reg64) : $signed(wire59))) : (8'h9d)) ?
              (reg65 ? wire9 : wire59) : ((8'hab) ?
                  $unsigned(reg69[(1'h1):(1'h0)]) : ({(!reg74)} >= $signed(reg64))));
          if (((~^((^(|(8'hba))) ^ reg15[(3'h5):(2'h2)])) ?
              (wire10 && (reg13 | (|$unsigned(reg69)))) : $signed($signed($signed(wire10)))))
            begin
              reg70 <= wire3;
              reg71 <= reg64;
            end
          else
            begin
              reg70 <= $signed($unsigned({(wire4 ? wire59 : $unsigned(reg66)),
                  (&$signed(reg73))}));
              reg71 <= ($unsigned((-(8'hb5))) ?
                  wire0[(4'he):(4'h8)] : (~(~|((wire3 | reg61) >>> {reg69,
                      wire39}))));
              reg72 <= (((($signed(reg65) ? (!(8'hb4)) : reg62[(4'h9):(1'h0)]) ?
                          reg73[(3'h7):(1'h1)] : (~^(!reg7))) ?
                      reg71[(1'h0):(1'h0)] : (^$unsigned(reg62[(4'ha):(4'h9)]))) ?
                  ((wire5 ? wire3 : {wire1}) ?
                      wire0[(3'h7):(2'h3)] : (((&wire39) ?
                          (wire2 ?
                              wire11 : wire59) : $signed(reg66)) * $unsigned((reg69 != reg70)))) : ((((~&reg74) ?
                      (reg6 ?
                          reg71 : wire10) : reg13[(2'h3):(2'h2)]) | ((~|wire9) ?
                      wire11[(4'ha):(4'ha)] : wire0)) & $unsigned(reg14[(4'h8):(4'h8)])));
              reg73 <= (+{wire3[(1'h0):(1'h0)]});
              reg74 <= ((|{$unsigned((~wire10))}) ?
                  {$unsigned(reg12[(4'he):(2'h2)]),
                      ((reg8[(4'hb):(4'h9)] ?
                          wire0 : $unsigned(reg69)) > $unsigned($unsigned(reg62)))} : $signed((((wire11 ~^ wire3) <<< (reg76 ?
                          reg12 : reg6)) ?
                      (^~(wire9 ? reg66 : reg61)) : reg7[(3'h5):(3'h4)])));
            end
          reg75 <= reg74[(5'h13):(4'ha)];
          reg76 <= ($signed(({reg67[(4'hd):(1'h0)],
              (&reg15)} ~^ $signed((reg68 | wire5)))) - $unsigned(((|reg76[(4'h9):(3'h5)]) ?
              $signed({reg65, reg65}) : $unsigned((-(8'hb5))))));
        end
    end
  always
    @(posedge clk) begin
      reg77 <= wire9[(2'h2):(1'h0)];
      reg78 <= reg73[(3'h7):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg79 <= (-reg71);
      reg80 <= wire0;
      if ({wire5, wire10[(1'h1):(1'h1)]})
        begin
          reg81 <= {(((reg15[(1'h0):(1'h0)] ? (-wire9) : {reg66}) << (&(reg68 ?
                      reg75 : reg66))) ?
                  $signed({reg15, reg71}) : reg63[(4'hb):(4'ha)])};
          reg82 <= (reg74 & (~(reg75[(3'h7):(3'h4)] ?
              ((reg7 <= wire1) ?
                  (reg72 != wire59) : $unsigned(reg61)) : (((8'hae) == reg61) == $signed(reg13)))));
        end
      else
        begin
          if (($signed({reg79[(1'h1):(1'h0)]}) ?
              $signed(reg64) : $signed((($signed((8'hb8)) ?
                      reg67 : (reg14 >= wire59)) ?
                  reg13 : reg81))))
            begin
              reg81 <= (+($unsigned($signed($unsigned(reg79))) * $signed($unsigned((^~(8'hbf))))));
              reg82 <= (wire59 | (wire59[(1'h0):(1'h0)] | (&(reg71[(1'h0):(1'h0)] ?
                  wire5 : reg7[(4'hb):(4'h9)]))));
            end
          else
            begin
              reg81 <= (-$unsigned(reg70[(2'h3):(1'h1)]));
            end
          reg83 <= wire10[(4'ha):(1'h0)];
          reg84 <= {((wire0[(4'hd):(4'hb)] >= $unsigned($unsigned(reg6))) ?
                  reg65 : (^~({reg15} ?
                      $unsigned((7'h44)) : reg64[(3'h4):(1'h1)]))),
              $signed((8'haa))};
        end
      reg85 <= ($unsigned((reg78 ?
              {$unsigned(reg84)} : $signed($signed(wire11)))) ?
          (reg84 ?
              $signed(reg67) : wire4[(4'h8):(1'h1)]) : (~(reg6[(3'h5):(1'h1)] >>> ((reg71 ?
              reg71 : wire3) < {reg84, reg72}))));
    end
  assign wire86 = reg84[(5'h13):(5'h12)];
  assign wire87 = reg69[(1'h1):(1'h1)];
  assign wire88 = {(&(8'hac)), $unsigned($signed(wire11[(2'h3):(1'h1)]))};
  always
    @(posedge clk) begin
      reg89 <= ($signed(wire5) <= $unsigned((wire59 ?
          $unsigned($signed((8'hbf))) : reg84[(3'h7):(3'h5)])));
      if (wire3)
        begin
          reg90 <= {$signed((^~$signed($unsigned(reg6))))};
          if ((reg90[(2'h2):(1'h0)] & wire11[(2'h2):(1'h0)]))
            begin
              reg91 <= {{({$unsigned(reg76), $signed(reg73)} ?
                          (^reg61[(3'h5):(2'h2)]) : (wire0 <= reg71))}};
              reg92 <= (($signed({(reg14 | reg79)}) ?
                  {(reg12 ? $unsigned(reg82) : reg70)} : (($signed(reg91) ?
                      reg12 : ((8'hbb) >>> (7'h42))) >>> (8'h9e))) && $signed((reg15[(4'ha):(3'h4)] <<< (~$signed(reg89)))));
            end
          else
            begin
              reg91 <= ({($signed(reg77[(1'h1):(1'h0)]) ?
                          (reg83 < (wire10 == reg92)) : reg74)} ?
                  {$signed($unsigned((wire4 ? reg6 : reg13))),
                      (+($unsigned(wire0) ?
                          $unsigned(reg14) : reg65))} : $unsigned($unsigned((^(wire2 - reg65)))));
              reg92 <= $unsigned($unsigned($signed($unsigned((8'hb2)))));
              reg93 <= wire59[(4'he):(3'h7)];
              reg94 <= reg14[(5'h12):(4'hf)];
            end
          reg95 <= reg69[(1'h1):(1'h0)];
        end
      else
        begin
          reg90 <= $signed($signed(reg65));
          if ((8'hb2))
            begin
              reg91 <= $signed($signed(((-$signed(reg68)) ?
                  ((reg65 ? reg67 : reg77) ?
                      (wire9 ?
                          reg64 : reg77) : $unsigned(reg68)) : $unsigned($signed(reg85)))));
              reg92 <= $unsigned(wire59);
            end
          else
            begin
              reg91 <= wire3;
            end
        end
      if ((~|$signed(reg77)))
        begin
          reg96 <= reg12;
          if (($unsigned($signed($unsigned(reg91[(1'h0):(1'h0)]))) ~^ (~&$unsigned((((8'hbf) < reg81) ^~ $signed(wire3))))))
            begin
              reg97 <= {$unsigned(($unsigned(reg62[(2'h3):(2'h3)]) >> $unsigned((^reg75)))),
                  $signed($unsigned((reg73[(5'h15):(5'h10)] ~^ (8'ha4))))};
              reg98 <= {(8'ha1)};
            end
          else
            begin
              reg97 <= wire39[(3'h5):(1'h1)];
              reg98 <= ($unsigned(reg65[(4'h9):(1'h1)]) <= (((~(^wire5)) ?
                  reg73 : $signed((!reg81))) * (-reg85)));
              reg99 <= $unsigned(($signed($signed((8'hac))) ?
                  reg95 : ($unsigned((wire3 ?
                      reg98 : (7'h42))) || ($signed(reg64) ?
                      reg67[(3'h6):(3'h6)] : $signed(reg89)))));
              reg100 <= ($signed(({reg98} + $signed($unsigned(reg75)))) << (wire3[(3'h5):(2'h3)] * $signed($signed($unsigned(reg8)))));
              reg101 <= $signed((wire88 & (reg64 ?
                  reg67[(2'h3):(1'h1)] : wire0)));
            end
          reg102 <= (~&$signed((7'h43)));
          if ($unsigned($unsigned($unsigned(({reg83} ? wire3 : (^reg14))))))
            begin
              reg103 <= ((7'h40) ? reg101[(1'h1):(1'h1)] : $signed(wire2));
              reg104 <= $unsigned(wire0[(4'hb):(3'h5)]);
              reg105 <= ((~($unsigned(reg85) ?
                      $unsigned((reg89 <= reg91)) : $signed((^~reg100)))) ?
                  wire0 : $unsigned(wire3[(1'h1):(1'h0)]));
              reg106 <= ((~^(($signed(reg15) || (8'hbb)) < reg72)) < (((8'ha8) <= $unsigned(((8'ha0) + reg71))) ?
                  reg74[(4'hc):(2'h3)] : (8'hb5)));
            end
          else
            begin
              reg103 <= $unsigned($signed((+({reg70, (8'h9e)} ?
                  (~|reg90) : $unsigned(wire88)))));
            end
          reg107 <= $signed({reg99[(4'hc):(4'hb)],
              (wire4 ?
                  ($unsigned(reg71) | reg73[(4'hc):(3'h4)]) : wire4[(3'h6):(2'h2)])});
        end
      else
        begin
          reg96 <= wire5;
          reg97 <= $signed(reg80[(4'h9):(2'h2)]);
          reg98 <= (reg97 * $signed((!{{wire0, (8'ha3)},
              (reg103 ? reg90 : reg106)})));
          reg99 <= reg8;
        end
      reg108 <= (reg84 < ((reg102[(1'h1):(1'h0)] ?
              $signed((reg8 ~^ reg7)) : ((reg74 || reg8) ?
                  {reg90} : (reg75 == reg70))) ?
          $signed((((8'hbd) >> reg92) ^~ $unsigned(reg70))) : ($unsigned(wire2) ?
              reg93[(2'h2):(1'h0)] : reg67)));
    end
  always
    @(posedge clk) begin
      if (wire4)
        begin
          reg109 <= $signed((reg74[(3'h5):(3'h4)] ?
              ((8'h9d) ?
                  $unsigned($unsigned(reg61)) : $signed((&reg80))) : ({reg73} ?
                  ($signed(wire88) + (wire39 ?
                      wire86 : reg68)) : (~|$signed(wire59)))));
          reg110 <= {{reg108[(3'h5):(2'h2)]}};
          reg111 <= (($unsigned($signed($signed(reg8))) ?
                  (+($unsigned(reg77) ?
                      $unsigned((8'haf)) : {reg71})) : ($unsigned((reg105 ?
                      reg63 : reg90)) != $unsigned(reg82[(3'h7):(3'h4)]))) ?
              ($unsigned((&wire0[(5'h14):(4'h9)])) ?
                  {reg104} : $signed($signed((~&wire39)))) : reg101);
        end
      else
        begin
          if ((8'hbc))
            begin
              reg109 <= $unsigned((+($signed((reg62 ?
                  reg12 : (8'hb1))) - (~&reg65))));
            end
          else
            begin
              reg109 <= ($unsigned(((reg110 == (reg101 >= reg15)) < ({reg89} ?
                      $unsigned(reg7) : $signed(reg78)))) ?
                  $unsigned(reg110[(3'h6):(1'h0)]) : {(((8'hbe) | (wire4 ?
                          reg89 : reg70)) * reg70[(3'h4):(2'h3)])});
              reg110 <= (8'ha6);
              reg111 <= (|$signed($unsigned(reg13)));
              reg112 <= wire86[(4'hb):(1'h0)];
            end
          reg113 <= {((reg101 >>> reg67) ? {wire10[(2'h2):(1'h0)]} : reg85)};
          if ($unsigned($signed(reg107)))
            begin
              reg114 <= $unsigned(({($signed(reg67) ?
                      ((8'hbc) ? reg93 : reg13) : ((8'hb0) - (8'hb1))),
                  wire3[(1'h1):(1'h0)]} << reg8[(3'h5):(2'h3)]));
              reg115 <= (reg113[(2'h3):(1'h1)] << (^($signed(wire9) ?
                  ($unsigned(reg97) ?
                      $unsigned(wire9) : reg104) : (~wire2[(3'h6):(2'h3)]))));
              reg116 <= (~^{$unsigned((reg65[(5'h14):(4'hf)] ?
                      (wire1 ^ reg7) : (|reg93)))});
              reg117 <= reg72;
              reg118 <= (~&($unsigned($unsigned($unsigned((8'hac)))) > ({(-reg108)} ?
                  wire5[(3'h4):(3'h4)] : (reg89[(2'h3):(1'h1)] ?
                      (reg103 ? wire10 : reg82) : $signed(reg94)))));
            end
          else
            begin
              reg114 <= reg91;
              reg115 <= (-$signed(reg101[(1'h1):(1'h1)]));
            end
          if ($unsigned($unsigned(wire11[(3'h5):(2'h2)])))
            begin
              reg119 <= (&((8'hb1) ?
                  $unsigned(reg106[(3'h5):(3'h4)]) : reg14[(2'h2):(2'h2)]));
              reg120 <= (wire1[(1'h0):(1'h0)] ~^ reg114[(3'h4):(2'h3)]);
              reg121 <= (^(8'hbc));
              reg122 <= (({(8'hae)} ?
                      (({reg82, reg110} ?
                          $signed(reg12) : $signed(reg100)) == ($signed(reg67) ?
                          $signed(reg108) : $signed(reg84))) : (-$signed({reg80,
                          reg62}))) ?
                  (reg77 ?
                      reg75[(3'h5):(1'h0)] : $signed($signed((reg121 ?
                          reg61 : reg98)))) : (wire5 || ($signed(reg105) ?
                      ((wire5 ^ reg14) ?
                          (reg108 << (8'h9d)) : reg119) : reg108[(1'h0):(1'h0)])));
              reg123 <= {reg96,
                  ((reg79[(2'h2):(1'h1)] <= (&$signed(wire86))) ?
                      reg74[(3'h5):(1'h0)] : ($unsigned((wire1 ?
                          (7'h44) : (8'ha6))) != reg90[(2'h3):(2'h3)]))};
            end
          else
            begin
              reg119 <= (+reg111);
            end
        end
      reg124 <= {reg14[(3'h7):(1'h1)]};
      if ((+reg69))
        begin
          reg125 <= (~&$signed(wire0[(5'h12):(4'hb)]));
        end
      else
        begin
          reg125 <= $signed((~^reg68[(3'h5):(1'h1)]));
          reg126 <= (8'ha7);
          reg127 <= reg116[(2'h3):(2'h3)];
          if ($unsigned((($unsigned((~(8'hbf))) ?
                  (reg118[(3'h4):(2'h2)] >>> (reg100 > (8'hbc))) : (|$signed(reg71))) ?
              reg112[(3'h7):(1'h1)] : reg82)))
            begin
              reg128 <= ($signed($unsigned((|(reg122 > wire88)))) ~^ reg101);
              reg129 <= $signed((~&(+($unsigned(reg8) ?
                  (reg105 ~^ reg73) : $unsigned(reg13)))));
              reg130 <= (|$unsigned($signed(reg116)));
            end
          else
            begin
              reg128 <= reg108;
              reg129 <= (~|((reg81 ^ reg107) & ((~$unsigned(reg90)) ?
                  (~&(^~wire59)) : reg73[(3'h7):(3'h5)])));
              reg130 <= $unsigned(((+(wire4 ? $signed(wire88) : {reg122})) ?
                  ($unsigned((^reg103)) ?
                      $unsigned(reg102) : (~&$signed(reg109))) : $unsigned($unsigned(wire88[(3'h5):(3'h4)]))));
            end
        end
    end
  assign wire131 = (($unsigned((&reg90[(1'h1):(1'h0)])) >= (|{$unsigned(reg128)})) != $unsigned({$unsigned($signed(reg94)),
                       (reg121[(1'h1):(1'h1)] ?
                           (reg80 ? reg81 : reg120) : reg6)}));
  assign wire132 = {(~^((8'h9e) ^ ((wire88 ?
                           (8'hab) : reg93) ^ (reg14 >= reg126))))};
  assign wire133 = wire9[(3'h4):(2'h2)];
  assign wire134 = $unsigned(($signed(reg7) <= {(~|$unsigned(wire0)),
                       (~|$signed(reg106))}));
  assign wire135 = reg68;
endmodule

module module41
#(parameter param57 = (^((^(((8'hbc) ? (8'ha6) : (8'hae)) | (^~(8'ha0)))) + ((~^(&(8'h9e))) ? (8'hb1) : ({(8'hbd)} - {(8'ha6)})))), 
parameter param58 = ((({(param57 & param57)} >>> ((~|param57) * ((8'ha1) ? param57 : param57))) ? {(param57 & param57), {param57, param57}} : (((8'hbd) ? (~|param57) : param57) ~^ (~(-param57)))) || (~|((((8'h9d) ? param57 : (8'hae)) ? param57 : param57) || ((~&param57) > param57)))))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire46;
  input wire signed [(4'h8):(1'h0)] wire45;
  input wire signed [(4'hb):(1'h0)] wire44;
  input wire [(5'h12):(1'h0)] wire43;
  input wire [(4'h9):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 reg56,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire45[(3'h5):(1'h1)])
        begin
          reg47 <= ((-wire43) && (wire44 >= ({((8'ha3) >>> wire46),
              ((8'hbb) ? wire46 : wire42)} & $unsigned((~wire45)))));
          reg48 <= $unsigned({(((wire46 <= wire42) <<< $unsigned((8'hb8))) * $unsigned((wire44 ?
                  wire46 : wire43))),
              $unsigned(($signed(wire43) ? wire46 : $unsigned(wire44)))});
          reg49 <= (8'hb7);
        end
      else
        begin
          if (($unsigned((wire45[(4'h8):(3'h4)] - ($signed(wire42) ?
              (reg47 ?
                  (8'hb2) : wire43) : $signed(wire46)))) >> {$unsigned((!$unsigned(reg48))),
              wire43[(1'h1):(1'h1)]}))
            begin
              reg47 <= (wire42 >= $signed($signed({(~|wire45)})));
              reg48 <= (8'hbb);
              reg49 <= (reg48[(3'h7):(1'h1)] ?
                  ($signed($unsigned($signed(wire44))) ?
                      (-($unsigned((8'ha2)) ?
                          ((8'hb4) <= reg47) : $unsigned(wire46))) : wire42) : (($unsigned((wire43 - reg47)) ?
                      ($signed(reg49) == $unsigned((8'haa))) : (wire45 ?
                          {wire45,
                              (8'haf)} : (reg49 != wire42))) && {(|(8'ha8)),
                      (7'h42)}));
            end
          else
            begin
              reg47 <= (wire45[(4'h8):(4'h8)] ?
                  (8'ha9) : $signed($unsigned(((7'h41) ?
                      (wire46 + (8'ha3)) : (+reg48)))));
            end
          reg50 <= $signed((8'ha6));
          reg51 <= $unsigned(wire42);
        end
      reg52 <= {($signed({{reg47, wire44}}) ^ $signed({$signed(reg47)})),
          reg49[(1'h0):(1'h0)]};
    end
  assign wire53 = {{$unsigned(reg50[(5'h14):(4'h8)])},
                      $signed($unsigned(reg50))};
  assign wire54 = (~&reg49[(4'hb):(2'h2)]);
  assign wire55 = wire46;
  always
    @(posedge clk) begin
      reg56 <= $signed(wire46);
    end
endmodule

module module16
#(parameter param38 = (~|(~^(+((~(8'haa)) ? ((8'h9d) ? (8'hab) : (8'hbb)) : ((8'ha0) | (8'hbf)))))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire signed [(2'h3):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire22;
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  assign y = {wire24,
                 wire22,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg23,
                 (1'h0)};
  assign wire22 = $unsigned({$unsigned(wire21[(1'h1):(1'h0)])});
  always
    @(posedge clk) begin
      reg23 <= ({($unsigned($signed(wire18)) ?
                  wire19 : ($signed(wire17) ?
                      {(8'h9f)} : (wire18 ? wire22 : wire22))),
              ((~&$signed((8'hab))) ?
                  (!$signed(wire22)) : $signed($signed(wire17)))} ?
          ($unsigned($unsigned(wire19[(2'h2):(1'h1)])) - (8'ha4)) : $signed(((+wire17[(2'h2):(1'h1)]) ?
              (~(wire18 ? (8'h9e) : wire22)) : (wire21 ?
                  $signed(wire20) : $signed(wire17)))));
    end
  assign wire24 = wire19;
  always
    @(posedge clk) begin
      reg25 <= (8'hb3);
      if (((-(+(wire19 >= $unsigned(wire21)))) ?
          wire17[(2'h3):(1'h1)] : (($signed(wire18[(1'h1):(1'h1)]) ?
              wire22[(2'h2):(2'h2)] : $unsigned(((8'haf) ?
                  reg23 : (8'hb0)))) && reg25[(3'h5):(1'h1)])))
        begin
          reg26 <= $signed((^~$unsigned(($unsigned(wire21) && (wire24 ?
              reg25 : wire24)))));
          reg27 <= wire18;
          reg28 <= wire17[(1'h0):(1'h0)];
          if ({$signed((($signed(wire20) ? (+wire20) : $unsigned(reg26)) ?
                  reg26 : (^~(wire18 >> reg27)))),
              (wire22[(1'h0):(1'h0)] ?
                  (wire21 ^~ (wire21[(2'h2):(1'h0)] || (reg28 ?
                      reg28 : (8'hbc)))) : (&(reg26[(2'h3):(1'h0)] | (~wire22))))})
            begin
              reg29 <= {reg23,
                  ($unsigned(($signed((8'had)) && (reg23 <= (8'ha6)))) ^~ ((wire24 ?
                          reg27[(3'h7):(2'h2)] : (reg27 * wire18)) ?
                      (7'h40) : (!wire17)))};
              reg30 <= ($unsigned($signed(wire22[(1'h1):(1'h0)])) ?
                  (wire24 + $unsigned($signed(wire24[(5'h14):(4'hf)]))) : $signed((~^$signed($unsigned(wire24)))));
              reg31 <= $unsigned($unsigned(wire17[(2'h3):(1'h1)]));
              reg32 <= ((~^$unsigned({(wire21 && reg26), $unsigned(wire17)})) ?
                  reg30[(2'h2):(1'h0)] : wire17);
            end
          else
            begin
              reg29 <= reg27;
              reg30 <= {(reg29 & $unsigned($unsigned((^~reg25)))),
                  (~|($unsigned((+(8'hb5))) ?
                      ((8'ha8) & $signed((8'hb5))) : $signed(wire17)))};
              reg31 <= $unsigned(reg30);
              reg32 <= {reg30, wire24};
              reg33 <= $signed(($unsigned((~&(^~wire21))) & {((!reg28) ?
                      (reg32 ? reg31 : wire24) : (reg30 ? wire19 : wire19))}));
            end
          if (wire20)
            begin
              reg34 <= $signed({(wire22 ? $unsigned((&reg30)) : reg28)});
              reg35 <= $signed((~&reg32[(2'h2):(1'h0)]));
              reg36 <= $signed($signed($signed(reg26[(1'h1):(1'h0)])));
            end
          else
            begin
              reg34 <= reg26;
              reg35 <= (reg25[(4'hb):(3'h6)] || $signed($unsigned({$unsigned(reg25)})));
              reg36 <= $signed($unsigned({reg34, $signed(reg28)}));
              reg37 <= ($unsigned(reg32) ^ (((^~(reg35 ?
                      reg34 : wire19)) | (wire24[(4'h9):(4'h9)] * {(8'h9e),
                      reg25})) ?
                  ($signed(wire21[(1'h1):(1'h1)]) ?
                      ($unsigned(wire24) <<< reg35[(3'h5):(2'h2)]) : {$unsigned(reg29)}) : (+(~$unsigned(wire20)))));
            end
        end
      else
        begin
          reg26 <= (8'hbf);
        end
    end
endmodule
