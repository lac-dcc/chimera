module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h282):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire46,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire22,
                 wire21,
                 wire20,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 reg9,
                 (1'h0)};
  assign wire4 = {(wire1 ?
                         (($unsigned(wire1) >> wire1[(3'h6):(1'h0)]) ?
                             wire2[(4'hf):(4'hd)] : ($unsigned(wire1) ?
                                 $signed(wire2) : (|wire2))) : $signed((!$unsigned(wire0))))};
  assign wire5 = wire2[(4'hb):(3'h6)];
  assign wire6 = (((8'ha8) * {$signed((8'hb5)),
                         ($signed(wire3) <<< $unsigned(wire2))}) ?
                     (&(^~wire5)) : (~|(&wire3)));
  assign wire7 = (wire0[(4'hc):(2'h2)] >>> wire3[(4'he):(3'h6)]);
  assign wire8 = $unsigned($signed($unsigned(((wire6 ? wire4 : wire0) ?
                     {(8'hbe), wire3} : $unsigned(wire3)))));
  always
    @(posedge clk) begin
      if ($signed(wire6[(2'h3):(1'h1)]))
        begin
          if ((wire6 >>> $signed((wire0[(2'h2):(2'h2)] ?
              (&$signed(wire1)) : (wire4 ? wire1[(3'h5):(1'h0)] : wire0)))))
            begin
              reg9 <= wire2;
              reg10 <= $unsigned(reg9);
            end
          else
            begin
              reg9 <= ($unsigned($signed($signed((wire5 ? wire4 : wire6)))) ?
                  (wire6 ? (~|wire7) : wire5) : {wire7[(3'h7):(3'h6)]});
              reg10 <= (|(~|(wire5[(3'h7):(3'h7)] ?
                  ((^~wire6) ?
                      wire2 : {reg9}) : $unsigned(wire1[(4'h8):(3'h4)]))));
              reg11 <= reg9;
              reg12 <= wire0[(1'h1):(1'h1)];
              reg13 <= reg11;
            end
          reg14 <= wire7;
        end
      else
        begin
          reg9 <= (^~(^~wire1));
          reg10 <= $unsigned(wire4[(5'h12):(1'h1)]);
          reg11 <= (wire5 & (reg11 ?
              (|(~^{reg11, reg11})) : $signed((~&(|(8'haa))))));
        end
      if (((-(^~wire2)) ? (8'ha2) : wire8))
        begin
          if ((7'h40))
            begin
              reg15 <= (~($unsigned(wire5[(4'h9):(3'h5)]) ?
                  ((8'hbd) << (8'hb9)) : wire8));
              reg16 <= ($unsigned(reg11[(5'h10):(2'h3)]) <= $unsigned($signed(((!reg15) | wire6[(1'h1):(1'h0)]))));
              reg17 <= ((~&((~|wire4) ?
                  ({reg15,
                      (8'hb3)} >>> (8'hbe)) : ((wire4 <<< wire4) <<< wire0[(4'hc):(4'ha)]))) <= {(wire1[(2'h3):(1'h1)] ?
                      wire8[(3'h6):(1'h0)] : reg14)});
            end
          else
            begin
              reg15 <= (((-(8'hac)) ?
                      $unsigned(wire1) : ($signed(reg15) >= wire2)) ?
                  $signed(($unsigned($signed(reg17)) || ((wire6 ^ wire7) ?
                      $unsigned(reg14) : (+(8'hb4))))) : $unsigned($signed((~|{reg15,
                      (8'hbd)}))));
              reg16 <= reg16[(4'hb):(3'h7)];
              reg17 <= wire4;
            end
          reg18 <= (reg17[(4'hb):(4'h8)] * ((~($unsigned(wire8) ?
                  reg12 : $unsigned(wire1))) ?
              wire8[(1'h1):(1'h1)] : $unsigned({$signed((8'hb1)),
                  $unsigned(wire3)})));
          reg19 <= reg15[(2'h2):(1'h0)];
        end
      else
        begin
          reg15 <= ($signed(reg12) ?
              $signed((reg10 ?
                  {(wire4 ?
                          wire2 : reg12)} : {$signed(reg19)})) : wire5[(3'h7):(2'h3)]);
          reg16 <= $signed(wire2);
          reg17 <= reg16;
          reg18 <= (8'hbe);
          reg19 <= $signed($signed(reg14[(4'hb):(3'h4)]));
        end
    end
  assign wire20 = ((8'ha4) > $unsigned(wire0));
  assign wire21 = reg18[(3'h6):(3'h6)];
  assign wire22 = wire4[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg23 <= (reg10[(1'h1):(1'h1)] ?
          $signed((^~reg17)) : $unsigned($signed($signed((reg10 <<< wire5)))));
    end
  always
    @(posedge clk) begin
      if ((~|$signed(($signed(reg12[(4'hb):(2'h2)]) ?
          $signed(reg16[(4'hb):(3'h5)]) : (wire5 ?
              $unsigned(reg15) : {wire21, wire2})))))
        begin
          reg24 <= (8'h9e);
          if (wire21)
            begin
              reg25 <= (reg14 ?
                  ($unsigned($unsigned((reg13 ? wire5 : wire8))) ?
                      {($signed(reg19) + ((8'ha7) + reg23))} : $unsigned((-(reg18 * reg15)))) : $unsigned(reg9[(4'hd):(4'hc)]));
            end
          else
            begin
              reg25 <= reg12;
              reg26 <= (^~({$unsigned({(8'ha3)})} <= $signed($signed((|wire7)))));
              reg27 <= (reg11[(4'h9):(3'h7)] ?
                  reg26[(4'ha):(4'h9)] : $signed(reg12[(3'h5):(3'h4)]));
            end
          if ($unsigned(reg24))
            begin
              reg28 <= $unsigned({$signed($signed((wire6 || wire7))),
                  $unsigned(reg25[(1'h1):(1'h0)])});
              reg29 <= (($unsigned({(~&wire6),
                  $signed(reg28)}) + $signed(((reg9 ? wire21 : reg15) ?
                  {reg10} : (wire6 ?
                      wire2 : wire20)))) & {wire0[(4'hd):(4'hb)]});
            end
          else
            begin
              reg28 <= ($signed($signed(reg29[(1'h0):(1'h0)])) >= wire6);
              reg29 <= $signed((^$unsigned($signed((~|wire8)))));
              reg30 <= $signed(($unsigned($unsigned(reg17[(5'h11):(4'hb)])) + ((~^(wire4 < reg17)) < (((8'hb3) & wire5) ?
                  ((7'h43) ^~ reg19) : reg18))));
              reg31 <= wire0[(4'hf):(2'h2)];
            end
        end
      else
        begin
          reg24 <= reg13;
        end
      reg32 <= (({($signed(reg13) ?
                      (reg18 ? reg17 : wire6) : (wire20 ? reg26 : reg18)),
                  reg11[(4'h8):(3'h7)]} ?
              (&{{reg14}}) : ($signed((^~wire4)) > (^$signed(reg24)))) ?
          {reg27, $signed(wire7)} : (+$unsigned((~(wire2 ? reg16 : reg27)))));
    end
  assign wire33 = (^~((wire2 ?
                      ((reg9 ? wire2 : wire20) ?
                          (wire5 || reg14) : (reg18 ?
                              reg19 : reg31)) : $unsigned((~|reg15))) == $signed($unsigned($signed((8'hba))))));
  assign wire34 = {$signed({$signed($signed(reg24))}),
                      $signed(wire2[(5'h13):(4'h8)])};
  assign wire35 = (|reg26[(3'h5):(1'h1)]);
  assign wire36 = (-$unsigned(({$unsigned(wire34)} ?
                      ($unsigned(wire21) ?
                          (reg9 ?
                              (8'hb6) : (8'ha7)) : wire4[(3'h7):(3'h5)]) : (^~(reg23 ?
                          reg25 : reg14)))));
  assign wire37 = reg14[(4'hd):(4'hc)];
  assign wire38 = {({$unsigned((~|reg17)),
                          reg28} >= ((wire37 >> reg25) && $signed((reg15 ?
                          reg27 : reg29))))};
  always
    @(posedge clk) begin
      if ((8'hb5))
        begin
          reg39 <= ((|$signed((reg31[(1'h1):(1'h1)] ?
                  $signed(wire8) : (~^reg9)))) ?
              (-reg14) : {$signed((7'h42))});
          if ({{$unsigned((~reg32[(4'h8):(2'h3)]))}})
            begin
              reg40 <= ((($unsigned($signed(wire8)) < ({reg28} >> reg39[(3'h7):(1'h1)])) == ($unsigned(reg17) ?
                      {$unsigned(wire21), $signed(reg28)} : wire20)) ?
                  (($signed((reg28 ?
                          reg15 : wire33)) << wire38[(4'ha):(3'h7)]) ?
                      $signed($unsigned($signed(reg12))) : $unsigned(reg12)) : $signed(reg32));
              reg41 <= (reg24[(3'h7):(2'h3)] && {{(7'h43)}});
            end
          else
            begin
              reg40 <= $signed(reg12[(3'h4):(2'h3)]);
            end
        end
      else
        begin
          reg39 <= ($unsigned({{((8'ha6) < wire0)},
                  $signed((wire20 | reg17))}) ?
              (8'ha8) : (~^(((wire38 * (8'hbf)) ?
                  $signed(wire37) : (wire36 <<< wire22)) <<< ((wire20 != (8'hb5)) ?
                  (reg15 ^ reg39) : {(8'hb6)}))));
          reg40 <= {(!{(wire38[(2'h2):(1'h1)] ?
                      ((8'h9f) || (8'hbb)) : ((8'hb1) ? (8'ha8) : wire3))}),
              $signed($signed(((!reg15) ?
                  (reg39 ~^ reg13) : $unsigned(wire4))))};
        end
      reg42 <= wire6;
      reg43 <= $signed($signed(wire4));
      reg44 <= $signed((~$signed(wire35[(3'h5):(2'h2)])));
      reg45 <= $unsigned(reg16[(3'h7):(3'h7)]);
    end
  assign wire46 = (wire37 ? (~reg23) : ((~&wire4) >>> reg24[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      if ($signed($signed(reg17[(3'h6):(3'h6)])))
        begin
          reg47 <= (&reg30[(1'h1):(1'h0)]);
        end
      else
        begin
          if ((({reg18[(3'h7):(3'h7)]} <<< $signed(($unsigned(reg13) ?
                  wire8[(4'h8):(3'h5)] : ((8'hb3) + wire46)))) ?
              $unsigned(((wire1[(3'h4):(2'h2)] ? {reg16} : reg23) ?
                  {(^reg32),
                      {reg27,
                          (8'hae)}} : $unsigned(reg30))) : {{($unsigned(reg31) ?
                          (reg28 ? (7'h42) : wire6) : $unsigned((8'hbe))),
                      $signed($unsigned((8'hac)))}}))
            begin
              reg47 <= {($unsigned((~|((8'hbc) ?
                      reg44 : reg24))) << $signed((reg12[(3'h6):(2'h3)] ?
                      $unsigned(reg40) : reg25[(2'h3):(2'h2)])))};
              reg48 <= ($unsigned(({(wire20 ? wire3 : reg43),
                  ((8'hbc) ^ reg31)} > wire38)) && ({(wire33 ?
                      {reg23} : {wire2, wire20}),
                  ($signed(reg11) >= wire38[(3'h5):(3'h4)])} + {$unsigned((+reg32))}));
              reg49 <= (+reg47);
              reg50 <= (wire22 <<< wire46[(1'h1):(1'h1)]);
            end
          else
            begin
              reg47 <= ((&reg30) <<< (reg24 ?
                  wire0[(5'h11):(4'he)] : ((~|$unsigned(wire8)) ?
                      $unsigned(wire37) : $signed(wire36[(3'h6):(3'h4)]))));
              reg48 <= (&wire7[(3'h5):(3'h4)]);
            end
          if ($unsigned((((~(reg48 + reg49)) ~^ $unsigned((wire1 ?
                  wire1 : reg45))) ?
              $unsigned({{reg39, (8'ha0)}, (^wire5)}) : (8'haf))))
            begin
              reg51 <= $unsigned((wire5[(3'h4):(2'h3)] >>> ($unsigned(((8'ha5) + (8'hb5))) ?
                  (wire38 ?
                      {reg29, reg45} : $signed(reg49)) : (reg12[(3'h6):(2'h2)] ?
                      (reg43 + wire3) : {wire21}))));
            end
          else
            begin
              reg51 <= reg13[(1'h1):(1'h1)];
              reg52 <= $signed(wire33[(1'h1):(1'h0)]);
            end
          if ($unsigned({(8'h9f), reg19[(3'h7):(2'h2)]}))
            begin
              reg53 <= (wire33[(2'h3):(2'h3)] ?
                  $signed($unsigned(($signed(reg43) ?
                      ((8'h9e) ?
                          (8'had) : (7'h42)) : $signed(wire4)))) : $signed((($unsigned(wire0) >= reg15[(3'h5):(3'h4)]) >> ((8'ha5) ?
                      {reg50, wire37} : $unsigned(reg30)))));
              reg54 <= $unsigned(wire22);
              reg55 <= $signed(($unsigned(reg29[(2'h2):(1'h0)]) ?
                  (7'h40) : wire0[(4'hf):(4'hd)]));
              reg56 <= reg44[(1'h1):(1'h0)];
            end
          else
            begin
              reg53 <= ((~&(wire46 ^~ wire7[(3'h6):(3'h5)])) ?
                  $unsigned(($unsigned((!reg39)) ?
                      ($signed(wire21) ?
                          (!reg50) : reg53[(5'h10):(4'hf)]) : $signed(wire21[(2'h3):(2'h2)]))) : (&$signed(((reg39 ?
                      reg45 : wire6) ~^ $unsigned(reg48)))));
              reg54 <= reg50;
              reg55 <= (((8'haa) ~^ $signed(reg47)) ?
                  $signed(($signed($unsigned(reg23)) >>> (^~$unsigned(reg48)))) : $signed($unsigned($signed($unsigned(reg29)))));
            end
        end
      reg57 <= {(+wire38[(3'h7):(2'h3)])};
    end
  assign wire58 = reg10[(5'h14):(4'ha)];
  assign wire59 = ($signed(reg19) ?
                      $unsigned({(8'haa), (^reg49)}) : $unsigned((-reg54)));
  assign wire60 = $unsigned((!reg43));
endmodule
