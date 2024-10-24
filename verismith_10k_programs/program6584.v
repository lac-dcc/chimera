module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire12, wire11, reg10, reg9, reg8, reg7, reg6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (((wire4[(4'hc):(3'h6)] || ($unsigned(wire1) ?
          $signed((8'ha6)) : wire1[(2'h3):(2'h3)])) << $signed(wire3[(5'h13):(4'hb)])) & (~({$unsigned(wire4),
          $unsigned(wire2)} <= $signed({wire1}))));
      reg6 <= ((8'ha2) ? wire3 : wire2);
      reg7 <= wire1[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg8 <= $signed(reg5);
      reg9 <= $signed((($signed(reg7) ?
              (~|wire2[(4'ha):(4'ha)]) : ($signed(wire0) ?
                  wire2 : reg5[(2'h3):(2'h3)])) ?
          $unsigned(reg8[(2'h3):(2'h3)]) : $signed($signed($unsigned(wire3)))));
      reg10 <= ($signed($unsigned(reg7[(4'hb):(3'h7)])) ?
          wire3[(5'h11):(3'h6)] : ($signed(((~^wire1) & {reg8})) <= ((wire0[(1'h0):(1'h0)] <= $unsigned(reg8)) >> ({wire1,
              wire3} | {reg6, (8'hba)}))));
    end
  assign wire11 = reg10;
  assign wire12 = (~&(reg10[(2'h3):(2'h3)] ~^ (|{(~^reg10), {wire2}})));
endmodule
