module top
#(parameter param11 = ((~&(!(-((8'haa) ~^ (8'hb8))))) + ((~^{(~&(7'h41))}) ? (8'hbc) : ((^((8'haa) ? (8'hb3) : (8'h9e))) ? (((8'hab) - (8'ha7)) < (~(8'h9c))) : (((8'ha4) - (8'hab)) != ((7'h41) & (8'haf)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  assign y = {wire8, wire7, wire6, wire5, reg10, reg9, (1'h0)};
  assign wire5 = (((($unsigned(wire0) ? $signed(wire0) : (|wire3)) ?
                     (~&(wire4 && wire0)) : ((wire0 ?
                         wire1 : wire0) ^ $unsigned((8'ha1)))) && (((|wire0) ?
                         {(8'hb1), (8'had)} : (|wire0)) ?
                     $signed((^wire3)) : ((wire1 ?
                         wire3 : (8'hb7)) >= $unsigned((8'h9c))))) < ($unsigned(wire4[(2'h2):(1'h0)]) != (~^{wire2})));
  assign wire6 = wire1[(4'h9):(3'h7)];
  assign wire7 = ($signed(wire2) - $unsigned(((~(wire0 * wire0)) ~^ wire3[(4'ha):(4'h9)])));
  assign wire8 = (!(wire7 ? (8'hbd) : wire1));
  always
    @(posedge clk) begin
      reg9 <= $signed($signed($signed(wire3[(4'hd):(2'h3)])));
      reg10 <= wire8[(5'h11):(4'ha)];
    end
endmodule
