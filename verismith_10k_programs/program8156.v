module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
                 wire20,
                 wire19,
                 wire18,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg36,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
  assign wire4 = ($signed($signed($unsigned($unsigned(wire2)))) || (wire1 ?
                     ($unsigned((+wire2)) ?
                         {wire2} : ((wire3 & wire1) - $unsigned(wire0))) : $signed(({(7'h41)} ?
                         {wire0} : $signed((8'hbe))))));
  assign wire5 = $signed(wire4);
  assign wire6 = (8'hbf);
  assign wire7 = (((&($signed((8'hb6)) << wire4[(2'h3):(2'h2)])) - wire4[(3'h7):(1'h1)]) >> wire5[(1'h0):(1'h0)]);
  assign wire8 = (wire3[(3'h4):(1'h1)] >> ((^(~&(wire1 >= wire7))) ?
                     wire1 : (wire4 + (~&(~|wire6)))));
  always
    @(posedge clk) begin
      reg9 <= $signed((~|(~^wire7)));
      reg10 <= wire6;
      if ((^reg10[(1'h1):(1'h1)]))
        begin
          reg11 <= (reg9 >= wire0[(5'h12):(4'ha)]);
          reg12 <= ($unsigned({reg11,
              wire1[(2'h2):(1'h0)]}) >= (~|$unsigned($signed(reg11[(5'h15):(4'hf)]))));
        end
      else
        begin
          reg11 <= wire5;
          reg12 <= wire0;
          if ($signed({(^(!(+wire4)))}))
            begin
              reg13 <= {($signed(((&wire1) || $signed(reg9))) ?
                      (+$signed(reg11)) : {{((7'h44) == wire0),
                              wire4[(4'h8):(3'h4)]},
                          wire2[(4'hc):(4'ha)]})};
              reg14 <= $unsigned($signed(wire6[(2'h2):(2'h2)]));
            end
          else
            begin
              reg13 <= (($unsigned((+$unsigned(wire7))) <= wire0[(4'hc):(2'h3)]) ?
                  $signed(({$unsigned((8'had))} ?
                      wire7[(5'h10):(4'hb)] : $unsigned($signed(wire4)))) : ((^$unsigned((wire1 ?
                          wire1 : wire5))) ?
                      reg10 : wire7[(3'h4):(2'h3)]));
              reg14 <= ($signed($unsigned(((wire1 <<< wire2) ?
                  (wire4 - (7'h43)) : (reg10 & reg12)))) < reg14[(4'ha):(2'h2)]);
              reg15 <= ((~|(reg10[(2'h2):(2'h2)] << (((8'hbe) ?
                  wire2 : wire6) ^~ (wire3 == reg13)))) * {(&$signed($unsigned(reg12)))});
              reg16 <= ((+((+(reg11 >= reg10)) <= (8'ha4))) + wire4[(3'h4):(3'h4)]);
            end
        end
      reg17 <= $unsigned((wire8[(3'h4):(3'h4)] ?
          (^(~wire2[(4'hc):(1'h0)])) : (^wire1[(4'hf):(3'h7)])));
    end
  assign wire18 = (+wire2);
  assign wire19 = (^~reg16[(2'h3):(2'h2)]);
  assign wire20 = (((~(~(wire6 ? wire3 : (8'h9d)))) ?
                      ((~&reg12[(4'hd):(3'h7)]) ?
                          ($signed(reg15) & (8'haa)) : $unsigned($signed((8'hb5)))) : wire3) != $signed($signed((reg11 ?
                      (reg14 ? (7'h42) : reg15) : reg10[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      if ((reg17 > reg12[(3'h7):(1'h0)]))
        begin
          reg21 <= $unsigned(({wire7} ^~ ({$unsigned(wire0),
              $unsigned((8'h9e))} || {$unsigned(reg14), (+wire6)})));
          reg22 <= ((7'h43) && reg11);
          reg23 <= ((($unsigned({wire19, wire8}) >>> wire20) ?
              (wire19 ?
                  ((reg17 >= reg15) >> {reg11, wire8}) : {{wire8,
                          wire19}}) : ((~|wire7) | (wire3 ?
                  {reg14,
                      (8'hb7)} : $unsigned(reg21)))) + ((^($unsigned((8'haf)) <<< wire7)) ?
              reg21[(2'h3):(2'h3)] : ($unsigned((reg21 != (7'h40))) ^~ ((!reg16) ?
                  wire4 : (!wire19)))));
          reg24 <= ($unsigned({($signed((8'hb9)) ?
                      (!(8'hb4)) : wire6[(2'h3):(2'h2)]),
                  ({reg9} - $unsigned(wire6))}) ?
              (~^((reg11 + reg23[(2'h2):(2'h2)]) ?
                  wire4[(3'h4):(1'h1)] : ((reg16 ? wire19 : reg9) ?
                      (wire7 == reg14) : (wire4 ?
                          reg11 : wire20)))) : $unsigned((^((wire4 * wire8) ?
                  $signed(reg11) : reg12))));
        end
      else
        begin
          reg21 <= (|$signed($signed($unsigned(wire4))));
          if (reg16)
            begin
              reg22 <= ((&$signed({(wire8 & wire19)})) ?
                  ((8'hb1) ?
                      {$unsigned(wire18),
                          ((reg16 << reg24) ?
                              wire0[(2'h2):(2'h2)] : {reg14,
                                  reg15})} : (($signed(reg13) ?
                          (+wire18) : $signed(wire2)) >= reg23[(2'h2):(1'h0)])) : wire0);
              reg23 <= (8'hac);
            end
          else
            begin
              reg22 <= (~((wire0 <<< reg23) ?
                  $signed($unsigned(reg14)) : (({wire5} ?
                          (+reg23) : ((8'h9e) ? reg13 : reg9)) ?
                      wire19 : $signed($signed(reg12)))));
              reg23 <= (~|($signed($signed(wire19)) ?
                  $unsigned((~&reg22)) : $signed($signed($unsigned(wire20)))));
            end
        end
      reg25 <= ((((reg12[(2'h3):(2'h3)] ? ((8'hbf) && wire0) : wire0) ?
                  {wire5[(1'h1):(1'h0)],
                      (wire0 ? reg10 : wire18)} : $unsigned($unsigned(reg13))) ?
              $unsigned(wire7) : $unsigned((reg17 ?
                  ((8'hbe) >>> wire0) : (wire2 && (8'ha4))))) ?
          wire5 : (^~$unsigned(($signed((8'h9c)) == wire20))));
      if (reg15[(4'hd):(4'hc)])
        begin
          reg26 <= (^(|wire8));
          reg27 <= (^reg23[(5'h11):(4'ha)]);
          reg28 <= {{wire7[(5'h11):(3'h6)], wire5},
              (((7'h40) ? (^~reg14[(4'h8):(3'h7)]) : (~|(~|reg9))) ^~ reg26)};
          reg29 <= reg11;
        end
      else
        begin
          reg26 <= {(reg22 < wire1)};
          reg27 <= (~&wire2);
          reg28 <= wire2[(2'h2):(1'h1)];
          if ((~wire19))
            begin
              reg29 <= {reg14, $signed((7'h41))};
            end
          else
            begin
              reg29 <= $signed({($unsigned(wire1[(4'hb):(3'h7)]) ?
                      $unsigned(wire5) : (~^reg29[(4'h9):(1'h0)]))});
              reg30 <= wire5;
              reg31 <= $unsigned((wire18[(3'h4):(1'h0)] ?
                  ({(&reg11), reg16} ?
                      $signed((reg23 ?
                          (8'hae) : reg28)) : reg25[(2'h2):(1'h0)]) : (reg22[(4'hd):(3'h4)] ?
                      (((8'hab) & wire7) << reg14[(2'h2):(1'h0)]) : $signed((reg30 | reg23)))));
              reg32 <= (reg9 < {{$unsigned(wire0), reg24[(1'h1):(1'h0)]}});
            end
          reg33 <= $unsigned(reg30[(3'h5):(2'h2)]);
        end
    end
  always
    @(posedge clk) begin
      reg34 <= (&{$signed(((+wire19) ? $signed(wire5) : {reg17, (8'h9d)})),
          ({(wire8 ? reg12 : wire18),
              (reg31 | (8'h9c))} | {$signed((8'hbf))})});
    end
  assign wire35 = $unsigned((^~reg33));
  always
    @(posedge clk) begin
      reg36 <= (+reg29);
    end
  assign wire37 = reg25[(4'hd):(4'ha)];
  assign wire38 = {((($signed(reg12) ?
                              (reg23 ? wire8 : reg24) : (reg24 ?
                                  reg34 : wire5)) + reg11[(3'h4):(3'h4)]) ?
                          reg15[(4'h9):(1'h0)] : ((~^(8'ha2)) <<< ((reg29 ?
                                  (8'ha1) : (8'ha8)) ?
                              (wire37 ? reg30 : reg32) : $signed(reg9))))};
  assign wire39 = $signed(wire8);
  assign wire40 = reg36[(4'h9):(3'h6)];
  assign wire41 = reg30[(1'h0):(1'h0)];
  assign wire42 = ((($signed($unsigned(reg10)) >= wire5) ?
                          wire7 : reg22[(2'h2):(1'h1)]) ?
                      reg15 : {(!(wire1 ?
                              (reg12 == (8'hbb)) : {(8'hba), reg24})),
                          (!wire7)});
  assign wire43 = wire4;
endmodule
