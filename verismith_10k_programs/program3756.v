module top
#(parameter param9 = ((~^(^~(((8'ha2) ? (7'h44) : (8'hbb)) ? ((8'hb4) * (8'hbc)) : {(8'h9e)}))) + (8'hb3)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire8, wire7, wire5, reg6, (1'h0)};
  assign wire5 = wire0;
  always
    @(posedge clk) begin
      reg6 <= (~&$signed($unsigned(wire5[(4'hb):(1'h0)])));
    end
  assign wire7 = $unsigned((~|wire5));
  assign wire8 = (reg6[(2'h2):(1'h1)] ?
                     (($unsigned((reg6 ^~ (8'hbe))) <= $unsigned($signed(wire0))) ?
                         (8'ha3) : ($unsigned($unsigned(wire4)) ?
                             (|(wire4 ^ (8'ha9))) : (+(wire7 | wire2)))) : $signed($signed(wire0)));
endmodule
