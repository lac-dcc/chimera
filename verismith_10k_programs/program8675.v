module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed((~|wire1));
  assign wire6 = wire5[(4'h9):(1'h0)];
  module7 #() modinst27 (wire26, clk, wire0, wire3, wire1, wire4);
  assign wire28 = wire5;
  assign wire29 = (^~wire26);
  assign wire30 = (~wire5[(2'h3):(1'h1)]);
  assign wire31 = $signed(wire2[(3'h6):(3'h5)]);
  assign wire32 = (~^$signed($unsigned((wire4 ?
                      (^~wire2) : (wire31 ? wire3 : wire5)))));
  assign wire33 = (8'ha5);
  assign wire34 = wire30;
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg25,
                 reg24,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= wire11;
      reg13 <= {$signed((~$signed((wire10 ? reg12 : reg12)))),
          reg12[(2'h2):(2'h2)]};
      reg14 <= (~(!$signed(wire8)));
      reg15 <= (~^wire9);
      if (reg13)
        begin
          reg16 <= reg15[(3'h7):(3'h5)];
          reg17 <= $signed((7'h44));
        end
      else
        begin
          reg16 <= ($unsigned($signed({(wire8 ? (8'haf) : (8'ha6))})) ?
              (~&(!{{reg14}, (reg14 + wire9)})) : reg15[(1'h0):(1'h0)]);
        end
    end
  assign wire18 = (~|reg17[(4'hd):(3'h4)]);
  assign wire19 = $signed($signed({$unsigned((|(8'ha7))),
                      (wire9 <= $unsigned(wire18))}));
  assign wire20 = {$unsigned((~&wire8[(4'he):(4'h9)])), reg16[(2'h3):(2'h2)]};
  assign wire21 = reg14;
  assign wire22 = ($signed($signed((~|$unsigned(reg16)))) ?
                      (reg14 ~^ ((wire19 != (wire20 ?
                          reg13 : wire20)) >>> {$signed(wire19)})) : {(~(((8'hb7) != reg15) - {(8'hbe),
                              wire8})),
                          reg17[(5'h13):(4'hd)]});
  assign wire23 = $signed($signed($signed((7'h41))));
  always
    @(posedge clk) begin
      reg24 <= (8'ha1);
      reg25 <= (wire18[(3'h6):(3'h5)] ?
          wire8[(3'h5):(1'h1)] : (reg14 || (wire18 ?
              reg17 : $unsigned({wire19}))));
    end
endmodule
