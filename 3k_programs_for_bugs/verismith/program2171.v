module top
#(parameter param12 = {((~|{(~|(8'hab)), ((8'hbf) ? (8'h9f) : (7'h40))}) ? ({(8'hb0), ((8'hbf) & (8'ha0))} ? (^((7'h42) <<< (8'hb3))) : (~|((8'hba) <<< (8'hb3)))) : (^~({(8'h9f), (8'hbc)} ^ (-(8'ha9)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, wire4, reg11, reg10, reg9, reg8, (1'h0)};
  assign wire4 = wire0[(1'h1):(1'h0)];
  assign wire5 = {((^(~|$signed(wire1))) <<< $unsigned($unsigned($signed(wire3)))),
                     (wire4[(2'h3):(1'h1)] ^ ($signed((-(8'hbf))) <= (~$signed(wire0))))};
  assign wire6 = (^~($unsigned($unsigned((wire0 ?
                     wire0 : (8'hb1)))) >>> wire3));
  assign wire7 = wire5[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg8 <= (^wire4);
      reg9 <= {(~|wire1[(2'h3):(2'h3)]), {$signed($unsigned((!(7'h42))))}};
      reg10 <= (~wire3);
      reg11 <= (-({((~reg10) ? $signed(wire4) : (-(7'h44))),
          $signed(wire2[(1'h1):(1'h0)])} ~^ $signed(((&wire5) && (8'hae)))));
    end
endmodule
