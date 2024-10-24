module top
#(parameter param23 = (~|{((!{(7'h41), (8'ha2)}) ^ ((^(8'ha4)) ~^ (~(7'h44))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg4 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~wire3);
      reg5 <= ($signed((wire3[(2'h3):(1'h0)] ?
              ({wire3, (8'hbf)} ? (&wire1) : {wire2, wire1}) : (&((7'h44) ?
                  (8'hb3) : wire2)))) ?
          wire0 : (wire3 ?
              reg4[(2'h3):(2'h3)] : ((((8'hb3) && wire0) - (reg4 | wire0)) >>> wire2)));
    end
  assign wire6 = ($signed((!((+reg4) ?
                     (reg5 ? wire0 : (8'ha6)) : (&wire2)))) | (^~wire1));
  assign wire7 = ((8'hb4) == ($signed($signed(reg5[(3'h5):(2'h3)])) ?
                     wire6 : {$signed({wire0, reg4})}));
  assign wire8 = reg5[(3'h6):(2'h3)];
  assign wire9 = {(~^(8'h9c)), $unsigned($signed($unsigned(wire7)))};
  assign wire10 = $signed({wire8[(1'h1):(1'h1)], wire6});
  always
    @(posedge clk) begin
      reg11 <= $signed(((wire3 ?
          ({wire2} ? $unsigned(wire3) : reg4[(2'h3):(2'h3)]) : (wire7 ?
              (~wire2) : $signed((8'hb5)))) + $unsigned((wire9[(4'hb):(2'h3)] != $signed((8'hae))))));
      reg12 <= ((~$unsigned(reg11)) & wire1[(1'h1):(1'h1)]);
      reg13 <= (reg11[(1'h1):(1'h0)] & $signed($signed(({wire3,
          wire0} >>> $signed(wire1)))));
      reg14 <= {wire2, (~($unsigned((^~wire8)) << {(reg13 <= reg4)}))};
      if ((+{(wire0 ?
              (wire7[(1'h0):(1'h0)] ?
                  (wire10 ? reg5 : reg12) : (|wire2)) : $signed((^~reg11)))}))
        begin
          reg15 <= $signed($unsigned(wire6[(4'h8):(1'h0)]));
          if (reg5)
            begin
              reg16 <= (+$unsigned(wire1[(3'h4):(1'h1)]));
              reg17 <= reg11[(1'h0):(1'h0)];
              reg18 <= reg12[(2'h2):(1'h1)];
            end
          else
            begin
              reg16 <= {$unsigned($signed(reg5[(3'h6):(3'h5)]))};
              reg17 <= ((~reg18) ? $unsigned(reg5) : wire7[(4'hb):(3'h5)]);
              reg18 <= ({$signed(($signed(reg11) ^ {reg15})),
                  (((reg11 - reg13) ?
                      reg18[(4'hf):(4'hd)] : $signed(wire8)) & {{(8'hbb),
                          wire0}})} * $unsigned(($unsigned(wire3[(2'h3):(2'h2)]) <= $signed((wire7 < reg15)))));
              reg19 <= ((~^reg18[(5'h10):(4'h9)]) && {wire8[(1'h1):(1'h1)]});
            end
        end
      else
        begin
          reg15 <= (wire10[(4'h9):(2'h3)] || reg16[(4'ha):(1'h1)]);
        end
    end
  assign wire20 = reg5;
  assign wire21 = $unsigned($unsigned({(8'h9e)}));
  assign wire22 = $signed(wire9);
endmodule
