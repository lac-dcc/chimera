module top
#(parameter param200 = (^~(8'hbf)), 
parameter param201 = {(param200 ? (8'ha6) : {((^~param200) <= (param200 ? param200 : param200)), (8'hb5)})})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire196;
  wire signed [(5'h15):(1'h0)] wire195;
  wire signed [(3'h5):(1'h0)] wire194;
  wire signed [(3'h4):(1'h0)] wire193;
  wire [(4'hf):(1'h0)] wire192;
  wire signed [(2'h3):(1'h0)] wire191;
  wire [(3'h5):(1'h0)] wire190;
  wire signed [(4'he):(1'h0)] wire189;
  wire [(5'h10):(1'h0)] wire188;
  wire signed [(3'h5):(1'h0)] wire187;
  wire [(3'h4):(1'h0)] wire186;
  wire [(5'h10):(1'h0)] wire185;
  wire signed [(5'h13):(1'h0)] wire184;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire182;
  reg [(2'h3):(1'h0)] reg199 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg197 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire5,
                 wire11,
                 wire112,
                 wire182,
                 reg199,
                 reg198,
                 reg197,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned(((~|({wire1} ?
                         wire0[(2'h3):(1'h1)] : wire0[(2'h3):(1'h1)])) ?
                     (^~(wire0[(2'h3):(1'h1)] ?
                         $unsigned(wire2) : wire0[(1'h1):(1'h1)])) : (^~$unsigned(((8'hba) ?
                         wire3 : wire2)))));
  always
    @(posedge clk) begin
      reg6 <= $signed((((wire1[(4'h8):(3'h4)] ?
              wire1 : (wire0 ? wire4 : (8'ha0))) >> $signed(wire4)) ?
          wire0 : ($signed(wire2[(2'h3):(2'h2)]) * $signed(wire4))));
      reg7 <= $signed(wire4);
      if ($unsigned($unsigned((reg6[(1'h1):(1'h0)] & ($signed(reg6) ?
          (wire3 ^~ wire0) : wire2)))))
        begin
          reg8 <= (wire5[(2'h2):(1'h1)] & $unsigned(wire2));
        end
      else
        begin
          reg8 <= (&{{$signed(wire4[(4'ha):(1'h0)]), reg8[(3'h4):(2'h2)]}});
        end
      reg9 <= (-wire3);
      reg10 <= reg8;
    end
  assign wire11 = reg6[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg12 <= $signed((!reg6[(5'h10):(4'hd)]));
      reg13 <= $unsigned(($unsigned(((|wire4) ? {(8'hbc)} : $signed(wire4))) ?
          (8'hab) : {reg7, wire3}));
    end
  module14 #() modinst113 (wire112, clk, reg6, wire2, wire11, reg12, reg13);
  module114 #() modinst183 (wire182, clk, wire11, reg8, reg10, reg13);
  assign wire184 = (~^$signed($unsigned($signed($unsigned(wire182)))));
  assign wire185 = (wire2[(4'hc):(3'h4)] ? wire184[(5'h10):(3'h5)] : reg8);
  assign wire186 = (|(wire5 - reg7));
  assign wire187 = wire186[(3'h4):(2'h2)];
  assign wire188 = (reg6[(3'h4):(2'h2)] ?
                       (!($signed(((8'hbc) ^ wire2)) ?
                           (wire4[(4'h8):(3'h5)] < ((8'h9c) <<< reg12)) : (~^(~^wire184)))) : ($signed($unsigned($unsigned(wire184))) - $signed((reg6[(3'h5):(1'h1)] ?
                           ((7'h42) | reg13) : reg6[(3'h6):(1'h1)]))));
  assign wire189 = {(wire11[(4'ha):(1'h0)] << (^~((+wire112) ?
                           {wire187} : (wire1 ^~ reg13)))),
                       reg8[(1'h0):(1'h0)]};
  assign wire190 = wire112[(5'h14):(3'h7)];
  assign wire191 = (((wire3[(3'h7):(3'h6)] >>> $signed((wire1 ?
                               reg8 : wire1))) ?
                           ((!$signed(wire11)) ?
                               (~|(~wire4)) : {(wire189 ? wire5 : (8'h9f)),
                                   (reg6 ?
                                       wire189 : wire190)}) : ($unsigned(wire0[(2'h3):(1'h1)]) ?
                               (8'ha7) : (~|(8'ha9)))) ?
                       ((-(!(reg10 ?
                           wire182 : wire2))) < (({wire3} | (~|wire184)) <= $signed($signed(wire186)))) : wire185[(3'h5):(2'h3)]);
  assign wire192 = $unsigned(reg10[(3'h6):(2'h3)]);
  assign wire193 = ($signed($unsigned(((~&reg12) ?
                           (wire4 ? wire5 : (8'hb1)) : wire182))) ?
                       wire11 : $unsigned(wire189));
  assign wire194 = (^~$unsigned($unsigned(wire188[(4'hd):(4'h9)])));
  assign wire195 = $signed(wire185[(2'h3):(2'h3)]);
  assign wire196 = {$unsigned($signed(reg13)), reg12};
  always
    @(posedge clk) begin
      reg197 <= $signed($signed(((&wire2) ?
          (((8'hb7) >> wire11) ?
              $unsigned(reg6) : reg7[(3'h4):(2'h3)]) : $unsigned(wire112))));
      if (((~$unsigned((-reg13[(1'h1):(1'h0)]))) ?
          $signed(((7'h42) >>> wire4)) : wire196[(5'h12):(2'h3)]))
        begin
          reg198 <= wire189[(3'h5):(1'h0)];
          reg199 <= {$signed(reg8[(2'h2):(1'h0)])};
        end
      else
        begin
          reg198 <= $signed(wire185);
        end
    end
endmodule

module module114
#(parameter param180 = (&((|((~^(8'hbb)) ? ((8'hb1) ? (8'had) : (8'hb8)) : ((8'hb6) ? (8'hbc) : (8'hb3)))) ? ((^~(|(8'ha3))) ? {(~&(8'had)), (+(8'ha7))} : (!(^~(8'ha0)))) : (+({(8'hb8)} ? ((8'hae) ? (8'ha4) : (8'h9f)) : ((8'had) ? (8'hb8) : (8'ha3)))))), 
parameter param181 = ({((~(8'hb3)) ? param180 : param180)} ? ((|((+param180) < (~^param180))) ? (((~|param180) ? {param180, param180} : param180) ^ (-(param180 < param180))) : (^~(-(param180 << param180)))) : ((&(+param180)) > (8'hae))))
(y, clk, wire115, wire116, wire117, wire118);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire115;
  input wire signed [(5'h15):(1'h0)] wire116;
  input wire [(5'h11):(1'h0)] wire117;
  input wire signed [(5'h11):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire179;
  wire [(4'h9):(1'h0)] wire178;
  wire [(2'h3):(1'h0)] wire177;
  wire signed [(5'h11):(1'h0)] wire176;
  wire signed [(4'ha):(1'h0)] wire175;
  wire [(5'h10):(1'h0)] wire174;
  wire [(4'hb):(1'h0)] wire173;
  wire signed [(4'h8):(1'h0)] wire172;
  wire [(4'hd):(1'h0)] wire119;
  wire signed [(5'h10):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire146;
  wire [(3'h5):(1'h0)] wire170;
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire119,
                 wire120,
                 wire121,
                 wire146,
                 wire170,
                 (1'h0)};
  assign wire119 = $signed((wire118 || $signed(wire117)));
  assign wire120 = (8'ha1);
  assign wire121 = (|(((wire116[(2'h3):(2'h2)] ?
                           (wire117 >> wire119) : (8'hae)) >> (-(wire115 ^ (8'ha6)))) ?
                       $unsigned(({wire119} == $signed(wire117))) : $signed(wire120[(3'h4):(1'h1)])));
  module122 #() modinst147 (wire146, clk, wire121, wire115, wire116, wire118);
  module148 #() modinst171 (wire170, clk, wire115, wire146, wire121, wire118, wire117);
  assign wire172 = wire118[(3'h4):(2'h2)];
  assign wire173 = ((($signed(wire172[(1'h1):(1'h1)]) ?
                           wire146 : wire117) < wire170) ?
                       $signed({wire172}) : $signed((^(wire115 || {wire119}))));
  assign wire174 = ($signed(((wire116 | (&(7'h43))) ?
                       (wire117 ? $signed(wire146) : (&wire118)) : (wire172 ?
                           $unsigned(wire117) : $signed(wire116)))) | (($signed((-(8'hbc))) >>> ((wire115 ?
                           wire170 : wire117) ?
                       {(8'hab),
                           wire173} : $signed(wire119))) > (^~(~&$unsigned(wire146)))));
  assign wire175 = ((&(wire170[(2'h3):(2'h3)] || $unsigned($signed(wire170)))) ?
                       ((wire120 ^~ (wire116 ^ wire117[(3'h6):(1'h0)])) && wire118[(4'he):(4'he)]) : ({((wire173 ?
                               wire116 : (8'hb1)) || $signed(wire172))} != ({(~wire121)} - wire118[(5'h10):(4'hc)])));
  assign wire176 = wire116[(1'h1):(1'h0)];
  assign wire177 = ((($unsigned($signed(wire176)) ?
                       $unsigned(wire176) : ((wire120 ? wire176 : wire176) ?
                           (~&wire176) : $unsigned((8'haf)))) <<< (((wire146 ?
                           wire175 : (8'ha0)) ?
                       (^wire173) : (!wire173)) - (^~(wire146 || wire115)))) != wire118);
  assign wire178 = ((($unsigned($unsigned(wire121)) >= ($signed((8'had)) ?
                               $unsigned(wire176) : $signed(wire176))) ?
                           $signed(wire120[(1'h1):(1'h0)]) : wire176[(4'hf):(3'h7)]) ?
                       $unsigned(((wire118 >> $unsigned(wire116)) ^ ((|wire170) ?
                           (wire176 > wire173) : (&wire177)))) : wire172);
  assign wire179 = ($signed((wire118 || wire118)) ?
                       (((~|$signed(wire174)) ?
                           (8'ha2) : wire173) ^ wire115[(1'h0):(1'h0)]) : wire119);
endmodule

module module14  (y, clk, wire15, wire16, wire17, wire18, wire19);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire16;
  input wire [(4'ha):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire111;
  wire signed [(2'h3):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire90;
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire92,
                 wire20,
                 wire21,
                 wire90,
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
                 (1'h0)};
  assign wire20 = $unsigned(wire19);
  assign wire21 = (&((((~wire15) ?
                      wire16[(4'he):(2'h3)] : wire16[(1'h1):(1'h1)]) ^~ $unsigned(((8'haf) == (8'hb9)))) <= {$unsigned(wire20[(2'h2):(2'h2)])}));
  module22 #() modinst91 (.wire26(wire16), .wire24(wire17), .wire23(wire18), .clk(clk), .y(wire90), .wire25(wire19), .wire27(wire20));
  assign wire92 = (!((8'hbf) ?
                      $signed($signed({wire17, wire16})) : {$unsigned((wire90 ?
                              wire17 : wire90)),
                          (|(wire15 ? wire17 : wire20))}));
  always
    @(posedge clk) begin
      reg93 <= (~{wire90});
      if (((-(-wire17[(3'h5):(3'h4)])) ?
          (~&$signed(wire20[(1'h1):(1'h1)])) : reg93[(2'h3):(2'h3)]))
        begin
          if (({wire90[(2'h2):(2'h2)],
                  $unsigned(($signed(wire16) >= wire20[(2'h3):(1'h0)]))} ?
              wire17[(4'h8):(3'h7)] : ($signed($unsigned((reg93 ?
                      reg93 : wire21))) ?
                  $signed($unsigned((wire19 ?
                      wire18 : (8'hb8)))) : $signed($unsigned((&reg93))))))
            begin
              reg94 <= ((wire90 ?
                  {(!$unsigned((8'ha5)))} : $unsigned((+$unsigned(wire18)))) || (&(-$signed(wire17[(4'ha):(2'h3)]))));
              reg95 <= wire92[(3'h5):(3'h4)];
            end
          else
            begin
              reg94 <= (|(~^wire19[(2'h3):(2'h2)]));
              reg95 <= (+(((&wire16[(4'he):(3'h6)]) ?
                  (wire17 ?
                      wire92[(1'h0):(1'h0)] : $unsigned(wire18)) : (8'hac)) * (^(8'hbe))));
              reg96 <= reg93[(2'h2):(1'h0)];
              reg97 <= ($signed((-(8'ha8))) << wire17);
            end
        end
      else
        begin
          reg94 <= $unsigned((-$signed((~|wire16[(4'ha):(1'h0)]))));
        end
      reg98 <= (&{(8'haa),
          (wire18 ?
              $unsigned((~reg96)) : (((7'h42) >> wire20) & wire21[(1'h1):(1'h0)]))});
    end
  always
    @(posedge clk) begin
      if ((-(8'hbc)))
        begin
          reg99 <= ((reg96 ?
              (reg93 >= reg97) : reg93) <<< ((~&$signed((!(7'h42)))) ?
              (^($unsigned(wire92) ?
                  ((8'hae) ? reg98 : wire17) : {wire18, wire19})) : ((+wire15) ?
                  wire16[(3'h6):(2'h2)] : (^~(reg98 || (8'hba))))));
          if (wire90[(1'h1):(1'h1)])
            begin
              reg100 <= {$signed($signed(wire19[(4'hb):(3'h4)])),
                  wire90[(1'h0):(1'h0)]};
              reg101 <= ((wire18[(2'h3):(2'h2)] ? (8'h9e) : reg94) ?
                  $signed(((~&(wire21 == reg99)) <= ({reg96} ?
                      (wire17 ^~ wire17) : (wire15 != wire90)))) : reg96[(3'h6):(3'h5)]);
            end
          else
            begin
              reg100 <= {((+{$unsigned(reg95)}) ? $signed(reg99) : wire18),
                  (+wire17[(3'h5):(2'h3)])};
              reg101 <= reg93[(2'h3):(1'h0)];
              reg102 <= wire17[(3'h7):(3'h6)];
              reg103 <= wire19;
            end
          reg104 <= $signed(((((wire90 <<< wire20) > wire15[(3'h6):(3'h4)]) * reg99[(2'h2):(1'h1)]) ?
              $unsigned(wire92) : $unsigned(($signed(reg94) ?
                  (reg100 ? wire17 : reg93) : (wire21 <<< reg98)))));
          reg105 <= (reg96 ? $signed(reg104[(4'ha):(3'h6)]) : {wire17});
        end
      else
        begin
          reg99 <= reg93[(1'h1):(1'h1)];
          reg100 <= {$unsigned($unsigned(($signed(reg100) ?
                  (reg97 * reg93) : $unsigned(wire90))))};
          reg101 <= (wire21 ?
              $unsigned((reg100[(2'h2):(2'h2)] ?
                  (^{wire90,
                      wire19}) : $signed(wire21[(2'h2):(1'h0)]))) : (|(reg101[(3'h7):(2'h2)] ?
                  reg105[(1'h0):(1'h0)] : reg93)));
          if ((~(^reg99)))
            begin
              reg102 <= (!(^~reg94));
              reg103 <= $unsigned(((reg100 ^~ ({wire15} ?
                  $unsigned(reg98) : reg104[(4'ha):(3'h4)])) == (((^~reg96) ?
                  (-reg95) : $unsigned(reg100)) <= $unsigned((+(8'hab))))));
            end
          else
            begin
              reg102 <= (wire19 ?
                  (wire16[(5'h10):(3'h6)] | wire16[(4'hf):(3'h7)]) : reg99);
              reg103 <= (!$signed((reg94 * wire20[(2'h2):(2'h2)])));
              reg104 <= (reg96[(3'h7):(1'h1)] < (wire90[(1'h0):(1'h0)] ?
                  reg95 : ($signed(reg94[(4'hc):(1'h0)]) ?
                      (~|$unsigned(reg101)) : (reg95 >> (reg95 ?
                          reg100 : wire19)))));
              reg105 <= $unsigned(({$signed((|reg102)), wire17[(2'h2):(1'h1)]} ?
                  wire92 : $unsigned((~^(8'hb4)))));
              reg106 <= ((wire18 ?
                      ($signed(reg94) ?
                          $unsigned($signed(reg101)) : ($signed(wire18) >= wire19[(4'hc):(3'h7)])) : wire17[(1'h0):(1'h0)]) ?
                  reg97[(2'h2):(2'h2)] : $unsigned((reg96 ?
                      (~^(-reg93)) : (+(~|wire18)))));
            end
        end
    end
  assign wire107 = (~&(wire18 ?
                       $signed(wire16[(5'h11):(2'h2)]) : ($unsigned({reg105,
                               wire20}) ?
                           ((8'ha5) ?
                               $unsigned((8'hbe)) : reg106) : $unsigned(reg98[(3'h6):(2'h2)]))));
  assign wire108 = $unsigned($unsigned(($signed(reg96[(3'h5):(3'h4)]) << (^~(reg97 ~^ reg94)))));
  assign wire109 = ((^~{($signed(reg100) ?
                               (wire20 ? wire21 : (7'h41)) : (reg104 ?
                                   wire108 : reg100)),
                           $signed($signed(reg94))}) ?
                       $signed(wire92) : (($unsigned(wire15[(4'h8):(2'h3)]) <<< wire21) * wire20));
  assign wire110 = reg93;
  assign wire111 = ((wire15 ?
                       reg103[(1'h0):(1'h0)] : $signed(((~|wire17) ?
                           $unsigned(reg93) : (wire19 ?
                               reg93 : reg104)))) != $unsigned((~|$signed((|(8'hb9))))));
endmodule

module module22
#(parameter param89 = (((+(((7'h41) ? (7'h40) : (8'hbb)) == ((7'h44) ? (8'hac) : (7'h40)))) ? {((~(8'hb7)) * {(8'ha2), (8'ha3)}), (((8'hb8) || (8'ha1)) ? ((8'hb7) ? (8'hbb) : (7'h40)) : {(7'h43)})} : {(+((8'ha2) & (8'hb6)))}) && (~|(!({(8'hbf)} ? (!(8'ha4)) : ((8'hae) < (8'hb7)))))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h2c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire [(4'ha):(1'h0)] wire24;
  input wire [(3'h6):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire47,
                 wire46,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~(wire27 ?
          $unsigned(wire23[(1'h1):(1'h0)]) : $unsigned((|$signed(wire24))))))
        begin
          reg28 <= ({($unsigned({wire26,
                  (8'ha9)}) && $signed((+wire26)))} ~^ (wire24 ?
              $signed(($unsigned(wire27) ?
                  wire26[(5'h10):(3'h7)] : $unsigned(wire26))) : wire27));
          if ((!(+$signed($unsigned((wire24 ? (8'hbc) : wire24))))))
            begin
              reg29 <= reg28[(3'h7):(3'h7)];
              reg30 <= wire23;
            end
          else
            begin
              reg29 <= reg28;
              reg30 <= $unsigned((&($unsigned(wire27[(1'h0):(1'h0)]) >= reg29[(3'h7):(3'h7)])));
              reg31 <= {(reg30[(3'h5):(2'h3)] < (reg29[(3'h7):(3'h5)] * wire27[(2'h3):(2'h3)])),
                  {$unsigned(wire23[(2'h2):(2'h2)])}};
              reg32 <= $signed((+(^((^reg30) << $unsigned((8'hb9))))));
            end
          reg33 <= (wire26[(4'hd):(1'h1)] ?
              $signed(((+reg28[(2'h3):(1'h1)]) ?
                  ((wire24 ? reg30 : wire25) ?
                      reg28 : wire24) : $unsigned((reg30 ^~ wire25)))) : {$signed(reg32[(4'h9):(2'h3)]),
                  (($signed(wire24) ?
                          (reg31 ? reg32 : (8'hbd)) : reg28[(3'h4):(2'h3)]) ?
                      (~$unsigned(wire25)) : (~^{(8'hb5), wire25}))});
        end
      else
        begin
          reg28 <= (-$signed($unsigned(reg28[(3'h5):(1'h1)])));
          reg29 <= wire26;
          reg30 <= ((wire25 ?
                  $unsigned($unsigned($signed(reg29))) : (((wire23 < reg29) ?
                      $unsigned(reg31) : reg31[(1'h0):(1'h0)]) + (~{(7'h41),
                      wire25}))) ?
              (7'h40) : reg28);
          reg31 <= $unsigned(reg28[(3'h6):(3'h4)]);
        end
      if ((reg30[(1'h1):(1'h0)] ^ $unsigned($unsigned(((reg31 > reg33) & reg33[(4'h8):(2'h2)])))))
        begin
          if ((($unsigned(((+wire27) >> (reg31 & wire27))) ?
              reg33 : ($unsigned(reg31[(2'h3):(1'h0)]) == $unsigned((reg33 ?
                  wire27 : reg31)))) || $unsigned($unsigned($unsigned((8'haf))))))
            begin
              reg34 <= (($unsigned(wire24[(2'h3):(1'h0)]) | (-$unsigned(wire25[(4'ha):(3'h5)]))) ?
                  $signed({$unsigned(wire25[(1'h1):(1'h1)]),
                      $unsigned($signed((7'h42)))}) : reg29[(3'h7):(3'h7)]);
              reg35 <= reg28;
              reg36 <= $unsigned((^$unsigned(reg33[(1'h0):(1'h0)])));
            end
          else
            begin
              reg34 <= $unsigned(((wire24 <<< {{wire25}}) ^~ $signed(((reg30 | wire26) <= (^reg33)))));
              reg35 <= (~^(!reg36));
              reg36 <= ($signed(({(reg30 >>> wire24), (+reg30)} ?
                  ((reg35 <<< wire24) == wire27[(3'h4):(3'h4)]) : reg34)) ~^ $signed((reg30[(2'h2):(1'h0)] ?
                  $unsigned($signed(wire24)) : reg35)));
              reg37 <= ((-((reg30 ? {wire26, reg31} : (reg34 ~^ reg34)) ?
                      reg34[(4'ha):(3'h5)] : wire23)) ?
                  ((~$unsigned(wire24[(1'h1):(1'h1)])) ?
                      reg30 : ({(wire27 ? reg31 : reg29),
                              (reg29 ? (8'ha2) : reg30)} ?
                          reg31[(1'h0):(1'h0)] : $signed(reg31[(2'h3):(1'h0)]))) : $signed($signed($signed((reg29 <<< (8'hbd))))));
              reg38 <= wire27;
            end
          reg39 <= (~&$unsigned(reg38));
          reg40 <= reg28;
          if ((^~(((wire25 ? wire27 : $signed(reg37)) != wire24) ?
              $unsigned({wire26[(3'h4):(1'h1)],
                  (reg32 <<< reg40)}) : ((~^{reg34, reg34}) ?
                  reg38 : {{(8'hba)}}))))
            begin
              reg41 <= $unsigned(((~&(~|(&wire25))) && ({(~|wire25)} | reg34)));
              reg42 <= $signed(reg39);
            end
          else
            begin
              reg41 <= $unsigned(((wire27 ? wire27 : $unsigned(reg34)) ?
                  ($signed({reg41, reg32}) >> ((reg28 <= reg36) ?
                      reg40[(5'h13):(4'hd)] : $unsigned(reg30))) : ($unsigned((wire25 ?
                          wire23 : reg36)) ?
                      reg36[(1'h0):(1'h0)] : reg32[(4'h8):(2'h2)])));
            end
          reg43 <= ((~|$signed(((reg38 >> (7'h44)) ?
                  $unsigned(reg35) : {reg30, (8'hb7)}))) ?
              (($unsigned(reg40[(3'h7):(3'h6)]) && $unsigned((~&reg39))) ~^ ({$unsigned(wire26)} | ($unsigned(reg31) ?
                  (wire25 >= reg34) : reg35))) : (~&(|$unsigned((reg42 ^~ reg34)))));
        end
      else
        begin
          reg34 <= wire26;
          reg35 <= $signed(reg38[(3'h7):(3'h4)]);
          reg36 <= wire27;
          reg37 <= ((~^$signed(((8'hbe) ? (~(8'haa)) : {reg37, (8'hab)}))) ?
              $signed((~$unsigned(reg29[(3'h5):(3'h5)]))) : reg35);
        end
      reg44 <= $unsigned((!$signed(reg31[(2'h3):(1'h0)])));
      reg45 <= $signed($unsigned((-wire24)));
    end
  assign wire46 = reg40[(4'h8):(3'h5)];
  assign wire47 = reg45[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      if (reg37[(4'ha):(3'h5)])
        begin
          reg48 <= (($unsigned({(reg38 & wire47)}) <<< ((!$unsigned(reg33)) ?
                  (~^(~&reg37)) : $signed((~^reg34)))) ?
              wire26[(4'ha):(1'h1)] : $signed($unsigned((+wire25))));
          reg49 <= $unsigned(reg33);
          reg50 <= $unsigned(($unsigned(((!(8'ha7)) & reg49[(1'h1):(1'h0)])) == reg30[(3'h6):(3'h5)]));
        end
      else
        begin
          if ((($signed($unsigned({reg33})) | reg35) <= (reg43 >>> {((&reg31) || (reg41 << reg39)),
              ($signed(wire23) ? (~^reg35) : $signed(reg30))})))
            begin
              reg48 <= {$unsigned((~&$signed((wire25 ? (7'h41) : reg36))))};
              reg49 <= (+(8'hbd));
            end
          else
            begin
              reg48 <= $unsigned(((((reg32 ? reg43 : wire23) >= (reg49 ?
                  (8'ha8) : reg40)) >>> reg32[(1'h1):(1'h1)]) + wire24));
              reg49 <= ($signed(reg33[(4'hc):(4'h9)]) ?
                  ($signed($unsigned((reg28 ?
                      wire24 : reg49))) ^~ reg37) : ((~reg50[(4'ha):(4'ha)]) ?
                      reg29 : wire27));
              reg50 <= (~&(!({$unsigned(reg44), $unsigned((8'ha7))} ?
                  wire24 : $unsigned({reg32, reg39}))));
              reg51 <= $unsigned((8'hbb));
              reg52 <= ({$signed(reg38[(3'h5):(3'h5)])} * reg29);
            end
          reg53 <= $signed((wire24[(2'h3):(1'h0)] ?
              ((reg32[(4'ha):(2'h3)] <= {wire26}) - wire23[(1'h1):(1'h0)]) : (8'hb6)));
          reg54 <= wire23;
          if (reg45)
            begin
              reg55 <= (^~reg33);
              reg56 <= $unsigned($signed($signed(reg38)));
            end
          else
            begin
              reg55 <= (reg42[(4'ha):(3'h6)] <<< (~|($signed($unsigned(reg55)) >= ($signed(wire27) ?
                  reg34[(1'h0):(1'h0)] : (reg38 ? wire25 : (8'ha6))))));
              reg56 <= reg30;
              reg57 <= reg41;
              reg58 <= {($unsigned(reg30[(1'h1):(1'h1)]) ^~ reg28),
                  $signed($signed((reg41 ? $signed(reg50) : (~reg56))))};
              reg59 <= $unsigned(({(reg58 ? (~^reg38) : $unsigned((8'hb0)))} ?
                  reg31 : $signed($unsigned($unsigned(wire24)))));
            end
        end
      reg60 <= ((8'hb8) && (reg28 ?
          {$unsigned(reg57), $unsigned($signed(wire23))} : wire24));
    end
  always
    @(posedge clk) begin
      reg61 <= ($unsigned(reg35[(4'h9):(4'h9)]) ?
          (|reg30[(3'h5):(2'h2)]) : (|wire24));
    end
  assign wire62 = reg45;
  assign wire63 = $unsigned((~^(&$signed($signed((7'h42))))));
  assign wire64 = reg37;
  assign wire65 = reg43;
  assign wire66 = $unsigned((($unsigned((^reg38)) * (!(~reg37))) != ((+(reg57 ?
                      reg48 : reg32)) << (((8'h9f) ? wire24 : wire24) ?
                      ((8'hbb) ? reg49 : reg44) : reg34[(2'h2):(2'h2)]))));
  assign wire67 = (^reg59[(5'h12):(4'hf)]);
  assign wire68 = reg33[(4'hf):(4'hb)];
  always
    @(posedge clk) begin
      reg69 <= reg37;
      reg70 <= wire27;
      reg71 <= $unsigned((($signed($unsigned(reg42)) ?
          (~wire64) : reg48[(3'h5):(1'h0)]) && ((~^$signed((8'hbd))) ?
          (|((8'ha7) * reg42)) : (!$signed(wire47)))));
      if (($signed($signed((reg28 < $signed((8'ha1))))) ?
          (reg43 ?
              (+reg31[(4'hd):(4'hc)]) : reg28[(2'h2):(1'h1)]) : $signed($signed(reg70))))
        begin
          reg72 <= reg48;
          reg73 <= (~|((&(~&reg37)) ?
              {reg41, (~|(reg35 ? wire66 : wire23))} : wire67[(3'h7):(3'h7)]));
          reg74 <= wire65[(4'h8):(3'h5)];
          reg75 <= {{(($unsigned(reg48) ?
                          (wire27 ? reg43 : reg33) : $unsigned(reg59)) ?
                      ($signed(reg45) != reg28[(1'h0):(1'h0)]) : ($unsigned(reg69) <= $unsigned(wire23))),
                  wire68[(2'h3):(1'h0)]}};
          reg76 <= reg38[(4'h8):(2'h2)];
        end
      else
        begin
          if (reg53)
            begin
              reg72 <= wire63;
              reg73 <= $unsigned($unsigned((reg69[(4'h8):(1'h0)] <= $signed((reg76 > reg29)))));
              reg74 <= ((^~(7'h44)) ~^ $signed(reg72));
            end
          else
            begin
              reg72 <= reg35[(4'h8):(3'h6)];
              reg73 <= reg61[(2'h3):(1'h0)];
              reg74 <= (reg61[(1'h0):(1'h0)] <= ((7'h43) | (reg51[(3'h7):(3'h7)] + $signed({wire24}))));
              reg75 <= ((!reg57[(4'hf):(3'h5)]) + $signed(reg49));
            end
          if ((wire24[(4'h8):(1'h0)] & reg32[(4'h8):(1'h1)]))
            begin
              reg76 <= $unsigned($signed((~&reg70)));
              reg77 <= (reg41 ?
                  (((wire47 < {reg48, reg73}) ?
                          (-$unsigned(wire63)) : (+wire68)) ?
                      (!(^$unsigned(reg72))) : $unsigned(($unsigned(reg43) != reg60))) : (wire62 < ((~^{reg38,
                          reg57}) ?
                      $signed(reg29) : $signed($unsigned(reg76)))));
              reg78 <= wire68[(3'h4):(2'h2)];
              reg79 <= reg78[(1'h0):(1'h0)];
            end
          else
            begin
              reg76 <= reg44;
              reg77 <= reg55;
            end
          if ((((|$signed((reg31 ? (8'hac) : reg38))) ?
                  reg53 : {(!{wire46}), {$unsigned(reg41), reg29}}) ?
              $unsigned(wire27[(1'h0):(1'h0)]) : (reg32[(3'h4):(1'h0)] > ($unsigned((reg73 & reg69)) + $signed(wire63[(1'h0):(1'h0)])))))
            begin
              reg80 <= ($signed(reg36) ?
                  $signed(({{reg71}} & (reg73[(5'h12):(3'h6)] <<< $unsigned(reg28)))) : $unsigned((-({reg50} && (wire47 != (8'ha4))))));
              reg81 <= (reg77 < (^((&((8'hba) + (8'ha8))) ?
                  $signed((reg44 ?
                      (8'h9c) : wire46)) : $signed($signed(reg72)))));
              reg82 <= ({{reg48[(4'he):(3'h4)], (~|wire65)},
                  reg29[(2'h2):(1'h0)]} * wire27[(2'h2):(1'h1)]);
              reg83 <= wire64;
              reg84 <= wire46[(2'h2):(2'h2)];
            end
          else
            begin
              reg80 <= reg36;
              reg81 <= ($signed(reg53) == {(wire27 == reg76), wire25});
              reg82 <= (~&reg42);
              reg83 <= $signed({$signed({$unsigned(wire24)}),
                  reg38[(3'h6):(2'h2)]});
              reg84 <= $signed($unsigned($signed(((reg70 & reg40) ?
                  ((8'hb0) ? reg78 : (8'hbf)) : (reg49 ^~ reg41)))));
            end
          reg85 <= ($unsigned(reg78) ?
              reg44 : $unsigned((wire67[(3'h7):(2'h3)] ^ ($unsigned(reg74) > $signed(reg55)))));
          reg86 <= $unsigned(($unsigned(wire64) ^~ reg75[(4'h8):(3'h5)]));
        end
    end
  assign wire87 = $unsigned(({$signed((^(8'haa)))} && ($signed(wire64) > (~&(&wire65)))));
  assign wire88 = (~$unsigned(($signed((~reg56)) << (&(reg43 ?
                      reg55 : wire25)))));
endmodule

module module148
#(parameter param169 = (((~|(((7'h44) + (8'ha8)) | ((8'ha5) ? (7'h40) : (8'h9f)))) ? (((|(8'haf)) ? (&(8'hbf)) : ((8'haa) ? (8'h9d) : (8'hbe))) >>> {{(8'hb1)}, ((8'hbb) ? (8'hbd) : (8'had))}) : (~|(((8'hb9) >= (7'h44)) < {(8'haf), (8'hae)}))) + (((((8'hb8) ? (8'hbc) : (8'hbb)) ? (-(8'hbd)) : (|(8'hb5))) >> ((!(8'ha5)) == (&(8'ha8)))) ? (!(|(+(8'ha7)))) : (({(7'h42), (8'ha4)} ? {(8'hbd)} : (~(8'hbd))) ? (8'ha8) : (((8'ha4) ? (8'ha9) : (8'had)) >>> (~^(8'hac)))))))
(y, clk, wire153, wire152, wire151, wire150, wire149);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire153;
  input wire [(4'h8):(1'h0)] wire152;
  input wire [(5'h10):(1'h0)] wire151;
  input wire [(3'h7):(1'h0)] wire150;
  input wire signed [(4'ha):(1'h0)] wire149;
  wire [(3'h4):(1'h0)] wire158;
  wire signed [(5'h11):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire155;
  wire signed [(3'h6):(1'h0)] wire154;
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(3'h6):(1'h0)] reg167 = (1'h0);
  reg [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(3'h5):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
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
                 (1'h0)};
  assign wire154 = ((wire151[(3'h6):(1'h0)] ?
                       ((wire151[(3'h7):(3'h5)] ?
                           wire153[(2'h3):(2'h3)] : {wire150,
                               wire149}) ~^ $unsigned((^~wire151))) : $unsigned($unsigned(wire152[(2'h3):(1'h1)]))) * {(wire149 ?
                           wire151[(1'h1):(1'h1)] : $unsigned(wire149)),
                       (wire149 & (8'hab))});
  assign wire155 = (~({(wire149 * (wire153 ? wire153 : wire153)),
                           ($unsigned(wire149) ?
                               (wire151 ?
                                   wire149 : wire151) : $signed((8'ha4)))} ?
                       $signed(wire153[(2'h3):(1'h0)]) : $unsigned(wire150)));
  assign wire156 = wire151[(4'hd):(4'h8)];
  assign wire157 = $unsigned(($signed(((wire152 & (8'hae)) ?
                           $unsigned(wire155) : $unsigned(wire156))) ?
                       (wire153[(3'h4):(3'h4)] ?
                           ($unsigned(wire149) << {wire156,
                               wire149}) : ((wire150 <= wire156) ?
                               (wire152 ?
                                   wire150 : wire153) : $signed(wire151))) : (($unsigned(wire151) - wire151[(1'h1):(1'h0)]) ?
                           wire151 : $signed($signed(wire149)))));
  assign wire158 = (8'haa);
  always
    @(posedge clk) begin
      if ($unsigned(wire158))
        begin
          if (wire149[(3'h5):(3'h5)])
            begin
              reg159 <= {$unsigned($signed((wire155[(3'h6):(1'h0)] ?
                      wire158[(1'h0):(1'h0)] : (wire157 ^ wire158))))};
              reg160 <= {wire151,
                  {((wire153[(3'h5):(1'h1)] ?
                          (&reg159) : wire154[(1'h1):(1'h0)]) || ($unsigned(wire151) ?
                          (7'h42) : $unsigned(wire157))),
                      wire149}};
              reg161 <= (wire158 | wire152);
              reg162 <= $unsigned((+((!(-wire151)) && ((reg159 >= wire157) << $unsigned(wire156)))));
              reg163 <= ((~|$unsigned(($signed(reg159) <= (^~reg162)))) && reg159);
            end
          else
            begin
              reg159 <= $signed(((($unsigned(reg160) ?
                  {(7'h41),
                      wire154} : wire156) && (8'hb7)) >= (reg160[(1'h0):(1'h0)] - wire158[(3'h4):(1'h1)])));
              reg160 <= wire157;
              reg161 <= (~|wire157[(2'h2):(1'h0)]);
              reg162 <= (reg161[(4'hb):(2'h2)] <<< reg160[(4'ha):(3'h5)]);
              reg163 <= $signed({reg159});
            end
          if ((wire154[(2'h2):(1'h1)] == reg162[(5'h10):(5'h10)]))
            begin
              reg164 <= $unsigned((|{wire149,
                  (reg163[(1'h1):(1'h1)] ?
                      $signed((8'had)) : (reg159 <= reg159))}));
              reg165 <= ($signed(reg163[(3'h5):(2'h2)]) < wire152);
            end
          else
            begin
              reg164 <= {$signed($signed($unsigned((wire151 && wire158)))),
                  reg163};
              reg165 <= (&$unsigned((reg159 ?
                  $unsigned($unsigned(wire155)) : ($signed(wire151) ~^ wire158))));
              reg166 <= ((^~wire157[(1'h0):(1'h0)]) < wire157);
              reg167 <= (({$signed($unsigned(wire155)), $unsigned(reg159)} ?
                  $unsigned({(&wire149)}) : (($unsigned((8'hae)) ?
                          (reg162 ? wire154 : wire150) : {wire155, wire155}) ?
                      reg164[(2'h3):(1'h1)] : ({reg166, reg162} ?
                          (~|reg164) : wire154))) == ((((wire157 >= wire149) * $signed(reg160)) ?
                  $signed($unsigned(wire153)) : ($signed((8'hba)) ?
                      (|reg161) : (8'h9f))) ~^ $unsigned(wire151)));
            end
        end
      else
        begin
          if ($unsigned((($unsigned(reg159[(1'h0):(1'h0)]) | $unsigned(wire154)) * $unsigned(((wire152 & reg167) | (8'haf))))))
            begin
              reg159 <= ((reg165[(3'h6):(3'h5)] > $unsigned(($unsigned(reg162) <= wire155))) ?
                  $signed(reg163[(2'h3):(1'h1)]) : (($signed((wire158 ?
                          reg165 : wire150)) & (!$unsigned(reg165))) ?
                      $signed(reg163) : reg160[(3'h6):(1'h0)]));
              reg160 <= reg161;
              reg161 <= {(~|$signed(((wire150 ?
                      wire152 : wire152) ^~ {wire151}))),
                  wire153};
            end
          else
            begin
              reg159 <= (reg164[(3'h7):(3'h7)] ?
                  (~{$unsigned((wire155 ?
                          reg163 : reg160))}) : $signed((+wire149)));
              reg160 <= (8'hb1);
            end
        end
      reg168 <= ($signed($unsigned(reg164)) < wire154[(2'h2):(2'h2)]);
    end
endmodule

module module122
#(parameter param145 = (-(~({((8'hb0) ~^ (8'hab)), (~&(8'hbf))} ? (((7'h44) != (7'h40)) ^~ ((8'ha0) || (8'h9c))) : ((|(8'hb2)) ? (-(8'h9d)) : ((8'ha4) ? (8'hbf) : (8'hba)))))))
(y, clk, wire126, wire125, wire124, wire123);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire126;
  input wire signed [(5'h13):(1'h0)] wire125;
  input wire signed [(4'he):(1'h0)] wire124;
  input wire [(5'h11):(1'h0)] wire123;
  wire [(4'he):(1'h0)] wire144;
  wire [(2'h2):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  wire signed [(4'h9):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire140;
  wire signed [(4'ha):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  wire signed [(3'h7):(1'h0)] wire137;
  wire signed [(2'h3):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire133;
  wire signed [(4'hf):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire129;
  wire [(3'h6):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire127;
  reg [(3'h6):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire134,
                 wire133,
                 wire132,
                 wire129,
                 wire128,
                 wire127,
                 reg136,
                 reg135,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire127 = (~^wire126);
  assign wire128 = {{$signed($signed(wire126))}};
  assign wire129 = ($signed((wire125[(4'he):(4'ha)] & wire127)) ?
                       (|(wire127[(2'h3):(2'h3)] ?
                           ((~wire125) >> $unsigned(wire128)) : $unsigned(((8'hb2) ^ (8'ha0))))) : ($unsigned($signed(wire126)) ?
                           wire123 : wire126));
  always
    @(posedge clk) begin
      reg130 <= (~{wire123[(1'h1):(1'h1)],
          $signed($unsigned($unsigned(wire129)))});
      reg131 <= (reg130[(3'h7):(2'h2)] ?
          (($unsigned((wire125 ? wire128 : reg130)) ?
              wire127 : wire129) <<< $unsigned((~reg130))) : $signed($unsigned($signed(((8'ha1) * wire127)))));
    end
  assign wire132 = ($signed((wire128 < wire123)) ?
                       ($signed((~|$signed(reg130))) * {wire128,
                           {{wire128}, reg130}}) : (wire125[(4'hf):(4'hc)] ?
                           wire127[(3'h5):(3'h5)] : ($signed((~^wire128)) <<< $signed($unsigned(wire125)))));
  assign wire133 = wire128[(2'h3):(1'h1)];
  assign wire134 = reg130[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg135 <= $signed(reg131[(1'h1):(1'h0)]);
      reg136 <= (reg131 & wire123);
    end
  assign wire137 = ($unsigned((wire123[(1'h0):(1'h0)] << {{reg131, reg131},
                           reg130})) ?
                       wire134 : $signed($signed(({wire132,
                           wire125} ~^ wire128[(2'h2):(1'h0)]))));
  assign wire138 = $unsigned(((((^~wire128) != $signed(wire125)) ?
                       (wire134[(1'h1):(1'h0)] ?
                           $signed(wire132) : {wire133,
                               wire137}) : ($signed(reg136) ?
                           wire129[(4'he):(3'h4)] : ((8'ha0) ?
                               wire124 : wire125))) || ((!((7'h42) ?
                           reg131 : wire125)) ?
                       (~&(reg130 <= (8'ha6))) : wire129)));
  assign wire139 = $signed(($signed((~|$signed(wire133))) ?
                       reg135[(1'h1):(1'h0)] : ((^(wire132 ^~ wire127)) ?
                           ($signed(wire126) <<< (~|wire123)) : (-$signed(wire129)))));
  assign wire140 = reg131;
  assign wire141 = reg131[(2'h3):(1'h0)];
  assign wire142 = wire125[(3'h7):(2'h3)];
  assign wire143 = {(~^{(7'h40), $unsigned(wire125)})};
  assign wire144 = $unsigned((((|{wire134, wire138}) | wire133[(4'hd):(4'hc)]) ?
                       (^$signed((wire139 <= wire128))) : (wire137 ?
                           wire139[(1'h1):(1'h1)] : ((wire125 ?
                                   wire137 : (8'ha5)) ?
                               (8'hb1) : (~^wire126)))));
endmodule
