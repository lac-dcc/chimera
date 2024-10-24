module top
#(parameter param12 = (&((~|(((7'h42) == (8'ha8)) + ((8'ha6) ? (8'h9c) : (8'ha2)))) != {(((8'ha3) ^ (7'h44)) * ((8'hb4) ? (8'hbd) : (8'haa))), ((!(8'h9f)) < ((8'hb8) != (8'ha3)))})), 
parameter param13 = (~&(~|((+(~|param12)) ^~ (~|param12)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire11, wire8, wire7, wire6, wire5, reg10, reg9, (1'h0)};
  assign wire5 = $unsigned($unsigned({((^~wire4) != wire3)}));
  assign wire6 = $unsigned((&$signed((wire4 ?
                     (wire5 ? wire2 : wire2) : {wire3, wire4}))));
  assign wire7 = $unsigned(wire6[(4'hc):(4'hc)]);
  assign wire8 = $unsigned(wire6[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg9 <= wire0;
      reg10 <= {((~^$signed((wire8 ? wire7 : wire5))) ^ (^$signed(((8'hae) ?
              wire5 : wire8))))};
    end
  assign wire11 = wire4;
endmodule
