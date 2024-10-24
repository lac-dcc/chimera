module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire11;
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire13,
                 wire11,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire4[(1'h1):(1'h0)];
      reg6 <= $signed(wire1[(1'h1):(1'h0)]);
      if (((wire1 != $unsigned($unsigned(reg5[(4'ha):(4'h8)]))) ^~ ((~^{$signed(wire4),
          (!reg6)}) || wire3)))
        begin
          reg7 <= $unsigned((~&((8'hb6) ?
              (reg6 ?
                  reg6 : (^~wire1)) : ((wire0 + reg5) >> reg6[(1'h1):(1'h1)]))));
          reg8 <= (wire1[(2'h3):(2'h2)] ?
              ((wire1 ?
                      {reg5[(1'h0):(1'h0)],
                          $unsigned(wire0)} : reg7[(1'h1):(1'h1)]) ?
                  $unsigned($unsigned(reg5)) : reg6) : reg6[(3'h5):(3'h5)]);
        end
      else
        begin
          reg7 <= (8'ha4);
          reg8 <= $signed(wire4[(3'h4):(2'h3)]);
        end
      reg9 <= ((~$unsigned(((~^reg8) ?
              wire0[(3'h6):(1'h1)] : ((8'hb4) * (8'ha9))))) ?
          (reg8 && wire3) : (reg8[(3'h6):(3'h4)] ?
              wire0[(3'h4):(1'h0)] : ($signed((wire4 ?
                  wire1 : wire4)) - {(wire4 >= wire0)})));
      reg10 <= $unsigned(wire4);
    end
  assign wire11 = $signed($signed($unsigned(wire4[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg12 <= (!$signed((wire3[(3'h7):(2'h3)] >>> ((reg6 ?
          reg8 : wire0) || $unsigned(reg7)))));
    end
  assign wire13 = reg5[(1'h1):(1'h0)];
endmodule
