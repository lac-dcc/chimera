module top
#(parameter param13 = (((((~|(8'hb0)) ? (~^(8'had)) : ((8'haf) < (8'ha0))) ? {((8'hbc) ? (8'hb3) : (8'hba)), ((8'ha7) ^ (7'h44))} : {{(8'hb3)}}) > {(((8'ha1) ? (8'hb3) : (8'hb0)) == (8'h9f))}) ? (({((8'h9e) | (8'had)), ((8'ha1) ? (8'hb7) : (8'h9c))} ? (((8'hb7) + (8'hbd)) ? ((8'ha1) ? (8'hb8) : (7'h41)) : (+(8'hb1))) : (((8'hb1) ? (8'hbc) : (8'had)) && (^~(8'haf)))) ? ((8'hb2) != (((8'hac) ? (8'had) : (7'h41)) ? ((8'haf) >= (8'ha9)) : ((8'ha8) > (8'hac)))) : ((&(~^(7'h44))) ? ((+(8'ha5)) ? (&(8'hbf)) : ((7'h42) > (8'hb8))) : (+((8'h9e) ? (7'h40) : (8'ha6))))) : {(+(^~{(8'hbf), (8'ha1)})), ((((7'h41) ? (8'hba) : (8'hb6)) ? {(8'hac)} : ((7'h42) * (8'hb1))) ? (8'hb0) : (((8'h9c) ? (8'h9d) : (8'h9c)) - ((8'hbd) ? (8'hac) : (8'hbb))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  assign y = {wire12, wire11, wire10, wire6, wire5, reg9, reg8, reg7, (1'h0)};
  assign wire5 = (wire1 ? wire1 : wire1[(3'h5):(3'h5)]);
  assign wire6 = (!wire2[(4'hb):(1'h1)]);
  always
    @(posedge clk) begin
      reg7 <= $signed(wire6);
      reg8 <= (^~(8'ha2));
      reg9 <= wire5;
    end
  assign wire10 = wire0;
  assign wire11 = $signed(wire1[(4'hb):(4'ha)]);
  assign wire12 = (wire6 << $signed($unsigned({((8'hb1) | wire0)})));
endmodule
