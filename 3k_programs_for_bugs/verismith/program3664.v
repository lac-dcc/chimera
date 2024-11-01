module top
#(parameter param35 = (~&((((~&(8'hb8)) <<< {(8'hba), (8'haa)}) || (((8'hb7) >>> (8'hb1)) ? {(7'h43), (8'h9c)} : (~(8'ha0)))) << (~((~(8'ha0)) ? ((8'ha4) ? (8'ha6) : (8'ha5)) : {(8'hb3)})))), 
parameter param36 = (~&{(param35 * param35), ({(param35 != param35)} & (&(|param35)))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire7;
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire7,
                 reg31,
                 reg30,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire3);
      reg6 <= {((($signed(wire3) & wire3[(2'h2):(2'h2)]) - wire4) & reg5),
          reg5[(2'h3):(1'h0)]};
    end
  assign wire7 = {((8'hbc) ~^ $unsigned(wire4[(1'h0):(1'h0)]))};
  always
    @(posedge clk) begin
      reg8 <= wire4;
      reg9 <= reg6[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ({$signed((wire7 >> (~|$unsigned(wire7))))})
        begin
          reg10 <= wire7[(3'h6):(3'h5)];
        end
      else
        begin
          reg10 <= $signed({((+$signed(reg9)) && {(wire4 ? reg9 : wire4)})});
          reg11 <= $unsigned((!$signed($signed((reg9 ? reg8 : reg10)))));
        end
      reg12 <= wire0[(3'h4):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg13 <= $unsigned(($unsigned(({reg9, reg5} ?
          reg10 : $unsigned(wire4))) ~^ wire0));
      reg14 <= ($unsigned({reg8,
          {wire3[(1'h0):(1'h0)]}}) != $signed($unsigned(($signed(reg9) ?
          wire2 : reg9[(2'h3):(2'h2)]))));
    end
  assign wire15 = wire2[(3'h4):(1'h1)];
  assign wire16 = (reg14 | {((reg12 ?
                          (reg11 + wire2) : {reg11,
                              reg6}) | reg13[(1'h1):(1'h0)])});
  assign wire17 = ((&(^reg6[(4'h8):(3'h5)])) <<< reg8[(4'ha):(2'h2)]);
  assign wire18 = (|(((wire2 > reg14[(3'h5):(1'h0)]) ?
                      reg8[(1'h1):(1'h1)] : reg10) != (wire2 == reg9[(1'h1):(1'h1)])));
  assign wire19 = $unsigned(wire0);
  assign wire20 = wire15;
  always
    @(posedge clk) begin
      reg21 <= (8'h9d);
      reg22 <= $signed(wire18[(2'h3):(1'h0)]);
      reg23 <= reg5[(2'h2):(1'h0)];
      reg24 <= (&wire7);
    end
  assign wire25 = (~&(8'hbf));
  assign wire26 = $signed(wire17);
  assign wire27 = (~&(~reg21[(3'h7):(2'h3)]));
  assign wire28 = $signed(wire15[(4'hf):(1'h0)]);
  assign wire29 = (wire4 ? reg8 : (reg12 > (8'hb5)));
  always
    @(posedge clk) begin
      reg30 <= (~|((~&{wire27[(1'h1):(1'h1)], wire28[(1'h1):(1'h1)]}) ?
          $unsigned((!{wire20})) : $unsigned($unsigned($signed((8'hbf))))));
      reg31 <= wire7;
    end
  assign wire32 = {reg12[(3'h7):(3'h5)]};
  assign wire33 = (~$signed(({{wire19, reg14}} ?
                      $signed(wire32) : ({wire4, wire20} + {reg30, reg13}))));
  assign wire34 = (wire25[(1'h0):(1'h0)] * (&$unsigned((wire29 * (8'hbf)))));
endmodule
