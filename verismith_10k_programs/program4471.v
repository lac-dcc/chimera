module top
#(parameter param13 = ({(~(|((7'h40) && (8'ha7)))), (8'ha2)} < (~&(8'hb6))), 
parameter param14 = param13)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  assign y = {wire12, wire10, wire9, wire8, wire7, wire6, wire5, reg11, (1'h0)};
  assign wire5 = wire1;
  assign wire6 = $unsigned($signed((8'hb4)));
  assign wire7 = wire6[(3'h4):(2'h3)];
  assign wire8 = $signed((wire6[(3'h4):(2'h2)] ?
                     wire0 : ((wire5 * $signed(wire5)) ?
                         wire0 : $unsigned((wire4 ? (8'haf) : wire2)))));
  assign wire9 = wire8[(3'h4):(1'h1)];
  assign wire10 = wire0[(4'ha):(2'h3)];
  always
    @(posedge clk) begin
      reg11 <= (~^(+(~(!(wire2 >> wire3)))));
    end
  assign wire12 = wire9;
endmodule
