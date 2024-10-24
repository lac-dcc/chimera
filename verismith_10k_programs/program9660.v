module top
#(parameter param11 = ((|{(8'ha8), ((~^(8'hb5)) + {(7'h41)})}) ? (((((8'ha9) < (8'h9d)) ? (+(8'ha1)) : (~|(8'ha3))) ? (-((8'hb5) << (8'hbb))) : (((8'hae) ? (8'ha8) : (8'ha3)) | (~(8'hb1)))) >= ((((8'hbb) > (8'had)) ? (|(8'h9f)) : (8'hba)) && (((8'ha1) ~^ (8'ha1)) ? {(8'ha1)} : ((8'ha2) < (8'ha0))))) : (^~(^~{((8'hae) <<< (7'h41)), (^(8'ha5))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  assign y = {wire10, wire8, wire7, wire6, wire5, reg9, (1'h0)};
  assign wire5 = $unsigned({wire4});
  assign wire6 = wire0[(2'h2):(1'h0)];
  assign wire7 = $signed($signed(wire4));
  assign wire8 = ($signed((8'ha6)) == ($signed(($signed((8'ha4)) ?
                         (wire7 ? wire5 : wire3) : wire4[(1'h0):(1'h0)])) ?
                     wire6[(4'hd):(4'hb)] : (!(~|$signed((8'hba))))));
  always
    @(posedge clk) begin
      reg9 <= (&wire5);
    end
  assign wire10 = $signed($signed((~(!(wire1 * wire1)))));
endmodule
