module top
#(parameter param24 = (^~(&((&(-(8'hbf))) ? (((8'hbe) ? (8'ha4) : (8'hb6)) ? ((8'h9d) ? (8'hb9) : (8'haf)) : (~|(8'hae))) : ((~|(8'haa)) << (8'hba))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire16;
  assign y = {wire23, wire22, wire21, wire20, wire19, wire18, wire16, (1'h0)};
  module4 #() modinst17 (wire16, clk, wire2, wire1, wire3, wire0);
  assign wire18 = (~&wire3);
  assign wire19 = (!$signed(wire18[(2'h3):(1'h0)]));
  assign wire20 = $signed($unsigned(wire18));
  assign wire21 = (~^({$signed(wire16[(4'hb):(2'h3)]), {{wire0, (8'ha1)}}} ?
                      ($signed((wire19 ?
                          wire20 : wire3)) + (~wire19)) : (wire1 ?
                          {{wire18, wire16},
                              wire3} : (((8'h9d) >>> (8'h9d)) ^~ wire16[(3'h5):(2'h3)]))));
  assign wire22 = ($signed($signed($signed((wire3 << wire0)))) ?
                      ((~&wire20) ?
                          ($signed(wire18) ?
                              wire20 : (8'hac)) : $unsigned(wire2[(2'h2):(2'h2)])) : (-(~(^(~^wire20)))));
  assign wire23 = (wire19[(3'h6):(3'h6)] ? wire22 : $signed(wire21));
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire9;
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  assign y = {wire15, wire14, wire9, reg13, reg12, reg11, reg10, (1'h0)};
  assign wire9 = {($signed((+$unsigned(wire5))) ?
                         $unsigned($signed(wire6[(5'h14):(4'hc)])) : $signed(($unsigned(wire6) ?
                             {wire7} : $signed((8'ha1))))),
                     wire7};
  always
    @(posedge clk) begin
      reg10 <= {(!(^~({wire8} <= $unsigned((8'ha2)))))};
      reg11 <= wire8[(1'h0):(1'h0)];
      reg12 <= ($signed($signed((wire8 ? $unsigned(wire5) : (-wire7)))) ?
          wire8 : reg11);
      reg13 <= wire8[(3'h6):(3'h6)];
    end
  assign wire14 = {(!$unsigned((!(~^reg10)))), reg11[(3'h4):(2'h2)]};
  assign wire15 = ($signed((+wire8)) + wire7[(3'h6):(1'h0)]);
endmodule
