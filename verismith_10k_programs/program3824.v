module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed($unsigned({($unsigned((8'ha6)) ?
                         (wire1 - wire1) : $signed(wire3)),
                     (8'hb9)}));
  assign wire6 = $signed(wire2[(4'he):(1'h0)]);
  assign wire7 = wire4;
  assign wire8 = (+(^~{$unsigned((~wire7))}));
  always
    @(posedge clk) begin
      reg9 <= ({wire7[(3'h7):(1'h0)], wire7[(1'h0):(1'h0)]} - $unsigned(wire1));
      reg10 <= (wire2[(5'h10):(4'h9)] & (($unsigned($unsigned(wire8)) ?
              $unsigned(wire3[(1'h0):(1'h0)]) : wire1[(4'he):(4'he)]) ?
          (-wire0) : (^~(reg9[(3'h4):(2'h3)] ?
              $signed((8'ha8)) : $signed(wire1)))));
      reg11 <= (~^{(($unsigned((8'ha7)) + reg9) ?
              ($signed(wire8) != (wire1 << reg10)) : reg10)});
      reg12 <= (^~((~^reg11[(2'h3):(1'h0)]) ?
          ((|wire3[(2'h2):(1'h0)]) ?
              (-(wire1 > wire5)) : ({wire6,
                  (8'hab)} <= $unsigned(wire0))) : $unsigned($unsigned($unsigned((7'h41))))));
      reg13 <= reg9[(4'hd):(4'h8)];
    end
  assign wire14 = $unsigned(reg11[(4'h8):(1'h1)]);
  assign wire15 = (^~(wire14[(3'h6):(3'h5)] ?
                      $signed(wire7) : ((~{reg9}) > (^(|wire4)))));
  assign wire16 = $unsigned(($unsigned(reg9[(4'ha):(4'ha)]) ?
                      wire4 : (~|wire14)));
  assign wire17 = (8'ha7);
  assign wire18 = (8'hab);
  assign wire19 = wire17[(3'h4):(1'h1)];
  assign wire20 = $unsigned(($signed({{wire4,
                          reg11}}) >= (~&{$unsigned((8'ha0))})));
  assign wire21 = wire14[(4'hf):(2'h2)];
  assign wire22 = ($signed(wire1) >>> wire5);
  assign wire23 = (~|reg11);
endmodule
