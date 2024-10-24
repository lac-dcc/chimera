module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, wire4, reg10, reg9, reg8, reg7, (1'h0)};
  assign wire4 = (~|wire0[(2'h2):(2'h2)]);
  assign wire5 = wire4[(4'hd):(4'h9)];
  assign wire6 = ({(|{(^~wire5)}),
                     $unsigned($unsigned(wire0[(2'h2):(2'h2)]))} <= (&($unsigned(wire3) ?
                     ($signed(wire4) ? wire1 : wire0) : (wire3 ?
                         (wire1 ? wire2 : wire2) : (wire3 ? wire3 : wire1)))));
  always
    @(posedge clk) begin
      reg7 <= (+wire3);
      reg8 <= (~&(((~^(~^wire6)) ^ wire5) <= $unsigned($unsigned(reg7))));
      reg9 <= wire1[(1'h1):(1'h1)];
      reg10 <= ({wire6} ?
          ($unsigned((^~(&(8'ha8)))) ?
              (wire5[(4'ha):(2'h3)] <= $unsigned(reg9)) : wire0[(3'h5):(2'h3)]) : (^$unsigned((-$unsigned(reg8)))));
    end
endmodule
