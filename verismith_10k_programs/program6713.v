module top
#(parameter param19 = (({(~((8'h9d) ? (8'hbf) : (8'ha4)))} == (~|(((8'hb4) ? (8'hb2) : (8'ha3)) >= (~^(8'ha9))))) < ((^~{(|(8'hb4))}) >> {(~(|(8'hbc))), (^~((8'hb8) ? (8'hb4) : (8'ha8)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = (+$signed($signed(wire0[(2'h3):(1'h1)])));
  assign wire5 = (-((~&wire4[(2'h3):(1'h1)]) >> (&wire1[(3'h4):(1'h0)])));
  assign wire6 = wire4;
  assign wire7 = $signed((^~((((8'hb1) ? wire3 : wire5) ?
                         (^~wire0) : $unsigned(wire0)) ?
                     {(~^wire3)} : ($signed(wire6) ?
                         {(8'hb8)} : (wire1 * wire3)))));
  assign wire8 = ($unsigned($signed({{wire3, wire7}})) * (^(({wire7} ?
                         (wire7 ? wire3 : wire6) : wire1) ?
                     wire3[(5'h10):(5'h10)] : (+$unsigned(wire1)))));
  always
    @(posedge clk) begin
      if ((|(wire1[(3'h4):(3'h4)] << ($unsigned(wire8) ?
          wire2 : $unsigned($unsigned(wire1))))))
        begin
          reg9 <= wire0;
          reg10 <= wire0[(1'h1):(1'h1)];
        end
      else
        begin
          reg9 <= $signed(reg10[(4'h8):(2'h3)]);
        end
      reg11 <= (8'hb4);
      reg12 <= wire0;
      reg13 <= wire5[(2'h3):(1'h1)];
    end
  assign wire14 = ((wire7[(3'h7):(3'h6)] * (((^~wire1) ?
                          $unsigned((8'ha9)) : $signed(wire7)) << {(reg12 ?
                              (8'h9f) : wire2)})) ?
                      $signed((~(reg11[(3'h4):(1'h0)] ?
                          $signed(wire1) : $signed(reg11)))) : (reg12[(3'h4):(3'h4)] <<< reg12));
  assign wire15 = $unsigned(((reg9 != $unsigned(reg13[(3'h6):(1'h1)])) ?
                      wire6[(5'h13):(3'h5)] : {$unsigned($signed(wire6))}));
  assign wire16 = $signed($unsigned(wire4[(3'h6):(3'h4)]));
  assign wire17 = (^~wire7);
  assign wire18 = {(wire2 | (+((wire3 ? wire7 : wire7) ?
                          $unsigned(wire14) : wire3[(5'h11):(4'he)])))};
endmodule
