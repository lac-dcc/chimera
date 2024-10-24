module top
#(parameter param16 = (+(~&((-{(8'ha8), (8'ha2)}) * (((8'ha2) ? (8'h9d) : (8'hb1)) ? (^(8'h9d)) : ((8'haf) ? (7'h41) : (8'ha5)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg4 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1;
      reg5 <= wire2;
    end
  assign wire6 = wire3;
  assign wire7 = ({wire6[(2'h2):(1'h0)], wire0[(3'h5):(1'h0)]} ?
                     wire2[(2'h2):(1'h1)] : reg5);
  assign wire8 = (wire1 << ((wire7 ?
                         wire2 : (wire0[(3'h5):(3'h5)] ?
                             (reg4 + wire7) : $unsigned(wire3))) ?
                     (+$unsigned((reg4 ? (8'hbb) : wire7))) : (^~wire2)));
  assign wire9 = wire0[(2'h3):(2'h3)];
  assign wire10 = (!(8'hb4));
  assign wire11 = (!wire3);
  assign wire12 = ((reg4 >= (~reg5[(1'h0):(1'h0)])) ?
                      $signed($unsigned(wire9[(2'h3):(2'h2)])) : wire3[(1'h0):(1'h0)]);
  assign wire13 = wire7;
  assign wire14 = (wire3[(1'h1):(1'h1)] ^~ ({(wire6 ?
                          wire3 : (wire1 ? (8'hb7) : wire6)),
                      ((wire8 || (8'ha5)) <= $signed(wire10))} && ($unsigned((wire2 - wire6)) ?
                      (~^((8'ha0) >> wire0)) : (~wire11))));
  assign wire15 = (((+wire12) ? {{(8'h9f)}} : wire10[(2'h2):(1'h1)]) | wire7);
endmodule
