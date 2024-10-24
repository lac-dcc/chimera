module top
#(parameter param34 = (8'hb2), 
parameter param35 = (|(8'h9e)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire24,
                 wire5,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire5 = wire0[(1'h0):(1'h0)];
  module6 #() modinst25 (wire24, clk, wire4, wire5, wire2, wire0);
  assign wire26 = (wire0 ?
                      (wire5[(3'h4):(2'h2)] ?
                          (7'h41) : wire2) : wire4[(3'h7):(2'h3)]);
  assign wire27 = wire2;
  assign wire28 = wire5;
  assign wire29 = $signed(wire3);
  always
    @(posedge clk) begin
      if (wire26)
        begin
          reg30 <= (wire3 & wire26[(2'h3):(2'h2)]);
          if ((|$signed((-wire3))))
            begin
              reg31 <= (($unsigned(((wire26 ?
                      wire2 : wire5) + $unsigned((8'ha4)))) == (((&wire29) >>> (wire2 ?
                          wire24 : wire3)) ?
                      wire5[(3'h4):(1'h1)] : (wire24[(4'hc):(4'hc)] ?
                          $signed(wire24) : (wire3 << (8'ha7))))) ?
                  ((7'h40) ?
                      ((~^(wire3 || wire26)) ^~ ((&wire24) <= (~&wire3))) : ((-((8'hb1) - wire1)) < wire3)) : ($unsigned((^wire26)) ^~ (8'hb4)));
            end
          else
            begin
              reg31 <= $signed(wire0[(4'h8):(1'h1)]);
            end
          reg32 <= reg31[(4'hc):(3'h7)];
          reg33 <= wire3;
        end
      else
        begin
          if ($unsigned(($signed(($signed((8'ha7)) ?
                  (wire5 ? (8'haf) : (8'hbb)) : (wire24 * wire4))) ?
              (^~{$signed(wire29)}) : reg33)))
            begin
              reg30 <= wire1;
              reg31 <= ({reg31[(4'h8):(4'h8)]} ~^ reg31[(4'hd):(4'h8)]);
              reg32 <= $signed($signed((wire2[(4'hb):(3'h6)] ^~ wire1)));
            end
          else
            begin
              reg30 <= ($unsigned((~^reg31[(3'h4):(1'h1)])) ?
                  $unsigned((wire3 - wire2)) : ($unsigned($unsigned(wire4)) & {$unsigned($unsigned(wire28))}));
              reg31 <= $unsigned($signed(wire26));
              reg32 <= $signed(reg33);
              reg33 <= (!wire28[(4'he):(2'h2)]);
            end
        end
    end
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire11;
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire11,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = $unsigned(wire10[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg12 <= (8'ha2);
      reg13 <= wire7;
      reg14 <= $signed(($signed($unsigned($unsigned((8'ha6)))) ?
          ((8'hb3) ? wire8[(4'ha):(1'h1)] : (^~(8'hbf))) : {(7'h40)}));
      reg15 <= $signed(((wire9[(1'h0):(1'h0)] ?
          {$unsigned(wire11)} : reg14) ~^ (~^(+(^wire10)))));
    end
  assign wire16 = $signed(reg14[(1'h1):(1'h1)]);
  assign wire17 = wire9[(1'h0):(1'h0)];
  assign wire18 = reg12[(3'h7):(1'h1)];
  assign wire19 = $signed(($unsigned(wire7) ?
                      (~|($unsigned(reg15) | $unsigned(wire7))) : reg14[(1'h0):(1'h0)]));
  assign wire20 = $signed(wire16);
  assign wire21 = reg15[(4'hd):(4'hd)];
  assign wire22 = ($unsigned(((&reg15[(4'h9):(2'h2)]) + $signed(wire7))) >> wire17[(4'h8):(2'h2)]);
  assign wire23 = (((!$unsigned(wire22)) ?
                      wire19[(1'h1):(1'h0)] : $signed((((8'hb7) >>> (8'h9f)) != (!reg12)))) ~^ (7'h43));
endmodule
