module top
#(parameter param65 = (((^(^~((8'hac) != (8'ha2)))) <= ((8'ha7) ? ((~&(8'hae)) ^~ (&(8'haa))) : (8'ha6))) + {(~^((~&(8'hb2)) ? ((8'had) ~^ (8'haa)) : ((8'haf) << (8'ha2))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire59;
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire61,
                 wire5,
                 wire6,
                 wire24,
                 wire25,
                 wire26,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire35,
                 wire36,
                 wire37,
                 wire59,
                 reg62,
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
                 reg27,
                 reg32,
                 reg33,
                 reg34,
                 reg38,
                 (1'h0)};
  assign wire5 = (^(wire0 | $unsigned(wire4[(4'ha):(3'h7)])));
  assign wire6 = $signed(wire5);
  always
    @(posedge clk) begin
      reg7 <= (wire6[(4'h9):(3'h5)] ?
          wire1 : (~|($unsigned(wire5[(3'h4):(2'h2)]) ?
              ($unsigned((8'hac)) ? wire4 : (wire5 ? wire6 : wire6)) : ((wire5 ?
                      wire2 : wire2) ?
                  wire1 : $unsigned(wire3)))));
      if (reg7)
        begin
          reg8 <= $signed($signed($signed(wire3)));
          reg9 <= wire0;
          reg10 <= wire2[(2'h3):(1'h0)];
          reg11 <= ((wire2[(4'ha):(1'h1)] ?
                  (reg10 ?
                      $unsigned(reg8[(3'h5):(3'h4)]) : $unsigned(reg8)) : wire5[(3'h7):(1'h0)]) ?
              {$signed((-(wire4 >>> (8'had))))} : $signed({{wire5,
                      $unsigned((8'hae))}}));
          if ($unsigned(wire0[(5'h10):(1'h0)]))
            begin
              reg12 <= (!$signed(reg10));
              reg13 <= {$signed($signed($signed((reg7 >= wire2)))), (^wire5)};
            end
          else
            begin
              reg12 <= reg7;
              reg13 <= reg12;
              reg14 <= $unsigned(reg7);
              reg15 <= $signed(wire0[(4'hf):(4'he)]);
              reg16 <= (reg15[(3'h7):(2'h3)] + (|wire1[(3'h5):(1'h1)]));
            end
        end
      else
        begin
          reg8 <= (~($signed((|{reg8})) >> wire5));
        end
      if ((8'h9f))
        begin
          if ($unsigned($unsigned(reg7)))
            begin
              reg17 <= reg7[(1'h1):(1'h0)];
            end
          else
            begin
              reg17 <= reg11;
              reg18 <= {(($unsigned((^reg14)) - (wire1[(1'h1):(1'h1)] ?
                          $unsigned((8'ha3)) : (!reg11))) ?
                      (+$signed(reg14)) : ((~$unsigned(reg10)) << ($signed(reg14) ?
                          {reg9, wire3} : (wire4 ? reg7 : reg9)))),
                  ($signed({(wire2 ? reg8 : (8'hb6))}) ?
                      $signed(wire6[(3'h4):(1'h0)]) : $signed($unsigned((~&reg14))))};
            end
          reg19 <= $signed(reg7[(4'h9):(1'h1)]);
          reg20 <= (($signed(($unsigned((8'hac)) | (+reg9))) >> reg19[(4'he):(4'ha)]) ?
              ((reg13[(1'h0):(1'h0)] == $unsigned(wire0[(4'hd):(4'h9)])) > wire6[(2'h3):(1'h0)]) : $signed($signed((8'hb7))));
          reg21 <= ($unsigned($signed($signed((~wire6)))) ?
              ($unsigned((wire6[(3'h6):(3'h6)] ?
                      ((8'ha9) ? reg10 : reg10) : $signed((8'hb1)))) ?
                  reg14 : reg10) : (reg15 ?
                  reg18 : ($unsigned((reg7 ? wire1 : reg16)) ?
                      ($signed(reg11) <= (wire1 ?
                          wire1 : wire3)) : ($unsigned(reg10) <<< (reg11 ?
                          wire4 : reg11)))));
        end
      else
        begin
          reg17 <= $signed(($unsigned((~^reg18[(1'h1):(1'h1)])) ?
              reg21 : (reg19[(4'hc):(2'h2)] * (reg7 ?
                  reg13 : $signed(reg14)))));
          if ((($unsigned((-$unsigned(reg14))) != ({$unsigned(reg7),
                  $signed(reg9)} ?
              {(&wire1),
                  (reg11 | (8'h9f))} : $signed($unsigned(reg9)))) && reg21[(4'h9):(3'h6)]))
            begin
              reg18 <= {$unsigned((8'hbf))};
            end
          else
            begin
              reg18 <= reg12;
              reg19 <= (wire3[(4'hd):(4'hd)] ?
                  ((((wire3 ? reg15 : reg19) ?
                          (wire4 >>> reg15) : $signed(reg17)) ?
                      $signed({wire4}) : (!(wire5 ?
                          wire0 : (8'ha2)))) <= ($unsigned((+(8'h9e))) ^~ (^~(~wire4)))) : reg21[(4'h8):(3'h6)]);
            end
        end
      reg22 <= reg11[(1'h1):(1'h0)];
      reg23 <= reg12[(1'h0):(1'h0)];
    end
  assign wire24 = (reg20 ?
                      $unsigned(reg7[(1'h1):(1'h0)]) : $unsigned($signed($signed((~|wire2)))));
  assign wire25 = reg16[(2'h3):(2'h2)];
  assign wire26 = ((wire24 ^~ (reg21 ?
                          $signed((&reg13)) : $signed($signed(wire5)))) ?
                      ($signed(((wire1 ?
                          reg10 : wire2) * reg9[(4'hb):(4'ha)])) <= (^~$unsigned($unsigned(wire6)))) : $unsigned((!reg18[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg27 <= ((~|wire26[(3'h6):(1'h0)]) < (wire25 <= (reg12 ~^ reg10[(3'h4):(2'h2)])));
    end
  assign wire28 = $signed(((+$signed((7'h40))) * ((!(~&reg8)) > $signed((!(8'haf))))));
  assign wire29 = (^({(~(reg8 ? wire2 : wire3))} ?
                      $signed((&{wire26})) : $signed($signed($signed(reg22)))));
  assign wire30 = ((reg20 <= $unsigned(wire4[(4'he):(4'h8)])) ?
                      reg12 : (|$signed({reg10, reg14[(1'h0):(1'h0)]})));
  assign wire31 = reg12;
  always
    @(posedge clk) begin
      if ((8'ha7))
        begin
          reg32 <= $unsigned(reg12[(4'h8):(2'h3)]);
          if (reg7[(4'ha):(2'h3)])
            begin
              reg33 <= (wire6 & reg7[(3'h6):(1'h0)]);
            end
          else
            begin
              reg33 <= ($signed(($unsigned(reg22) ~^ (~reg18[(2'h2):(2'h2)]))) != reg32[(1'h0):(1'h0)]);
              reg34 <= $unsigned(reg17);
            end
        end
      else
        begin
          reg32 <= $signed(reg11);
        end
    end
  assign wire35 = ($signed(((((8'hb5) ?
                      reg7 : reg7) >> reg9) > {$unsigned(reg32),
                      (reg10 <= wire2)})) && ((~&wire30[(2'h3):(1'h0)]) >>> $unsigned($signed((reg18 <<< reg14)))));
  assign wire36 = (wire26 ?
                      ($signed($unsigned($signed(reg32))) << (7'h40)) : wire30);
  assign wire37 = (reg15 ?
                      ($signed((~^(reg23 ?
                          reg21 : (8'hb7)))) || $unsigned(($unsigned(wire5) | {(8'ha5)}))) : (wire36[(5'h13):(3'h5)] ?
                          reg20 : (^($signed((7'h40)) ?
                              $signed(wire35) : ((8'ha9) | reg9)))));
  always
    @(posedge clk) begin
      reg38 <= wire4;
    end
  module39 #() modinst60 (.wire41(reg22), .wire42(reg19), .wire43(reg12), .y(wire59), .wire40(wire1), .clk(clk));
  assign wire61 = (~^wire4[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg62 <= $unsigned((((wire37[(4'hc):(4'hc)] ?
              $unsigned(reg12) : ((8'ha5) ? wire26 : wire31)) + {reg34}) ?
          (7'h41) : $unsigned(({wire28, wire29} ?
              wire59 : wire4[(2'h3):(2'h3)]))));
    end
  assign wire63 = {$signed($unsigned({(~reg15), wire2})), reg38[(1'h1):(1'h0)]};
  assign wire64 = {$signed(($signed($unsigned(wire30)) ^~ $signed((-reg33)))),
                      wire24};
endmodule

module module39  (y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire43;
  input wire signed [(4'he):(1'h0)] wire42;
  input wire signed [(2'h3):(1'h0)] wire41;
  input wire [(5'h10):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire44 = wire43[(3'h7):(3'h5)];
  assign wire45 = $signed(wire44[(3'h6):(1'h0)]);
  assign wire46 = wire41[(1'h0):(1'h0)];
  assign wire47 = (^~$signed(($unsigned(wire46) ^ $unsigned($signed(wire46)))));
  assign wire48 = $unsigned($signed(wire40[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ((^~wire43))
        begin
          reg49 <= {wire40};
          if ((^(~|(wire43[(3'h7):(3'h5)] ?
              (^((8'h9f) && (8'ha5))) : $signed($signed(wire41))))))
            begin
              reg50 <= ($signed($unsigned((~|(+wire41)))) ?
                  $unsigned(($unsigned($signed((8'hb0))) ^ $unsigned((wire41 >>> wire45)))) : (!({(7'h40),
                          wire41[(1'h1):(1'h1)]} ?
                      $unsigned((wire45 ^ wire43)) : wire44[(3'h6):(2'h2)])));
              reg51 <= $unsigned(wire42[(2'h3):(1'h0)]);
              reg52 <= wire48;
              reg53 <= {wire48};
              reg54 <= wire46;
            end
          else
            begin
              reg50 <= (wire45 ?
                  wire46[(4'hd):(1'h1)] : $unsigned(($signed((8'hae)) ^ ((wire42 ?
                      (8'hbb) : wire40) - wire44))));
            end
        end
      else
        begin
          reg49 <= reg49[(2'h3):(2'h3)];
          reg50 <= $unsigned(wire41);
          reg51 <= wire41[(1'h0):(1'h0)];
          reg52 <= ((~&wire40) ?
              $signed((reg49[(1'h1):(1'h1)] ?
                  $unsigned({(8'ha8)}) : wire46[(4'hb):(2'h3)])) : (wire47[(1'h0):(1'h0)] ^ (8'ha3)));
        end
      reg55 <= {(^(reg54[(4'hb):(3'h6)] ?
              $signed($unsigned(reg52)) : (7'h40)))};
      reg56 <= (8'ha3);
      reg57 <= $signed(wire47[(2'h2):(1'h0)]);
      reg58 <= {($signed($unsigned(reg51)) >> reg49[(4'ha):(2'h2)]), wire43};
    end
endmodule
