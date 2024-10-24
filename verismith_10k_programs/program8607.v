module top
#(parameter param92 = (7'h44))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire89;
  wire signed [(2'h2):(1'h0)] wire87;
  assign y = {wire91, wire90, wire89, wire87, (1'h0)};
  module5 #() modinst88 (wire87, clk, wire0, wire1, wire2, wire4, wire3);
  assign wire89 = wire0;
  assign wire90 = (^~($unsigned(wire2) ?
                      $signed($unsigned(wire0[(4'h9):(3'h4)])) : ((wire3[(4'h8):(1'h0)] ^~ $unsigned(wire89)) ?
                          wire87 : (&(+wire87)))));
  assign wire91 = {((~&((wire2 <<< (8'hba)) ?
                          wire3[(4'hd):(1'h0)] : wire2[(4'he):(3'h5)])) ^ ((|wire2[(3'h5):(1'h1)]) ?
                          wire0[(4'h8):(2'h3)] : $unsigned(wire2[(5'h10):(1'h1)])))};
endmodule

module module5
#(parameter param86 = ((({((8'ha4) ? (8'hb1) : (7'h42)), (+(8'h9e))} ? (((8'hb0) ? (7'h42) : (8'hb4)) <<< (~&(8'hb0))) : {(~|(8'hbc)), {(8'hb8)}}) | (8'ha6)) + (8'h9d)))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  assign y = {wire82,
                 wire80,
                 wire28,
                 wire27,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg85,
                 reg84,
                 reg83,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire11 = $signed(wire6);
  assign wire12 = wire9;
  assign wire13 = ($signed(wire11) || $unsigned(wire9));
  assign wire14 = ($unsigned({wire11[(3'h7):(3'h5)]}) & $unsigned($unsigned((wire9[(2'h2):(1'h1)] ?
                      $signed((8'hb6)) : {wire6}))));
  assign wire15 = $signed(wire6[(1'h0):(1'h0)]);
  assign wire16 = $unsigned((!$signed((|{(8'ha8), wire15}))));
  assign wire17 = (~^(+$unsigned({wire13[(2'h3):(2'h2)]})));
  assign wire18 = (($unsigned(wire15[(4'h8):(2'h2)]) ?
                          ($signed((wire11 ?
                              (8'hb5) : wire7)) < $unsigned((wire16 ?
                              wire10 : wire9))) : wire14) ?
                      wire11[(4'hd):(1'h1)] : {wire7,
                          $unsigned($unsigned($signed(wire7)))});
  assign wire19 = wire18;
  assign wire20 = ($unsigned(wire7[(2'h3):(1'h1)]) ?
                      {wire13[(1'h0):(1'h0)],
                          (~|((wire11 ? wire19 : wire17) ?
                              wire12 : wire9[(1'h1):(1'h0)]))} : $unsigned((8'hbc)));
  assign wire21 = (&($unsigned((wire6 ?
                      (^~wire18) : $signed(wire19))) & wire19));
  always
    @(posedge clk) begin
      reg22 <= wire6[(1'h0):(1'h0)];
      reg23 <= (wire20[(2'h2):(1'h0)] ?
          {{$unsigned($signed(wire16))},
              wire20} : (-{(wire16 | $unsigned(wire16)),
              ((wire15 ? wire6 : wire7) ~^ (|(8'haa)))}));
      reg24 <= (({wire21, wire6[(1'h0):(1'h0)]} ?
              wire7 : (~|((wire10 ? wire18 : reg23) ? (+wire13) : {wire17}))) ?
          reg22[(3'h5):(1'h1)] : {wire20[(3'h4):(1'h1)],
              $signed({reg22[(3'h4):(2'h3)], (wire21 < wire15)})});
      reg25 <= wire7[(2'h2):(1'h1)];
      reg26 <= (|$signed((~&(!$unsigned(reg24)))));
    end
  assign wire27 = $unsigned((reg23 << wire10[(3'h4):(2'h2)]));
  assign wire28 = (+(|wire10));
  module29 #() modinst81 (wire80, clk, wire18, wire19, wire15, wire13);
  assign wire82 = $signed($signed(({(wire16 <= reg26)} ?
                      $signed(((8'ha2) ?
                          wire21 : wire8)) : ($unsigned(reg22) || wire13))));
  always
    @(posedge clk) begin
      reg83 <= (-{{wire80,
              ((wire19 ? wire9 : wire16) ? $unsigned(reg26) : wire27)}});
      reg84 <= $signed(({wire28,
          (((8'h9d) || wire19) ?
              $unsigned((8'hb8)) : wire6)} << wire27[(4'hf):(4'he)]));
      reg85 <= {(+(^(~&$unsigned(wire7)))), wire18[(4'h8):(1'h0)]};
    end
endmodule

module module29
#(parameter param78 = (+((-({(8'hb2), (8'ha9)} ? ((8'ha0) - (8'ha6)) : (8'hbc))) >= {(8'ha6)})), 
parameter param79 = (~|(param78 ? (-(^~(~param78))) : (param78 ^~ ((|param78) ^~ (!param78))))))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h222):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire33;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire signed [(5'h14):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({(wire30 ?
              ((7'h41) ?
                  wire31[(4'hc):(1'h0)] : $signed(wire30[(4'hd):(4'ha)])) : (^wire32))})
        begin
          reg34 <= ($unsigned({($signed(wire32) >>> wire33[(5'h10):(3'h5)])}) * {wire33,
              wire32[(4'hc):(4'h9)]});
          reg35 <= wire30[(5'h11):(3'h4)];
        end
      else
        begin
          if ($signed(($unsigned($signed((reg34 - wire33))) ?
              $unsigned((wire31[(4'hf):(4'h9)] <<< reg35)) : {reg35,
                  ($signed(wire32) ? $unsigned(wire31) : $signed(wire31))})))
            begin
              reg34 <= ($unsigned(reg35) ?
                  ((wire32[(3'h5):(3'h4)] ?
                          ({wire32, reg35} >= reg35[(4'h9):(4'h9)]) : wire31) ?
                      $unsigned((8'hbc)) : $unsigned((reg34[(1'h0):(1'h0)] ?
                          wire32[(5'h10):(3'h6)] : $unsigned((8'hbf))))) : (|wire31[(4'hc):(2'h3)]));
              reg35 <= (reg35[(3'h4):(1'h1)] <<< $unsigned($signed({$unsigned(wire33),
                  wire31[(2'h2):(1'h0)]})));
              reg36 <= wire31;
              reg37 <= reg34[(3'h5):(2'h3)];
            end
          else
            begin
              reg34 <= (((reg37 ?
                      ((|wire31) ? $signed(reg36) : $unsigned(reg37)) : reg35) ?
                  (|($signed((8'ha9)) <<< (reg37 ?
                      reg37 : wire30))) : $signed((reg37 ?
                      $signed(reg35) : reg37[(3'h5):(2'h2)]))) < {($signed(reg37) ?
                      $signed((wire32 ?
                          reg34 : (8'hb5))) : {$unsigned(wire32)})});
              reg35 <= reg34[(3'h7):(2'h2)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg38 <= (8'h9f);
      reg39 <= ($signed($signed((((7'h40) >>> wire33) || $signed(reg34)))) ?
          (~^($unsigned({(8'ha1)}) >>> $unsigned($unsigned(reg38)))) : ({({reg35,
                      reg36} ^ reg35),
                  reg36[(4'h9):(2'h3)]} ?
              $signed((~|$signed(reg34))) : reg34[(3'h6):(1'h1)]));
      reg40 <= $unsigned($unsigned((({(8'haf), wire33} ?
              $signed((8'ha5)) : (!wire33)) ?
          $signed($signed(reg34)) : {$unsigned(wire30)})));
    end
  assign wire41 = {wire32};
  assign wire42 = $unsigned(({wire33} ?
                      $signed(reg40) : ({$signed(reg35)} * (((8'h9d) >> reg39) ?
                          $signed(wire32) : (~&reg36)))));
  assign wire43 = $unsigned(wire33);
  assign wire44 = ({(^reg34[(4'h8):(2'h3)]),
                          (((~wire41) ?
                                  reg38[(2'h3):(2'h2)] : ((8'ha0) >>> wire32)) ?
                              ($unsigned((8'hb7)) ?
                                  (~&reg40) : reg34) : (&reg38[(5'h14):(5'h12)]))} ?
                      reg35[(3'h4):(1'h0)] : ($unsigned({reg37}) ~^ ({$signed((8'hb9))} > reg38[(4'hc):(3'h7)])));
  always
    @(posedge clk) begin
      reg45 <= wire42;
      if ($unsigned(($signed((wire41[(5'h11):(3'h4)] <= ((8'ha3) ?
          wire30 : wire31))) <= (!(^~(reg39 && reg39))))))
        begin
          reg46 <= wire41[(2'h3):(2'h2)];
          reg47 <= wire32;
        end
      else
        begin
          reg46 <= (^((wire42[(5'h12):(4'ha)] ?
              wire33[(2'h3):(1'h0)] : (reg36 ?
                  wire33 : (reg35 * (8'hb3)))) >> (8'hb0)));
        end
      reg48 <= $unsigned((~|((((8'hb5) * reg45) ?
              ((8'haa) ? reg46 : reg36) : (8'had)) ?
          reg38[(4'hf):(2'h3)] : $signed(reg34))));
      reg49 <= $unsigned((~$unsigned((7'h41))));
      if ((((~^$signed(wire33)) ? (8'hba) : reg36) >>> wire32[(5'h15):(2'h2)]))
        begin
          reg50 <= $signed($unsigned({(((8'hb6) ? (8'hac) : wire32) ?
                  wire32 : (reg35 && reg48))}));
        end
      else
        begin
          reg50 <= (8'hab);
          reg51 <= (+(((+reg36[(2'h2):(1'h0)]) ?
                  (~$unsigned(reg35)) : $signed((reg50 ? reg49 : wire42))) ?
              (^((+reg35) ?
                  $signed(reg37) : reg50[(3'h5):(1'h0)])) : (!wire30)));
          if ((reg34 ?
              (^~$signed(reg37[(3'h5):(1'h1)])) : ($unsigned(wire44[(4'ha):(1'h0)]) ~^ wire30)))
            begin
              reg52 <= wire33[(2'h3):(2'h2)];
            end
          else
            begin
              reg52 <= $signed(wire31[(4'h8):(3'h7)]);
              reg53 <= wire30;
              reg54 <= (~&((~&(~wire30[(5'h14):(4'hb)])) ?
                  $signed(reg38) : reg53));
            end
        end
    end
  always
    @(posedge clk) begin
      reg55 <= ((^~wire30) <<< reg45[(4'ha):(2'h2)]);
      reg56 <= $signed(((!wire44[(4'hd):(3'h7)]) * (~&wire32[(4'h9):(2'h3)])));
      reg57 <= (&((reg37[(1'h0):(1'h0)] >> reg48[(4'he):(3'h6)]) | (wire44[(4'h8):(4'h8)] ?
          $unsigned($signed((8'had))) : (!reg49[(3'h5):(2'h2)]))));
    end
  assign wire58 = reg54[(1'h0):(1'h0)];
  assign wire59 = ((^~(reg47[(2'h3):(1'h1)] > reg51[(1'h1):(1'h0)])) ?
                      reg51 : ((~&reg36[(2'h2):(2'h2)]) | {$unsigned({reg48})}));
  assign wire60 = (($unsigned(wire32) < $signed($signed((reg39 ?
                          wire58 : wire33)))) ?
                      reg46[(3'h4):(3'h4)] : (reg39 ?
                          (~^$unsigned($signed(reg55))) : (reg57[(4'hc):(3'h5)] >>> wire43)));
  assign wire61 = (((reg34 > (+(8'hbe))) < wire44[(5'h15):(1'h0)]) ?
                      (reg47[(3'h6):(1'h0)] ?
                          (((~|(8'ha8)) == $unsigned((8'ha1))) ?
                              (-$unsigned(reg50)) : (8'hbf)) : (((reg54 <<< reg37) ^~ reg45) <= wire59)) : ((^~reg40) ^ {wire58,
                          ((!wire31) && reg57)}));
  always
    @(posedge clk) begin
      reg62 <= wire59[(1'h1):(1'h0)];
      reg63 <= wire58;
      reg64 <= {(^~$signed($signed((|reg45)))), reg36};
      if ($signed(reg34))
        begin
          if (reg56[(3'h7):(1'h0)])
            begin
              reg65 <= $signed(($signed((^(wire44 ?
                  wire30 : reg64))) ~^ $unsigned(reg40[(4'h9):(3'h5)])));
              reg66 <= ({(($signed(reg52) && reg52[(3'h7):(3'h5)]) | (8'hbf)),
                  reg46[(3'h4):(3'h4)]} >> ({$signed({(8'hb0), reg38}),
                  reg39[(5'h12):(2'h3)]} + $unsigned(((|wire58) ?
                  $signed((8'hbd)) : (reg39 ? (8'hb4) : reg54)))));
              reg67 <= reg35[(4'h9):(2'h3)];
            end
          else
            begin
              reg65 <= reg52[(3'h6):(1'h0)];
            end
          reg68 <= ($unsigned((|wire30)) >>> $unsigned($signed(reg56[(2'h3):(2'h2)])));
          reg69 <= $unsigned({$signed($signed(reg56[(3'h5):(3'h4)])),
              $unsigned($unsigned((wire32 ? reg46 : reg37)))});
          reg70 <= reg50;
          reg71 <= (&{($unsigned((8'haf)) ?
                  reg37[(1'h0):(1'h0)] : {(^reg57), (wire60 == (8'ha0))}),
              $signed(((~|reg49) >= $signed(reg54)))});
        end
      else
        begin
          if (wire58[(4'ha):(2'h3)])
            begin
              reg65 <= $signed({($unsigned($unsigned(reg62)) ?
                      reg54 : ($unsigned(reg54) <<< (reg36 > reg64))),
                  ((8'h9d) ~^ $signed((reg34 <= reg34)))});
              reg66 <= $signed(reg67);
              reg67 <= {{{reg68[(5'h12):(2'h3)]}},
                  ($signed($signed((|wire31))) ?
                      ((8'h9e) ?
                          ((wire61 & wire41) ?
                              wire41 : (reg69 ?
                                  (8'ha8) : (7'h43))) : reg62[(4'he):(4'hc)]) : $unsigned((wire61 ?
                          (wire41 ^ reg51) : reg71)))};
            end
          else
            begin
              reg65 <= wire32[(4'hb):(4'ha)];
              reg66 <= $unsigned($signed(reg67));
              reg67 <= $signed($unsigned(reg64));
              reg68 <= $unsigned(reg71);
              reg69 <= $unsigned(($signed($unsigned((|(8'hab)))) ?
                  ((^(wire32 ? wire41 : reg40)) || wire60) : reg37));
            end
          reg70 <= {(wire30[(4'hf):(4'hf)] || wire41[(2'h2):(1'h1)])};
          reg71 <= wire32;
        end
    end
  assign wire72 = reg50[(4'hd):(4'h9)];
  assign wire73 = reg38[(4'ha):(4'h9)];
  assign wire74 = $unsigned($unsigned((-$signed((wire30 + reg45)))));
  assign wire75 = ($unsigned(($unsigned(reg55) ?
                          ({reg68, wire33} ?
                              $signed(reg52) : (reg66 ?
                                  wire73 : reg64)) : $signed($signed(wire58)))) ?
                      (wire59[(1'h1):(1'h1)] ?
                          (((~reg62) ? $signed(reg47) : {reg54, reg39}) ?
                              reg37[(2'h3):(2'h2)] : $unsigned((~^wire73))) : ({$unsigned(reg49)} ?
                              reg39 : (!wire33))) : (~&(($unsigned(wire33) ?
                              reg66 : $unsigned(reg71)) ?
                          $signed((wire33 > (8'ha5))) : (^$unsigned(reg64)))));
  assign wire76 = reg66[(3'h5):(2'h3)];
  assign wire77 = ($signed($unsigned({wire43})) > $signed({(!$unsigned(wire74))}));
endmodule
