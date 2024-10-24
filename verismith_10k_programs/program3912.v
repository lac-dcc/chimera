module top #(parameter param48 = (8'ha6)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire43;
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire4,
                 wire5,
                 wire6,
                 wire16,
                 wire43,
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
  assign wire4 = (8'hb4);
  assign wire5 = ($signed($signed(((wire2 ? wire4 : wire0) ?
                     (wire2 ~^ (8'ha7)) : (wire1 <= (8'h9e))))) ^~ (wire2 ?
                     {$signed((wire0 ? (8'hbf) : wire0)),
                         (!(!wire0))} : ((((8'hb1) - wire0) ^~ $unsigned(wire2)) ?
                         wire0 : wire4[(3'h5):(1'h0)])));
  assign wire6 = (^~$unsigned((wire1 ?
                     $unsigned((wire0 ? wire3 : wire1)) : (|(+wire3)))));
  always
    @(posedge clk) begin
      reg7 <= wire5;
      if ((&wire3[(1'h0):(1'h0)]))
        begin
          reg8 <= (!(^$signed($unsigned(wire1[(2'h3):(1'h1)]))));
          reg9 <= reg7;
          if ((~$unsigned(wire0)))
            begin
              reg10 <= {((reg9 ?
                          (wire6 <<< (~&wire0)) : (|(wire0 ? wire5 : wire2))) ?
                      (wire4[(4'hd):(4'ha)] && wire3[(1'h1):(1'h1)]) : wire0[(4'hf):(4'h9)])};
            end
          else
            begin
              reg10 <= ((wire2 ?
                  wire0[(3'h6):(3'h4)] : (~^$unsigned($signed((8'hbe))))) & $signed($signed($signed($unsigned(wire6)))));
              reg11 <= ({$unsigned(({wire4} || (wire6 <= reg9))), wire2} ?
                  (+(wire0[(5'h15):(4'he)] ?
                      (wire5[(4'h8):(3'h4)] ?
                          $signed(wire4) : $unsigned(wire6)) : $unsigned($signed(wire4)))) : wire4);
              reg12 <= ((&$signed(wire5[(4'ha):(2'h2)])) > ({$unsigned($signed(wire2))} ?
                  $unsigned(wire5) : (&$unsigned($unsigned(wire0)))));
              reg13 <= wire4[(3'h5):(1'h0)];
              reg14 <= $unsigned($unsigned((&reg9[(3'h5):(3'h5)])));
            end
          reg15 <= wire1;
        end
      else
        begin
          reg8 <= reg8[(2'h2):(1'h1)];
          if (({(^~((wire4 <= reg10) ~^ (wire6 < reg15))),
              (((reg15 ?
                  reg14 : reg12) != wire3) <<< ((8'h9d) <<< (wire5 == reg9)))} <= {wire1[(2'h2):(1'h0)],
              (|$signed((reg13 || wire2)))}))
            begin
              reg9 <= ($unsigned(($signed($unsigned((8'hb9))) ?
                      $unsigned($unsigned(reg15)) : (^~reg12[(3'h7):(2'h3)]))) ?
                  ((((reg13 ? reg10 : wire1) * $unsigned(wire2)) ?
                      (~|(&wire1)) : (reg12[(2'h2):(1'h0)] & {wire5,
                          (8'hab)})) ^~ reg10[(3'h6):(2'h2)]) : $signed((~|{$signed(reg13),
                      (7'h43)})));
              reg10 <= ($unsigned(reg15[(2'h2):(1'h1)]) ?
                  (~reg9[(2'h2):(1'h1)]) : ((wire5[(4'hd):(1'h1)] ?
                      wire3[(1'h1):(1'h1)] : $unsigned((^~wire3))) && reg14[(1'h0):(1'h0)]));
              reg11 <= wire1[(3'h4):(1'h0)];
              reg12 <= (wire6 ?
                  reg11 : ($signed((-(|wire1))) - $unsigned($signed(wire2[(1'h0):(1'h0)]))));
              reg13 <= (~^reg13);
            end
          else
            begin
              reg9 <= (reg9 ?
                  {$signed($signed((wire2 - reg12))),
                      wire1[(2'h3):(2'h2)]} : $unsigned(reg13));
              reg10 <= {wire4[(4'hc):(4'hb)], reg11};
              reg11 <= ((reg13 - $unsigned(wire3[(4'hc):(1'h1)])) >= $unsigned((-(wire3[(4'h9):(3'h6)] >= (reg13 | reg13)))));
              reg12 <= (reg9[(3'h5):(3'h5)] ?
                  wire0[(4'h8):(3'h4)] : (&wire4[(4'hb):(4'hb)]));
            end
          reg14 <= (!(-(((wire1 ? reg7 : wire0) ^~ (reg10 ? reg13 : reg15)) ?
              {reg11} : (((8'hbf) * wire5) <<< (^wire2)))));
          reg15 <= reg14;
        end
    end
  assign wire16 = ((reg8 < $signed($unsigned($signed(wire5)))) ?
                      ((((8'had) <<< (!(8'ha7))) & ($signed(reg7) ^ (~wire0))) ?
                          $unsigned(((wire2 ? reg13 : reg15) ?
                              $signed(reg11) : $signed(reg8))) : $unsigned(reg12[(3'h7):(3'h4)])) : (+(^~wire2[(1'h1):(1'h0)])));
  module17 #() modinst44 (wire43, clk, wire16, wire4, wire3, reg14, reg10);
  assign wire45 = {(^~reg9[(2'h3):(2'h3)])};
  assign wire46 = wire4;
  assign wire47 = (^$signed((wire16 ?
                      ((wire0 ?
                          reg15 : (8'hb3)) ^~ $signed((8'ha4))) : (&(reg15 ?
                          reg8 : wire46)))));
endmodule

module module17
#(parameter param41 = (-((+({(7'h42)} ? ((8'hb1) ? (8'ha2) : (8'ha6)) : ((7'h44) ? (8'ha8) : (8'had)))) | ((~^((8'hac) ? (8'hb5) : (7'h41))) ? {((8'ha0) ? (8'h9f) : (8'haa))} : (8'ha7)))), 
parameter param42 = ((^~((~&{param41, param41}) >= ({(8'hab)} - (param41 >>> (8'ha2))))) + ((((param41 + param41) ? (|(8'hbb)) : {param41}) ? {(&param41), {param41}} : {(param41 ? param41 : param41)}) >> (((param41 ~^ param41) ~^ {param41}) ? {param41} : ((~|param41) ? (param41 ? param41 : param41) : (~^param41))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire22;
  input wire signed [(4'h8):(1'h0)] wire21;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= (8'had);
      reg24 <= wire20;
      reg25 <= $unsigned(wire18);
      if (wire20)
        begin
          reg26 <= $signed(wire20[(1'h0):(1'h0)]);
          reg27 <= (wire22 ?
              $signed($signed(((&wire18) ?
                  $signed((8'ha4)) : $signed(reg24)))) : ((|reg24) <= (^wire19)));
          if ((&$unsigned(wire20)))
            begin
              reg28 <= $unsigned(($unsigned((wire22[(3'h7):(1'h0)] + {reg27,
                  wire21})) - wire19));
              reg29 <= $unsigned($unsigned(($unsigned((wire21 ?
                      (8'hbc) : (8'ha0))) ?
                  ($signed(reg23) >>> ((8'hb3) ~^ (8'hbb))) : reg26)));
              reg30 <= (~|$unsigned((+wire21[(3'h7):(2'h2)])));
              reg31 <= ($unsigned(wire20) <<< $unsigned($unsigned(($unsigned(wire18) + (wire22 > wire21)))));
              reg32 <= $unsigned($signed({wire21}));
            end
          else
            begin
              reg28 <= (($signed(((^reg29) ? (+reg26) : (+wire18))) ?
                  ((~(!(8'ha6))) - (8'hb6)) : ((wire20 ?
                      reg23 : $signed(reg26)) <<< $signed({wire22,
                      reg24}))) & reg32[(1'h1):(1'h0)]);
            end
          reg33 <= ((~&(wire20[(3'h6):(2'h3)] ?
                  $unsigned(reg31) : $unsigned((reg32 ? wire22 : reg26)))) ?
              wire18 : $unsigned(((wire22 ?
                  reg27 : (~|reg29)) == (~(reg31 ^ wire21)))));
          reg34 <= ($unsigned($unsigned((((7'h43) ^ wire19) + {wire22,
                  reg32}))) ?
              (($unsigned({reg26, wire22}) ?
                      reg28[(4'hb):(2'h3)] : wire22[(1'h1):(1'h0)]) ?
                  ({reg33,
                      {(8'hba),
                          reg25}} == reg31[(2'h3):(1'h1)]) : $unsigned(wire19)) : $signed($unsigned((reg30[(4'he):(4'ha)] ?
                  (wire21 ? (7'h43) : reg23) : ((8'ha2) < reg31)))));
        end
      else
        begin
          reg26 <= reg31[(4'ha):(3'h5)];
          reg27 <= ((8'ha3) + $unsigned(($signed(reg24) || (wire21 ?
              $signed(reg25) : ((7'h42) >= reg25)))));
          reg28 <= reg24;
        end
    end
  assign wire35 = (reg25 ?
                      (reg29[(5'h11):(4'h9)] ?
                          reg28 : reg27[(3'h7):(3'h7)]) : ((reg25[(4'h8):(2'h3)] ?
                          (!(reg26 ?
                              reg33 : reg26)) : $unsigned($unsigned(reg25))) * (~|wire22)));
  assign wire36 = $signed($unsigned(((^~(~^reg30)) >= $unsigned((reg31 ?
                      wire20 : wire20)))));
  assign wire37 = $unsigned($signed($unsigned($unsigned(((8'hae) ?
                      wire21 : reg23)))));
  assign wire38 = ({((^(reg30 && wire22)) - ($signed(reg24) ?
                              (reg26 ? reg32 : reg26) : reg25)),
                          (((~^reg23) ?
                                  (wire37 ^~ wire37) : (reg28 ?
                                      wire21 : reg33)) ?
                              {(wire20 | reg33)} : wire22)} ?
                      reg28 : reg25);
  assign wire39 = wire38;
  assign wire40 = $unsigned((^~(({reg29} ?
                          wire39[(4'h8):(2'h2)] : $signed(wire22)) ?
                      $unsigned((8'hbe)) : $signed((reg26 >= reg23)))));
endmodule
