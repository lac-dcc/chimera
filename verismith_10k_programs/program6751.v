module top
#(parameter param9 = ((((!((8'haf) & (8'hae))) * (((8'ha0) ? (8'hae) : (8'hbe)) ? ((8'ha8) - (8'hac)) : {(7'h44)})) == ((((8'had) ? (7'h41) : (7'h40)) ? {(8'h9e), (8'ha0)} : ((8'hbf) ? (8'ha4) : (8'had))) ~^ (~{(8'ha6), (8'hb5)}))) ^~ (8'hbe)), 
parameter param10 = ({(-((param9 & param9) == (param9 >= (8'hbe))))} ? (&param9) : (((~^(param9 - param9)) ? {(param9 ? param9 : param9), {param9, param9}} : ((param9 ? param9 : param9) ? (param9 ^~ param9) : (8'hb8))) ^~ (((8'ha6) ? (param9 ? param9 : param9) : (param9 ? param9 : param9)) <= ((~|param9) << param9)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, wire4, reg8, reg7, (1'h0)};
  assign wire4 = ($unsigned(wire2[(4'ha):(3'h5)]) != (wire3 == wire1[(3'h4):(3'h4)]));
  assign wire5 = $unsigned({($signed(wire0[(4'h8):(3'h6)]) || ((wire4 >= wire0) >>> $unsigned(wire1))),
                     {$signed({wire3}), (wire3 || wire2)}});
  assign wire6 = (|wire4);
  always
    @(posedge clk) begin
      reg7 <= ({$unsigned(wire2),
              ($unsigned(((8'h9c) >>> wire2)) ?
                  (~^(wire1 ? wire4 : wire2)) : (~&$signed(wire2)))} ?
          wire0[(1'h1):(1'h0)] : (!((~^(wire1 || wire0)) ^~ $signed(wire1[(2'h3):(1'h0)]))));
      reg8 <= (($signed((&reg7)) ?
          wire5 : (~^(+(~&wire4)))) >> $unsigned($unsigned(wire1)));
    end
endmodule
