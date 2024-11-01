module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, reg12, reg11, (1'h0)};
  assign wire5 = (wire3[(3'h5):(1'h1)] ^~ (~&$signed($unsigned((~wire2)))));
  assign wire6 = $unsigned(wire2);
  assign wire7 = wire0[(3'h6):(3'h5)];
  assign wire8 = $unsigned($unsigned($unsigned(({wire3, wire5} ?
                     wire4 : (wire2 ? (8'h9e) : wire4)))));
  assign wire9 = ($unsigned(((8'hb2) >= (7'h40))) ?
                     {((wire0 ?
                             $unsigned(wire2) : wire7[(2'h3):(1'h1)]) >> $unsigned((wire8 << wire8)))} : ((|wire6) ?
                         (8'hb3) : $unsigned(wire8)));
  assign wire10 = $unsigned(($signed({(wire1 ? wire1 : wire0)}) ?
                      $unsigned(wire7) : (~(8'ha3))));
  always
    @(posedge clk) begin
      reg11 <= ($signed((((wire8 ? wire4 : wire7) * wire2[(3'h4):(2'h2)]) ?
              (7'h40) : ((^~wire6) ? $signed(wire4) : (^wire4)))) ?
          ($signed(wire9[(4'hb):(2'h3)]) <<< {wire2,
              (wire10[(4'hc):(3'h4)] ?
                  (-wire4) : wire1)}) : (+$unsigned($unsigned(wire5[(2'h2):(1'h0)]))));
      reg12 <= $unsigned($unsigned($unsigned(wire10)));
    end
endmodule
