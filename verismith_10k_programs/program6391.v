module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire18,
                 wire17,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
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
                 reg20,
                 reg19,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg8,
                 (1'h0)};
  assign wire5 = (wire0 >> $signed((7'h40)));
  assign wire6 = ($unsigned($unsigned((^~wire0[(5'h10):(2'h3)]))) | ((((8'hba) <= wire3[(4'hf):(4'hf)]) != (~(wire0 * wire1))) <= $unsigned(wire1[(4'h8):(4'h8)])));
  assign wire7 = {$signed(($unsigned((wire3 >> wire4)) >>> ((-wire0) >>> wire0))),
                     ((&(wire3 || (8'had))) ?
                         $signed(wire6[(4'ha):(3'h6)]) : wire2)};
  always
    @(posedge clk) begin
      reg8 <= wire1[(4'h9):(4'h9)];
    end
  assign wire9 = $unsigned(wire2);
  always
    @(posedge clk) begin
      reg10 <= wire7[(3'h6):(3'h4)];
      reg11 <= (-wire2);
      reg12 <= wire1[(2'h3):(1'h1)];
      if ($unsigned((!{($signed(wire1) ?
              (wire0 <<< (8'hb8)) : (wire3 ? (7'h41) : reg11)),
          wire9[(2'h3):(2'h2)]})))
        begin
          reg13 <= $signed(($unsigned(wire1[(4'hb):(3'h6)]) - wire1));
          reg14 <= $unsigned($signed((8'hb7)));
        end
      else
        begin
          reg13 <= wire4[(1'h1):(1'h0)];
          reg14 <= (reg8 >>> $unsigned(wire6));
          reg15 <= $signed(($unsigned(wire5[(1'h1):(1'h1)]) * (&reg13[(3'h4):(3'h4)])));
          reg16 <= (-$signed($signed((|(reg8 ? reg10 : wire1)))));
        end
    end
  assign wire17 = ((wire2[(1'h1):(1'h0)] ?
                      $unsigned($unsigned((|wire6))) : {$signed(reg8[(4'hd):(4'hc)]),
                          {(-wire4)}}) << $signed((!{reg16})));
  assign wire18 = wire5;
  always
    @(posedge clk) begin
      if ($unsigned(($signed((~|((8'ha2) ?
          wire17 : wire7))) ^ $unsigned(((^(8'ha7)) ?
          (reg11 + (8'hae)) : wire17)))))
        begin
          reg19 <= (wire18[(1'h1):(1'h0)] > reg8[(4'h9):(3'h4)]);
          reg20 <= reg12[(4'hc):(4'h8)];
          reg21 <= {$signed($unsigned($signed($unsigned(wire17)))),
              reg13[(2'h3):(2'h2)]};
          reg22 <= (~|$signed($unsigned(reg13[(2'h3):(2'h2)])));
        end
      else
        begin
          reg19 <= (&((($signed((8'hb6)) != reg12[(3'h6):(3'h4)]) ?
              ($signed(wire17) ?
                  {reg22} : (^~reg20)) : $signed(reg13[(2'h3):(2'h2)])) != wire1[(1'h0):(1'h0)]));
          reg20 <= (~|(($unsigned($signed(reg8)) ?
              wire5[(2'h2):(1'h0)] : $unsigned($signed((8'hac)))) < reg15[(5'h11):(4'hc)]));
          reg21 <= wire9;
        end
      reg23 <= {{wire2}};
    end
  always
    @(posedge clk) begin
      if ($unsigned({((^~(~|reg15)) ? wire2 : $signed((-wire4))),
          $unsigned(wire2)}))
        begin
          reg24 <= (reg12[(3'h5):(1'h1)] ?
              $signed((~^(reg13 ?
                  (!reg23) : (reg13 != reg19)))) : $signed(reg21));
          reg25 <= (({reg13[(2'h3):(2'h3)], $unsigned(wire0[(4'he):(3'h6)])} ?
                  (((~&(8'ha9)) ? ((8'hab) ? reg13 : reg11) : (~^reg22)) ?
                      $signed((reg10 <<< reg21)) : {((8'hac) >>> reg12)}) : ($signed($unsigned(reg12)) * ($signed(reg13) == $signed((7'h43))))) ?
              ($unsigned($unsigned($unsigned(reg22))) ?
                  $signed(wire7[(4'hd):(4'h9)]) : (8'ha8)) : ($unsigned($signed($unsigned((8'ha7)))) ?
                  (!{$unsigned(reg8)}) : (~|$unsigned($unsigned((8'h9e))))));
          reg26 <= (~|reg13);
          if (($signed(reg23) + ((+($signed(reg11) && {reg20})) <<< (wire7 | ((~^(8'ha7)) ?
              reg16[(3'h4):(3'h4)] : (~wire17))))))
            begin
              reg27 <= (wire9[(4'h8):(3'h4)] > $signed($unsigned((^~wire5))));
            end
          else
            begin
              reg27 <= reg23;
              reg28 <= ($signed(((reg25[(3'h7):(1'h0)] ?
                      (~^reg24) : (8'ha3)) >= (!$unsigned(reg13)))) ?
                  ($unsigned((8'hb1)) ?
                      ({reg16, (!reg16)} ?
                          $unsigned(reg19[(5'h12):(2'h2)]) : ($unsigned(wire1) >> (reg12 ?
                              reg13 : reg16))) : $signed(wire6[(3'h4):(1'h1)])) : reg26);
              reg29 <= $signed(reg24[(1'h1):(1'h0)]);
              reg30 <= (7'h40);
            end
          reg31 <= reg8[(2'h2):(1'h1)];
        end
      else
        begin
          reg24 <= $unsigned($signed((7'h44)));
        end
    end
  assign wire32 = {$unsigned((~reg20[(2'h3):(2'h3)]))};
  assign wire33 = (8'hb8);
  assign wire34 = (~^(&(~^((^~(8'hae)) & (|wire0)))));
  assign wire35 = (wire6 >> (^~$unsigned({reg22[(2'h2):(1'h0)],
                      (reg11 ? (7'h42) : wire18)})));
  assign wire36 = (!{$unsigned(reg24[(4'he):(4'h8)])});
  assign wire37 = wire3[(3'h5):(1'h0)];
  assign wire38 = (!$signed((-{reg27[(4'hf):(4'h9)]})));
endmodule
