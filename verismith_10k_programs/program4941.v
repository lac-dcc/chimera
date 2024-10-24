module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire18,
                 wire17,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg16,
                 reg15,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = ($unsigned((wire4 ?
                     wire0 : $unsigned($unsigned((8'ha2))))) >= $unsigned(wire2[(1'h1):(1'h1)]));
  assign wire6 = wire5;
  assign wire7 = (~&wire0[(3'h7):(2'h2)]);
  assign wire8 = $unsigned({($unsigned((8'ha5)) ^~ wire6[(3'h5):(3'h5)])});
  always
    @(posedge clk) begin
      if ($unsigned(wire4))
        begin
          if ((($signed(wire4) <= (((wire4 ? wire6 : wire7) ?
                  (wire5 <= (7'h40)) : (8'hb3)) * ($unsigned(wire0) >>> wire1[(3'h6):(3'h4)]))) ?
              wire6[(2'h3):(2'h2)] : ($unsigned($signed($signed(wire1))) | (~^((wire8 & wire3) ?
                  wire6[(3'h4):(1'h0)] : wire4[(1'h0):(1'h0)])))))
            begin
              reg9 <= wire4;
              reg10 <= (wire8[(1'h0):(1'h0)] ?
                  $unsigned($unsigned((wire5 | $unsigned(wire4)))) : (~^wire1));
            end
          else
            begin
              reg9 <= $signed(($unsigned(wire1) * ($signed($unsigned(wire0)) ?
                  (wire5 <= $signed(wire6)) : ((7'h44) ?
                      wire0[(1'h1):(1'h0)] : wire0[(1'h0):(1'h0)]))));
              reg10 <= wire7;
              reg11 <= $signed($signed($signed(($signed(wire0) ?
                  $unsigned(wire0) : $unsigned(wire8)))));
              reg12 <= reg9;
              reg13 <= reg12[(4'hf):(2'h2)];
            end
        end
      else
        begin
          reg9 <= ($signed(wire0[(1'h1):(1'h0)]) ?
              $signed(wire8[(1'h0):(1'h0)]) : wire3);
          reg10 <= {wire8[(1'h1):(1'h1)]};
          reg11 <= (!{reg13});
        end
    end
  assign wire14 = wire1;
  always
    @(posedge clk) begin
      reg15 <= (~$unsigned($signed(wire5)));
      reg16 <= wire3[(4'he):(3'h5)];
    end
  assign wire17 = wire5;
  assign wire18 = (&{(~|reg10[(4'h9):(2'h2)])});
  always
    @(posedge clk) begin
      if (wire3[(1'h0):(1'h0)])
        begin
          reg19 <= $unsigned({wire7,
              (~&($unsigned(wire17) ? (+wire1) : $signed(wire17)))});
          reg20 <= $signed((wire14[(3'h4):(3'h4)] && $signed(wire2[(3'h6):(2'h3)])));
          reg21 <= $signed((~^((~^$signed((8'hbc))) ?
              {((8'hb9) ? wire6 : reg13), wire0} : {(~^reg10)})));
          reg22 <= {{{(^~$unsigned(reg10)), {(~^reg15)}},
                  ($unsigned(reg9) <<< $signed((reg9 ? reg19 : (8'h9c))))},
              reg15};
          reg23 <= reg19;
        end
      else
        begin
          if ($signed($signed((~|wire7[(4'h9):(3'h4)]))))
            begin
              reg19 <= (!reg23);
            end
          else
            begin
              reg19 <= reg10[(4'he):(2'h3)];
              reg20 <= wire4[(3'h4):(1'h0)];
              reg21 <= $unsigned(((^~(^wire4[(3'h6):(3'h4)])) < (~|(~&(reg19 ?
                  (8'ha3) : wire4)))));
              reg22 <= (+$signed(reg13[(1'h0):(1'h0)]));
            end
        end
      reg24 <= reg22;
      reg25 <= reg15;
    end
  assign wire26 = $unsigned((!(~|$signed($signed(reg13)))));
  assign wire27 = reg11;
  assign wire28 = ((~^(wire27 == reg21)) ? {reg13} : wire14[(4'h8):(3'h4)]);
  assign wire29 = reg9;
  assign wire30 = wire17;
endmodule
