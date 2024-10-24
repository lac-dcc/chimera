module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire60;
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire5,
                 wire15,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire60,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire5 = $signed({wire1, $unsigned($unsigned(wire4))});
  always
    @(posedge clk) begin
      reg6 <= $unsigned((8'hb2));
      reg7 <= {$signed($unsigned(wire5[(3'h6):(3'h6)])),
          (((~&(wire5 + wire2)) + wire5) != $unsigned($unsigned((wire1 <<< wire5))))};
      reg8 <= wire1[(1'h0):(1'h0)];
      if ($unsigned($unsigned((reg6[(3'h7):(3'h5)] ?
          ((~&reg6) ?
              (wire4 < reg8) : (wire5 <= wire5)) : $signed(wire1[(3'h4):(2'h2)])))))
        begin
          reg9 <= ($signed($signed($unsigned((8'hb5)))) ?
              $unsigned(wire5) : (~&{(^$signed(reg7)),
                  ((&reg7) ? (wire5 >= wire4) : $unsigned(wire4))}));
          reg10 <= ($signed((&wire4[(2'h2):(2'h2)])) ?
              $unsigned((|(^~reg9[(3'h5):(2'h2)]))) : ((reg6[(2'h3):(1'h0)] | {$signed(reg9),
                      (~^reg8)}) ?
                  (wire0 ?
                      reg7[(3'h6):(2'h2)] : (reg6 != reg7)) : $unsigned(wire1[(2'h2):(1'h0)])));
          reg11 <= $unsigned($signed((($signed((8'ha8)) ?
                  $unsigned(reg10) : (wire2 & (8'hb2))) ?
              {((8'ha7) || wire3), $unsigned(wire3)} : $unsigned((reg8 ?
                  wire3 : wire2)))));
          reg12 <= wire4[(2'h2):(1'h1)];
        end
      else
        begin
          reg9 <= (reg10 ?
              wire1 : $signed({(~&{(8'hb9), wire5}),
                  (((8'h9d) || (8'ha1)) ?
                      (reg6 ? reg11 : wire5) : {reg12, reg8})}));
          reg10 <= $unsigned((|reg9[(3'h5):(2'h3)]));
          if (reg11[(1'h1):(1'h0)])
            begin
              reg11 <= $signed(wire3[(5'h10):(4'h8)]);
              reg12 <= ((($unsigned((wire4 ? wire1 : wire0)) < wire0) ?
                  reg10[(4'ha):(3'h4)] : (&$signed({wire4,
                      reg6}))) + $signed($signed(wire2[(3'h7):(1'h0)])));
            end
          else
            begin
              reg11 <= (((~&reg11[(1'h0):(1'h0)]) ?
                      {(reg7[(4'h9):(2'h3)] ?
                              wire2[(1'h0):(1'h0)] : (wire1 ?
                                  wire5 : reg11))} : (8'hb9)) ?
                  $signed($signed($unsigned({wire0,
                      (8'ha8)}))) : (-wire2[(2'h3):(1'h1)]));
              reg12 <= $unsigned((~$signed(((~wire4) ^~ reg8))));
              reg13 <= $signed({(^~{(wire0 ? wire3 : reg6)})});
              reg14 <= {$signed((wire3[(4'h9):(3'h6)] ?
                      {(^reg12), (~^reg7)} : wire5)),
                  $unsigned(wire4)};
            end
        end
    end
  assign wire15 = {($unsigned(((|reg9) ?
                          ((8'ha2) ?
                              wire4 : (8'ha6)) : (~(8'hbd)))) < reg8[(3'h5):(3'h4)])};
  always
    @(posedge clk) begin
      if ((~^(^~((wire1[(3'h5):(3'h5)] ? (+wire5) : wire3) ?
          reg13[(3'h7):(3'h5)] : (8'h9d)))))
        begin
          reg16 <= $signed($signed(wire1[(3'h4):(2'h2)]));
          if ({wire15, (^~$unsigned((^wire4[(2'h2):(2'h2)])))})
            begin
              reg17 <= (reg10 >>> reg12);
              reg18 <= (^reg11[(2'h2):(1'h1)]);
              reg19 <= (~&(8'hab));
              reg20 <= $signed($unsigned($signed({reg16, (reg9 - wire4)})));
              reg21 <= $signed($signed((!($signed(wire5) < $unsigned(reg9)))));
            end
          else
            begin
              reg17 <= (!((~^reg19[(3'h7):(2'h3)]) ?
                  wire5 : ((8'hb3) ?
                      (^~(reg19 << wire0)) : {(8'hb0), $unsigned(reg19)})));
              reg18 <= $signed(($unsigned($unsigned({reg19})) > ({(^~wire1)} ?
                  $signed(reg20[(1'h1):(1'h0)]) : reg13)));
              reg19 <= wire4;
            end
        end
      else
        begin
          reg16 <= reg21;
          reg17 <= (^$unsigned(reg8[(4'hd):(3'h7)]));
        end
      reg22 <= wire2;
      if ((8'ha7))
        begin
          reg23 <= reg19;
          if (reg20[(2'h2):(2'h2)])
            begin
              reg24 <= ((^~reg17[(3'h7):(3'h6)]) ?
                  $unsigned((~(reg18[(2'h2):(1'h0)] | reg6[(3'h4):(1'h0)]))) : (reg17[(2'h3):(1'h1)] - ((+reg6[(3'h5):(1'h1)]) == $unsigned(wire15[(4'hd):(3'h4)]))));
            end
          else
            begin
              reg24 <= $signed((7'h44));
              reg25 <= $signed({reg18[(1'h0):(1'h0)]});
            end
        end
      else
        begin
          reg23 <= reg10;
          reg24 <= $signed($unsigned(reg20[(2'h2):(2'h2)]));
        end
    end
  assign wire26 = ($unsigned((~&reg18[(1'h1):(1'h0)])) ~^ (&(reg13[(1'h1):(1'h1)] >>> (&(reg19 ?
                      reg23 : reg7)))));
  assign wire27 = (~^reg11[(1'h1):(1'h1)]);
  assign wire28 = wire5[(3'h7):(3'h7)];
  assign wire29 = reg7;
  module30 #() modinst61 (.wire31(wire2), .wire33(reg22), .wire34(reg13), .wire32(reg25), .y(wire60), .clk(clk));
  assign wire62 = wire29;
  assign wire63 = $unsigned($signed(($signed((wire2 ? reg6 : reg12)) ?
                      $unsigned(reg25) : wire3[(4'h9):(4'h9)])));
  assign wire64 = $unsigned({{$signed((8'ha5))},
                      {((8'ha8) ? wire27 : wire0),
                          (wire15[(3'h4):(3'h4)] * $unsigned(reg17))}});
  assign wire65 = ((~^$unsigned(((wire5 < reg12) + (~wire64)))) - wire60);
  assign wire66 = (($unsigned($unsigned({wire62, reg9})) ?
                      (8'hb0) : $unsigned($unsigned($unsigned(wire5)))) + (wire29 ?
                      $signed(reg21[(4'h8):(2'h2)]) : $unsigned($signed($signed((8'had))))));
  assign wire67 = $unsigned($unsigned($unsigned((^~(reg11 ? (8'ha6) : reg9)))));
  assign wire68 = reg13[(4'hd):(4'ha)];
  assign wire69 = reg21[(1'h0):(1'h0)];
  assign wire70 = reg19;
endmodule

module module30
#(parameter param58 = {({{((7'h40) && (8'hac))}, ((&(8'hb6)) ? ((8'haf) ? (8'hb8) : (8'hb9)) : (!(8'h9e)))} ? (^((^~(8'ha3)) ? ((8'hb4) + (8'ha7)) : {(8'hb8), (8'hb4)})) : (8'ha1)), (^~{{{(7'h42)}, ((8'ha1) ? (8'hae) : (7'h44))}})}, 
parameter param59 = (param58 ? (+param58) : param58))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire34;
  input wire signed [(4'hb):(1'h0)] wire33;
  input wire signed [(4'hd):(1'h0)] wire32;
  input wire signed [(4'ha):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  assign y = {wire57,
                 wire49,
                 wire48,
                 wire47,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire35 = (wire34 ?
                      ($unsigned((wire31 ?
                          $signed(wire32) : $signed((8'hb7)))) + ($signed(wire31) >= wire32)) : wire31[(1'h0):(1'h0)]);
  assign wire36 = wire31;
  assign wire37 = $signed($unsigned((~^$signed(((8'ha5) ? (8'h9e) : wire36)))));
  assign wire38 = wire37;
  assign wire39 = wire34[(4'h8):(3'h4)];
  assign wire40 = ((wire32[(4'ha):(3'h7)] ?
                      (((wire39 >>> (8'hbc)) ~^ wire34) ?
                          ((8'haa) & {wire33}) : {$signed(wire32),
                              wire35}) : wire31[(3'h7):(1'h1)]) && (|wire35[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      reg41 <= (^~($signed((-(&wire36))) ?
          {$unsigned(wire39)} : ($signed((wire32 + wire40)) ?
              $unsigned((^(8'had))) : $signed($signed(wire32)))));
      reg42 <= $signed(({$unsigned($unsigned(wire33))} - wire33[(2'h3):(1'h1)]));
      if ((~($unsigned((^(reg42 ^~ wire32))) << ($signed(wire32) ?
          $signed((~|reg41)) : (reg41[(1'h0):(1'h0)] ?
              wire36[(2'h3):(2'h3)] : (-(8'hbc)))))))
        begin
          reg43 <= $unsigned((wire39 ?
              (-($unsigned(wire36) << (wire38 ?
                  (7'h42) : wire33))) : $signed(($signed(wire36) ?
                  ((8'hbb) <= wire36) : {reg42, wire36}))));
          reg44 <= ($unsigned(wire36[(3'h5):(2'h2)]) > wire34);
        end
      else
        begin
          reg43 <= reg43;
        end
      reg45 <= wire36;
      reg46 <= $unsigned($signed(wire38[(1'h1):(1'h1)]));
    end
  assign wire47 = (-{($signed(wire32[(2'h2):(2'h2)]) ?
                          ((wire36 ?
                              wire31 : wire36) < $unsigned(wire38)) : $signed({reg43,
                              reg44})),
                      wire39});
  assign wire48 = wire47[(3'h4):(3'h4)];
  assign wire49 = (reg46[(2'h2):(1'h1)] || $unsigned(reg45));
  always
    @(posedge clk) begin
      reg50 <= reg44;
      if ($signed(reg45))
        begin
          reg51 <= (wire38[(1'h0):(1'h0)] | $unsigned($unsigned($signed(wire33[(1'h1):(1'h0)]))));
          reg52 <= ({$signed($signed(reg41[(1'h0):(1'h0)])),
              reg44} <<< (($signed($signed(wire47)) >> ((^~wire34) ~^ wire31)) <= reg42));
          reg53 <= (!wire49[(2'h2):(2'h2)]);
        end
      else
        begin
          if ({$unsigned(wire32[(4'h8):(1'h1)])})
            begin
              reg51 <= reg45;
              reg52 <= {($signed($unsigned((~&wire36))) ?
                      wire37[(2'h2):(1'h1)] : $signed(wire34[(1'h0):(1'h0)])),
                  (~(8'h9f))};
            end
          else
            begin
              reg51 <= {(~{((|reg41) ?
                          (wire33 ? wire48 : reg51) : (reg52 ?
                              (8'h9f) : reg51)),
                      $signed(wire34)})};
              reg52 <= (((~($unsigned(wire49) || wire49)) < $unsigned(($signed(wire39) >>> reg42))) ?
                  (({((8'hb6) ? wire38 : reg51)} ?
                      ({wire33, (8'hae)} ?
                          wire49[(1'h0):(1'h0)] : (~&reg45)) : $signed($unsigned(reg43))) * wire36) : {$signed(reg51),
                      $signed((reg45[(2'h2):(2'h2)] ?
                          wire38[(1'h1):(1'h0)] : (~|reg43)))});
              reg53 <= $unsigned((-$signed((~&$unsigned((8'h9d))))));
              reg54 <= reg53[(2'h2):(2'h2)];
              reg55 <= reg46;
            end
        end
      reg56 <= reg53;
    end
  assign wire57 = ($unsigned((~^(~$unsigned(wire39)))) ?
                      reg42[(2'h3):(2'h3)] : ($signed(wire33) ?
                          $signed(reg44) : $unsigned((wire48 * $unsigned(wire37)))));
endmodule
