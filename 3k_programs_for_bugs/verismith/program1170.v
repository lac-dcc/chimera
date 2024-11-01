module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire9, wire6, wire5, reg8, reg7, (1'h0)};
  assign wire5 = ((~(8'ha5)) | $signed(wire1));
  assign wire6 = {(^$signed($signed((8'hb9)))), wire4};
  always
    @(posedge clk) begin
      reg7 <= (|($unsigned(((8'hb9) * wire0)) & {(+(wire5 ? wire0 : wire0))}));
      reg8 <= $signed(({((wire4 ? (7'h41) : wire5) ?
                  wire1[(4'he):(1'h1)] : ((8'hbe) ? wire5 : (8'hb1)))} ?
          $signed(((wire5 ^~ wire4) ?
              (wire5 > (8'h9d)) : $unsigned(wire2))) : $signed($signed(wire1))));
    end
  assign wire9 = $signed((~^(^(&wire2[(4'hb):(1'h1)]))));
endmodule
