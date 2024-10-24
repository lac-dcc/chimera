module top
#(parameter param11 = {(^((((8'ha0) >>> (8'hb8)) ? (~^(7'h40)) : ((8'hba) ? (7'h41) : (8'h9d))) ? {((8'ha1) ? (7'h42) : (7'h43))} : (~&{(8'hbc)})))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire10, wire9, wire7, wire6, wire5, wire4, reg8, (1'h0)};
  assign wire4 = $signed(wire3[(4'hb):(1'h1)]);
  assign wire5 = $signed($unsigned(($signed(wire2[(3'h6):(2'h2)]) ^~ {$unsigned(wire3)})));
  assign wire6 = wire4;
  assign wire7 = wire1[(4'h9):(4'h8)];
  always
    @(posedge clk) begin
      reg8 <= (($unsigned($unsigned($signed(wire6))) >= wire0[(1'h1):(1'h1)]) ?
          ({$signed($signed((7'h44)))} ?
              wire3 : $unsigned($unsigned((wire4 ?
                  wire0 : wire7)))) : ((~((wire3 || wire0) ?
                  $signed((8'ha2)) : $signed(wire0))) ?
              wire3 : (~wire2)));
    end
  assign wire9 = ($signed((((&wire1) ^ {wire7}) ?
                         ((wire1 << wire1) | wire7) : {(wire2 ?
                                 wire0 : wire4)})) ?
                     $signed(wire1[(4'ha):(3'h4)]) : {{{((8'h9d) != wire5),
                                 (&wire0)},
                             $signed((wire1 ? wire4 : (8'hb5)))},
                         ((~$signed(reg8)) ^ {wire0})});
  assign wire10 = wire1;
endmodule
