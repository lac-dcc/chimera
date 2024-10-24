module top
#(parameter param59 = (8'h9d), 
parameter param60 = (((^~((~|param59) < (param59 ? param59 : param59))) ? {param59} : (|((-param59) >>> (8'h9e)))) ? (^((+(|param59)) ? ((param59 & param59) ? ((8'hb0) * param59) : (-param59)) : param59)) : (8'h9c)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire55,
                 wire27,
                 wire21,
                 wire20,
                 wire19,
                 wire6,
                 wire5,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = wire0;
  always
    @(posedge clk) begin
      reg7 <= (|{$unsigned(wire1), (^~(~&$signed(wire2)))});
      if (wire5[(3'h6):(1'h1)])
        begin
          reg8 <= (~($unsigned((wire5[(3'h6):(3'h6)] ?
              (reg7 ? wire4 : wire0) : wire3)) ^ (8'hbc)));
          reg9 <= (!(!((wire6[(3'h7):(3'h7)] || {wire0}) ?
              wire2[(1'h0):(1'h0)] : ($unsigned((8'had)) ^ wire5))));
          reg10 <= (+$unsigned(wire2[(2'h2):(1'h1)]));
          reg11 <= $unsigned(reg8);
          reg12 <= (^~($unsigned(($signed(reg8) ? wire0 : wire4)) | wire0));
        end
      else
        begin
          reg8 <= reg9;
          reg9 <= (~$unsigned(((8'h9e) ^~ $unsigned({reg11}))));
          reg10 <= $signed($unsigned(wire0[(4'ha):(2'h3)]));
          reg11 <= $unsigned((((wire5 + (8'hbe)) ?
              reg8[(1'h1):(1'h0)] : $unsigned((reg11 >>> (8'hb7)))) <<< (~|((~|reg9) < reg9))));
          if ($signed({reg10}))
            begin
              reg12 <= {((($signed(wire6) || {(8'ha4)}) ?
                          wire1 : $unsigned($unsigned(wire1))) ?
                      reg8[(4'hc):(4'ha)] : {($signed(wire1) >>> reg9[(1'h1):(1'h0)]),
                          {(~(8'hba)), (wire5 != reg8)}}),
                  {wire4}};
              reg13 <= (~&((wire3[(5'h10):(3'h5)] >>> ($unsigned(reg9) ?
                      $signed(wire0) : (reg8 ? wire6 : reg11))) ?
                  $signed(((8'haf) << (~reg7))) : ($signed((reg11 ?
                      reg7 : (8'hb8))) - {(wire2 ? wire3 : reg12),
                      ((8'hb0) ? reg9 : wire3)})));
            end
          else
            begin
              reg12 <= $unsigned($unsigned(((~&$signed((8'hbb))) << reg10)));
              reg13 <= $signed($signed(({(reg10 ? reg11 : reg13), (&(8'hb9))} ?
                  ($unsigned((8'ha9)) ^ {reg9}) : $unsigned((^reg12)))));
              reg14 <= reg13;
              reg15 <= ((({(reg13 ? wire5 : wire0),
                  (~&wire4)} >>> $signed($signed(reg13))) || (~reg13[(2'h2):(2'h2)])) ~^ reg12[(4'ha):(1'h0)]);
              reg16 <= $unsigned($signed(wire4));
            end
        end
      reg17 <= wire4;
      reg18 <= wire2[(3'h5):(3'h5)];
    end
  assign wire19 = (8'ha2);
  assign wire20 = (+(&(wire1[(4'he):(3'h7)] ?
                      {(^~(8'h9f)), (8'hb8)} : $signed($unsigned(wire6)))));
  assign wire21 = $unsigned((&$signed($unsigned((wire4 ? reg9 : wire1)))));
  always
    @(posedge clk) begin
      reg22 <= ((~^reg8[(4'hc):(3'h7)]) ?
          (~^$signed($unsigned((~wire3)))) : wire4[(3'h7):(1'h0)]);
      reg23 <= (~wire6[(1'h1):(1'h1)]);
      reg24 <= (8'hb2);
      reg25 <= (~|(({(&reg23)} >> (&(reg17 ?
          wire21 : (7'h43)))) - wire2[(1'h0):(1'h0)]));
      reg26 <= (wire5[(3'h6):(1'h0)] ?
          reg14 : (reg15[(2'h3):(1'h1)] ?
              reg15[(1'h1):(1'h1)] : (($unsigned((8'hb5)) << (wire3 ?
                  reg18 : reg12)) | ((reg16 ~^ reg7) ?
                  (reg23 ? reg7 : reg14) : (reg8 ? wire0 : wire21)))));
    end
  assign wire27 = reg22[(5'h13):(3'h6)];
  module28 #() modinst56 (wire55, clk, reg22, wire27, reg10, wire0);
  assign wire57 = reg11[(4'hb):(4'h8)];
  assign wire58 = wire19;
endmodule

module module28
#(parameter param54 = (8'had))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire32;
  input wire [(2'h3):(1'h0)] wire31;
  input wire [(5'h13):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire42,
                 wire41,
                 wire40,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire33 = ($unsigned($unsigned(wire30)) ~^ (((wire29[(3'h7):(2'h3)] ?
                      wire30[(4'h8):(4'h8)] : $signed(wire31)) & $signed($signed((8'hab)))) << wire31));
  assign wire34 = $signed((+$unsigned($unsigned((wire32 ?
                      (8'hac) : (8'hba))))));
  assign wire35 = wire34[(4'hd):(3'h7)];
  assign wire36 = wire30[(4'he):(3'h7)];
  always
    @(posedge clk) begin
      reg37 <= $unsigned(wire33);
      reg38 <= ((wire32[(3'h7):(1'h0)] ?
          (($unsigned(wire33) ? $signed(wire33) : (wire32 ? wire34 : (8'hb2))) ?
              wire36[(4'h9):(2'h3)] : ($unsigned(wire29) ?
                  {wire36} : wire34[(2'h3):(2'h3)])) : $unsigned((&wire33))) & $unsigned(((wire35 ^ (-(8'ha1))) ?
          $signed($signed(wire31)) : $unsigned(((8'ha0) ? wire32 : wire29)))));
      reg39 <= ((((^(+wire31)) | (reg37[(3'h4):(1'h1)] ?
          $signed((7'h43)) : $signed(wire33))) <<< (((~^wire32) ?
              (wire31 == reg37) : {wire33, reg38}) ?
          {$signed((8'hbb)),
              reg38[(3'h7):(2'h2)]} : ($signed(reg38) <= {(8'hb8)}))) || (+$signed(wire36)));
    end
  assign wire40 = $signed(({((wire33 + wire31) && {wire33, reg38}),
                          $unsigned($unsigned(wire35))} ?
                      (!wire32[(4'he):(3'h5)]) : {((^~(7'h40)) || (+wire30))}));
  assign wire41 = (~(((7'h41) ? {$signed(wire29)} : reg37[(3'h5):(3'h4)]) ?
                      $unsigned({((7'h42) ?
                              wire29 : wire30)}) : $unsigned((^~((8'hae) ?
                          reg39 : (8'hb6))))));
  assign wire42 = reg39[(4'hf):(4'h8)];
  always
    @(posedge clk) begin
      reg43 <= wire40;
      if (wire36)
        begin
          if (wire30[(3'h4):(3'h4)])
            begin
              reg44 <= ($signed((-{(wire30 ? reg43 : wire42),
                      $signed(wire42)})) ?
                  (~&({(wire41 ? (8'h9f) : wire40), $signed(wire34)} ?
                      wire40[(4'h8):(3'h7)] : ((wire42 - wire36) ?
                          wire33[(2'h2):(2'h2)] : wire29[(1'h0):(1'h0)]))) : reg37);
              reg45 <= wire40;
              reg46 <= (($signed(wire35) ?
                      (8'hbf) : (wire41[(2'h2):(1'h1)] - $signed({reg38}))) ?
                  reg37 : wire36[(5'h10):(2'h3)]);
              reg47 <= wire32;
            end
          else
            begin
              reg44 <= (^$signed((^~(reg44 ?
                  (8'hbe) : (wire35 ? wire41 : (8'h9d))))));
            end
        end
      else
        begin
          reg44 <= {wire42, $unsigned({reg45, (^~wire40)})};
        end
      reg48 <= $signed($signed(reg38));
    end
  assign wire49 = ((+$unsigned((^wire32))) && (wire29[(2'h2):(1'h1)] == ($signed((8'ha4)) + $signed((8'ha3)))));
  assign wire50 = wire49[(2'h2):(1'h1)];
  assign wire51 = {$signed(wire42), $signed(wire36)};
  assign wire52 = wire36;
  assign wire53 = $signed(wire34[(3'h4):(1'h1)]);
endmodule
