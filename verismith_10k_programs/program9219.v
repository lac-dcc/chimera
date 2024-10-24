module top
#(parameter param30 = ((|(^~(~&((8'h9f) >> (8'ha8))))) || ((~|{(~^(8'ha5))}) - (~|(~^((8'hbe) ? (8'ha7) : (8'had)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg11,
                 (1'h0)};
  assign wire5 = $signed(wire4[(1'h0):(1'h0)]);
  assign wire6 = (wire2 + $unsigned((~&{wire5[(3'h7):(3'h6)]})));
  assign wire7 = $unsigned(($unsigned(($unsigned(wire2) ?
                     (wire4 <= wire4) : wire4[(4'hd):(1'h1)])) >> (($signed(wire0) > $unsigned((8'hb6))) ?
                     ((wire5 ? (8'h9c) : wire3) ?
                         $unsigned(wire4) : wire3[(3'h5):(3'h5)]) : ($signed(wire0) ?
                         (~wire6) : (wire1 ? (8'hb5) : wire3)))));
  assign wire8 = (~&$unsigned($unsigned($unsigned($signed(wire7)))));
  assign wire9 = wire7[(3'h4):(2'h3)];
  assign wire10 = wire7[(5'h13):(4'hc)];
  always
    @(posedge clk) begin
      reg11 <= ($signed(({(wire5 ? wire5 : wire6),
          wire3[(3'h4):(2'h3)]} && wire1[(3'h4):(1'h1)])) >> ($signed(wire10[(2'h2):(1'h1)]) >= (^~(&wire7))));
      if ($unsigned(wire0))
        begin
          reg12 <= (((wire0 ?
              (wire7 & wire7) : wire1[(4'hb):(2'h3)]) >>> (+wire10[(3'h5):(3'h4)])) - ($signed(((&reg11) ?
              wire4 : {wire10, wire10})) ~^ ((reg11 ?
                  $signed(wire1) : $unsigned(wire0)) ?
              (~$unsigned(wire1)) : (^{wire9, (8'haf)}))));
          reg13 <= ((reg12 ^~ $signed($unsigned($unsigned(wire8)))) ?
              ($signed($unsigned(((8'ha9) <= wire8))) ?
                  wire8[(3'h4):(1'h1)] : (!({reg11, wire9} ?
                      $unsigned(wire2) : wire10))) : $unsigned(wire8[(3'h5):(3'h5)]));
        end
      else
        begin
          if (wire2[(4'ha):(3'h6)])
            begin
              reg12 <= wire4[(3'h6):(3'h4)];
              reg13 <= (reg12[(1'h0):(1'h0)] ?
                  (($signed((+reg12)) ?
                      $signed(((7'h40) ^ wire0)) : (+$signed(reg11))) <= {{$signed(wire4)}}) : ({({wire6,
                          wire10} == {wire5,
                          wire4})} >= ((wire1[(4'he):(3'h6)] ?
                          (reg12 < (8'hb9)) : ((8'ha7) ? wire9 : wire6)) ?
                      $signed({wire9,
                          wire7}) : $signed(reg12[(1'h0):(1'h0)]))));
              reg14 <= (!wire5[(4'ha):(3'h6)]);
              reg15 <= wire0[(3'h4):(3'h4)];
            end
          else
            begin
              reg12 <= (-$unsigned((&((wire8 && wire6) ?
                  wire9 : $unsigned(wire6)))));
              reg13 <= $signed($signed(reg13[(3'h4):(2'h2)]));
              reg14 <= (wire5 ?
                  (({wire10[(3'h4):(1'h1)], wire7[(2'h3):(2'h3)]} ?
                      (reg14 >>> $unsigned(reg12)) : wire3[(1'h1):(1'h0)]) + $unsigned(((|wire2) ^~ {wire1,
                      reg14}))) : (reg14 ?
                      (&(~|reg15)) : wire6[(4'h9):(3'h7)]));
              reg15 <= (-(|($unsigned((wire2 <<< wire1)) ?
                  (^wire10[(4'ha):(3'h4)]) : ((wire7 ? reg14 : reg12) ?
                      (8'hb0) : $signed(reg15)))));
              reg16 <= {$unsigned({{(wire0 ? wire6 : reg14)},
                      wire4[(3'h7):(1'h1)]})};
            end
          reg17 <= $unsigned(((($signed(reg12) | (reg14 > wire1)) & wire10[(1'h0):(1'h0)]) ?
              (wire0 ?
                  wire3 : $signed(((8'hb5) ?
                      wire6 : wire8))) : ((^~reg11[(3'h6):(2'h3)]) ?
                  reg12[(1'h1):(1'h1)] : {(wire3 ? wire6 : wire9),
                      $signed(reg13)})));
          if ((~|wire5))
            begin
              reg18 <= reg12;
              reg19 <= (-$unsigned($signed(reg13[(3'h7):(2'h2)])));
              reg20 <= wire10;
              reg21 <= ($signed($unsigned(({reg18, wire4} ?
                  $signed(wire8) : $signed(wire10)))) != ((((reg17 ?
                      wire8 : wire6) <<< $signed(reg15)) ?
                  $unsigned(reg18[(2'h3):(1'h0)]) : $unsigned((~&wire5))) >>> (~|((reg12 > wire1) >= (wire1 >= (8'ha0))))));
              reg22 <= $unsigned(wire10);
            end
          else
            begin
              reg18 <= wire7;
              reg19 <= wire6;
            end
        end
      reg23 <= $unsigned(($unsigned($signed((reg22 - wire2))) ?
          ($signed((!reg21)) - (^~(|reg22))) : ((!(+(8'ha3))) ?
              $signed($signed(wire7)) : $signed(reg21[(2'h2):(1'h0)]))));
      reg24 <= (~|(~|wire5));
    end
  assign wire25 = wire5;
  assign wire26 = $signed($signed((reg16 <= ((wire3 ? reg11 : (8'hb8)) ?
                      reg14[(2'h2):(1'h0)] : $signed(wire2)))));
  assign wire27 = $unsigned(reg11[(3'h4):(1'h0)]);
  assign wire28 = (($unsigned((~(^~reg15))) & (reg16 ?
                      $signed((wire2 ^ (8'h9d))) : $signed((reg18 ?
                          reg15 : wire10)))) ~^ $signed({wire2,
                      $unsigned(wire4)}));
  assign wire29 = wire7[(5'h13):(4'hf)];
endmodule
