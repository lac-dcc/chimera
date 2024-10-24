module top
#(parameter param78 = (((^~((8'haa) < ((8'ha3) * (8'hb5)))) ? {{((8'hb4) >>> (8'ha5)), (^(8'hbe))}, ((~(8'hbe)) && {(8'h9d)})} : {(^((7'h42) ^ (8'hb8))), {{(8'hb5)}, ((8'ha5) ? (8'ha6) : (7'h43))}}) + ((({(8'ha4), (7'h44)} >= ((8'hb1) ? (8'ha6) : (8'hbc))) ? {(~^(8'hb1)), ((8'haf) ~^ (8'hac))} : ({(8'hb0)} ? ((8'ha0) < (8'ha5)) : {(8'hbd), (8'ha8)})) ? ((((8'hb4) ? (8'h9c) : (8'h9d)) >> ((8'h9c) ? (8'had) : (8'haf))) <<< {{(8'had), (8'hb6)}, ((8'hbb) ? (8'hbf) : (8'ha3))}) : ((~(-(8'ha0))) & (((8'hb8) ? (8'hb9) : (8'ha7)) >= (^~(8'haa)))))), 
parameter param79 = param78)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  assign y = {wire76,
                 wire25,
                 wire24,
                 wire6,
                 wire5,
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
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire5 = wire3[(3'h6):(3'h5)];
  assign wire6 = wire5[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      if ($signed(wire1))
        begin
          reg7 <= (wire3[(3'h6):(2'h3)] * (~|wire0));
          reg8 <= (wire2[(1'h1):(1'h0)] ^ ($unsigned((((8'hb6) ?
                  reg7 : (8'h9f)) ?
              wire2[(1'h1):(1'h1)] : $unsigned(wire0))) >= (($signed(wire1) ?
              $unsigned(wire4) : $unsigned(wire3)) || (8'ha2))));
          if (((!wire2[(1'h0):(1'h0)]) <<< (($signed(wire6) ?
              $unsigned((wire3 <= reg8)) : (-wire1[(2'h2):(1'h1)])) >> (((wire2 ~^ wire6) <<< wire4) <<< (((8'hae) ?
              wire0 : wire0) + $unsigned(wire6))))))
            begin
              reg9 <= reg8[(4'he):(3'h5)];
              reg10 <= ($signed({((reg8 << wire2) ?
                          wire5[(3'h4):(3'h4)] : reg9),
                      $unsigned(wire2[(1'h1):(1'h0)])}) ?
                  ({(^((8'hb9) ?
                          reg8 : reg9))} == $signed({$unsigned(wire3)})) : reg8[(4'hc):(3'h4)]);
              reg11 <= $signed({($signed(wire5) ?
                      wire0 : (((8'ha0) ? wire0 : wire4) * (wire1 ?
                          wire3 : wire5)))});
            end
          else
            begin
              reg9 <= wire2;
            end
          reg12 <= (|(8'hb2));
        end
      else
        begin
          reg7 <= $unsigned((&(wire2 ?
              $signed((reg9 ? (8'hbb) : (8'h9c))) : ((wire4 == wire1) ^ (reg10 ?
                  reg12 : wire4)))));
          reg8 <= wire2[(1'h0):(1'h0)];
          reg9 <= ({(^~($signed((8'h9e)) ? $signed(reg7) : (~&wire6))),
              $unsigned({wire5[(4'hc):(3'h5)]})} <= ((-$unsigned((wire2 ?
              wire5 : reg12))) + reg8[(5'h12):(2'h3)]));
          reg10 <= reg9[(3'h6):(2'h2)];
          if ($unsigned((reg9 ?
              ($signed({wire0}) ?
                  $signed((reg8 != reg10)) : ((wire3 - (8'hb7)) << wire2[(1'h0):(1'h0)])) : (wire5[(1'h0):(1'h0)] != ($signed(wire4) << $signed(wire6))))))
            begin
              reg11 <= $signed(wire5);
              reg12 <= (+$unsigned(wire6));
              reg13 <= ((+(((8'ha0) ?
                  $signed(reg11) : wire5[(3'h4):(3'h4)]) * (|$unsigned((8'hac))))) >> reg9[(1'h0):(1'h0)]);
              reg14 <= wire0;
            end
          else
            begin
              reg11 <= {wire0[(1'h1):(1'h0)], wire5};
              reg12 <= $unsigned(reg12);
              reg13 <= $unsigned((-reg14[(4'hc):(4'ha)]));
            end
        end
      reg15 <= reg14[(2'h2):(2'h2)];
      if (reg8)
        begin
          reg16 <= (reg10 < reg12[(4'he):(4'he)]);
          if (reg15)
            begin
              reg17 <= (~$unsigned($unsigned(($signed(wire2) & $signed(wire6)))));
            end
          else
            begin
              reg17 <= (({(|reg17)} | reg15[(1'h0):(1'h0)]) ?
                  $signed(reg13[(3'h5):(3'h5)]) : (~^(8'hb8)));
            end
          reg18 <= reg7;
          reg19 <= reg18;
          if (reg19[(1'h0):(1'h0)])
            begin
              reg20 <= $signed(($signed(reg11[(3'h5):(2'h3)]) | ({{(8'hae),
                          reg14},
                      (reg11 ? wire2 : reg18)} ?
                  wire1 : $signed(reg13[(1'h1):(1'h0)]))));
              reg21 <= $unsigned($signed($unsigned(wire0[(3'h4):(1'h0)])));
              reg22 <= wire6;
              reg23 <= $signed(reg10);
            end
          else
            begin
              reg20 <= $unsigned((8'h9d));
              reg21 <= $signed($signed($unsigned(wire3[(3'h6):(1'h1)])));
              reg22 <= reg18;
              reg23 <= reg19;
            end
        end
      else
        begin
          reg16 <= reg14[(2'h3):(1'h0)];
          reg17 <= (^~((7'h44) ? reg13[(3'h6):(3'h6)] : (8'hae)));
          reg18 <= ($signed($signed((reg18[(2'h2):(1'h1)] <<< (reg7 ?
              reg22 : wire6)))) ^ {wire6[(2'h3):(2'h2)],
              ($unsigned((7'h42)) || ($unsigned(wire6) ?
                  $unsigned(reg18) : $signed(wire2)))});
        end
    end
  assign wire24 = (~reg18);
  assign wire25 = reg18;
  module26 #() modinst77 (wire76, clk, wire25, reg20, wire4, wire2, wire5);
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire31;
  input wire signed [(4'hb):(1'h0)] wire30;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire [(5'h15):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire65,
                 wire64,
                 wire63,
                 wire42,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire32,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
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
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg41,
                 reg34,
                 (1'h0)};
  assign wire32 = $unsigned((!wire31[(4'he):(3'h5)]));
  assign wire33 = wire31[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg34 <= (^~$signed((+wire30)));
    end
  assign wire35 = ((+wire28[(5'h12):(4'hd)]) && {wire30[(3'h4):(2'h3)]});
  assign wire36 = {(!(wire28 > (wire27 ~^ wire35[(1'h1):(1'h1)]))),
                      {$unsigned((!wire29)),
                          (wire32[(4'he):(4'ha)] > $unsigned(((8'haa) * wire32)))}};
  assign wire37 = $unsigned(wire36[(3'h5):(2'h3)]);
  assign wire38 = ((wire37[(4'hb):(4'h8)] <<< $signed({$signed(wire28),
                          (~wire35)})) ?
                      wire31 : wire37[(3'h5):(2'h3)]);
  assign wire39 = wire35;
  assign wire40 = $unsigned($signed(wire37[(4'hd):(3'h4)]));
  always
    @(posedge clk) begin
      reg41 <= (8'ha9);
    end
  assign wire42 = (($signed(wire31[(3'h4):(2'h3)]) ?
                          ((wire27 >= (|wire28)) ?
                              {((8'hae) ?
                                      wire31 : wire33)} : wire40[(3'h7):(1'h0)]) : {$signed((~|reg41))}) ?
                      (~|(~((wire40 != (8'hbe)) > ((8'ha1) && (8'ha1))))) : wire31[(3'h7):(2'h3)]);
  always
    @(posedge clk) begin
      if (wire40)
        begin
          if (wire38[(1'h1):(1'h0)])
            begin
              reg43 <= wire33[(3'h4):(1'h1)];
              reg44 <= wire30[(2'h3):(2'h3)];
              reg45 <= (((~|$unsigned($unsigned((8'hba)))) | wire36[(3'h5):(3'h4)]) ?
                  (&$unsigned(({wire37} ?
                      $unsigned(reg43) : (~|reg34)))) : $unsigned($signed(({wire31,
                      wire28} && (^(8'hb7))))));
              reg46 <= $signed($signed(wire39[(2'h3):(2'h2)]));
            end
          else
            begin
              reg43 <= wire37;
            end
        end
      else
        begin
          if (wire40[(5'h13):(3'h7)])
            begin
              reg43 <= reg41;
              reg44 <= reg46[(4'h8):(3'h7)];
              reg45 <= ((|$unsigned(((~|wire28) ?
                  wire36[(3'h6):(1'h0)] : reg44))) << (&$unsigned((+$signed(reg44)))));
            end
          else
            begin
              reg43 <= $signed((~|$signed((&reg44))));
              reg44 <= (^$unsigned(((wire35 >= (wire38 * (8'ha7))) || (~(|wire29)))));
            end
          reg46 <= reg46[(3'h5):(3'h4)];
          if (reg45)
            begin
              reg47 <= wire39[(1'h1):(1'h1)];
            end
          else
            begin
              reg47 <= $signed($signed(wire38[(2'h2):(1'h1)]));
              reg48 <= $signed(((^~($unsigned(wire31) * {wire39, reg45})) ?
                  $unsigned((^~wire37[(5'h10):(4'hb)])) : {((&wire32) ?
                          wire40 : (!wire35))}));
              reg49 <= wire33;
            end
        end
      if ($unsigned((!reg43)))
        begin
          if (($unsigned($unsigned((+(reg44 ?
              wire28 : wire37)))) >> wire30[(4'h8):(2'h2)]))
            begin
              reg50 <= {reg41, (&$signed((reg34 - {reg47})))};
              reg51 <= $unsigned(wire31[(5'h13):(3'h5)]);
            end
          else
            begin
              reg50 <= (~(~|$unsigned(reg41[(4'he):(3'h6)])));
              reg51 <= ($signed({(reg51[(2'h3):(2'h2)] != {wire30, reg41})}) ?
                  (($signed($signed(wire42)) * wire28[(2'h2):(1'h0)]) ?
                      ((wire39[(2'h2):(1'h0)] & {reg34, wire28}) ?
                          {reg51} : ((wire33 ? wire28 : reg51) ?
                              reg45 : (reg49 & wire30))) : (((wire32 >= reg48) + (wire42 <= wire30)) ?
                          $unsigned(((8'hb9) ?
                              wire29 : wire42)) : ((wire35 > reg43) <= $unsigned((7'h40))))) : $unsigned((+$signed($signed(wire30)))));
              reg52 <= wire36[(3'h5):(1'h0)];
            end
          if (wire33)
            begin
              reg53 <= ($signed($signed((7'h43))) ?
                  ((^~$unsigned((8'hb2))) + reg49[(4'ha):(2'h2)]) : wire35);
              reg54 <= $unsigned(($unsigned($unsigned((&reg50))) ?
                  ($unsigned({wire30, reg47}) ?
                      ((reg34 < reg45) || (reg49 ?
                          reg46 : wire28)) : ((reg45 ^ reg49) == (wire40 >= reg44))) : ($signed((wire36 ?
                          reg41 : (8'haa))) ?
                      wire38 : $signed($unsigned(reg46)))));
            end
          else
            begin
              reg53 <= ({(((+wire32) > reg53) >>> reg52[(1'h1):(1'h1)])} | (((^~(wire42 >> wire32)) - reg41[(4'ha):(1'h0)]) ?
                  (8'hbb) : reg47[(4'h8):(3'h6)]));
              reg54 <= reg48[(2'h2):(2'h2)];
              reg55 <= (reg45[(4'h9):(2'h3)] ?
                  (({reg47,
                      $signed(wire35)} > (reg48[(1'h1):(1'h1)] == (wire32 ?
                      reg44 : (8'ha3)))) <= $signed((wire39[(1'h1):(1'h1)] || (reg54 ?
                      (8'hba) : reg48)))) : wire27);
              reg56 <= (!wire29);
            end
        end
      else
        begin
          reg50 <= (8'ha2);
          reg51 <= (({($unsigned(wire37) ^~ reg53[(4'hd):(1'h0)]),
                  $unsigned((~reg49))} ?
              $unsigned((^~wire27[(4'h9):(1'h1)])) : $signed(((!wire35) * reg47))) ^~ {$unsigned(wire29[(3'h6):(1'h0)])});
          if ({$unsigned(($unsigned((!(8'hae))) ?
                  ((reg43 > wire28) ? wire28 : $unsigned(wire30)) : (-(wire30 ?
                      reg51 : wire32))))})
            begin
              reg52 <= ((-wire36) ?
                  ($signed($signed((wire28 ^ wire39))) | $unsigned({wire28[(5'h11):(2'h2)],
                      (wire28 & reg48)})) : (wire42[(2'h2):(1'h1)] ?
                      wire30 : reg41));
            end
          else
            begin
              reg52 <= wire42[(1'h1):(1'h0)];
            end
          reg53 <= $unsigned($unsigned((reg52 < ({reg55, reg46} ?
              $signed(reg48) : (wire30 ? wire38 : reg43)))));
          reg54 <= $signed((wire27 && ((reg49[(4'h8):(3'h4)] - $unsigned(wire42)) > {(reg45 | wire37)})));
        end
      reg57 <= reg43[(3'h6):(1'h1)];
      reg58 <= (!$signed($unsigned((wire33[(4'hd):(4'h8)] ?
          ((8'hb4) ^ wire27) : reg45[(2'h3):(2'h2)]))));
    end
  always
    @(posedge clk) begin
      reg59 <= ($unsigned(({$signed(wire32), $signed((7'h42))} ?
              ($signed(reg44) - (8'h9d)) : {(wire38 + wire38), (^~reg50)})) ?
          $signed($signed(((reg41 <<< reg34) ?
              {wire32} : reg56))) : (($unsigned((8'hbc)) ?
              ((reg43 ? reg51 : reg48) ?
                  $unsigned(wire31) : wire28) : wire40[(2'h2):(1'h1)]) && (~&reg51[(2'h2):(1'h1)])));
      reg60 <= (({$signed(((8'hb8) ^ wire35)), $signed($unsigned(reg55))} ?
              ((-$signed((8'hb7))) && wire36) : ((~$signed(reg41)) >> wire27)) ?
          $unsigned($signed($signed(reg46[(1'h0):(1'h0)]))) : {$unsigned($signed($unsigned(reg54))),
              reg41[(5'h10):(1'h1)]});
      reg61 <= wire27[(4'ha):(4'ha)];
    end
  always
    @(posedge clk) begin
      reg62 <= reg51[(1'h0):(1'h0)];
    end
  assign wire63 = $unsigned(wire39[(2'h3):(2'h2)]);
  assign wire64 = (~&(wire36[(2'h3):(2'h3)] ~^ ((~|(reg52 || wire29)) && (reg43[(3'h7):(2'h2)] ~^ {reg46}))));
  assign wire65 = wire63[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      if ($signed((reg50[(3'h6):(3'h5)] > ($unsigned($signed(reg51)) + reg60[(4'hc):(4'ha)]))))
        begin
          reg66 <= (~|$unsigned((|(~^reg56[(4'h8):(1'h0)]))));
          reg67 <= $unsigned($signed((7'h44)));
          reg68 <= (reg58[(2'h3):(1'h1)] ?
              $unsigned(reg55) : ((((wire42 > reg60) ?
                      reg45 : ((8'hbe) - reg57)) ?
                  reg46[(4'hb):(4'h8)] : ((reg51 == reg47) ?
                      {reg54,
                          reg50} : (^~(7'h43)))) || (!$unsigned((^wire35)))));
        end
      else
        begin
          if (reg61[(4'h8):(3'h6)])
            begin
              reg66 <= $signed(($unsigned(($unsigned(reg68) >>> reg41)) ?
                  (~|(!((8'ha6) ? reg52 : reg68))) : {{(wire35 <= wire39),
                          $unsigned(reg60)}}));
              reg67 <= (~^wire64[(4'he):(3'h7)]);
              reg68 <= reg61;
              reg69 <= {{((~^(reg58 ? reg49 : reg52)) ~^ $signed((reg57 ?
                          wire37 : (8'hb7)))),
                      reg50[(3'h7):(3'h6)]}};
            end
          else
            begin
              reg66 <= (+(!reg44));
              reg67 <= ($unsigned({({reg60, reg61} ?
                      (reg50 ^ reg57) : (reg55 > wire38))}) || (($unsigned({reg43}) ?
                  ($signed(reg61) == (wire32 ? (8'hb4) : wire28)) : ({reg58} ?
                      $unsigned(reg41) : {wire32,
                          reg56})) | (-($unsigned(reg59) ?
                  $signed(reg67) : reg52[(1'h1):(1'h1)]))));
              reg68 <= (wire39 >>> reg47[(3'h5):(2'h3)]);
              reg69 <= wire32;
              reg70 <= ($signed((!({reg56} ? reg52 : wire33[(1'h1):(1'h0)]))) ?
                  reg59[(1'h0):(1'h0)] : (~&(~|(reg49 < $signed(reg34)))));
            end
          reg71 <= $unsigned(reg62);
        end
      reg72 <= (~&$signed($unsigned({wire65[(3'h5):(1'h1)],
          (wire32 ^~ wire33)})));
    end
  assign wire73 = ($signed(reg60) ?
                      ($unsigned((~&(~|reg44))) ?
                          $unsigned(reg43) : reg60) : ((+({wire27} << (wire37 ?
                          reg66 : reg54))) > $unsigned((~|reg41[(3'h7):(1'h0)]))));
  assign wire74 = {wire32[(1'h1):(1'h0)],
                      $unsigned({((wire33 ? reg52 : wire32) ^~ $signed(reg61)),
                          {$signed(wire30), wire31}})};
  assign wire75 = (reg41 && {(^~($signed(wire73) ?
                          reg56[(2'h2):(1'h0)] : (&reg69))),
                      (wire32[(5'h11):(1'h0)] ^~ reg57[(3'h4):(2'h3)])});
endmodule
