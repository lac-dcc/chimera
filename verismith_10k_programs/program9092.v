module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h250):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire132;
  wire signed [(3'h7):(1'h0)] wire131;
  wire [(5'h15):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire128;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire128,
                 wire52,
                 wire51,
                 wire42,
                 wire41,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire5,
                 wire4,
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
                 reg18,
                 reg19,
                 reg20,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
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
                 (1'h0)};
  assign wire4 = $unsigned((~^wire1[(3'h5):(1'h1)]));
  assign wire5 = wire1[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      if ({((($unsigned(wire0) != wire0[(5'h11):(5'h11)]) != (wire3[(4'h9):(4'h8)] & wire2[(1'h0):(1'h0)])) + {($unsigned(wire3) != wire4)}),
          ($unsigned(wire5) >= wire1)})
        begin
          reg6 <= $signed(wire4[(3'h6):(2'h2)]);
          if ((|($signed(((wire5 - wire1) ? (8'ha2) : wire5[(3'h7):(2'h2)])) ?
              wire5[(4'ha):(4'h9)] : {wire4})))
            begin
              reg7 <= (&$unsigned(wire2[(3'h6):(3'h5)]));
            end
          else
            begin
              reg7 <= ((8'hb1) << (((8'hbc) ?
                  $signed((^~reg6)) : $unsigned(wire5[(3'h5):(1'h1)])) == (+(wire3 ?
                  $signed((8'haa)) : (8'ha7)))));
              reg8 <= (~^wire0[(4'hc):(3'h7)]);
              reg9 <= reg7;
            end
          reg10 <= (~^wire4);
        end
      else
        begin
          if ($signed($unsigned(wire3)))
            begin
              reg6 <= (wire5 ? wire5 : (8'hae));
              reg7 <= (((((wire1 ? reg8 : wire2) ^~ (wire0 ^ reg10)) ?
                      (8'hb3) : (~|wire4)) ?
                  $unsigned(reg7[(3'h6):(2'h3)]) : (reg10 < $signed($unsigned(reg10)))) != ((({wire5,
                      (8'ha5)} != (8'hb5)) * reg9[(5'h11):(4'h8)]) ?
                  (wire5 >= wire0) : ((wire0[(3'h4):(1'h0)] ?
                      (8'hb4) : $unsigned(wire1)) ^~ (((7'h43) >> wire0) > $unsigned(wire4)))));
              reg8 <= {reg9};
              reg9 <= (~&wire1[(2'h3):(2'h2)]);
            end
          else
            begin
              reg6 <= (reg7[(4'h9):(3'h4)] ^~ $signed({((reg8 ?
                          (8'hbc) : reg10) ?
                      (~^reg6) : (wire3 ? reg6 : wire1))}));
              reg7 <= ($signed((~|$unsigned($unsigned(reg10)))) == $unsigned($signed((reg10 == wire1[(2'h3):(2'h3)]))));
              reg8 <= reg7[(5'h11):(4'h9)];
            end
          if (wire0)
            begin
              reg10 <= $unsigned($signed(reg8[(5'h11):(4'hf)]));
              reg11 <= (~^($unsigned(wire0) ? ((~reg7) ~^ reg6) : wire5));
              reg12 <= reg8;
              reg13 <= $unsigned({(reg7[(4'h9):(3'h6)] ?
                      reg12 : ($signed((8'h9f)) ? $unsigned(reg9) : {wire2}))});
              reg14 <= (-$unsigned(wire3[(3'h4):(2'h2)]));
            end
          else
            begin
              reg10 <= reg11[(4'h9):(1'h0)];
            end
          reg15 <= (reg8 <= (8'hb8));
          reg16 <= $unsigned($unsigned($signed(wire0[(4'ha):(3'h4)])));
          reg17 <= (~|$signed($unsigned(reg13[(2'h2):(1'h0)])));
        end
      reg18 <= reg14[(5'h13):(1'h1)];
      reg19 <= ((($signed(reg11[(4'ha):(4'ha)]) ?
                  wire3[(3'h6):(3'h4)] : (|$signed(reg7))) ?
              ((~^wire3[(5'h14):(3'h7)]) >= ((wire3 < (8'hb7)) ?
                  reg13 : {(8'hb4), reg18})) : $signed(reg10)) ?
          (((reg9[(3'h7):(1'h1)] - reg15[(1'h1):(1'h0)]) ?
              wire5[(3'h5):(2'h3)] : $unsigned(reg17[(4'h9):(1'h0)])) < (((wire0 ^~ reg9) ^~ wire0) ?
              {wire3[(1'h1):(1'h1)]} : reg11)) : (-$unsigned(((8'ha2) >= $unsigned(wire3)))));
      reg20 <= $signed(reg7);
    end
  assign wire21 = (8'hae);
  assign wire22 = {$signed(({(reg6 ? reg12 : reg18), (reg16 ? reg6 : (8'hae))} ?
                          $signed($unsigned(wire21)) : $unsigned($unsigned(reg16)))),
                      $signed(((8'hbb) ?
                          (reg10 ?
                              (reg8 || wire5) : reg16[(3'h5):(1'h0)]) : $unsigned(wire0)))};
  assign wire23 = reg7;
  assign wire24 = ((reg15[(1'h0):(1'h0)] >= wire22) ?
                      $unsigned($signed(((reg16 ? (8'hac) : wire0) && (wire0 ?
                          reg7 : reg18)))) : reg8[(4'ha):(3'h6)]);
  assign wire25 = reg8[(4'h8):(4'h8)];
  assign wire26 = $unsigned(($signed(reg13[(1'h1):(1'h0)]) ?
                      (-wire4[(2'h2):(1'h1)]) : ($signed($unsigned(wire24)) ?
                          reg18[(2'h3):(2'h2)] : reg17[(4'hb):(3'h5)])));
  assign wire27 = reg10;
  assign wire28 = wire2;
  always
    @(posedge clk) begin
      reg29 <= wire23[(2'h3):(2'h3)];
      reg30 <= ((wire22 - (((wire3 < reg7) ?
              (^~wire23) : reg18[(4'he):(3'h6)]) ?
          (reg18[(2'h3):(1'h0)] ?
              reg15 : reg20[(2'h2):(2'h2)]) : $unsigned($signed(reg29)))) != wire0[(4'h9):(1'h1)]);
      if (wire4)
        begin
          if ($unsigned(((wire3[(3'h7):(3'h5)] ? reg14 : wire4[(2'h2):(1'h1)]) ?
              (wire3[(5'h15):(2'h3)] <= ((~^reg14) ?
                  (wire24 ? wire2 : reg13) : wire4[(3'h5):(2'h2)])) : ((reg9 ?
                  wire25 : reg9) || $signed({wire3})))))
            begin
              reg31 <= $unsigned($unsigned(reg19));
            end
          else
            begin
              reg31 <= (~$unsigned((((!reg7) ?
                  (^~reg8) : (wire23 < wire21)) ^ $unsigned((wire25 != (8'hbc))))));
              reg32 <= ($unsigned(reg17) ?
                  (wire5 ? $unsigned(reg17) : (8'haf)) : (~(!(~^(wire24 ?
                      wire26 : reg20)))));
              reg33 <= $unsigned((&{({reg8, reg11} ?
                      (reg19 <<< reg32) : {wire21})}));
            end
          reg34 <= (^~$signed($unsigned({(-reg15)})));
          if (($unsigned((((7'h41) << $unsigned(reg32)) >>> ({wire27} ?
              (reg20 ? reg20 : reg30) : {wire23}))) >>> reg9[(3'h6):(1'h0)]))
            begin
              reg35 <= wire22[(4'hc):(3'h7)];
            end
          else
            begin
              reg35 <= ($unsigned($unsigned(($unsigned(wire2) <<< (reg11 ?
                      (8'haa) : reg13)))) ?
                  ($signed(((wire3 ? wire4 : (8'hba)) ?
                          $unsigned(reg9) : (7'h42))) ?
                      (wire5[(4'hb):(1'h1)] && (-reg29[(3'h5):(3'h4)])) : (((8'hbb) > $signed(wire26)) >= ({(8'h9e),
                              (8'ha3)} ?
                          wire1 : (wire0 ? reg10 : wire26)))) : (reg15 ?
                      ({(wire28 ? reg17 : wire4)} ?
                          ($unsigned(wire24) >= {wire21}) : reg31[(2'h2):(1'h1)]) : $unsigned({(reg11 != reg30),
                          $unsigned(wire1)})));
              reg36 <= wire2[(2'h3):(2'h3)];
            end
          reg37 <= $unsigned($unsigned((^{reg33, reg10[(2'h2):(1'h1)]})));
          reg38 <= $signed($unsigned(((~^$unsigned((8'hb8))) ?
              $unsigned((~^reg30)) : wire0[(5'h12):(3'h7)])));
        end
      else
        begin
          reg31 <= $unsigned({$unsigned((~^$signed(wire2))),
              $signed(wire24[(2'h3):(2'h2)])});
          reg32 <= $signed(reg29[(4'h8):(3'h5)]);
          reg33 <= $unsigned(($unsigned(reg35[(3'h6):(1'h0)]) >= {((reg12 << reg36) >>> (reg31 ?
                  (8'haf) : (7'h41)))}));
          reg34 <= ($unsigned(wire27) ^ wire25[(5'h10):(5'h10)]);
        end
      reg39 <= (((wire23 ?
              (~&(wire24 >> (7'h44))) : ($unsigned(reg7) ?
                  (~&wire2) : $signed(reg32))) ?
          $unsigned(((reg37 ~^ reg14) >> (~|reg14))) : $signed({reg19[(3'h5):(3'h5)]})) || reg36);
      reg40 <= (^(^~reg32[(2'h3):(1'h1)]));
    end
  assign wire41 = (&reg38[(3'h4):(2'h3)]);
  assign wire42 = reg10[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg43 <= wire42;
      if ($unsigned($unsigned($unsigned(reg17))))
        begin
          reg44 <= wire26;
          reg45 <= $signed(reg36);
          reg46 <= $signed({(8'haa)});
          reg47 <= wire21;
          reg48 <= $unsigned(reg31);
        end
      else
        begin
          reg44 <= wire24[(4'ha):(2'h3)];
          reg45 <= (^({reg37, (wire5 >> $signed(reg45))} ?
              reg14 : (~^({reg38, wire41} ^ reg16[(3'h7):(3'h6)]))));
        end
      reg49 <= (-reg14[(3'h7):(3'h6)]);
      reg50 <= wire0;
    end
  assign wire51 = {$unsigned($unsigned((!$signed(reg43))))};
  assign wire52 = ($signed(wire24) ? $signed(reg36[(5'h11):(5'h11)]) : reg37);
  module53 #() modinst129 (wire128, clk, wire0, reg36, reg47, wire24, reg31);
  assign wire130 = $signed(reg46[(4'h8):(1'h1)]);
  assign wire131 = reg8[(3'h7):(1'h0)];
  assign wire132 = $signed($unsigned(reg36[(5'h14):(5'h12)]));
endmodule

module module53
#(parameter param126 = (^~((!(((8'h9c) ? (8'hb8) : (8'hb2)) != {(8'hb6), (8'ha6)})) != (~^(((8'haa) & (8'hbd)) <<< {(8'hb2), (8'hbd)})))), 
parameter param127 = (~^(((param126 < (!(8'haa))) ? ((!param126) ^ (8'had)) : (^~param126)) ? (((^(8'ha6)) & param126) != (&param126)) : ((param126 ? param126 : (param126 ? param126 : param126)) ? (param126 - param126) : (param126 ? (|param126) : param126)))))
(y, clk, wire54, wire55, wire56, wire57, wire58);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire54;
  input wire signed [(4'h8):(1'h0)] wire55;
  input wire signed [(5'h13):(1'h0)] wire56;
  input wire [(5'h11):(1'h0)] wire57;
  input wire signed [(3'h4):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire121;
  wire signed [(2'h3):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire [(5'h13):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire113;
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire117,
                 wire116,
                 wire115,
                 wire77,
                 wire113,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg119,
                 reg118,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg59 <= $signed({$signed($signed(((8'hb9) <= wire55)))});
      if (wire58[(1'h0):(1'h0)])
        begin
          reg60 <= (wire56[(2'h3):(2'h3)] ?
              ($unsigned((((8'ha7) ? wire54 : wire54) ?
                  (^~wire58) : (8'hb5))) < wire57[(4'hb):(4'h8)]) : wire54);
          reg61 <= $unsigned($signed(($unsigned($signed(wire56)) <<< wire58[(3'h4):(3'h4)])));
          reg62 <= wire58;
        end
      else
        begin
          reg60 <= $signed($signed(wire56[(2'h3):(1'h0)]));
          reg61 <= (wire54 >>> reg61[(3'h7):(3'h4)]);
          reg62 <= $unsigned((wire54[(2'h2):(1'h1)] ~^ ($unsigned((8'hb0)) ?
              ({wire57} >= {reg59, wire57}) : reg61)));
        end
      if ((wire55[(3'h6):(3'h6)] == reg59[(2'h2):(1'h1)]))
        begin
          if ((($signed(wire56[(2'h2):(1'h0)]) & wire58) == wire58))
            begin
              reg63 <= reg62[(5'h12):(5'h11)];
              reg64 <= (reg62 * (+$signed(reg63[(4'hc):(3'h6)])));
              reg65 <= (-(($unsigned($unsigned(wire57)) || reg61[(2'h3):(2'h3)]) && (($unsigned((8'haf)) ^~ $unsigned(wire55)) ?
                  $unsigned((reg59 > (8'hb8))) : $unsigned(((8'ha7) ?
                      (8'hbf) : (8'hb5))))));
              reg66 <= $unsigned((reg64[(3'h7):(3'h4)] ?
                  $unsigned(($signed(reg64) ?
                      $signed(reg65) : $unsigned(reg61))) : wire56));
            end
          else
            begin
              reg63 <= wire54[(3'h7):(3'h7)];
              reg64 <= reg66[(3'h6):(1'h1)];
              reg65 <= (((reg62 > wire58) >= $unsigned((8'hba))) ?
                  (($unsigned(reg62) ?
                      reg59[(1'h1):(1'h0)] : ($signed(reg65) ?
                          reg60 : $unsigned(reg60))) & $signed($unsigned((wire56 & (8'hb2))))) : $signed($unsigned($unsigned((!reg65)))));
              reg66 <= ((&(((reg62 ?
                  (7'h41) : reg66) << $signed(reg59)) <<< ($unsigned(reg64) ~^ $signed(reg63)))) < (-(-wire58[(1'h1):(1'h1)])));
              reg67 <= wire57[(5'h10):(2'h3)];
            end
          reg68 <= $unsigned(({(-$signed(wire55))} && $signed(wire56[(2'h2):(1'h1)])));
          reg69 <= (~&wire58[(2'h2):(1'h1)]);
          if ($unsigned(((~&(~reg62[(4'he):(2'h3)])) ?
              reg69 : ((!reg69[(2'h2):(1'h0)]) ?
                  wire55 : {reg64, $unsigned((8'hae))}))))
            begin
              reg70 <= reg61[(4'h8):(1'h1)];
              reg71 <= ($signed((^reg67)) ^ (~^(((reg63 ? reg70 : reg65) ?
                      (reg65 | wire57) : wire56) ?
                  {reg63, (reg62 ^ (8'hb0))} : reg70)));
            end
          else
            begin
              reg70 <= ($signed((reg64 ?
                      (reg71[(4'h9):(3'h5)] << {reg68,
                          reg62}) : (~|$unsigned(wire54)))) ?
                  reg62 : ($signed({$signed(reg66)}) ?
                      {({reg66, reg59} || (reg70 | wire58)),
                          ((~|wire57) || (~&reg70))} : (((reg69 > wire54) - (wire57 ~^ reg67)) >>> $unsigned($unsigned(reg66)))));
              reg71 <= (&reg70);
              reg72 <= ($unsigned(((~&$unsigned(wire57)) >> reg69[(1'h0):(1'h0)])) ?
                  $unsigned(reg62[(3'h7):(3'h6)]) : reg61[(3'h6):(3'h5)]);
              reg73 <= $signed(reg65[(1'h0):(1'h0)]);
              reg74 <= (-($signed(((reg66 - (8'hbf)) ~^ (wire54 ?
                  reg71 : reg59))) & (wire57[(4'hc):(3'h4)] || {reg68[(3'h5):(3'h5)],
                  (~|wire55)})));
            end
        end
      else
        begin
          if ($signed({reg67[(2'h2):(1'h0)],
              $unsigned(((~&wire55) ? $unsigned(reg63) : (~|(8'ha8))))}))
            begin
              reg63 <= (({((~wire55) <<< reg64[(2'h3):(2'h2)])} * wire55) ?
                  (8'hb6) : ((8'h9e) ?
                      $unsigned($unsigned($signed(reg66))) : (&(&reg72[(4'h9):(3'h6)]))));
              reg64 <= $signed(reg74);
              reg65 <= ((~|(reg71[(3'h4):(2'h2)] | {reg73[(1'h1):(1'h1)],
                      reg67})) ?
                  (8'haa) : (8'ha6));
              reg66 <= wire54;
              reg67 <= (reg64[(3'h4):(2'h3)] ?
                  reg64[(1'h0):(1'h0)] : $unsigned($unsigned(wire54)));
            end
          else
            begin
              reg63 <= (~|reg70[(4'h9):(2'h2)]);
              reg64 <= (^~(|(~|reg61[(1'h0):(1'h0)])));
              reg65 <= $unsigned((7'h43));
              reg66 <= $unsigned((($unsigned($signed(reg70)) ?
                  (reg74[(1'h1):(1'h1)] ? (8'h9e) : reg64) : $unsigned((reg72 ?
                      reg70 : reg74))) == reg60));
              reg67 <= wire56;
            end
          if ($signed($unsigned($unsigned({{(8'hac)},
              (reg62 ? (8'hb5) : reg59)}))))
            begin
              reg68 <= $signed(reg71);
              reg69 <= $signed($signed((~|(-{(8'haf), wire56}))));
              reg70 <= ((8'hb1) >> reg66[(2'h3):(1'h0)]);
              reg71 <= {wire56, (8'hb3)};
              reg72 <= reg74;
            end
          else
            begin
              reg68 <= ({((wire58 ?
                      reg62[(5'h11):(5'h11)] : $signed((7'h44))) == (~^$unsigned(reg63))),
                  reg63} >> {(8'h9e)});
              reg69 <= $signed((|((((8'hb2) ^~ reg59) < ((8'hb1) ?
                      reg71 : wire58)) ?
                  (wire56 ?
                      $unsigned((8'ha0)) : wire56) : (~^((7'h40) || (8'hae))))));
              reg70 <= reg70[(4'he):(4'h8)];
            end
          reg73 <= (~&wire56);
        end
      reg75 <= (^reg74);
      reg76 <= wire54;
    end
  assign wire77 = ((wire57[(4'h8):(4'h8)] ?
                      reg61[(1'h1):(1'h1)] : reg76) + (+reg71));
  module78 #() modinst114 (.wire83(reg65), .wire80(reg68), .wire79(wire56), .y(wire113), .wire82(reg63), .clk(clk), .wire81(reg76));
  assign wire115 = reg64;
  assign wire116 = $unsigned($unsigned(($unsigned({wire55}) ?
                       (8'h9d) : (^~$signed((8'hb2))))));
  assign wire117 = {wire77[(3'h6):(3'h6)]};
  always
    @(posedge clk) begin
      reg118 <= reg64;
      reg119 <= $signed(reg118[(4'h8):(1'h0)]);
    end
  assign wire120 = (~|$signed(reg74));
  assign wire121 = (^{(reg63 == (((8'ha5) >>> reg70) && reg66))});
  always
    @(posedge clk) begin
      if ($signed(($signed(reg66) << {reg73})))
        begin
          reg122 <= (8'hac);
        end
      else
        begin
          reg122 <= (~&reg118);
          reg123 <= (^(((8'h9f) ?
              (reg67 ?
                  reg59[(1'h0):(1'h0)] : (reg72 ?
                      reg61 : wire56)) : $unsigned((reg59 ?
                  (8'had) : reg70))) == (~^{reg64[(1'h1):(1'h1)],
              (reg122 << reg73)})));
        end
      reg124 <= wire115;
      reg125 <= $unsigned((wire56[(4'hd):(1'h0)] > (((wire116 * (8'ha9)) >>> reg64) ?
          $unsigned($signed(reg119)) : reg118[(3'h7):(3'h5)])));
    end
endmodule

module module78
#(parameter param112 = ((^((((8'hb2) ? (8'hbd) : (8'ha0)) | ((8'ha7) ~^ (8'hb1))) ? (((8'hbb) ? (8'ha5) : (7'h44)) ? {(8'hba)} : ((8'h9f) ? (8'hb0) : (8'hba))) : ((8'ha7) ~^ ((8'hb7) ? (8'hbf) : (8'hb5))))) ? (((~|((8'hb3) ? (8'ha1) : (7'h43))) & {(^(8'hab)), ((8'hba) ? (8'ha1) : (8'hb0))}) ? ((((7'h42) <= (8'h9f)) ? (^(8'hb1)) : (~^(8'ha4))) ^ (((8'hb7) <= (7'h43)) && ((8'hb7) ? (8'hb8) : (8'h9d)))) : ((8'hab) >= {((7'h43) + (7'h44))})) : (-(^{((8'hbc) & (8'hbe)), ((8'hb6) ? (8'h9d) : (8'hb9))}))))
(y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire83;
  input wire signed [(4'he):(1'h0)] wire82;
  input wire signed [(5'h14):(1'h0)] wire81;
  input wire signed [(4'hf):(1'h0)] wire80;
  input wire [(5'h13):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  assign y = {wire111,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire85,
                 wire84,
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
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire84 = {(~(~^$signed(wire82))),
                      (wire83 == (|{$unsigned(wire83), wire80}))};
  assign wire85 = wire80[(4'h9):(3'h7)];
  always
    @(posedge clk) begin
      reg86 <= (wire84 ^~ ((((wire83 ^~ wire79) < wire84) << ($unsigned(wire84) ?
          (wire85 >>> wire84) : $unsigned((8'hb5)))) << (((wire81 ?
              (8'hb2) : wire85) ^ $unsigned(wire83)) ?
          ($unsigned(wire85) == (wire84 ^~ (8'hb5))) : wire85[(5'h14):(3'h4)])));
      reg87 <= $signed(wire83);
      reg88 <= {{$unsigned(($signed(wire79) ?
                  (+(8'hb5)) : wire85[(5'h12):(1'h0)])),
              $signed($unsigned(reg87))}};
      if ({$unsigned({reg88[(4'hb):(2'h2)],
              ($signed(wire83) << $signed((8'hbb)))})})
        begin
          reg89 <= $signed($unsigned($unsigned(wire82[(3'h4):(1'h1)])));
          reg90 <= (reg89[(1'h1):(1'h1)] ?
              (8'hbe) : ((($signed(wire80) ?
                          (reg86 ^~ wire79) : $signed(reg88)) ?
                      $signed((wire79 ? wire84 : reg88)) : wire80) ?
                  {wire79} : ($signed(((8'ha9) | (8'hbd))) ?
                      $unsigned((reg89 ? reg88 : wire82)) : $signed((reg88 ?
                          reg89 : wire83)))));
          reg91 <= wire79[(3'h4):(1'h0)];
          reg92 <= reg86[(1'h0):(1'h0)];
        end
      else
        begin
          reg89 <= (((reg91 ?
              (~(wire80 ? wire85 : reg91)) : {reg86}) <<< (|(^~(reg92 ?
              wire81 : (8'ha7))))) <<< reg92[(2'h3):(2'h3)]);
          reg90 <= wire85;
          reg91 <= reg87;
        end
      reg93 <= reg89[(1'h0):(1'h0)];
    end
  assign wire94 = (&(8'hb9));
  assign wire95 = {reg91[(2'h2):(1'h1)]};
  assign wire96 = ($signed($signed(({reg89} ? ((8'hb4) > reg88) : {wire83}))) ?
                      ({(8'hb4)} + ({{wire80}} > (-$signed(reg88)))) : $unsigned(((+(reg90 ?
                          reg88 : wire94)) << ((~wire79) ?
                          (^reg89) : wire85[(3'h4):(1'h0)]))));
  assign wire97 = $signed($signed($signed(reg89[(1'h1):(1'h1)])));
  assign wire98 = $signed((($unsigned(wire81) ?
                      reg89 : ({wire94, wire96} ?
                          ((7'h42) ?
                              wire97 : wire95) : (wire96 >= wire85))) && $unsigned($signed(wire97[(2'h2):(1'h1)]))));
  assign wire99 = $unsigned((~^(^((!reg87) ?
                      (wire80 >>> wire94) : {wire80, wire96}))));
  assign wire100 = {$unsigned(reg92[(3'h4):(2'h3)]), reg86[(1'h1):(1'h0)]};
  always
    @(posedge clk) begin
      reg101 <= (8'hb7);
      if (reg90)
        begin
          reg102 <= ((&(($unsigned(wire94) != reg87[(2'h3):(2'h2)]) ?
                  ({reg92} ?
                      reg87[(4'ha):(4'ha)] : (wire85 ?
                          reg90 : wire84)) : wire79[(4'hf):(4'hc)])) ?
              $unsigned(reg87[(4'he):(2'h3)]) : reg88[(5'h11):(4'h9)]);
          reg103 <= wire85;
          reg104 <= $signed(wire85);
          reg105 <= (&{((reg92 ?
                  (~wire100) : $unsigned(reg102)) >> $signed(((8'hb1) ?
                  reg87 : reg89))),
              (~reg89)});
        end
      else
        begin
          reg102 <= ($signed($unsigned(reg102)) >= ({((8'h9d) << reg92[(5'h10):(1'h1)]),
              reg103[(1'h1):(1'h0)]} || (~&(~^reg103))));
          if ($signed((reg101[(3'h6):(3'h6)] < $signed((~&wire94[(2'h2):(1'h0)])))))
            begin
              reg103 <= wire81;
              reg104 <= (reg88 ?
                  reg104 : (reg89 & (wire85 != wire82[(1'h1):(1'h0)])));
              reg105 <= $unsigned(wire94);
            end
          else
            begin
              reg103 <= (({wire84,
                      ((wire82 <= wire95) ^ (wire99 <= (8'hb6)))} >>> reg87) ?
                  ($signed($unsigned({reg87})) >> reg92[(4'he):(4'he)]) : ((~&{(wire99 ?
                          wire96 : wire79)}) || ({wire96,
                      {(7'h42), reg93}} != wire85[(4'h9):(1'h0)])));
              reg104 <= reg101;
              reg105 <= $unsigned(wire99);
              reg106 <= (^(wire99 ?
                  ({wire95} ?
                      reg87[(5'h11):(3'h5)] : $unsigned(((7'h43) ?
                          (7'h44) : wire100))) : ((wire99 ?
                          {wire95} : reg93[(2'h3):(2'h2)]) ?
                      (reg93[(3'h5):(1'h0)] ?
                          $unsigned(wire85) : $signed(reg90)) : (~$signed(wire85)))));
              reg107 <= (wire94[(2'h2):(1'h0)] ? (^$unsigned(wire81)) : reg101);
            end
          reg108 <= (reg103 - $signed($signed($unsigned((reg101 ?
              reg105 : wire96)))));
        end
      reg109 <= $unsigned($unsigned(reg106));
      reg110 <= wire96;
    end
  assign wire111 = wire79[(4'hf):(3'h5)];
endmodule
