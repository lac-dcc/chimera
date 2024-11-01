module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire27,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire5,
                 reg26,
                 reg25,
                 reg24,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (wire3 ?
                     (((wire2 | (&wire3)) ?
                         {$signed(wire1)} : ($unsigned((8'hbf)) & $signed(wire2))) < ($signed((wire1 << wire4)) ^~ {wire3,
                         {wire2,
                             wire2}})) : $signed((wire0 & (~|$unsigned(wire2)))));
  always
    @(posedge clk) begin
      reg6 <= $signed(wire1);
      reg7 <= (($signed(wire3[(4'ha):(2'h3)]) ?
              ((^(wire1 >> reg6)) & (wire1 || wire4[(3'h5):(1'h0)])) : wire5[(2'h2):(1'h0)]) ?
          reg6[(2'h2):(1'h1)] : $unsigned({wire0, $unsigned({wire0})}));
      reg8 <= (((+(8'ha2)) << (|{wire1[(4'h9):(1'h0)]})) >>> (~^wire2[(5'h12):(2'h2)]));
      reg9 <= reg6;
      if ((((reg7 - reg8[(2'h2):(1'h1)]) ?
          ($signed((^~(7'h43))) ?
              ((7'h44) ? $unsigned(reg7) : reg7[(4'h8):(2'h2)]) : ((reg9 ?
                  wire4 : wire1) >= wire5)) : {wire3[(5'h10):(4'hc)],
              $signed($unsigned(wire4))}) ^~ (wire3[(3'h7):(1'h1)] <= wire4[(3'h5):(3'h4)])))
        begin
          reg10 <= ($signed(wire1) ?
              (((&$signed((8'hbb))) ?
                      wire2[(4'hd):(1'h1)] : wire0[(2'h2):(1'h0)]) ?
                  (&reg8) : reg6[(1'h1):(1'h1)]) : (reg8[(3'h4):(1'h1)] ?
                  ($unsigned($signed(reg8)) != $unsigned(reg8)) : (~|$unsigned((reg8 ?
                      wire0 : wire0)))));
          reg11 <= reg6[(4'h9):(4'h8)];
          reg12 <= ((reg9[(4'ha):(1'h0)] ?
              wire1 : (~^(~&(wire3 == reg9)))) + $unsigned(reg7[(3'h4):(2'h2)]));
        end
      else
        begin
          reg10 <= (((wire3[(2'h3):(2'h3)] + (~(reg11 ? reg9 : reg7))) ?
                  reg8 : reg12) ?
              $signed(wire0) : reg9[(3'h5):(1'h0)]);
          if ($unsigned(wire2))
            begin
              reg11 <= reg12[(1'h1):(1'h1)];
              reg12 <= $unsigned(($unsigned({$signed((8'ha5)),
                  (-wire3)}) && {(((8'h9c) | wire3) >>> (wire2 ?
                      wire2 : (7'h44)))}));
              reg13 <= wire4;
              reg14 <= ($signed($unsigned((((8'ha8) * wire4) < wire0[(1'h0):(1'h0)]))) ?
                  (wire2 ?
                      reg12 : (((^~wire2) ?
                          wire1 : (reg13 != wire5)) >= (reg10 != reg6[(4'h8):(3'h5)]))) : reg7);
              reg15 <= (((~&{$unsigned(wire1),
                  (^~reg13)}) & $unsigned($signed(reg8))) << {((~^wire3[(3'h7):(2'h3)]) ?
                      reg13[(1'h1):(1'h1)] : ($signed(reg6) >= (-wire1)))});
            end
          else
            begin
              reg11 <= $signed(reg12[(4'hf):(1'h1)]);
              reg12 <= $unsigned(((wire1 ? wire3 : (&wire4)) ?
                  $signed((8'ha8)) : $signed($unsigned(reg10))));
              reg13 <= ({reg7} ?
                  $unsigned((reg10[(1'h1):(1'h0)] ?
                      reg7[(3'h4):(1'h0)] : $unsigned((~|wire1)))) : wire0[(1'h0):(1'h0)]);
              reg14 <= (7'h40);
            end
          reg16 <= $unsigned($signed((reg8[(1'h1):(1'h1)] ?
              (!(reg14 ?
                  reg15 : reg14)) : ($unsigned((8'hbc)) & $signed((8'ha2))))));
        end
    end
  assign wire17 = (wire4[(3'h4):(3'h4)] || $signed(reg15[(1'h0):(1'h0)]));
  assign wire18 = ((reg13 ? reg9 : $unsigned({$unsigned(wire4)})) ?
                      (^~$unsigned(wire3[(5'h11):(4'ha)])) : wire4);
  assign wire19 = $signed($unsigned($unsigned(reg8[(3'h4):(1'h1)])));
  assign wire20 = reg8[(2'h3):(2'h3)];
  assign wire21 = $signed((+($unsigned($unsigned(wire2)) >> $signed($signed(reg14)))));
  assign wire22 = (+(-$unsigned(wire19)));
  assign wire23 = wire19[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg24 <= reg12[(2'h2):(1'h1)];
      reg25 <= wire18;
    end
  always
    @(posedge clk) begin
      reg26 <= (($unsigned($unsigned((reg12 ? reg8 : reg7))) ?
              (wire4[(3'h6):(3'h4)] ?
                  (!((8'ha7) >>> wire0)) : (8'haa)) : (~^reg11)) ?
          (((reg14 < (7'h41)) & wire20[(4'ha):(2'h2)]) ?
              $signed(reg13[(2'h3):(1'h0)]) : $unsigned(wire1)) : ($signed(reg25[(1'h1):(1'h0)]) | {(&$signed(wire3))}));
    end
  assign wire27 = wire1;
endmodule
