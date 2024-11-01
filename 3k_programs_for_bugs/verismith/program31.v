module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 reg7,
                 (1'h0)};
  assign wire5 = ((~^$signed({wire2[(2'h3):(2'h3)], $signed(wire3)})) ?
                     (wire3[(3'h4):(2'h3)] ?
                         ({{wire3,
                                 wire3}} >> $unsigned(wire4[(2'h2):(1'h1)])) : $signed($signed({wire0}))) : wire4);
  assign wire6 = ((~($signed($signed(wire0)) >> wire1)) ?
                     $unsigned(((&(wire5 ? wire0 : wire4)) ?
                         $signed(wire0[(2'h3):(2'h3)]) : wire2)) : (wire0 ?
                         wire0[(3'h6):(1'h1)] : ({wire3[(1'h0):(1'h0)]} <= (~|wire0[(3'h5):(3'h5)]))));
  always
    @(posedge clk) begin
      reg7 <= $signed(wire0);
    end
  assign wire8 = {(((8'ha0) ? (~|$unsigned(wire2)) : wire3) >>> ({wire2} ?
                         wire4[(3'h5):(1'h1)] : {$unsigned(wire6)})),
                     $unsigned(wire1[(4'he):(2'h3)])};
  assign wire9 = (~|(8'ha6));
  assign wire10 = ($signed($signed($unsigned((~&reg7)))) ^ wire3);
  assign wire11 = ($unsigned($signed((wire9 <= $unsigned(wire1)))) ?
                      (($signed((wire1 + wire10)) ?
                              {((8'hb5) && wire9),
                                  ((8'ha7) ? wire5 : wire0)} : (wire1 ?
                                  (~^wire10) : $signed(wire0))) ?
                          (wire3[(2'h3):(1'h0)] ?
                              (((8'hbb) ? wire2 : wire0) ?
                                  (|wire9) : ((8'ha2) ?
                                      wire4 : wire3)) : $unsigned(wire3[(1'h0):(1'h0)])) : $unsigned(wire4[(3'h5):(3'h4)])) : ($signed(wire10) || (8'h9f)));
  assign wire12 = (~|(~($unsigned($signed(wire0)) < $unsigned(wire5))));
  assign wire13 = $signed($unsigned({((wire8 ? reg7 : wire11) ?
                          $signed(wire6) : {reg7, wire8}),
                      (~^$unsigned(wire6))}));
endmodule
