module top
#(parameter param71 = (8'hb8), 
parameter param72 = param71)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire61,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg64,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
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
                 reg11,
                 (1'h0)};
  assign wire5 = wire2[(4'hb):(3'h5)];
  assign wire6 = (^wire0);
  assign wire7 = (wire6[(3'h4):(2'h2)] ?
                     {$signed($signed(wire6))} : {wire4[(4'ha):(4'ha)]});
  assign wire8 = ($signed($unsigned($signed((~wire7)))) * $unsigned($unsigned($signed((wire0 ~^ wire4)))));
  assign wire9 = (8'haa);
  assign wire10 = (($unsigned((8'h9c)) > ($unsigned((~^(8'hb8))) ?
                          $unsigned((wire0 + (8'hb7))) : ($signed(wire2) ?
                              $signed(wire2) : $signed(wire8)))) ?
                      wire8 : ((($unsigned(wire6) > $unsigned(wire8)) ?
                              (^~wire0[(3'h5):(1'h0)]) : ({wire7} ?
                                  wire9 : $signed(wire7))) ?
                          wire6 : {(|wire9[(3'h4):(3'h4)])}));
  always
    @(posedge clk) begin
      reg11 <= (((|{$signed(wire8)}) ? (+{{wire8}}) : (!wire8)) ?
          wire6 : $unsigned(((^$signed(wire2)) ?
              wire8[(1'h0):(1'h0)] : $unsigned(wire8))));
      reg12 <= {$unsigned(((wire3[(3'h4):(2'h2)] && $signed(reg11)) ~^ ((|(8'ha7)) & (wire4 * wire4)))),
          $signed((~&({(8'h9f)} ? (wire5 >> (8'hbc)) : (wire4 == wire4))))};
    end
  always
    @(posedge clk) begin
      reg13 <= $unsigned((-($unsigned($unsigned(reg12)) ?
          ((wire0 > wire4) >>> $signed(wire0)) : (wire1[(2'h3):(1'h0)] ?
              $signed((8'hb1)) : (~&wire9)))));
      reg14 <= ($unsigned(wire0[(2'h3):(1'h1)]) ?
          $signed(((wire4[(2'h2):(1'h1)] ?
              wire10[(1'h1):(1'h1)] : (!wire6)) ~^ {$signed(wire8)})) : reg12);
      if ((|(+($signed($signed(wire5)) ?
          wire10[(1'h0):(1'h0)] : ((wire3 ~^ reg13) >>> (reg14 ?
              reg11 : wire8))))))
        begin
          reg15 <= reg12[(4'hc):(3'h4)];
          if ((8'haf))
            begin
              reg16 <= $unsigned((wire8 ?
                  {wire10, $signed((+(8'hbc)))} : wire0[(2'h2):(1'h0)]));
              reg17 <= $unsigned($signed($unsigned((wire8[(4'hc):(3'h7)] + $unsigned((8'hb2))))));
              reg18 <= (wire3 + {reg11, reg11[(2'h2):(1'h1)]});
              reg19 <= wire0[(1'h1):(1'h0)];
            end
          else
            begin
              reg16 <= $signed($signed($signed((wire5[(2'h2):(1'h1)] ?
                  $signed((8'hb5)) : {wire3}))));
              reg17 <= wire7;
            end
        end
      else
        begin
          if ($unsigned((wire8 ?
              (!$unsigned((~|wire1))) : ($signed(reg19) & $unsigned((&wire9))))))
            begin
              reg15 <= (((((wire0 - wire6) ?
                      reg14 : {reg19, wire3}) || (&(reg16 || reg19))) ?
                  (^{$signed(reg17)}) : {(!(^(8'ha5))),
                      {$unsigned(wire9)}}) >= $signed((wire4[(2'h3):(2'h3)] >>> wire3[(1'h1):(1'h1)])));
              reg16 <= (~^(^~$unsigned(wire9)));
              reg17 <= $unsigned(((~&$signed({(8'h9e),
                  wire5})) || $unsigned((~&(reg17 && (8'hb8))))));
              reg18 <= $signed({$unsigned($signed({reg18}))});
            end
          else
            begin
              reg15 <= (~wire2);
            end
          reg19 <= {{($signed((!wire1)) ?
                      (~|$unsigned((8'hb4))) : {$unsigned(wire2), (|wire0)})},
              reg11[(4'h9):(4'h8)]};
          reg20 <= {reg15, wire4[(3'h6):(1'h0)]};
          reg21 <= (|$unsigned((~{(^~wire7), wire8})));
        end
      if ((8'hb2))
        begin
          reg22 <= $signed({(+$unsigned((!reg19)))});
        end
      else
        begin
          reg22 <= $unsigned((~|{wire3,
              ($unsigned(wire1) ?
                  (wire9 ? (8'hb5) : wire2) : $unsigned(reg18))}));
          if ($unsigned($signed((+((reg14 ~^ wire1) >> (&wire2))))))
            begin
              reg23 <= $signed($signed($unsigned((wire2[(3'h6):(3'h4)] ?
                  $unsigned(wire2) : {reg19}))));
              reg24 <= $unsigned($unsigned($unsigned($signed($signed(wire9)))));
              reg25 <= ($unsigned({wire1}) ? reg12 : reg12);
              reg26 <= $unsigned((wire9 ?
                  $unsigned(wire3[(1'h1):(1'h0)]) : $signed((~reg14))));
              reg27 <= (({(|wire9[(1'h0):(1'h0)]), wire2[(3'h7):(2'h3)]} ?
                      $unsigned((~^(reg16 ~^ wire6))) : $signed((-$signed(reg17)))) ?
                  {wire8[(3'h7):(1'h0)]} : {(((reg16 ? reg19 : reg16) ?
                              wire5[(2'h2):(1'h1)] : reg16) ?
                          (!$unsigned(reg15)) : $unsigned(reg21)),
                      reg11[(1'h1):(1'h0)]});
            end
          else
            begin
              reg23 <= ($signed(($unsigned($signed(wire4)) ?
                      ((~^reg16) ?
                          {(7'h40)} : (+reg11)) : $unsigned({wire8}))) ?
                  ($unsigned(($signed(reg23) ?
                      wire7[(1'h0):(1'h0)] : ((8'hb0) != reg18))) & reg15) : {(&(wire7 ?
                          $signed(reg23) : (|(8'hab))))});
              reg24 <= (wire6 ?
                  ($unsigned($unsigned(wire6)) ^~ {wire2[(4'h8):(1'h0)],
                      $unsigned((^~reg15))}) : (8'h9e));
              reg25 <= (~^reg20);
              reg26 <= $unsigned(reg12[(3'h7):(3'h6)]);
            end
          if ({$unsigned($unsigned((((8'h9d) ~^ reg24) ?
                  (reg25 ? wire8 : wire4) : (8'hb2)))),
              $signed(wire7)})
            begin
              reg28 <= reg18[(1'h0):(1'h0)];
              reg29 <= reg12;
            end
          else
            begin
              reg28 <= (({((reg12 > (8'hac)) <= reg22[(2'h3):(1'h0)]),
                      reg19[(1'h1):(1'h0)]} ?
                  reg18[(3'h7):(3'h5)] : {wire7}) || wire10);
            end
          reg30 <= ({reg25} ?
              $signed(wire4[(3'h4):(2'h3)]) : (((wire9 >= (wire4 ?
                      (8'h9c) : reg18)) ?
                  $unsigned((reg13 > reg23)) : $signed(reg15[(3'h6):(3'h5)])) != $unsigned($signed((wire10 ?
                  wire4 : wire8)))));
          reg31 <= (~^$unsigned(reg20));
        end
    end
  module32 #() modinst62 (wire61, clk, wire6, reg21, wire3, reg27);
  assign wire63 = $unsigned((~&$signed((~|(reg19 >> (8'ha9))))));
  always
    @(posedge clk) begin
      reg64 <= (reg22 ?
          $unsigned($unsigned({reg21[(3'h7):(2'h3)]})) : (wire8[(5'h10):(1'h1)] >>> reg21[(4'h8):(1'h0)]));
    end
  assign wire65 = (!wire7);
  assign wire66 = (wire0 ?
                      ($unsigned(((wire4 ? reg64 : reg24) ?
                          {(8'hb9)} : $unsigned(wire61))) << (+(!reg16))) : {(!($unsigned((8'haf)) ?
                              (^~reg23) : wire3)),
                          $unsigned({wire5[(2'h2):(2'h2)]})});
  assign wire67 = reg30;
  assign wire68 = (reg15 >>> reg19[(4'hc):(4'h9)]);
  assign wire69 = $unsigned((8'hb6));
  assign wire70 = (&reg31);
endmodule

module module32
#(parameter param60 = (~&((~|(((8'hb4) == (8'h9d)) ? (!(8'hbc)) : ((8'hb2) ? (8'hb8) : (8'hb3)))) ? ((~^(8'ha8)) ? (~|(-(8'hba))) : (8'h9f)) : ((&(~&(8'ha0))) >= (((8'ha0) ? (8'h9d) : (7'h44)) >= (^~(8'hbc)))))))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire36;
  input wire signed [(3'h7):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire [(3'h7):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((+$signed((!$unsigned(wire34)))))
        begin
          if ({$signed(((wire33 ? (~&wire34) : (wire34 < wire33)) ?
                  ($unsigned(wire34) << $signed(wire33)) : (wire35[(3'h5):(1'h1)] <= (8'h9f)))),
              ((((wire35 >> wire36) ?
                  (!wire36) : wire35[(2'h2):(1'h1)]) + wire36[(4'he):(1'h0)]) ^~ $signed(({(7'h44)} ?
                  wire33 : (wire33 >= wire35))))})
            begin
              reg37 <= $unsigned($signed($unsigned(wire33[(3'h6):(3'h6)])));
              reg38 <= $unsigned((+wire36[(3'h7):(2'h2)]));
              reg39 <= $unsigned(reg38);
              reg40 <= wire34;
            end
          else
            begin
              reg37 <= {wire35};
            end
          reg41 <= $signed((-(!(~(~&wire33)))));
          reg42 <= ($unsigned({wire33[(2'h2):(2'h2)]}) ?
              $signed(reg40[(4'he):(4'hd)]) : ($unsigned(((reg40 <<< wire33) ^ wire34[(4'he):(1'h0)])) < (!(~&$signed(reg38)))));
          reg43 <= {(8'ha8), $signed(wire33[(3'h5):(2'h3)])};
        end
      else
        begin
          reg37 <= wire35;
          reg38 <= reg40;
          reg39 <= wire33[(1'h1):(1'h0)];
          reg40 <= (reg40 * $signed((!($unsigned(reg40) ?
              reg39[(3'h7):(3'h5)] : $unsigned(reg37)))));
        end
      reg44 <= {(reg43[(4'h8):(2'h3)] >>> (({(8'hb0)} ^ wire33) ?
              (~(^wire33)) : $signed(reg41[(4'hf):(4'ha)]))),
          $signed(reg43[(5'h11):(5'h10)])};
      reg45 <= (((reg43 ?
          $signed(reg38[(3'h6):(3'h6)]) : reg42[(3'h4):(3'h4)]) >> (((wire33 ?
              reg40 : reg43) ?
          (wire35 ? reg37 : wire36) : (7'h40)) * (+(reg39 ?
          wire33 : reg37)))) > ({(wire36 | reg39),
              ((+reg37) ? (~^reg41) : (&wire35))} ?
          $unsigned(($signed(wire35) ?
              reg41 : reg37[(3'h6):(3'h5)])) : $unsigned((8'ha0))));
      reg46 <= ({$unsigned((((8'ha7) ? reg45 : reg40) << reg43)),
          {(~&$unsigned(reg37))}} || reg41);
      reg47 <= ((wire33 ?
              $signed(reg43[(4'h9):(3'h7)]) : (reg45 ?
                  reg42[(4'h8):(4'h8)] : $unsigned(wire36))) ?
          (wire35[(3'h7):(3'h7)] ?
              reg39 : wire35) : $unsigned(($unsigned((reg44 || reg45)) ?
              wire34 : ($signed((8'ha4)) ? $unsigned(reg43) : reg37))));
    end
  always
    @(posedge clk) begin
      reg48 <= $signed($unsigned((reg45[(3'h5):(2'h2)] >>> ({reg47} ?
          ((8'hb0) ? reg39 : reg45) : wire36))));
    end
  assign wire49 = reg41;
  assign wire50 = (wire35 ? (~|reg48[(1'h1):(1'h0)]) : $signed((-wire36)));
  assign wire51 = ($unsigned(($unsigned($unsigned(reg39)) == $unsigned(wire49))) > (|$signed(((8'hac) ?
                      reg43[(4'hd):(4'h9)] : (reg48 != reg37)))));
  assign wire52 = wire33;
  assign wire53 = ($signed($signed(($signed(reg47) ?
                      (^~(8'hbb)) : (wire49 ?
                          reg46 : reg41)))) - (+(reg47 | $unsigned((reg37 ?
                      wire35 : wire33)))));
  assign wire54 = {(reg41[(3'h7):(1'h0)] == wire35)};
  assign wire55 = reg41[(4'h8):(1'h1)];
  assign wire56 = $signed(reg46);
  assign wire57 = reg42;
  assign wire58 = wire36[(4'hc):(4'h8)];
  assign wire59 = {(reg38[(1'h0):(1'h0)] <<< reg41)};
endmodule
