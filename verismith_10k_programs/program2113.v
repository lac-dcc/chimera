module top
#(parameter param8 = (({(-(|(8'ha6))), (~|(~(8'hbf)))} * {(((8'hbf) ? (8'hb0) : (8'hb0)) ? (8'h9c) : ((8'hae) ? (8'ha6) : (8'hb2)))}) ? (!{(((8'had) * (8'ha5)) > {(8'hb6), (8'hb3)})}) : ((-(((8'ha4) ? (8'hb5) : (8'hb4)) ? (+(8'hbb)) : (~|(8'ha5)))) != ((8'ha9) ? (((8'hb4) ? (8'ha7) : (8'hb8)) ? (~&(8'hbc)) : ((7'h40) ? (8'hb0) : (8'ha6))) : (((8'hb0) ? (8'ha6) : (8'hba)) || ((8'hbf) ? (8'hb2) : (8'ha8)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire7, wire6, wire5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($signed(wire0));
    end
  assign wire5 = $unsigned($unsigned($unsigned(wire2)));
  assign wire6 = (({$unsigned({wire2, reg4})} ?
                         wire3[(2'h2):(2'h2)] : {{{(8'ha0), (8'hb5)},
                                 $signed(wire0)}}) ?
                     $signed((((wire0 >>> (7'h40)) <= wire1) ?
                         (wire3[(2'h2):(1'h0)] == wire5[(4'hb):(2'h3)]) : reg4[(4'ha):(1'h0)])) : wire3);
  assign wire7 = $unsigned($signed($signed(wire5)));
endmodule
