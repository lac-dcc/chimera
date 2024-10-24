module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  assign y = {wire10, wire8, wire7, wire6, wire5, wire4, reg9, (1'h0)};
  assign wire4 = (wire0 - $signed((wire3[(1'h1):(1'h0)] < {$signed(wire3)})));
  assign wire5 = (&(~|wire4[(1'h0):(1'h0)]));
  assign wire6 = (&$signed(wire4));
  assign wire7 = wire3[(2'h2):(2'h2)];
  assign wire8 = ((8'ha3) == $signed(((8'hbc) < wire5[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg9 <= (wire0[(4'h8):(4'h8)] == ({$signed($signed(wire6)),
          wire0[(4'hb):(4'hb)]} & wire3[(1'h1):(1'h0)]));
    end
  assign wire10 = ({wire3} ?
                      {(((wire7 >> reg9) >>> $signed(wire4)) ?
                              ((!wire6) && wire4) : wire7),
                          ((8'hbb) != ($signed((8'hbe)) ?
                              wire4[(3'h5):(2'h2)] : (^~wire0)))} : (&({$unsigned(wire6),
                              (reg9 - (8'hb6))} ?
                          wire1[(2'h2):(1'h1)] : ($unsigned((8'h9c)) ~^ wire5[(1'h0):(1'h0)]))));
endmodule
