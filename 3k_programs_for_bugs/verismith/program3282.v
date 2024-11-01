module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire36,
                 wire16,
                 wire15,
                 wire10,
                 wire9,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($unsigned((($unsigned(wire1) | (wire0 ?
              wire0 : wire1)) ?
          ((&wire0) ? $signed(wire2) : {wire1}) : (+$signed(wire0)))));
      reg5 <= (wire3 ? {wire1} : wire0);
      reg6 <= (8'ha4);
      reg7 <= ($unsigned(reg4[(1'h1):(1'h1)]) * $unsigned(($unsigned(reg5[(3'h5):(2'h3)]) ?
          ($signed(reg6) ?
              (wire2 ? reg6 : wire3) : {reg6,
                  reg6}) : $signed(wire2[(2'h3):(2'h3)]))));
    end
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire3[(4'hd):(4'h9)]);
    end
  assign wire9 = $unsigned($signed($signed($unsigned($unsigned(reg8)))));
  assign wire10 = ((7'h44) ?
                      ($signed(wire2) ?
                          (({(8'ha2), (8'haf)} << wire0[(2'h3):(2'h2)]) ?
                              reg7[(4'hb):(4'h9)] : $signed((&(8'ha3)))) : (wire3 << (((8'ha0) ?
                                  wire3 : reg4) ?
                              wire0 : {wire0}))) : {(^(wire0 >= (7'h42)))});
  always
    @(posedge clk) begin
      reg11 <= {$unsigned(wire1[(1'h0):(1'h0)])};
      reg12 <= {$unsigned(($signed((~|reg5)) - $signed($signed(wire9))))};
      reg13 <= reg8[(1'h1):(1'h1)];
      reg14 <= reg6;
    end
  assign wire15 = (wire1[(3'h4):(2'h2)] & (wire10[(3'h4):(3'h4)] ?
                      {reg12, $unsigned((~reg5))} : ((wire1 ?
                              ((8'ha6) ? (8'hb1) : reg13) : reg11) ?
                          ((wire1 == wire3) == reg14) : (^reg13))));
  assign wire16 = reg5;
  module17 #() modinst37 (wire36, clk, wire15, reg8, wire1, reg14);
  assign wire38 = (reg14[(4'hb):(3'h5)] ?
                      ((|((reg11 ? wire15 : reg13) ?
                          (+reg11) : (wire0 ?
                              wire16 : reg8))) || (!(!(~|(8'hac))))) : reg5[(4'he):(3'h6)]);
  assign wire39 = ((|{{$unsigned(reg13), $unsigned(reg6)},
                      ($unsigned(reg11) ?
                          (reg4 <= reg4) : $unsigned(wire15))}) < (+{(&$unsigned(wire36)),
                      (((8'ha8) << wire2) <<< (reg11 ? wire1 : (8'hb0)))}));
endmodule

module module17
#(parameter param35 = {{(~&({(8'hab)} ~^ ((8'hb1) ? (7'h42) : (8'hb6))))}})
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire21;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire signed [(4'he):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire28,
                 wire24,
                 wire23,
                 wire22,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire22 = wire18;
  assign wire23 = (&(^~$signed(((wire18 ? wire22 : wire18) >>> ((8'hb3) ?
                      (8'ha2) : wire18)))));
  assign wire24 = (8'h9c);
  always
    @(posedge clk) begin
      reg25 <= wire22[(3'h4):(2'h2)];
      reg26 <= $signed($unsigned(wire19));
      reg27 <= wire23[(2'h3):(1'h1)];
    end
  assign wire28 = (wire24[(3'h4):(1'h1)] ?
                      {$signed(wire18)} : $signed($signed((&{wire21}))));
  always
    @(posedge clk) begin
      reg29 <= (-(^(reg26[(1'h1):(1'h1)] << $unsigned(wire23))));
      reg30 <= (~(8'had));
    end
  assign wire31 = reg29[(1'h1):(1'h0)];
  assign wire32 = $unsigned(wire21);
  assign wire33 = $unsigned(wire24);
  assign wire34 = ($unsigned(($signed((8'haf)) >= $unsigned((!reg26)))) ?
                      ((reg27 << reg25) ?
                          wire24 : $signed(reg29[(3'h5):(2'h2)])) : ($signed(($signed((8'hbf)) ?
                          $signed(wire23) : (wire28 <= wire31))) <= ({(!wire32),
                              $unsigned(wire31)} ?
                          {(!wire28)} : $signed({(8'ha6), reg26}))));
endmodule
