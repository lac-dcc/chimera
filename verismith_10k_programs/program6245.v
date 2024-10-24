module top
#(parameter param12 = {((~({(8'hbd), (8'ha8)} - ((8'ha0) + (8'hae)))) ? ((~|(8'ha5)) >>> ((-(8'hb9)) ? {(8'hb8)} : (8'ha2))) : ({{(8'hbf)}, ((8'ha7) + (7'h44))} ? (((8'hbd) ? (8'hb6) : (8'h9d)) ? ((7'h40) ? (8'hb3) : (8'h9e)) : (|(8'ha9))) : (^~((7'h44) ? (8'hbe) : (8'h9d))))), (({(~&(8'h9f))} ? ((8'hae) != ((8'hb4) ? (7'h43) : (8'ha2))) : ({(8'h9d)} ? ((8'hb6) || (8'ha6)) : ((8'hbf) < (8'ha2)))) <<< ((~^((8'hac) ? (8'hbe) : (7'h43))) < (~^(8'haa))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, reg11, (1'h0)};
  assign wire5 = $unsigned({(+((wire4 >= wire1) > wire2))});
  assign wire6 = $unsigned(({{$unsigned(wire1)}} * $unsigned(wire2)));
  assign wire7 = (!wire2[(4'h8):(3'h4)]);
  assign wire8 = wire3[(2'h3):(1'h1)];
  assign wire9 = ((wire6 ?
                     (wire5 >= wire6) : wire2) == ($signed($signed(((8'h9d) ^ (8'had)))) == (wire8[(4'hc):(4'hb)] ~^ wire8[(4'hd):(2'h2)])));
  assign wire10 = (!({wire9} * wire8[(4'ha):(2'h3)]));
  always
    @(posedge clk) begin
      reg11 <= $unsigned({wire7, (~^(&wire4[(2'h3):(2'h3)]))});
    end
endmodule
