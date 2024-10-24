module top
#(parameter param11 = ((8'hbb) & ((^(((8'ha3) <= (8'had)) > (+(8'h9c)))) && (|(^{(7'h42), (8'h9e)})))), 
parameter param12 = ((param11 ? (8'h9e) : param11) ? param11 : (({(8'hac), param11} << (^~(param11 ? param11 : param11))) ? (!((param11 >>> param11) > (param11 ^~ param11))) : (!((param11 ? param11 : (7'h44)) != (|param11))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire5, reg6, (1'h0)};
  assign wire5 = (^(&($unsigned({wire1, (8'h9e)}) > ((8'hb3) ?
                     wire0 : {wire4, wire3}))));
  always
    @(posedge clk) begin
      reg6 <= $signed(wire0[(1'h1):(1'h0)]);
    end
  assign wire7 = wire2[(1'h0):(1'h0)];
  assign wire8 = wire1;
  assign wire9 = {($signed($signed(wire0)) && (wire1 ?
                         (+{wire5, reg6}) : $unsigned((wire0 << wire4)))),
                     (!$signed($signed({wire8, wire4})))};
  assign wire10 = wire2[(3'h4):(3'h4)];
endmodule
