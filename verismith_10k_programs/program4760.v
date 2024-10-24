module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  assign y = {wire21,
                 wire13,
                 wire12,
                 wire11,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $unsigned($unsigned(wire1));
  assign wire6 = $signed(($unsigned(wire0) ?
                     (^~$unsigned(wire0[(3'h7):(2'h2)])) : wire2[(3'h6):(3'h5)]));
  assign wire7 = $unsigned(wire0);
  always
    @(posedge clk) begin
      reg8 <= wire7;
      reg9 <= {(+$signed($unsigned($unsigned(wire7)))),
          (wire3[(4'ha):(2'h3)] ?
              (+$signed((^wire1))) : $signed($unsigned(((8'h9f) && wire6))))};
      reg10 <= {wire4[(2'h2):(1'h1)], wire4};
    end
  assign wire11 = (~&wire7);
  assign wire12 = wire4[(2'h2):(1'h0)];
  assign wire13 = wire3;
  always
    @(posedge clk) begin
      reg14 <= (wire1[(2'h3):(2'h3)] ?
          (&{$unsigned($signed(reg9))}) : (~^(((wire7 ?
                  wire1 : (8'hbb)) >> $signed((8'hae))) ?
              wire11 : (-(wire5 == (8'ha2))))));
      if ($signed((~|$signed($signed(reg9[(4'hd):(3'h4)])))))
        begin
          reg15 <= $signed($unsigned(($unsigned({wire12}) ?
              (wire13 ?
                  (wire13 ? reg8 : (7'h43)) : (8'hb3)) : $signed({wire0}))));
          reg16 <= (~|$unsigned($signed(($signed(reg10) ~^ (~|wire4)))));
          reg17 <= wire6[(2'h2):(2'h2)];
          reg18 <= $unsigned(({($signed(wire0) ?
                      wire7[(4'hc):(2'h2)] : $signed(wire13)),
                  (&$signed(wire3))} ?
              (-$unsigned(wire6[(4'hd):(1'h1)])) : (($unsigned(wire12) ?
                  {(8'ha0)} : (wire6 + wire4)) - (8'hb8))));
          reg19 <= {wire13, $unsigned(({$unsigned(wire13)} ? (7'h44) : reg14))};
        end
      else
        begin
          reg15 <= reg9;
        end
      reg20 <= (+reg16);
    end
  assign wire21 = $unsigned((reg16 & $signed($unsigned((wire12 > reg18)))));
endmodule
