module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire31;
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire4,
                 wire5,
                 wire6,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire31,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (wire2 ?
                     (($unsigned($signed(wire1)) ?
                         (~&(-(8'hb8))) : {(wire0 <= wire3)}) | $signed($signed(wire2[(2'h2):(2'h2)]))) : (($signed((|(8'hb0))) && (-wire3[(4'h9):(4'h9)])) ?
                         wire3[(1'h1):(1'h1)] : ((-((8'ha8) <= wire2)) ?
                             wire0[(2'h2):(1'h0)] : $unsigned($unsigned(wire3)))));
  assign wire5 = {$signed($unsigned((8'ha7))), $signed(wire1[(1'h1):(1'h1)])};
  assign wire6 = (~^$signed($signed($signed(wire3))));
  always
    @(posedge clk) begin
      reg7 <= (wire0 ? wire4 : $signed((~^wire6[(1'h0):(1'h0)])));
      reg8 <= ($signed((^wire0)) ? wire4 : wire1[(3'h6):(2'h2)]);
      reg9 <= $unsigned(({{$unsigned(wire3)}, (~^(~^(8'hbf)))} ?
          $signed((wire1 ?
              (reg7 ?
                  wire1 : (8'hae)) : $unsigned(wire0))) : wire5[(3'h6):(3'h6)]));
      reg10 <= {(+((wire6 ? wire4 : (~wire3)) ?
              (wire1 ?
                  ((7'h42) ?
                      wire0 : wire0) : $signed(wire6)) : ($unsigned(wire6) ?
                  (wire2 <<< wire1) : $signed(wire5)))),
          {(((wire3 ? wire2 : wire6) ? (reg7 << reg9) : $signed(wire0)) ?
                  ((wire0 > (8'haf)) ?
                      (+wire3) : $signed(wire5)) : $unsigned($signed(wire5))),
              wire2[(1'h1):(1'h1)]}};
      if (((((-$unsigned(wire4)) + (reg8[(5'h11):(4'hd)] ?
              wire0[(1'h0):(1'h0)] : wire3[(4'h8):(3'h6)])) ?
          $unsigned($signed(wire0[(3'h4):(2'h3)])) : wire5) << $unsigned(($signed($signed(wire3)) >> {{wire4},
          wire0[(3'h4):(3'h4)]}))))
        begin
          reg11 <= wire5;
          reg12 <= ((wire0[(2'h2):(1'h0)] ?
              $signed(reg8[(5'h10):(5'h10)]) : ((wire4[(4'hb):(4'h9)] >>> (wire5 ?
                  (8'ha5) : (8'ha8))) && wire2[(2'h2):(1'h0)])) * reg8);
          reg13 <= $signed($signed($unsigned($unsigned($signed(reg11)))));
          reg14 <= $signed(reg13);
          reg15 <= reg12;
        end
      else
        begin
          reg11 <= (^reg13[(3'h7):(1'h1)]);
        end
    end
  assign wire16 = (((~|{wire6}) ?
                      (8'hba) : reg14[(1'h0):(1'h0)]) | ({$signed({reg10,
                              reg7}),
                          wire2[(1'h0):(1'h0)]} ?
                      ($signed((~|wire6)) >= $signed(((7'h43) != reg11))) : (8'hb7)));
  assign wire17 = reg14;
  assign wire18 = reg13;
  assign wire19 = $signed((!((-wire3) ^~ reg14)));
  assign wire20 = $unsigned(wire17[(5'h11):(5'h11)]);
  module21 #() modinst32 (wire31, clk, reg10, reg7, reg11, wire17, reg14);
  assign wire33 = (8'h9c);
  assign wire34 = (+$unsigned(wire4[(4'ha):(3'h4)]));
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire25;
  input wire [(4'ha):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  assign y = {wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = wire25[(5'h10):(4'hc)];
  assign wire28 = $unsigned((!(wire22[(4'h9):(4'h9)] + ({wire27,
                      (8'hbd)} == $unsigned(wire23)))));
  assign wire29 = wire25;
  assign wire30 = wire28[(1'h0):(1'h0)];
endmodule
