module top #(parameter param11 = (8'ha4)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire5, wire4, reg6, (1'h0)};
  assign wire4 = (!$unsigned(wire3[(4'h8):(3'h5)]));
  assign wire5 = {$signed(wire4[(3'h5):(3'h4)]), wire3};
  always
    @(posedge clk) begin
      reg6 <= $signed($signed((($signed(wire2) >>> $signed(wire5)) ?
          ({wire5, wire5} * wire3) : $unsigned((wire2 == wire2)))));
    end
  assign wire7 = (((&(wire0[(2'h3):(1'h1)] > (-wire1))) >> (({wire3} ?
                         (&reg6) : wire5) && wire0[(2'h3):(1'h1)])) ?
                     (^$unsigned((wire5[(3'h7):(3'h4)] ?
                         ((8'haf) <= wire0) : wire2))) : $unsigned($unsigned({wire3})));
  assign wire8 = $unsigned(($unsigned(wire2[(4'hf):(4'hb)]) ?
                     (((wire2 ? wire7 : wire2) ? (|wire0) : $signed(reg6)) ?
                         wire5[(4'hc):(3'h6)] : wire3) : $signed(wire5)));
  assign wire9 = ((((^$signed(wire1)) ?
                     wire5[(2'h2):(2'h2)] : ($unsigned(wire3) ?
                         (wire7 && wire1) : (~&wire3))) << $signed((reg6 <<< {(7'h40)}))) >= (^((~|$signed(wire1)) ?
                     $signed((8'ha0)) : (~|(^wire4)))));
  assign wire10 = wire0;
endmodule
