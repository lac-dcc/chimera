module top
#(parameter param66 = (!(^(^~(((8'hbb) ? (8'hb4) : (7'h43)) | ((8'hb4) <<< (8'hbb)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  assign y = {wire65,
                 wire63,
                 wire26,
                 wire4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
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
  assign wire4 = (|$unsigned($signed(((wire3 && wire2) ?
                     wire1[(2'h3):(1'h1)] : wire1))));
  always
    @(posedge clk) begin
      if ((^~(8'ha0)))
        begin
          reg5 <= $signed(wire0[(2'h2):(1'h0)]);
          reg6 <= reg5[(2'h2):(1'h0)];
          reg7 <= (~^$unsigned($unsigned($signed(wire4))));
          if ({$unsigned({wire0[(1'h0):(1'h0)], wire2}), reg7[(1'h1):(1'h1)]})
            begin
              reg8 <= wire2[(3'h5):(2'h3)];
              reg9 <= $signed(wire0[(1'h1):(1'h0)]);
              reg10 <= (^$unsigned(wire0));
              reg11 <= (~|(|(8'hac)));
              reg12 <= ((reg6 >= (reg6 && $unsigned((~reg5)))) == {(8'hb9),
                  (+wire2[(1'h0):(1'h0)])});
            end
          else
            begin
              reg8 <= reg11;
              reg9 <= (~^reg10);
              reg10 <= $signed({(&$unsigned(((8'hb3) || wire4)))});
            end
          reg13 <= (^$signed((&(~&(reg12 ? (8'ha7) : wire0)))));
        end
      else
        begin
          reg5 <= wire3;
          reg6 <= wire3;
          reg7 <= wire4[(3'h6):(1'h0)];
        end
      reg14 <= reg12[(1'h0):(1'h0)];
      reg15 <= $unsigned((reg8[(3'h6):(2'h2)] ?
          reg10[(3'h5):(1'h1)] : $unsigned($signed(reg5[(4'h9):(1'h0)]))));
      if ($signed((((~|$unsigned(reg10)) == reg7[(1'h0):(1'h0)]) > (^$unsigned(reg8)))))
        begin
          reg16 <= ((!wire3) ?
              $unsigned($signed({(wire1 && (8'hb6)),
                  reg10[(3'h6):(1'h1)]})) : reg6[(4'hb):(4'hb)]);
          if (($unsigned((8'ha1)) << reg9))
            begin
              reg17 <= $signed((-(($unsigned(reg11) ^ reg11[(4'hf):(4'ha)]) ?
                  (((7'h44) == reg10) ?
                      (reg12 || wire2) : (&reg16)) : ((^~reg6) < $signed(wire1)))));
              reg18 <= (reg15[(1'h1):(1'h1)] ?
                  $signed($signed((reg8[(1'h0):(1'h0)] << $unsigned(reg15)))) : (8'h9f));
              reg19 <= ($unsigned(wire2) > reg9);
              reg20 <= (^((($unsigned(reg8) >> reg12) ?
                      $signed(reg7[(1'h1):(1'h1)]) : {(reg11 - reg19)}) ?
                  ($unsigned({reg7, wire4}) ?
                      $signed(wire1[(4'he):(3'h7)]) : $signed($signed(reg5))) : ((reg17 == $signed(reg14)) ?
                      $signed((^~reg17)) : $unsigned({reg5, (8'ha7)}))));
            end
          else
            begin
              reg17 <= wire2[(4'hb):(3'h7)];
              reg18 <= wire2[(4'hb):(2'h3)];
              reg19 <= $signed(((((~^reg8) && $signed((8'hbd))) & ($signed(reg17) | (~|reg5))) ?
                  (&((reg16 << reg20) >= $signed(wire3))) : $unsigned({(reg14 || reg10)})));
              reg20 <= {$signed(reg5), wire4};
            end
        end
      else
        begin
          reg16 <= {reg13[(5'h12):(4'hd)]};
          if (($unsigned((reg15 ~^ ((wire4 ? (8'hb5) : wire2) ?
              reg8 : reg11))) >>> $unsigned($signed($unsigned((wire4 ?
              reg18 : reg17))))))
            begin
              reg17 <= $unsigned(wire3);
              reg18 <= $signed(($signed(((-reg13) ?
                      (reg12 ? reg18 : (8'ha8)) : wire1[(3'h5):(2'h2)])) ?
                  reg11[(3'h4):(1'h0)] : $signed($signed((wire0 ?
                      reg16 : (8'h9e))))));
            end
          else
            begin
              reg17 <= reg10[(3'h5):(2'h3)];
              reg18 <= reg14;
              reg19 <= reg10;
              reg20 <= (~&$signed($unsigned({((8'ha1) ? reg14 : reg14),
                  (reg12 < (8'hb8))})));
            end
          if (reg12)
            begin
              reg21 <= (wire0 ? $signed($signed((8'ha0))) : reg11);
              reg22 <= reg20[(4'ha):(4'h8)];
              reg23 <= $unsigned(($unsigned((|((8'hab) << reg21))) ?
                  reg11 : reg19));
              reg24 <= $signed((~&$signed((wire1 ? reg21 : $signed((7'h44))))));
              reg25 <= ((8'hab) != ({({(8'ha3)} ?
                          (wire2 >>> reg13) : reg22[(1'h0):(1'h0)]),
                      $unsigned($unsigned(reg15))} ?
                  (((|wire3) ? $unsigned((8'h9d)) : ((8'ha3) ~^ reg19)) ?
                      reg20 : (wire2 >>> (~reg18))) : $signed((~(reg6 ?
                      (8'hb6) : reg13)))));
            end
          else
            begin
              reg21 <= reg13[(4'h8):(2'h2)];
              reg22 <= ((^(reg11[(4'hc):(3'h5)] ?
                  {wire4[(1'h0):(1'h0)],
                      reg7[(1'h0):(1'h0)]} : {$unsigned(wire4)})) * $unsigned((~|$unsigned((reg12 ?
                  reg10 : reg24)))));
              reg23 <= (8'haf);
            end
        end
    end
  assign wire26 = $unsigned(reg25);
  module27 #() modinst64 (.wire28(reg24), .wire31(reg16), .wire29(reg20), .wire30(reg18), .clk(clk), .y(wire63), .wire32(reg6));
  assign wire65 = (~reg15[(4'h9):(3'h7)]);
endmodule

module module27  (y, clk, wire28, wire29, wire30, wire31, wire32);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire29;
  input wire signed [(4'hf):(1'h0)] wire30;
  input wire [(4'he):(1'h0)] wire31;
  input wire [(2'h2):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire61;
  assign y = {wire33, wire34, wire35, wire36, wire37, wire38, wire61, (1'h0)};
  assign wire33 = (wire32 ?
                      wire30[(1'h1):(1'h1)] : (wire30[(4'he):(4'hb)] + $unsigned((~|wire28))));
  assign wire34 = (({wire32[(1'h0):(1'h0)]} ?
                      ($signed(((8'ha1) ? (7'h41) : wire32)) ?
                          (((8'hbe) ? wire30 : wire29) ?
                              $signed(wire33) : wire30) : wire32) : wire29[(3'h5):(3'h4)]) * (~wire32));
  assign wire35 = $signed((8'haa));
  assign wire36 = $unsigned($signed({(-$signed(wire28))}));
  assign wire37 = ($signed(((-(wire33 ? wire36 : wire36)) ?
                      $unsigned((wire32 ?
                          wire32 : wire30)) : $unsigned($signed(wire33)))) << $unsigned((^~(~(wire31 ?
                      wire34 : wire36)))));
  assign wire38 = {(~wire32)};
  module39 #() modinst62 (wire61, clk, wire30, wire37, wire38, wire28, wire31);
endmodule

module module39
#(parameter param60 = (8'hbc))
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire44;
  input wire signed [(4'h9):(1'h0)] wire43;
  input wire [(5'h12):(1'h0)] wire42;
  input wire signed [(4'h8):(1'h0)] wire41;
  input wire signed [(4'he):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire55;
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed((wire40 && $unsigned($unsigned(wire40))))))
        begin
          reg45 <= $signed(($signed((8'hb9)) ?
              wire42[(4'hc):(4'hc)] : $signed(((wire43 ?
                  wire43 : wire43) ~^ $signed(wire44)))));
          reg46 <= $unsigned(((($signed(reg45) ? (|wire44) : (reg45 ^ wire40)) ?
                  ((8'hb1) || ((8'hb4) | (8'hbb))) : $signed(reg45)) ?
              ($unsigned((|wire43)) ?
                  (wire44[(4'h8):(4'h8)] >>> wire43[(1'h1):(1'h0)]) : wire44[(3'h6):(1'h1)]) : ($signed($unsigned(wire41)) ?
                  wire41 : (|(reg45 - wire44)))));
        end
      else
        begin
          if ((wire40[(1'h0):(1'h0)] < ($signed(((wire43 < wire44) ?
                  wire43[(3'h4):(1'h0)] : wire41[(3'h6):(3'h6)])) ?
              wire41[(1'h0):(1'h0)] : (^~$unsigned({wire44, wire42})))))
            begin
              reg45 <= (&($signed(((wire43 ?
                  (8'haa) : reg46) >= $unsigned(wire41))) ^~ {$unsigned(wire40[(4'hc):(4'h8)]),
                  ((+(8'hae)) * wire43)}));
              reg46 <= wire43[(4'h9):(2'h2)];
              reg47 <= ($signed($unsigned(reg45[(4'ha):(3'h7)])) == $unsigned(((~^(&wire44)) ?
                  ((+reg45) ?
                      (^wire42) : $signed(reg46)) : $signed((wire44 | wire41)))));
            end
          else
            begin
              reg45 <= $unsigned(((!wire42[(4'h8):(3'h4)]) ?
                  $unsigned((7'h44)) : $unsigned(wire42)));
              reg46 <= (+$signed({reg46}));
            end
          if ($unsigned((^~(~^($signed(reg45) || $unsigned(reg45))))))
            begin
              reg48 <= reg47[(3'h4):(2'h2)];
              reg49 <= (($unsigned(wire43) ^ $unsigned({(~&(8'hac))})) ?
                  ((reg45[(4'hf):(4'he)] ?
                      reg47 : ((wire42 ? wire43 : wire41) ?
                          (wire42 ^ reg45) : (+wire44))) && $unsigned(wire43[(3'h6):(2'h2)])) : reg47);
              reg50 <= reg45;
              reg51 <= reg48[(4'hb):(4'ha)];
              reg52 <= reg50[(1'h0):(1'h0)];
            end
          else
            begin
              reg48 <= ((^~reg47) ?
                  {((|wire40[(3'h7):(3'h4)]) ?
                          ((reg47 ^ wire44) >> wire42[(3'h4):(2'h3)]) : ({reg46} ?
                              {wire42, (8'hbe)} : (~&(8'hb9))))} : wire44);
              reg49 <= ({$signed($signed((~reg47)))} ?
                  (|$signed(reg51)) : $unsigned($unsigned(((reg51 ?
                      reg52 : reg45) == reg50[(2'h2):(1'h0)]))));
              reg50 <= (~(((8'hb7) >> reg50) ?
                  $signed(wire41[(3'h4):(1'h1)]) : reg47[(2'h2):(2'h2)]));
              reg51 <= reg47;
            end
        end
      reg53 <= (&wire43[(3'h4):(2'h2)]);
      reg54 <= {$unsigned((|((wire43 ? reg48 : (7'h42)) ?
              (|reg46) : (reg48 ? (8'h9f) : reg53)))),
          (7'h43)};
    end
  assign wire55 = (reg45 ?
                      $unsigned($signed(wire42)) : (+(^(((8'ha6) ?
                          reg47 : (8'ha8)) && reg50[(2'h2):(1'h1)]))));
  assign wire56 = $signed($signed($unsigned(reg46)));
  assign wire57 = $signed($unsigned($unsigned({(wire43 ? reg53 : wire44),
                      (reg47 ? reg48 : (8'hba))})));
  assign wire58 = (8'h9d);
  assign wire59 = {reg54};
endmodule
