module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h21f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire116;
  wire signed [(4'ha):(1'h0)] wire115;
  wire [(4'he):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire86;
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(2'h2):(1'h0)] reg4 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire89,
                 wire88,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire86,
                 reg119,
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
      if (wire2)
        begin
          reg4 <= (((~|{(wire3 ? wire0 : (8'h9f))}) ?
                  wire0[(2'h3):(2'h2)] : $signed($unsigned($unsigned(wire2)))) ?
              wire2[(3'h4):(2'h3)] : $unsigned({(^wire0[(1'h1):(1'h0)])}));
        end
      else
        begin
          reg4 <= (wire2 ?
              wire1[(1'h1):(1'h0)] : (wire1 ?
                  wire0 : ($unsigned({reg4, wire0}) <<< ($signed(wire1) ?
                      (-(8'had)) : (wire2 > wire2)))));
          reg5 <= $unsigned(wire3);
          if (($unsigned($unsigned((^(reg4 >= wire2)))) ^ (($signed(wire0[(3'h4):(2'h2)]) ?
              {$unsigned(wire3),
                  $unsigned(reg4)} : (((8'ha4) << wire2) ~^ (wire2 >> wire2))) ^~ wire1)))
            begin
              reg6 <= (~^(7'h42));
              reg7 <= ($signed($unsigned((~$signed(wire0)))) ?
                  $unsigned($unsigned(((reg4 | reg6) ?
                      reg5[(1'h0):(1'h0)] : wire3))) : reg4);
              reg8 <= reg4;
              reg9 <= $unsigned($unsigned((~|(!(reg6 & wire2)))));
            end
          else
            begin
              reg6 <= $signed(wire2[(3'h4):(3'h4)]);
              reg7 <= (^{$unsigned($unsigned(((8'ha6) ? wire2 : reg4))),
                  ($signed($signed(wire3)) ^~ ({wire1, (8'hbf)} ?
                      $unsigned(reg8) : (+(8'hb2))))});
              reg8 <= wire1[(4'hf):(2'h3)];
            end
          reg10 <= wire3;
        end
      reg11 <= reg6;
      reg12 <= (^wire0[(3'h5):(3'h5)]);
    end
  assign wire13 = $unsigned($unsigned($signed(((reg8 + (8'ha5)) <<< (reg10 ?
                      reg4 : wire2)))));
  assign wire14 = (reg8[(1'h1):(1'h1)] ~^ (~^$signed({(wire1 + reg5),
                      ((7'h41) * (8'ha5))})));
  assign wire15 = $unsigned((wire2 ? reg6 : $unsigned((!$unsigned(wire0)))));
  assign wire16 = (($unsigned((reg12[(4'he):(2'h3)] << (7'h42))) ~^ (reg10 != (wire15 ?
                      ((8'h9c) ?
                          (7'h42) : wire2) : (reg7 >= reg4)))) <<< (~^((reg6[(3'h4):(2'h2)] ^~ $unsigned(wire15)) <<< wire14)));
  module17 #() modinst87 (wire86, clk, wire1, reg9, reg8, wire2, wire3);
  assign wire88 = (reg9 >= {(8'ha9)});
  assign wire89 = $signed($signed({wire3[(4'h9):(3'h4)],
                      wire1[(5'h11):(5'h11)]}));
  always
    @(posedge clk) begin
      if ((~|reg8[(1'h1):(1'h1)]))
        begin
          reg90 <= $signed($unsigned((reg6[(3'h4):(2'h3)] ?
              reg9[(1'h0):(1'h0)] : wire15[(2'h3):(2'h2)])));
          reg91 <= $unsigned(($signed((reg9[(2'h3):(1'h0)] - ((8'hae) == reg9))) ?
              {reg90[(3'h5):(3'h5)],
                  $unsigned($signed(reg11))} : ($signed($signed(reg7)) ?
                  ($unsigned((8'hbb)) == $signed((8'ha4))) : (wire88 ?
                      {(8'hb8)} : reg90))));
          reg92 <= wire88[(3'h5):(1'h1)];
          reg93 <= $unsigned((+$unsigned(($signed(wire13) >> ((7'h41) << wire88)))));
          reg94 <= (reg12[(3'h4):(2'h3)] ^ $signed(reg7));
        end
      else
        begin
          reg90 <= $unsigned((-((|(^~reg9)) ?
              reg92[(1'h0):(1'h0)] : $signed(reg8[(3'h7):(3'h5)]))));
          if ((wire13 | ($signed(({reg9, wire86} ?
                  $signed(reg92) : (wire14 ? wire86 : reg7))) ?
              ($unsigned((reg8 ~^ reg91)) > wire3[(1'h0):(1'h0)]) : (((wire13 && wire2) ?
                  (reg91 * (8'hb9)) : (reg94 <<< (8'hac))) < $signed(reg6)))))
            begin
              reg91 <= (reg91 ?
                  $unsigned($unsigned(((~reg10) ?
                      (&(8'h9f)) : (^reg94)))) : ({((reg91 || wire2) ?
                              $unsigned((8'ha6)) : reg8),
                          (|((8'h9f) > (8'hb6)))} ?
                      reg91 : wire15));
              reg92 <= $unsigned($unsigned(($unsigned({reg9,
                  reg90}) ~^ {{(8'hb4)}, (~^wire86)})));
            end
          else
            begin
              reg91 <= ({$signed(wire89[(3'h7):(2'h3)])} ?
                  $unsigned(reg9[(4'hb):(4'hb)]) : reg8);
              reg92 <= {reg5[(3'h6):(1'h1)]};
            end
          reg93 <= reg94;
          reg94 <= wire3;
        end
      if (((reg11 == wire13[(5'h11):(4'hb)]) > (reg11 ?
          ((!(~^(8'ha1))) ?
              ((~|reg12) ?
                  {(8'hb7), wire13} : reg90[(3'h5):(3'h5)]) : (+(reg92 ?
                  reg8 : (8'hbc)))) : $signed(((~wire3) < {reg10})))))
        begin
          reg95 <= (reg4[(1'h1):(1'h0)] ? $signed($unsigned(wire14)) : reg9);
          reg96 <= (8'hbb);
          reg97 <= wire1;
        end
      else
        begin
          reg95 <= wire16;
          if (wire89[(4'hb):(3'h4)])
            begin
              reg96 <= reg5[(2'h2):(2'h2)];
              reg97 <= $unsigned(reg94);
              reg98 <= (wire15 + $unsigned($unsigned(($signed(wire89) ?
                  (&reg7) : ((8'ha3) > reg92)))));
              reg99 <= (8'hb7);
            end
          else
            begin
              reg96 <= wire0[(3'h6):(1'h1)];
            end
        end
      if (wire2)
        begin
          reg100 <= {(&reg8), $unsigned(reg90[(1'h1):(1'h0)])};
          reg101 <= (reg8 ^~ reg7[(3'h7):(1'h0)]);
        end
      else
        begin
          reg100 <= ((+(reg92 ? $unsigned(reg94[(3'h7):(1'h0)]) : (&wire2))) ?
              ({$unsigned($signed(reg100)),
                  (~(wire15 ?
                      reg100 : (8'hae)))} && reg9) : ($signed(($unsigned(reg12) <<< (wire2 ?
                      reg8 : wire2))) ?
                  (|{$unsigned(reg92)}) : (+$unsigned((8'ha5)))));
          if ($signed(((+reg100) ? {wire0[(2'h2):(1'h0)]} : reg12)))
            begin
              reg101 <= wire3;
              reg102 <= (^$signed({wire86}));
              reg103 <= ((-$unsigned(((+reg97) ?
                  (reg95 + reg93) : (8'hb5)))) & (^~(8'ha9)));
              reg104 <= reg96[(1'h1):(1'h0)];
            end
          else
            begin
              reg101 <= wire2[(3'h6):(3'h6)];
              reg102 <= (reg93[(3'h6):(3'h4)] <= ($unsigned($unsigned($signed(reg8))) ^~ $unsigned(wire15[(2'h3):(1'h0)])));
            end
          reg105 <= $unsigned($signed(((+(^~reg103)) || reg90[(3'h7):(3'h6)])));
          if ((reg97[(2'h2):(1'h1)] && ((-(&(reg8 ? wire86 : (8'ha0)))) ?
              reg94 : $signed((wire89[(1'h1):(1'h0)] ?
                  (!wire13) : (reg93 + wire88))))))
            begin
              reg106 <= reg94;
              reg107 <= wire15[(4'he):(1'h1)];
              reg108 <= wire2;
            end
          else
            begin
              reg106 <= wire14;
              reg107 <= $unsigned((reg4[(1'h0):(1'h0)] ?
                  $unsigned(reg103) : $signed(reg12)));
              reg108 <= ($signed($signed($unsigned(reg92[(2'h3):(1'h1)]))) ?
                  {{$signed({(7'h41)})}, reg95[(4'he):(3'h4)]} : reg107);
            end
          reg109 <= (~|(($unsigned({wire3,
              wire15}) ~^ $signed($unsigned((8'ha1)))) ^ wire15));
        end
      if ((8'hb2))
        begin
          reg110 <= (+wire16[(3'h7):(1'h1)]);
        end
      else
        begin
          reg110 <= (reg10 > ((wire1[(4'hf):(4'he)] >= ($signed(reg107) ?
              ((8'hb8) ? reg95 : wire86) : (~^reg6))) != reg90));
          reg111 <= (8'hbe);
          reg112 <= wire15;
          reg113 <= ($signed($signed(reg104)) ?
              ($signed($unsigned((&reg9))) ?
                  {(reg91[(4'h9):(3'h6)] ?
                          reg91[(3'h7):(2'h3)] : $unsigned(wire1)),
                      ($unsigned(wire14) ?
                          $signed(reg108) : (reg108 ?
                              wire1 : (7'h43)))} : reg94) : (|(($signed(wire89) << reg102) != (~|reg107[(1'h1):(1'h0)]))));
        end
      reg114 <= $signed(reg95);
    end
  assign wire115 = ($signed(((~reg102[(4'h8):(1'h1)]) >>> (-{reg94}))) ~^ reg112);
  assign wire116 = reg103[(3'h5):(3'h5)];
  assign wire117 = reg97[(1'h1):(1'h1)];
  assign wire118 = ({$signed($unsigned($signed(reg103))),
                       $unsigned((+reg4))} << reg100);
  always
    @(posedge clk) begin
      reg119 <= $signed((-(reg102[(2'h2):(1'h1)] ?
          ($unsigned(reg5) != reg114) : $unsigned((wire15 ?
              reg107 : reg111)))));
    end
endmodule

module module17
#(parameter param84 = {(((-(^(8'ha6))) - (((8'hb4) - (7'h43)) ^ ((8'ha7) ? (8'hb4) : (8'hbf)))) ? ({((8'hbc) ? (8'h9e) : (8'hb8)), (8'ha4)} ? (((7'h40) * (8'hb9)) & ((8'ha9) ? (8'hb8) : (8'ha1))) : (!((8'h9e) ? (8'hb2) : (8'ha7)))) : (~^((^~(8'ha9)) ? ((8'ha0) ? (8'hbe) : (8'ha2)) : ((8'hb8) ? (8'hb2) : (8'h9c))))), {((((8'ha0) ? (8'hb5) : (8'hb1)) ? (+(8'hb8)) : (|(7'h44))) + (+((8'ha6) >= (7'h41)))), {{(!(8'hba)), (8'ha9)}}}}, 
parameter param85 = param84)
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire22;
  input wire [(4'hc):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire82;
  assign y = {wire39,
                 wire23,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire82,
                 (1'h0)};
  assign wire23 = $unsigned({wire20[(3'h4):(2'h2)]});
  module24 #() modinst40 (wire39, clk, wire19, wire22, wire21, wire23, wire20);
  assign wire41 = ((8'ha1) ?
                      {(wire23 ?
                              $unsigned(wire20) : (wire22[(2'h2):(1'h1)] >= ((8'hb5) ?
                                  wire39 : wire18)))} : {(~&($signed(wire21) ?
                              (wire19 >>> wire39) : (wire21 <<< wire20))),
                          wire22});
  assign wire42 = $signed((!wire39[(2'h2):(1'h0)]));
  assign wire43 = {($signed(($signed(wire42) ? (8'hab) : $signed((8'hb4)))) ?
                          wire39[(1'h1):(1'h0)] : wire22[(4'hb):(3'h6)])};
  assign wire44 = $signed(wire42[(1'h0):(1'h0)]);
  assign wire45 = (-($unsigned((wire39[(1'h1):(1'h1)] ?
                          $unsigned(wire44) : wire43)) ?
                      (((wire18 ^~ (8'ha0)) ?
                              $signed(wire39) : $unsigned(wire39)) ?
                          $signed(wire43) : (+wire43)) : (!$unsigned((wire41 ^ wire42)))));
  assign wire46 = (^~($unsigned($signed(wire41)) ?
                      $unsigned($unsigned($unsigned(wire43))) : (wire42[(4'ha):(3'h4)] ?
                          ($unsigned(wire20) ?
                              $unsigned((8'hb0)) : wire45) : (^~$signed((8'hac))))));
  assign wire47 = wire43;
  module48 #() modinst83 (wire82, clk, wire42, wire21, wire22, wire19, wire20);
endmodule

module module48
#(parameter param81 = (((~^(((8'hb3) ^~ (8'ha5)) ? ((7'h43) ? (8'ha3) : (8'hab)) : ((8'hb5) & (7'h43)))) ? (^(-(!(7'h44)))) : {(&(~&(8'hb0))), (8'ha5)}) ^ (((((8'hbf) >> (7'h42)) >= ((8'ha1) | (7'h41))) >>> ({(8'h9e)} ? ((8'h9f) << (7'h44)) : {(8'hb0), (8'hb5)})) ? (!(((8'ha0) >>> (8'hb8)) ? ((8'hb3) >> (8'hbe)) : (~|(8'hb2)))) : (7'h44))))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire53;
  input wire [(4'hc):(1'h0)] wire52;
  input wire [(4'he):(1'h0)] wire51;
  input wire signed [(4'hb):(1'h0)] wire50;
  input wire signed [(2'h2):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  assign y = {wire75,
                 wire74,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 (1'h0)};
  assign wire54 = wire51;
  assign wire55 = $unsigned(wire50);
  assign wire56 = (wire49[(1'h1):(1'h1)] > $signed(wire52));
  assign wire57 = $signed(wire50);
  assign wire58 = (8'hb0);
  assign wire59 = $signed((~^(($signed(wire55) - wire55) | ($signed(wire57) + (wire50 >>> wire55)))));
  assign wire60 = (&wire53[(3'h4):(1'h1)]);
  assign wire61 = wire50;
  assign wire62 = (((8'ha8) <<< $unsigned($unsigned((wire51 ?
                          wire56 : wire61)))) ?
                      $signed($unsigned(wire57)) : wire56);
  assign wire63 = {$signed(wire53[(5'h10):(4'hb)]), wire61};
  always
    @(posedge clk) begin
      if ((~|$unsigned(((-{wire50}) & (((8'ha6) < wire52) ?
          (^wire50) : wire56)))))
        begin
          reg64 <= (&(!$unsigned(wire49[(1'h0):(1'h0)])));
          reg65 <= wire63;
          if ((wire55[(2'h2):(1'h1)] == ((~|(~&(wire51 - wire55))) ?
              wire51 : reg64[(3'h6):(3'h6)])))
            begin
              reg66 <= (wire54[(2'h3):(1'h1)] || ($signed(wire59[(2'h2):(1'h1)]) >= {(~|{reg65,
                      wire54})}));
              reg67 <= wire54;
            end
          else
            begin
              reg66 <= {(wire61 ?
                      wire57[(2'h2):(2'h2)] : $signed(({(8'hb1)} ?
                          $signed(reg65) : $signed(wire58)))),
                  (~&(^~$unsigned((wire49 ? wire58 : wire61))))};
              reg67 <= ($unsigned(((wire52[(3'h5):(2'h2)] ^ $signed(wire50)) ?
                      (8'hb9) : wire57)) ?
                  {$signed({(wire52 ? wire49 : (8'hbb)),
                          $unsigned(wire59)})} : wire60[(4'h9):(3'h5)]);
              reg68 <= $signed(($unsigned((^~(^wire61))) ?
                  wire52 : $signed(($signed(wire63) & $unsigned(wire59)))));
              reg69 <= $unsigned(($signed(((|wire59) ?
                  (&wire51) : $signed(reg64))) != {wire54}));
            end
          reg70 <= wire50;
          if ($unsigned((wire53 << ({wire60[(3'h6):(3'h5)],
                  wire53[(5'h11):(4'hf)]} ?
              (((8'ha4) ?
                  wire60 : reg65) >= wire50[(4'h9):(2'h2)]) : (8'h9f)))))
            begin
              reg71 <= wire53[(1'h1):(1'h1)];
              reg72 <= ((~|$signed(wire58[(3'h7):(2'h3)])) ?
                  ($signed(((wire49 && wire61) ? {reg71} : $unsigned(wire49))) ?
                      (reg70 || $signed((~^wire57))) : $signed(($signed(reg68) ?
                          wire56[(3'h7):(3'h6)] : wire61))) : (reg67[(3'h7):(3'h7)] > (-reg71[(2'h2):(1'h0)])));
              reg73 <= {((((wire53 ? (8'hbd) : reg65) ?
                          reg70[(2'h3):(1'h1)] : wire51) <<< reg67[(2'h3):(1'h1)]) ?
                      $signed((wire57 ?
                          (wire59 ?
                              (8'hb4) : wire53) : (wire51 - reg71))) : reg68[(4'hd):(3'h4)])};
            end
          else
            begin
              reg71 <= (^~(8'hbb));
              reg72 <= (~|$unsigned((wire63 ?
                  {$signed(wire63),
                      (reg67 >= wire63)} : $signed($signed(reg69)))));
            end
        end
      else
        begin
          reg64 <= {(^~$signed(($unsigned(reg67) >> (reg71 ? reg64 : reg70))))};
          reg65 <= reg64[(3'h4):(1'h1)];
          if ($signed($signed((((wire61 >> wire53) < (wire55 > wire63)) <<< ((reg72 ?
                  (7'h41) : reg65) ?
              $signed(reg70) : (reg70 ? reg66 : wire56))))))
            begin
              reg66 <= reg73[(4'hb):(2'h3)];
              reg67 <= (((reg70 ^~ ((wire63 && wire60) >= wire53)) ?
                      reg71 : {$signed($signed(wire62)),
                          ($unsigned(reg71) ~^ wire63)}) ?
                  {(wire55[(4'h9):(3'h7)] == reg69[(3'h4):(1'h0)])} : reg66[(3'h4):(1'h0)]);
              reg68 <= ((wire54 ?
                  (-wire59[(4'hc):(4'hc)]) : {(~^$signed((8'hb4)))}) <= $signed(wire57[(2'h2):(1'h1)]));
              reg69 <= (((|(!reg73[(4'h8):(3'h5)])) - wire60) ?
                  (((8'hbc) & ($unsigned(wire53) * (reg71 < reg72))) + ({(wire52 << reg67),
                      wire58[(1'h0):(1'h0)]} | wire51[(4'h8):(3'h6)])) : ($signed({((8'hb0) != wire60),
                          $unsigned((8'haa))}) ?
                      (reg65[(3'h6):(3'h4)] ?
                          (reg73 || {wire59,
                              wire56}) : (wire53[(3'h5):(1'h0)] > (!(8'hb9)))) : (reg67[(2'h3):(1'h1)] ^ $unsigned((!reg64)))));
              reg70 <= ($signed((((reg64 ? reg72 : reg68) == (reg67 ?
                  wire53 : wire60)) >= ((~wire51) && (^reg64)))) || wire53);
            end
          else
            begin
              reg66 <= wire57;
            end
          reg71 <= {reg72[(4'he):(3'h4)]};
        end
    end
  assign wire74 = reg67;
  assign wire75 = wire60[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg76 <= (~(((7'h44) ? reg70 : {$signed(wire75), $unsigned(wire74)}) ?
          {($unsigned(wire56) | (7'h40)),
              ((wire50 ? reg67 : wire49) ?
                  $unsigned(reg68) : {wire63, reg65})} : (|wire74)));
      reg77 <= ($unsigned(wire62) ? wire49[(1'h1):(1'h1)] : {wire52});
      reg78 <= $unsigned(reg67);
      reg79 <= wire51[(3'h4):(2'h2)];
      reg80 <= wire49[(2'h2):(1'h1)];
    end
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire [(4'hf):(1'h0)] wire28;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire [(4'hb):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 (1'h0)};
  assign wire30 = $unsigned(wire27);
  assign wire31 = (&$unsigned(wire27));
  assign wire32 = wire28[(2'h3):(1'h1)];
  assign wire33 = (7'h43);
  assign wire34 = wire29;
  assign wire35 = wire25[(5'h10):(4'h9)];
  assign wire36 = (wire30 ? wire30[(2'h3):(1'h1)] : (&wire35[(5'h14):(1'h0)]));
  assign wire37 = ($signed(((~|(wire32 ? wire30 : wire30)) ?
                          {((8'ha7) >>> wire34)} : (((8'ha2) ?
                                  wire34 : wire31) ?
                              $signed((8'ha5)) : {wire36, wire30}))) ?
                      (wire26 ?
                          (((wire29 ? (8'hbf) : wire36) ?
                              (wire26 ?
                                  wire34 : wire25) : $unsigned(wire32)) ~^ (wire28 ^~ wire25)) : wire31) : {wire26[(4'h9):(3'h7)],
                          wire29});
  assign wire38 = $unsigned((wire26[(3'h6):(3'h4)] || (~&(wire36 ?
                      $unsigned(wire37) : wire36))));
endmodule
