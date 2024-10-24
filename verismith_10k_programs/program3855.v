module top
#(parameter param11 = (7'h44), 
parameter param12 = ((((~&(~^(8'h9f))) <<< param11) - (~^param11)) ? param11 : (((param11 > (&param11)) ^ (param11 ~^ (~^param11))) ? ((!param11) ? {(-param11)} : param11) : (~|((&param11) ? {param11, param11} : (8'hab))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire10, wire8, wire7, wire6, wire5, reg9, (1'h0)};
  assign wire5 = (wire0[(5'h13):(2'h3)] ?
                     $unsigned($unsigned((&wire1[(4'ha):(3'h4)]))) : wire2[(2'h3):(1'h1)]);
  assign wire6 = $unsigned((wire4 ? $unsigned(wire4[(3'h4):(3'h4)]) : wire5));
  assign wire7 = (((~|(wire2 && (wire0 && wire0))) ?
                     wire5 : $unsigned(wire5[(2'h3):(1'h0)])) <= ((8'hb9) ?
                     (((wire2 && wire4) ?
                         $unsigned(wire2) : wire0[(3'h4):(2'h2)]) < ((wire4 || wire0) ?
                         ((8'ha0) <<< wire3) : $unsigned(wire2))) : wire5));
  assign wire8 = $unsigned(((8'had) ?
                     (8'ha0) : ($signed({wire7, (8'hbe)}) ?
                         wire3[(3'h4):(1'h1)] : $signed($unsigned((8'ha5))))));
  always
    @(posedge clk) begin
      reg9 <= (^wire2[(4'hf):(2'h2)]);
    end
  assign wire10 = reg9[(4'h9):(3'h7)];
endmodule
