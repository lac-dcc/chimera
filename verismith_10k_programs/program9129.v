module top
#(parameter param29 = ((({(|(8'hb0)), (&(7'h40))} <<< {((8'hb1) < (8'h9d))}) != (~({(7'h42), (8'haa)} ? ((8'h9e) * (8'ha0)) : (+(8'hb8))))) <<< ((~(((7'h44) ? (8'hbc) : (8'had)) ^~ ((8'ha0) && (8'h9d)))) - (((~|(8'hba)) ? ((8'hbf) + (7'h43)) : ((7'h43) >>> (8'ha6))) ? ({(7'h42), (8'ha4)} ? ((8'h9c) <= (8'hb0)) : ((8'h9e) | (8'hb1))) : (7'h42)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg10,
                 (1'h0)};
  assign wire4 = ($signed((~wire0)) || (~^$unsigned({{wire0, wire2},
                     $signed((7'h44))})));
  assign wire5 = $unsigned(((^(8'hbe)) & $unsigned(((wire1 >> wire3) ?
                     $signed((8'ha6)) : {wire3}))));
  assign wire6 = ($signed((|(wire4 ? wire2 : (|wire5)))) ?
                     wire1 : $unsigned($unsigned((wire4 ? wire3 : wire0))));
  assign wire7 = (~(~^$signed({wire6})));
  assign wire8 = {wire7};
  assign wire9 = ((8'hb7) ?
                     (-(~&(wire4[(3'h6):(1'h1)] ?
                         {wire0, wire6} : wire0))) : {(8'had)});
  always
    @(posedge clk) begin
      reg10 <= (^~(~(wire9[(1'h1):(1'h1)] ?
          $unsigned(wire1) : ((~&wire6) != wire0))));
      if ($signed((^($signed(wire1[(1'h1):(1'h1)]) ?
          $signed($signed(wire8)) : ((wire1 << wire4) ?
              wire0 : $signed(reg10))))))
        begin
          reg11 <= wire8;
          reg12 <= $unsigned({(wire1[(3'h4):(2'h3)] >>> (~(wire7 >= wire3)))});
          reg13 <= (reg10 ?
              $unsigned({$unsigned(wire0), (~|{wire6})}) : ((~{{wire6,
                          wire3}}) ?
                  (reg12 || $signed(((8'hb2) == wire1))) : (wire7[(4'hc):(4'h9)] * {(8'hac),
                      $signed(wire7)})));
          if ((wire5[(1'h0):(1'h0)] ?
              wire9 : (^~((wire2 ?
                  $signed(reg12) : reg11[(1'h0):(1'h0)]) != {(reg12 ?
                      (8'ha8) : reg12)}))))
            begin
              reg14 <= reg10[(1'h1):(1'h1)];
              reg15 <= $unsigned((~&(($unsigned(wire1) ~^ reg13) >> $unsigned((wire0 ?
                  wire1 : reg12)))));
              reg16 <= {reg15};
              reg17 <= $signed((~&(&({reg10, wire0} == (reg14 ?
                  reg15 : (8'hbf))))));
              reg18 <= reg15[(4'he):(2'h2)];
            end
          else
            begin
              reg14 <= ((&($unsigned(reg10[(4'ha):(1'h0)]) <= ($signed(reg11) < (reg12 ?
                      wire2 : (8'ha7))))) ?
                  (&reg14) : (^(reg16 >> $unsigned({reg12, reg12}))));
              reg15 <= ((reg15[(5'h10):(3'h5)] ?
                  (!reg18) : reg16[(1'h0):(1'h0)]) <= (reg13[(4'h9):(3'h4)] ?
                  {$signed((wire2 + reg13)), reg16} : ({$signed(reg17),
                          (&reg14)} ?
                      $signed(reg13) : (~$unsigned(reg16)))));
              reg16 <= ($signed($signed(wire8)) ?
                  (8'ha6) : ({{reg17, (~&reg11)},
                          ($signed(wire2) + reg17[(2'h3):(1'h0)])} ?
                      reg15 : {(8'h9d), wire6[(1'h1):(1'h1)]}));
              reg17 <= (~^$unsigned((wire3[(1'h1):(1'h1)] ?
                  ($unsigned(wire5) >>> $unsigned((8'had))) : $unsigned($unsigned(wire4)))));
            end
        end
      else
        begin
          reg11 <= (wire4[(4'hc):(4'hb)] >> reg11);
          reg12 <= ({reg15[(5'h11):(4'hc)]} << $unsigned(($signed((8'ha1)) == $unsigned($unsigned(reg11)))));
          reg13 <= reg15;
          reg14 <= $unsigned((8'hb3));
        end
      reg19 <= ((&{wire4[(1'h1):(1'h1)]}) >= $signed((wire5 ?
          (-{reg13}) : $signed({wire1, wire1}))));
    end
  always
    @(posedge clk) begin
      reg20 <= (($unsigned(wire2[(4'ha):(2'h2)]) ?
          wire7 : (wire2 ?
              (&(wire4 ?
                  wire5 : (8'hbc))) : ((~&wire9) ~^ ((8'hac) >>> wire6)))) ~^ $unsigned((reg11[(1'h1):(1'h1)] ?
          reg11[(1'h0):(1'h0)] : ((reg13 & reg15) ?
              {wire5} : ((8'hb4) <= reg19)))));
      reg21 <= ({{$unsigned($signed(reg12)),
              {(reg15 ? reg18 : reg20), (!reg16)}},
          ($unsigned($signed(reg17)) ?
              wire3 : $unsigned($signed(reg20)))} <= {{($unsigned(wire9) ?
                  $signed(reg20) : $signed(reg18)),
              (&(reg16 + wire7))}});
      reg22 <= $unsigned($signed(($signed({wire7, reg18}) ?
          wire4[(3'h7):(2'h2)] : ($signed(wire1) || (8'hbc)))));
      reg23 <= wire2[(3'h7):(3'h5)];
    end
  assign wire24 = (!$unsigned($unsigned((wire5[(1'h1):(1'h0)] * reg18[(3'h4):(1'h1)]))));
  assign wire25 = ($signed($unsigned(reg16)) ?
                      (((~&$signed(reg10)) ?
                          reg17 : wire6[(1'h0):(1'h0)]) || $unsigned(wire24[(2'h2):(1'h0)])) : (wire8 & (+$signed(wire9))));
  assign wire26 = $signed($signed($unsigned(((-reg10) ?
                      wire1[(4'h8):(2'h2)] : reg14))));
  assign wire27 = (~^reg11[(2'h2):(1'h0)]);
  assign wire28 = ($unsigned({{$unsigned(reg17), ((8'hbe) ? reg10 : reg15)},
                      (wire26 - wire0)}) ~^ ($unsigned((wire7[(5'h10):(4'hb)] & {wire0,
                      reg19})) < reg23));
endmodule
