module top
#(parameter param9 = (~&((+(^~(|(8'hab)))) >> {(~|(|(8'hbe)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire8, wire5, wire4, reg7, reg6, (1'h0)};
  assign wire4 = $unsigned(wire3[(1'h0):(1'h0)]);
  assign wire5 = (8'hb4);
  always
    @(posedge clk) begin
      reg6 <= ($signed((8'hb8)) + wire4);
      reg7 <= ((^(~|({wire3, wire4} ?
              wire1[(4'hc):(4'h9)] : $unsigned(wire2)))) ?
          ((((wire1 ~^ wire5) * wire2[(2'h3):(2'h2)]) ?
              {(wire2 ? wire2 : wire3)} : (((8'hbc) || wire3) ?
                  $unsigned(wire4) : wire2[(3'h7):(3'h6)])) >= (wire2[(2'h3):(1'h1)] ?
              ($signed(wire0) < wire3[(1'h0):(1'h0)]) : ($unsigned(reg6) >> $signed(wire5)))) : $unsigned($unsigned(wire5[(5'h11):(1'h0)])));
    end
  assign wire8 = reg7;
endmodule
