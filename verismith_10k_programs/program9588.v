module top
#(parameter param12 = (-(^~{(((8'ha6) ? (8'h9f) : (8'had)) ? ((8'haf) ? (8'hbe) : (8'hab)) : (-(8'hbb))), (!((8'hb3) < (8'hbf)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire11, wire8, wire7, wire6, wire5, reg10, reg9, (1'h0)};
  assign wire5 = wire3[(2'h2):(1'h1)];
  assign wire6 = $signed({wire3});
  assign wire7 = {{(!((wire0 ~^ wire0) >>> wire5))}};
  assign wire8 = (($unsigned(((wire2 ? wire4 : (8'hbd)) <<< (wire2 != wire3))) ?
                         wire7 : $signed((&(wire0 <= wire1)))) ?
                     (((8'ha2) ?
                             $signed({wire6,
                                 wire4}) : $signed((wire6 >> wire4))) ?
                         $signed($unsigned((-wire6))) : wire3) : (wire1[(3'h6):(3'h5)] <<< (wire7[(2'h3):(2'h3)] && $unsigned(wire7[(3'h4):(3'h4)]))));
  always
    @(posedge clk) begin
      reg9 <= (~{$unsigned($signed(wire2))});
      reg10 <= $signed(wire8);
    end
  assign wire11 = (reg10 >> (8'ha8));
endmodule
