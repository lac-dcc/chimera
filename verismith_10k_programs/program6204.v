module top
#(parameter param14 = {(({((7'h40) | (8'ha9))} ? (&(8'hbb)) : (~&((8'hac) != (8'had)))) & (-(((8'ha9) ? (8'haa) : (8'hbd)) ? (~(8'hb8)) : ((8'hac) | (8'h9f)))))}, 
parameter param15 = (!{(((param14 >> param14) - (~^param14)) ? ((param14 <<< param14) | {param14, param14}) : (param14 == ((8'hae) ? param14 : param14))), (-{(param14 ? param14 : param14), (param14 ? param14 : param14)})}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (($unsigned(((wire2 != wire2) || ((8'hab) ? wire1 : wire1))) ?
              wire1[(3'h7):(3'h5)] : wire3[(4'hb):(3'h4)]) ?
          wire0 : wire2);
      if (reg4[(1'h0):(1'h0)])
        begin
          reg5 <= wire0[(5'h13):(3'h6)];
          if (($signed((8'hb6)) - {reg4[(3'h6):(2'h3)]}))
            begin
              reg6 <= ((^(wire3[(3'h5):(1'h1)] * ((~^reg4) ?
                  (wire0 ?
                      wire0 : (8'h9e)) : wire2))) ^~ (|wire2[(4'hc):(1'h0)]));
              reg7 <= reg6;
              reg8 <= {wire0, $signed((&$unsigned($signed(wire2))))};
            end
          else
            begin
              reg6 <= (reg6[(1'h0):(1'h0)] ?
                  {wire1,
                      $signed($signed($signed(wire3)))} : (+$unsigned($unsigned((wire2 << wire3)))));
              reg7 <= wire0;
            end
          reg9 <= ({wire2[(2'h2):(2'h2)]} ?
              wire1[(2'h3):(2'h3)] : (|reg7[(1'h1):(1'h0)]));
        end
      else
        begin
          reg5 <= (7'h43);
          reg6 <= ($signed(reg9) ~^ $signed({wire2[(4'hd):(3'h5)]}));
          reg7 <= $signed(reg5);
        end
    end
  assign wire10 = $unsigned((wire0[(4'he):(4'hc)] >> $signed({(~reg5)})));
  assign wire11 = wire2;
  assign wire12 = wire3[(3'h7):(3'h5)];
  assign wire13 = $signed(((reg9[(1'h1):(1'h0)] ?
                      (wire2 ?
                          (^(8'hac)) : (~&reg5)) : wire11) << $signed((-{wire10}))));
endmodule
