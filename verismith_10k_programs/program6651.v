module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = $unsigned(wire0);
  assign wire6 = ($unsigned((({(8'ha1), wire0} ?
                             $unsigned(wire3) : (wire5 ? wire4 : wire4)) ?
                         (~&(8'hb6)) : ((&(8'hb2)) ?
                             $unsigned((8'haa)) : (-wire1)))) ?
                     (+$unsigned(wire3[(3'h4):(2'h3)])) : $signed((&((8'hb2) ?
                         (wire2 ? wire5 : wire1) : $unsigned(wire2)))));
  assign wire7 = (wire0 ?
                     wire2[(4'h9):(3'h4)] : ((!(+(wire6 != wire3))) ^ wire0));
  assign wire8 = (wire2 <= {$unsigned(((wire3 - wire1) ?
                         $signed(wire2) : wire3)),
                     $signed({$signed((8'had)), (-wire0)})});
  assign wire9 = $unsigned(((^wire1[(4'hf):(4'hc)]) ?
                     $signed((+wire1)) : ($signed($unsigned(wire4)) ~^ (((8'hb5) & wire6) < (~|(8'hbe))))));
  always
    @(posedge clk) begin
      reg10 <= $signed((~^(-(~|wire5[(2'h3):(1'h1)]))));
      if ($unsigned($unsigned(wire8)))
        begin
          reg11 <= (^wire5);
          reg12 <= wire7[(2'h2):(2'h2)];
          reg13 <= (~&((~|(wire9[(3'h5):(1'h1)] ^ reg10[(5'h11):(4'he)])) <<< wire9));
          reg14 <= reg12[(3'h6):(1'h1)];
          reg15 <= $unsigned(wire6[(3'h5):(3'h4)]);
        end
      else
        begin
          if (($signed(reg14[(4'he):(4'hd)]) | $signed($signed($unsigned(((8'ha3) ?
              wire7 : reg11))))))
            begin
              reg11 <= wire3[(1'h0):(1'h0)];
              reg12 <= {$unsigned(wire7[(1'h1):(1'h1)])};
              reg13 <= (!(~|reg11));
              reg14 <= (({((wire8 ? wire1 : (8'h9c)) >>> wire1[(2'h3):(2'h3)]),
                      (^~wire8[(1'h1):(1'h1)])} << (^(8'hbe))) ?
                  $unsigned(wire9[(3'h6):(3'h4)]) : {reg11[(3'h7):(3'h7)],
                      (({wire2, wire4} ? $signed(wire7) : $unsigned(wire8)) ?
                          $unsigned({wire0}) : (wire6 ?
                              (wire2 <= (8'hb8)) : reg14))});
            end
          else
            begin
              reg11 <= ($signed(({reg15[(3'h4):(3'h4)],
                      wire6} - (reg15[(4'hc):(2'h2)] ~^ reg10[(3'h5):(1'h1)]))) ?
                  ((8'hb3) + (!(reg11 >> reg11[(3'h6):(1'h0)]))) : wire2);
            end
          reg15 <= wire9;
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed((&(|(7'h43))))))
        begin
          reg16 <= $unsigned(($signed(wire9[(1'h1):(1'h0)]) < $unsigned($signed(wire8))));
          reg17 <= reg13;
          reg18 <= ((~&(reg12 ^~ $unsigned($unsigned(wire8)))) ?
              wire7 : $unsigned((((reg14 < wire2) ?
                  (wire0 <= reg16) : $signed(wire1)) > {wire6,
                  $signed(reg14)})));
        end
      else
        begin
          reg16 <= (wire0 ?
              (^~(((wire0 - wire8) ?
                  {reg13, wire9} : reg18) ^ wire2[(4'h9):(3'h4)])) : wire4);
          if (reg18)
            begin
              reg17 <= reg18[(1'h0):(1'h0)];
            end
          else
            begin
              reg17 <= (reg16[(2'h3):(1'h0)] ?
                  {wire7,
                      wire5[(1'h0):(1'h0)]} : {$unsigned($unsigned(wire3))});
              reg18 <= (~&wire7);
            end
          if ($signed(reg18[(1'h1):(1'h1)]))
            begin
              reg19 <= (reg12 - ($signed(({(8'hb7),
                  wire0} * $signed(wire0))) << wire9));
              reg20 <= (8'h9d);
              reg21 <= $signed((7'h44));
            end
          else
            begin
              reg19 <= (((reg21[(1'h1):(1'h1)] ?
                      reg20[(1'h1):(1'h0)] : (|(reg13 * (8'hab)))) ?
                  $signed($signed($signed(reg13))) : (~&wire6)) + (~$signed(({wire5,
                  wire2} - reg12[(4'h9):(2'h3)]))));
              reg20 <= reg11;
            end
          reg22 <= wire0[(1'h0):(1'h0)];
          if (($signed((~|{reg20})) * reg17[(1'h0):(1'h0)]))
            begin
              reg23 <= reg14[(4'h8):(1'h0)];
              reg24 <= {wire8, $signed(reg20[(1'h1):(1'h1)])};
              reg25 <= ($signed(wire3) ?
                  ((&((|reg24) ? (wire2 ? reg13 : wire8) : {wire4})) ?
                      $signed((8'ha1)) : {reg21}) : $unsigned({$signed((reg24 + reg22))}));
            end
          else
            begin
              reg23 <= $unsigned(wire1[(4'hb):(3'h7)]);
            end
        end
      reg26 <= (reg14 ?
          $signed(wire5) : ($signed($unsigned((~&reg21))) ?
              ({(wire3 ? reg18 : reg25), {wire4}} ?
                  (&(^~wire3)) : wire5[(1'h1):(1'h1)]) : $signed(($signed(wire1) ?
                  wire1[(4'hf):(4'hc)] : (reg24 + wire4)))));
    end
  assign wire27 = $signed($unsigned(reg25));
  assign wire28 = $unsigned(((reg25[(2'h2):(2'h2)] ?
                      $unsigned({(8'ha5)}) : $unsigned($signed(reg13))) ~^ {$unsigned({reg22,
                          wire6})}));
  assign wire29 = $unsigned({(~&(-$unsigned(wire0)))});
  assign wire30 = (7'h43);
  assign wire31 = (|$unsigned((&(!(~&reg24)))));
  assign wire32 = (~^((+(8'ha3)) ?
                      ((reg21 >> (wire5 || wire0)) - (reg17 ?
                          (8'hb3) : (-reg13))) : $signed((~$signed(wire29)))));
  assign wire33 = reg14;
  assign wire34 = $signed({({$signed((8'hae)),
                          $signed(wire3)} && ($signed(wire6) | {wire33,
                          wire4})),
                      wire8[(3'h6):(3'h4)]});
  assign wire35 = {$signed(reg12[(2'h3):(1'h1)]), (^~reg16)};
endmodule
