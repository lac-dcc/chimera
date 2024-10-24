module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire10, wire9, wire8, wire4, reg7, reg6, reg5, (1'h0)};
  assign wire4 = $signed((wire0[(3'h7):(3'h5)] ?
                     (~wire0[(4'h8):(1'h1)]) : (($unsigned(wire3) ?
                             (wire2 ? (8'ha7) : wire2) : (&(8'hb9))) ?
                         (8'hb2) : $unsigned((~wire0)))));
  always
    @(posedge clk) begin
      reg5 <= (+(&($unsigned((wire4 ~^ wire0)) && (~^(wire1 > (8'hb9))))));
      reg6 <= wire0;
      reg7 <= reg6[(4'hc):(4'h9)];
    end
  assign wire8 = reg6[(1'h0):(1'h0)];
  assign wire9 = wire0;
  assign wire10 = ((!(((8'hb4) ?
                      $unsigned(wire0) : (wire1 ? wire1 : reg6)) <<< {{reg7},
                      $signed(reg7)})) != ($signed(((wire3 ? wire0 : wire3) ?
                      (~&wire0) : $signed(wire4))) <<< {wire1[(2'h2):(1'h0)],
                      reg5}));
endmodule
