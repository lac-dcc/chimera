module top
#(parameter param12 = (~^{(+{((8'hb5) ? (8'hac) : (8'hbc))}), ((((8'hab) <= (8'hbe)) ? ((8'ha0) ? (8'ha5) : (8'ha4)) : {(8'ha9), (8'h9f)}) <= (+((8'h9e) || (8'ha9))))}), 
parameter param13 = ({(param12 ? (^{param12}) : ((~|param12) * (param12 ? (8'ha8) : param12)))} ~^ (8'hb4)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire11, wire5, wire4, reg10, reg9, reg8, reg7, reg6, (1'h0)};
  assign wire4 = wire1[(2'h2):(2'h2)];
  assign wire5 = wire4[(4'he):(4'he)];
  always
    @(posedge clk) begin
      reg6 <= ((wire1[(4'h8):(4'h8)] ?
          (~|wire1[(4'hd):(4'ha)]) : $unsigned($unsigned((~&(8'h9e))))) <<< ($signed(wire5[(5'h11):(4'h8)]) ?
          wire5[(4'ha):(2'h3)] : wire4));
      if (reg6[(4'hf):(4'ha)])
        begin
          reg7 <= (^(wire2[(4'hd):(4'hd)] & {$signed(wire5[(4'hf):(4'hc)]),
              ($unsigned(wire4) && wire4)}));
          if ($unsigned(wire4))
            begin
              reg8 <= $unsigned((wire4[(4'hb):(4'h8)] * wire5));
              reg9 <= ($unsigned(wire1[(4'hd):(1'h1)]) >>> ((^$signed({reg8,
                  (8'hb0)})) * $signed({(wire1 > wire2), {reg6, wire1}})));
            end
          else
            begin
              reg8 <= $unsigned($unsigned($unsigned(reg6[(4'ha):(3'h7)])));
              reg9 <= ($signed({(wire3[(4'ha):(4'h8)] ?
                          {(8'hb4)} : $signed(wire4))}) ?
                  wire5 : $unsigned(($unsigned((~^reg8)) & (&$signed(reg7)))));
            end
          reg10 <= (~((&wire4) ^ reg6[(4'he):(3'h5)]));
        end
      else
        begin
          reg7 <= ((reg7[(2'h3):(2'h2)] <= (8'h9e)) ~^ (~wire1));
        end
    end
  assign wire11 = $signed($signed(wire5));
endmodule
