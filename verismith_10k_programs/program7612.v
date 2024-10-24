module top
#(parameter param38 = ((((^((8'h9c) ? (8'h9f) : (8'ha1))) ^~ {((8'hbf) ? (8'hb9) : (8'h9f))}) ? (~((+(8'haa)) ? {(8'hb4), (8'ha5)} : {(8'ha8), (8'hb0)})) : {{(8'hbe), ((8'had) ? (8'haf) : (7'h40))}, {((8'haf) ? (7'h44) : (8'hbb)), {(8'ha1)}}}) >= (~&({((8'haf) ? (8'hbc) : (8'h9f)), (+(8'ha8))} >> ({(8'ha4), (8'hbc)} ? (&(8'ha9)) : {(8'hba)})))), 
parameter param39 = (+(~{param38})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg27,
                 reg26,
                 reg25,
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
  assign wire5 = {wire1[(2'h2):(1'h0)], $unsigned(wire0)};
  assign wire6 = (($signed($signed(((8'hb8) ? wire5 : wire2))) ?
                     $signed(wire0[(2'h3):(2'h3)]) : $signed(($unsigned((8'hae)) ?
                         (8'hb8) : wire4))) + wire0);
  assign wire7 = wire0[(3'h7):(3'h6)];
  assign wire8 = (!wire2[(4'hb):(4'hb)]);
  assign wire9 = (wire3[(4'hf):(3'h7)] ?
                     wire1 : (~^(((wire3 ?
                         (8'hb7) : wire2) <<< wire8) <<< ((wire3 - wire1) & (wire4 && wire6)))));
  assign wire10 = $unsigned(($unsigned(($signed(wire9) ?
                          (wire7 ? wire3 : wire1) : (+wire4))) ?
                      wire2 : $unsigned((!wire9[(3'h6):(1'h0)]))));
  assign wire11 = ($signed({((wire7 ? wire6 : wire8) < $unsigned(wire9))}) ?
                      (wire9 >= {$unsigned(wire5)}) : ({(~&(wire8 ?
                                  (8'hb7) : wire5)),
                              ({wire9} != (wire7 ? wire10 : wire6))} ?
                          wire7[(4'ha):(1'h1)] : ($signed(((8'hbc) ?
                              (8'ha3) : (7'h42))) & (~&(^(8'hbc))))));
  always
    @(posedge clk) begin
      reg12 <= (wire8[(4'ha):(2'h2)] ?
          wire9[(4'ha):(3'h5)] : wire11[(3'h4):(1'h1)]);
      reg13 <= ({((wire0 ? ((8'h9f) ? wire6 : (8'hab)) : wire4) < wire0),
              $signed($unsigned($signed((8'hbf))))} ?
          $unsigned($signed(((&wire8) >> (wire3 ?
              wire10 : wire2)))) : (!wire2[(1'h0):(1'h0)]));
      reg14 <= $signed(($signed((~^wire11[(4'hc):(2'h2)])) < reg12));
      if ((wire9 ? (8'haf) : wire6))
        begin
          reg15 <= ((+(&$signed($unsigned(wire10)))) ?
              (|wire1[(1'h1):(1'h1)]) : $signed(wire5[(4'h8):(2'h3)]));
          if ($signed(reg12[(4'hb):(4'h9)]))
            begin
              reg16 <= ($signed(wire6) ?
                  ((wire3 != wire1) >>> {(~&wire11[(3'h5):(3'h4)])}) : ((wire8 ?
                          (wire6[(1'h1):(1'h1)] ?
                              (reg12 != wire1) : (reg15 ~^ wire0)) : (wire2 && $signed(reg13))) ?
                      ((-reg13[(4'h9):(3'h6)]) << (wire1[(3'h5):(1'h0)] ?
                          {wire6} : (reg12 ^ wire7))) : wire3));
            end
          else
            begin
              reg16 <= wire3[(5'h14):(4'he)];
              reg17 <= ((8'hb8) ~^ wire7[(2'h3):(1'h1)]);
              reg18 <= ((wire8 ?
                  wire4 : (~|($signed(wire0) != (reg17 & wire11)))) != ($signed((reg12[(4'h9):(2'h2)] ?
                  wire11 : (reg16 | reg16))) * wire2));
              reg19 <= $signed($signed((!((wire3 + wire3) && $unsigned(reg14)))));
              reg20 <= wire2[(3'h6):(2'h3)];
            end
          reg21 <= $signed({(8'hb2)});
          if ({wire5[(4'ha):(3'h7)]})
            begin
              reg22 <= reg15;
              reg23 <= {($signed(wire8[(1'h0):(1'h0)]) ?
                      ((|wire9) ^ $signed((wire3 >= wire8))) : $unsigned((8'hb1))),
                  $signed((~^((+wire11) ?
                      $signed(reg18) : (reg22 ? reg18 : wire9))))};
              reg24 <= (($unsigned($unsigned($signed((8'ha0)))) <= (~&wire7[(2'h2):(2'h2)])) ?
                  reg18 : ((&wire11) ?
                      wire10 : (reg20[(2'h2):(1'h0)] >>> wire5)));
              reg25 <= wire5;
              reg26 <= (8'h9f);
            end
          else
            begin
              reg22 <= (((!$signed((reg24 ? wire5 : wire10))) ?
                  ($signed((~wire6)) != {wire0}) : ((~^$unsigned(reg26)) * (wire1[(2'h3):(2'h3)] >>> wire6[(2'h2):(1'h1)]))) >> wire9);
              reg23 <= ((reg16[(4'hd):(4'hb)] ?
                  (($unsigned((8'hb6)) | (~wire1)) ?
                      reg22[(1'h0):(1'h0)] : (-$unsigned((8'hb3)))) : reg15) & reg17[(1'h1):(1'h1)]);
              reg24 <= (~&(wire8 > (8'ha9)));
            end
        end
      else
        begin
          reg15 <= $unsigned($unsigned(reg18[(1'h0):(1'h0)]));
          if ((~|(~&(((reg19 ? (8'hbd) : reg21) != (7'h42)) ~^ (-(~^reg14))))))
            begin
              reg16 <= (^~(~&(((reg19 != wire8) ?
                      $signed((8'hbf)) : $unsigned(wire3)) ?
                  wire1[(2'h2):(1'h1)] : (!(reg15 ? reg18 : wire1)))));
              reg17 <= wire2[(3'h7):(2'h3)];
              reg18 <= $unsigned(reg22[(4'h8):(1'h0)]);
              reg19 <= $unsigned({reg20[(1'h0):(1'h0)]});
              reg20 <= wire9[(4'hc):(1'h0)];
            end
          else
            begin
              reg16 <= {$signed(wire5[(1'h1):(1'h0)]),
                  ($unsigned($unsigned((~&wire1))) >> $unsigned((&(+reg23))))};
              reg17 <= ((reg26[(4'hc):(3'h4)] ?
                  (^reg20[(1'h0):(1'h0)]) : (($unsigned(wire1) << (&wire1)) > wire9)) ^~ (!(wire6[(1'h0):(1'h0)] && $signed((+reg23)))));
              reg18 <= $unsigned((8'hb4));
              reg19 <= ((~&($signed((wire4 ^ reg13)) ?
                  $unsigned((-reg18)) : $signed((!(8'hae))))) - (^$unsigned($signed((reg26 ?
                  reg16 : reg20)))));
            end
          reg21 <= ($signed(((reg13[(2'h3):(2'h2)] * ((8'hbf) && reg23)) ?
                  reg18[(1'h1):(1'h0)] : $unsigned((wire8 <= wire7)))) ?
              (^~reg18[(2'h2):(2'h2)]) : (-reg17[(4'h8):(3'h7)]));
        end
      reg27 <= wire8[(3'h5):(1'h1)];
    end
  assign wire28 = reg23[(1'h1):(1'h0)];
  assign wire29 = (($signed(wire0[(3'h4):(3'h4)]) ?
                          wire1[(3'h4):(2'h2)] : {((reg21 | reg25) <<< $signed(reg26))}) ?
                      $signed((reg19 ?
                          ($unsigned(reg26) <<< $signed(wire8)) : wire10[(1'h0):(1'h0)])) : (({reg17[(2'h3):(2'h2)]} - (wire8 ~^ {reg16,
                          reg17})) ~^ reg14[(2'h3):(1'h0)]));
  assign wire30 = $signed(reg16[(4'he):(4'he)]);
  assign wire31 = ($signed(((reg16[(4'ha):(2'h3)] ?
                      $signed((8'ha2)) : (wire28 ?
                          reg25 : reg23)) <<< (&wire4[(1'h0):(1'h0)]))) || reg14[(3'h7):(1'h0)]);
  assign wire32 = (wire3[(4'hc):(4'hc)] >= $signed($unsigned($signed(wire0[(1'h1):(1'h0)]))));
  assign wire33 = ((^(|{(reg25 & wire4),
                      (reg25 != wire8)})) < (({wire10} != ({wire2} | (-wire2))) ?
                      ((~^$unsigned(reg26)) ?
                          reg25[(2'h2):(1'h1)] : $unsigned(wire29[(1'h1):(1'h0)])) : ($unsigned((wire6 ?
                              wire29 : reg22)) ?
                          $unsigned($signed(reg27)) : {(^reg23)})));
  assign wire34 = reg18;
  assign wire35 = (~|((^(~(wire33 ~^ wire8))) ?
                      $signed($signed(reg22[(3'h6):(3'h5)])) : {{((8'ha1) ?
                                  reg16 : (8'hb8))},
                          (+$signed(reg25))}));
  assign wire36 = $signed(wire31[(4'he):(4'he)]);
  assign wire37 = $unsigned($signed((+(+$unsigned(reg26)))));
endmodule
