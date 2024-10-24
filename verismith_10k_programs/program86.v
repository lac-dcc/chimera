module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = wire1[(1'h0):(1'h0)];
  assign wire6 = $unsigned(((|wire0) ?
                     ((^$unsigned(wire1)) << ({wire0, wire5} ?
                         (wire0 ? wire4 : wire2) : $unsigned(wire4))) : wire1));
  assign wire7 = ((wire1 < (wire2 | ({wire2, (8'ha0)} ?
                     (wire6 ^~ (8'hb8)) : {(8'hba),
                         wire4}))) + wire6[(1'h1):(1'h0)]);
  assign wire8 = (7'h43);
  assign wire9 = (^((|wire0[(2'h3):(2'h3)]) ?
                     ((wire7 && $unsigned(wire2)) ?
                         wire8[(1'h0):(1'h0)] : {$signed(wire3)}) : wire3));
  assign wire10 = wire2[(2'h3):(1'h0)];
  assign wire11 = $signed($signed((^~(wire3[(2'h2):(2'h2)] - {wire6}))));
  always
    @(posedge clk) begin
      reg12 <= (~$signed(((~&$unsigned(wire0)) <<< wire3)));
      reg13 <= $unsigned(wire11);
      if (($unsigned((wire1[(3'h4):(1'h1)] ^~ {(wire0 ? wire11 : wire5),
              $signed(wire1)})) ?
          $signed((8'hbb)) : wire5))
        begin
          reg14 <= ((($unsigned((!wire5)) <<< {{reg13}}) || {$signed($signed((8'ha5)))}) ?
              reg13 : $unsigned($signed(((wire4 <<< wire2) ?
                  $unsigned(wire10) : (wire2 ? wire0 : wire2)))));
          reg15 <= $unsigned($signed($signed((^$signed(wire3)))));
        end
      else
        begin
          reg14 <= wire3[(1'h0):(1'h0)];
          if (reg15[(5'h11):(1'h0)])
            begin
              reg15 <= wire0;
              reg16 <= ($unsigned($signed($signed((8'hb3)))) ?
                  {$unsigned((((8'ha0) | reg15) | wire2[(3'h6):(2'h3)])),
                      $signed((|(+wire11)))} : ($signed(($unsigned((8'h9e)) ?
                      wire8[(3'h4):(1'h0)] : wire5[(4'ha):(1'h1)])) || (^((wire10 <= wire11) ?
                      (!wire4) : (reg12 ? wire5 : wire3)))));
              reg17 <= wire2;
              reg18 <= ($unsigned((~^$signed(wire6))) ?
                  ({(reg13 ? (reg12 ? wire7 : wire2) : (wire7 <<< reg13)),
                      (^(reg15 - wire11))} - (wire9[(4'hc):(3'h6)] ?
                      (reg13[(4'hf):(4'hf)] <<< reg12[(4'h9):(2'h3)]) : wire8)) : {(+((^(8'hbd)) ^~ (!wire2))),
                      $unsigned(wire8[(3'h7):(3'h4)])});
              reg19 <= wire4;
            end
          else
            begin
              reg15 <= {$signed($signed($signed(reg13[(3'h5):(1'h0)])))};
              reg16 <= wire3;
            end
          reg20 <= {(8'ha0)};
          reg21 <= (8'ha6);
          reg22 <= reg14[(3'h6):(2'h2)];
        end
      reg23 <= ($signed($unsigned($unsigned((^(8'ha1))))) <= $unsigned(wire11));
      reg24 <= ((!(-(wire9[(4'hc):(2'h2)] - reg14[(4'hf):(3'h6)]))) == $signed({(wire2 ?
              $signed(reg20) : (+reg19))}));
    end
  assign wire25 = wire3[(2'h2):(1'h1)];
  assign wire26 = wire0[(2'h2):(1'h0)];
  assign wire27 = (~|reg18);
  assign wire28 = (reg20[(3'h4):(2'h3)] != wire6[(3'h5):(1'h1)]);
  assign wire29 = (+reg14[(4'hd):(3'h5)]);
  assign wire30 = $unsigned($signed(wire10[(1'h0):(1'h0)]));
  assign wire31 = (wire5[(5'h13):(1'h1)] - $unsigned(reg12[(4'hb):(3'h6)]));
  always
    @(posedge clk) begin
      reg32 <= $signed((wire0 <= ($signed({wire0, wire29}) ?
          $signed(wire4) : ((reg20 ? wire29 : wire0) ?
              (wire31 & wire11) : $signed(reg21)))));
      reg33 <= $unsigned(($unsigned(($unsigned(wire0) - $signed((8'hb8)))) < $signed(((wire3 + (8'hab)) ?
          $unsigned((8'haa)) : wire27[(4'hd):(4'h9)]))));
      reg34 <= $signed((-(~&{wire28[(2'h2):(1'h0)]})));
      reg35 <= wire28;
    end
endmodule
