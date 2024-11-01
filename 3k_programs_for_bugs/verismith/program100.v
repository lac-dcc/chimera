module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = $unsigned($signed(((|(~|wire2)) ?
                     wire4[(3'h5):(3'h4)] : {$unsigned(wire5), wire4})));
  always
    @(posedge clk) begin
      reg7 <= ($signed($signed($signed(wire5))) < (^(wire0[(3'h4):(3'h4)] || (wire1 <= (wire4 && wire3)))));
      if (($unsigned($signed((wire0[(2'h2):(1'h0)] ?
              $unsigned((8'h9f)) : (wire0 ? (7'h44) : (8'hbd))))) ?
          ((8'hb7) ? $unsigned(wire6) : reg7) : wire0[(4'ha):(3'h6)]))
        begin
          reg8 <= wire4;
          reg9 <= $unsigned(wire3[(3'h7):(2'h3)]);
        end
      else
        begin
          reg8 <= wire6[(3'h4):(2'h2)];
          reg9 <= $unsigned($unsigned({wire4[(3'h6):(3'h5)]}));
          if (reg9[(3'h6):(3'h5)])
            begin
              reg10 <= ((wire5[(1'h1):(1'h1)] > (|($unsigned(reg8) ?
                  (wire6 ~^ wire0) : (~|reg9)))) != (wire2 && reg8[(1'h1):(1'h1)]));
              reg11 <= ($unsigned($signed((wire6[(3'h5):(3'h4)] ?
                      (7'h40) : $signed((8'hae))))) ?
                  $signed((wire6[(3'h4):(2'h2)] << {(wire2 ? reg8 : wire1),
                      $unsigned(wire5)})) : $unsigned((&wire5[(1'h1):(1'h1)])));
              reg12 <= wire6;
              reg13 <= $signed((+$signed(reg8[(2'h2):(2'h2)])));
              reg14 <= $signed($unsigned(((((8'hbd) ?
                      reg11 : (8'hb3)) >> $signed(wire4)) ?
                  $signed((wire6 + reg10)) : reg13)));
            end
          else
            begin
              reg10 <= wire4;
              reg11 <= (wire6[(2'h2):(1'h1)] >>> $signed($unsigned(($unsigned(reg9) << (8'hae)))));
              reg12 <= ($unsigned($unsigned($unsigned({wire1,
                  reg11}))) ~^ $unsigned(reg10[(4'h9):(2'h2)]));
              reg13 <= $signed((wire3[(3'h7):(3'h6)] + (|{$signed(reg10),
                  $signed(reg13)})));
            end
        end
      reg15 <= wire5[(3'h4):(2'h3)];
      reg16 <= $signed((~^((8'hb9) ? wire3[(4'hc):(4'ha)] : $unsigned(wire4))));
    end
  assign wire17 = (((-reg9) ^~ $unsigned(reg12)) || $signed(wire6[(5'h10):(1'h0)]));
  assign wire18 = (wire2[(5'h10):(4'hf)] < wire17[(1'h0):(1'h0)]);
  assign wire19 = $unsigned((|(|reg15)));
  assign wire20 = ((($signed(wire5[(1'h1):(1'h0)]) >> wire18[(4'he):(4'hd)]) + (wire19 ?
                          wire1 : $unsigned($signed(wire1)))) ?
                      (~&wire5) : ((((8'hab) ?
                          reg9[(4'hc):(1'h0)] : $signed((8'haf))) >= $unsigned(wire3[(3'h4):(2'h2)])) + (^reg10)));
endmodule
