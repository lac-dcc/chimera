module top
#(parameter param46 = (((8'h9e) <= ((((7'h44) & (8'hb8)) ? (^~(8'ha5)) : ((7'h44) + (8'hab))) ^ (-((8'hba) ? (8'ha8) : (8'ha2))))) ? (((-((8'haa) | (8'hb4))) >>> (8'hae)) > (|({(7'h43), (8'h9f)} ? ((8'h9c) ^ (8'hb7)) : ((7'h42) ? (8'ha4) : (8'hb3))))) : (((~^((7'h41) ? (8'hac) : (8'hb7))) ? (8'hba) : {((8'h9d) ? (7'h44) : (8'hba)), ((7'h42) ? (8'hb3) : (8'haf))}) >>> ((~&{(8'ha5), (8'hb0)}) < (8'hb8)))), 
parameter param47 = (((param46 != param46) ? (!{(^param46)}) : {(!(param46 ? param46 : param46))}) ? (^~(({param46} ? (param46 || param46) : param46) <= ({param46, param46} ? (param46 ? (8'hb6) : param46) : (~&param46)))) : (8'ha9)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~|(+{($signed(wire2) ? {wire1} : (wire0 | (7'h40)))})))
        begin
          reg5 <= wire4;
        end
      else
        begin
          reg5 <= ($unsigned((wire1[(1'h1):(1'h0)] ^ $signed(wire3[(3'h5):(1'h0)]))) ?
              $signed({wire1}) : $unsigned(($signed($signed(reg5)) ?
                  ($unsigned(wire2) ?
                      wire2[(4'he):(3'h4)] : (~|wire4)) : ((wire0 ?
                      wire4 : wire0) == wire1))));
          reg6 <= ((~|((wire0 || $signed(wire1)) ?
              (^~(7'h42)) : wire1)) < (-wire4[(4'h8):(3'h7)]));
          reg7 <= $signed(((((-reg5) ? $unsigned(wire4) : (^wire0)) ?
                  ($unsigned((8'ha0)) ?
                      (wire0 << wire0) : (wire4 << (8'hb3))) : $unsigned($unsigned(wire1))) ?
              $unsigned(wire4) : wire4));
          reg8 <= (+{reg5});
        end
      reg9 <= ($unsigned($signed(reg6[(3'h7):(1'h0)])) >>> ((reg7[(2'h2):(1'h1)] ?
          (wire0[(3'h7):(2'h3)] ?
              $unsigned(wire1) : reg7[(3'h7):(1'h0)]) : {(wire3 ~^ (8'hbb)),
              (~|wire4)}) <= wire4[(3'h4):(3'h4)]));
      if (((8'hb6) ?
          $signed(wire2[(3'h5):(3'h4)]) : ((~&(~&$signed(wire0))) <<< $signed((~^((8'haa) ?
              wire2 : (8'h9e)))))))
        begin
          reg10 <= ((+(reg5 >= $unsigned({wire4}))) ?
              reg7 : (^{({wire4, reg5} ? wire3 : $unsigned(reg6))}));
          if (wire4)
            begin
              reg11 <= $signed({(($unsigned((8'hb8)) ^ (~&reg6)) ~^ reg8[(4'hd):(4'hd)]),
                  {(reg10[(3'h4):(2'h2)] >>> (wire1 ? reg5 : (8'ha9)))}});
            end
          else
            begin
              reg11 <= $unsigned(reg8[(3'h7):(3'h6)]);
              reg12 <= {$signed($unsigned((!wire4[(3'h7):(3'h7)]))),
                  $unsigned(reg9)};
            end
        end
      else
        begin
          reg10 <= (7'h41);
          reg11 <= (~$unsigned(reg12[(2'h3):(1'h1)]));
          reg12 <= (reg11[(3'h6):(3'h4)] <= $signed(({(wire1 ? reg7 : reg11),
              wire1[(3'h4):(2'h2)]} <= $signed(wire3))));
          if ((-reg7))
            begin
              reg13 <= ((&$unsigned((~^$signed(reg8)))) ?
                  (reg7[(4'h8):(2'h3)] << {{(7'h40)},
                      ($signed((7'h41)) ?
                          $unsigned(reg12) : $unsigned(reg11))}) : reg5[(2'h3):(1'h0)]);
              reg14 <= $signed($unsigned($unsigned(((wire4 >> reg8) ?
                  (reg5 ? wire0 : reg10) : (7'h40)))));
            end
          else
            begin
              reg13 <= ($unsigned($unsigned(reg10)) << ((wire2 > $unsigned(wire3)) <<< ((~&reg6[(3'h7):(1'h1)]) - (wire0 > reg9[(3'h7):(1'h0)]))));
              reg14 <= (~&$unsigned(reg7[(1'h1):(1'h1)]));
              reg15 <= $signed($signed(((reg9[(3'h4):(3'h4)] ?
                  reg11[(5'h11):(4'h9)] : $signed(reg7)) * ((wire0 & wire4) * wire2))));
            end
          reg16 <= reg14;
        end
      reg17 <= ((8'hac) ~^ $unsigned({{(reg14 ? wire3 : reg6), (~|wire2)},
          reg14}));
    end
  assign wire18 = ($unsigned(reg15) <<< $signed((~|reg7)));
  assign wire19 = $signed((~(!(8'hb3))));
  assign wire20 = ((&reg8) & ((^~(((8'h9d) ? reg11 : reg13) || (reg8 ?
                          reg12 : wire1))) ?
                      reg11[(1'h0):(1'h0)] : (wire4[(3'h4):(3'h4)] ~^ (reg14[(1'h1):(1'h1)] ?
                          (wire2 == reg7) : reg15))));
  assign wire21 = ((-reg5[(3'h4):(1'h1)]) ?
                      $unsigned($unsigned($signed((8'hb2)))) : reg16[(2'h2):(1'h1)]);
  assign wire22 = $signed(reg13);
  assign wire23 = $unsigned(wire19[(4'hc):(2'h2)]);
  assign wire24 = wire18;
  assign wire25 = $signed((wire3 ?
                      $unsigned(($unsigned(wire3) | (reg14 ?
                          wire23 : reg16))) : $signed(reg5)));
  assign wire26 = (^wire2[(1'h0):(1'h0)]);
  assign wire27 = wire2[(4'hc):(4'h8)];
  assign wire28 = {(~^{$signed((wire20 ? wire26 : reg16)),
                          reg6[(3'h7):(2'h2)]})};
  assign wire29 = {(((reg10 ?
                          reg11 : ((8'ha3) ?
                              wire28 : wire27)) <<< $unsigned({reg5})) <<< ((~|reg6[(1'h0):(1'h0)]) ?
                          $unsigned(reg17) : reg8))};
  always
    @(posedge clk) begin
      if (reg11)
        begin
          reg30 <= wire23[(4'he):(4'h9)];
        end
      else
        begin
          reg30 <= ((wire1[(3'h6):(1'h1)] ?
              $unsigned(($signed(reg6) ?
                  $signed(wire24) : (-(8'hb1)))) : wire26[(2'h3):(2'h2)]) | (wire24 ?
              reg14 : ({reg8[(3'h6):(3'h5)], reg5} > {reg5})));
        end
      reg31 <= ((&(~&(8'hbe))) ?
          (~^$signed((&$signed(wire23)))) : (!(((wire1 ?
                  wire0 : (8'ha7)) >= (^~wire3)) ?
              {{reg10, (7'h43)}} : ($signed(reg5) <<< (reg30 * wire27)))));
      reg32 <= wire24;
      reg33 <= {(8'h9f)};
      reg34 <= $signed(((wire25 && $signed(reg7[(4'h9):(2'h3)])) ~^ (~|(!reg6))));
    end
  assign wire35 = (~^wire27[(2'h2):(1'h1)]);
  assign wire36 = $unsigned($unsigned(($signed(reg31[(2'h2):(1'h0)]) ?
                      ((reg31 ^ wire25) ~^ $unsigned(reg7)) : (^~reg13))));
  assign wire37 = (^reg11);
  assign wire38 = (((~|{$signed(wire37)}) ?
                      wire21[(3'h7):(3'h6)] : wire35[(3'h4):(2'h3)]) | reg6);
  always
    @(posedge clk) begin
      if ($signed($unsigned(((^~(reg17 >> reg30)) ?
          ($signed(wire4) >>> (!(7'h41))) : $signed((8'hb1))))))
        begin
          reg39 <= $signed(((|({wire26,
              wire35} + wire26[(2'h3):(1'h1)])) > reg16[(3'h4):(3'h4)]));
          reg40 <= $signed(wire38);
        end
      else
        begin
          if ($signed($unsigned(((8'h9d) ~^ wire0))))
            begin
              reg39 <= ($unsigned((wire18[(3'h5):(2'h3)] >= $unsigned($unsigned((8'hb1))))) ?
                  $signed((reg10 > $unsigned(((8'hb4) ?
                      reg32 : wire23)))) : (8'ha6));
              reg40 <= {(7'h43)};
            end
          else
            begin
              reg39 <= (reg39[(1'h1):(1'h1)] >= (!{({reg15} && $unsigned(wire22)),
                  (^~(-wire24))}));
              reg40 <= ((reg5 ?
                      ({$signed(wire18)} ?
                          reg7[(2'h2):(2'h2)] : (~^(reg9 ?
                              wire37 : reg13))) : {{reg34},
                          ({reg5, wire3} <= reg8[(1'h0):(1'h0)])}) ?
                  (-$signed((&(wire24 + reg9)))) : (8'haf));
              reg41 <= $unsigned($unsigned((((wire3 ? (8'hba) : wire4) ?
                      (&wire19) : reg9[(2'h2):(1'h0)]) ?
                  {(wire3 && wire25), (reg34 >= reg6)} : reg30)));
              reg42 <= $unsigned($unsigned((({reg8} && reg31) | reg12)));
            end
        end
      reg43 <= (reg15 ^~ (wire25 >>> {reg42}));
      reg44 <= wire35[(2'h2):(2'h2)];
      reg45 <= ($unsigned(wire36) ?
          {wire2[(4'hf):(4'h9)], (7'h40)} : ($unsigned($unsigned((~^wire3))) ?
              (($signed(reg31) - $unsigned(reg10)) >= (&reg31)) : {$signed(reg30),
                  (~^$signed(reg9))}));
    end
endmodule
