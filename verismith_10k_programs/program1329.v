module top
#(parameter param42 = ((~|((((8'hbf) < (8'hbd)) ? ((7'h42) | (8'ha0)) : ((8'hbe) ? (7'h43) : (8'hb7))) ? ((8'h9c) ? ((8'hb2) ? (8'ha4) : (8'hb3)) : (7'h42)) : ((+(8'ha7)) ? {(8'hac), (8'haf)} : ((7'h41) ^ (7'h44))))) ? {{(&{(8'hbe), (8'hae)}), (((8'hbb) ? (8'ha8) : (8'hb9)) ? (|(8'hb7)) : ((8'h9d) * (8'h9e)))}} : ((^((~^(8'haa)) ? (^(8'haf)) : (&(8'h9e)))) ? (((~(7'h42)) ? {(8'ha3)} : ((8'hb1) - (8'hb7))) < (((8'h9e) && (8'ha1)) < ((8'hac) ~^ (8'ha7)))) : (((-(8'ha1)) ? ((7'h43) ? (8'haf) : (7'h40)) : ((8'had) - (8'ha0))) >= (((8'hb0) < (8'ha2)) & (8'hb1))))), 
parameter param43 = ((&({(~param42), ((8'hbc) ? param42 : param42)} ? (|param42) : (param42 ? (8'hbb) : param42))) * (((param42 ? param42 : (param42 && param42)) == param42) ? (8'haf) : (param42 ? (|(~&param42)) : ((param42 ? param42 : param42) ? param42 : {param42})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire18;
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  assign y = {wire41,
                 wire33,
                 wire18,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire4[(1'h0):(1'h0)] ?
          (8'hb3) : $unsigned($unsigned((wire4[(3'h4):(3'h4)] ?
              $unsigned(wire4) : (^~(8'hbb))))));
      reg6 <= (wire1 ?
          {$signed(wire2),
              (wire3 ?
                  (^(wire4 ~^ (8'hbd))) : $unsigned((~wire3)))} : (+wire0));
      if ({$signed($unsigned(reg6))})
        begin
          if (({(^~$signed(reg6[(3'h4):(1'h0)])),
              {(|(reg6 ? reg5 : (8'hbc))), wire3}} < wire4[(3'h4):(1'h1)]))
            begin
              reg7 <= (&(({$unsigned(wire0)} ?
                  $signed((|reg5)) : wire2) * $unsigned(reg5[(3'h7):(3'h6)])));
              reg8 <= wire3;
              reg9 <= {reg6};
              reg10 <= reg7;
            end
          else
            begin
              reg7 <= (&$signed($signed(wire2[(1'h0):(1'h0)])));
              reg8 <= wire2;
              reg9 <= $unsigned($signed(reg8[(4'hc):(4'ha)]));
              reg10 <= wire2;
            end
          reg11 <= (-{wire4});
          reg12 <= $signed(wire0);
          reg13 <= $signed(($signed(wire4) <<< (($unsigned(reg9) ?
              $signed(wire1) : wire1[(2'h2):(2'h2)]) | reg7)));
          if ($unsigned($signed(($signed($signed(reg7)) * $unsigned((~|wire0))))))
            begin
              reg14 <= (8'h9c);
              reg15 <= $signed(((^~reg7[(3'h6):(1'h1)]) ?
                  $signed($unsigned(((8'haa) ? reg11 : reg6))) : (((reg10 ?
                          (8'hb0) : wire4) >= (~|reg13)) ?
                      $unsigned({wire2}) : $signed($signed(reg13)))));
              reg16 <= reg5[(3'h7):(1'h0)];
              reg17 <= (-reg11[(3'h5):(2'h2)]);
            end
          else
            begin
              reg14 <= reg9[(1'h1):(1'h0)];
            end
        end
      else
        begin
          if ((wire3 ?
              reg8[(5'h10):(1'h1)] : $unsigned((wire0[(4'hd):(4'hb)] >> {wire3[(4'h8):(2'h3)]}))))
            begin
              reg7 <= {(|$signed(reg13))};
              reg8 <= (($unsigned(({reg5} ?
                          (reg10 ? reg9 : reg12) : (~&reg5))) ?
                      (((wire2 >>> wire2) ~^ reg6[(3'h4):(3'h4)]) - (~|$signed(reg7))) : (+{$signed(reg16),
                          reg9})) ?
                  wire4 : (($signed((8'hab)) ?
                          (~&(reg13 ? reg10 : reg13)) : wire2[(3'h4):(1'h1)]) ?
                      $signed(((reg5 || reg15) ?
                          $unsigned(reg6) : (reg15 >>> wire2))) : (((^reg6) ?
                          (reg9 != wire0) : wire4) - (-(reg16 <= wire0)))));
              reg9 <= (wire1 - $unsigned(((^reg6[(1'h1):(1'h1)]) ?
                  $unsigned((reg15 ^ reg14)) : $unsigned(reg17[(2'h2):(1'h0)]))));
              reg10 <= $signed(((wire3 > ((!reg9) ?
                  reg14 : ((7'h42) ^~ reg14))) << (~(reg8 >= $signed(reg15)))));
              reg11 <= ($signed({({reg5, reg15} >> reg10[(1'h0):(1'h0)]),
                  {$signed(wire2)}}) >> ((wire3[(5'h10):(3'h7)] ?
                      $signed(((8'ha0) ? reg8 : reg7)) : reg15[(3'h4):(1'h0)]) ?
                  $signed(((~|reg13) & reg11)) : ($signed(reg16[(4'hc):(3'h6)]) ?
                      (^~$unsigned(reg5)) : reg17[(1'h1):(1'h1)])));
            end
          else
            begin
              reg7 <= (reg5[(4'hf):(4'h9)] ?
                  $unsigned(reg7[(3'h5):(1'h1)]) : $signed($signed((-(-reg11)))));
              reg8 <= $signed($unsigned(reg16));
            end
          reg12 <= reg6;
          reg13 <= $unsigned($signed(reg9));
          if ($unsigned({{(~^reg10[(3'h6):(1'h0)]),
                  ({(8'hbe), reg13} ^~ (wire3 & reg12))},
              reg9}))
            begin
              reg14 <= $unsigned($unsigned(($unsigned((wire4 == reg8)) + $signed($unsigned(reg5)))));
              reg15 <= wire4[(2'h3):(2'h3)];
              reg16 <= reg13[(3'h4):(2'h2)];
            end
          else
            begin
              reg14 <= wire4;
              reg15 <= {$signed((wire1 ?
                      wire0 : ($unsigned(reg15) ? reg12 : $signed(wire0))))};
              reg16 <= wire3[(3'h4):(3'h4)];
              reg17 <= reg16[(4'h8):(4'h8)];
            end
        end
    end
  assign wire18 = {$unsigned(($unsigned((wire4 + wire3)) == $signed(reg6[(1'h0):(1'h0)]))),
                      $unsigned($signed(reg14))};
  module19 #() modinst34 (.wire21(reg17), .wire23(wire3), .clk(clk), .wire22(reg15), .wire24(reg5), .wire20(wire2), .y(wire33));
  always
    @(posedge clk) begin
      reg35 <= $unsigned(reg16[(5'h10):(4'hf)]);
      reg36 <= $signed(reg17[(3'h7):(1'h0)]);
      if ((-{wire33, $unsigned(($signed(reg13) == $signed(reg36)))}))
        begin
          reg37 <= ((reg6[(1'h0):(1'h0)] ?
                  wire18 : (~(reg13[(4'h8):(3'h7)] ?
                      (~|reg15) : (reg35 ? reg8 : (8'ha4))))) ?
              $unsigned($signed({{wire18, reg5}})) : {reg35});
          reg38 <= (&(((reg16 ?
                  $unsigned(reg36) : (8'hab)) <= $signed($unsigned(reg35))) ?
              $signed(($signed((8'ha1)) + $unsigned(reg35))) : wire2));
        end
      else
        begin
          if ({wire2[(4'h8):(2'h2)]})
            begin
              reg37 <= ((|((~^reg7[(3'h5):(3'h4)]) ?
                  $unsigned((reg13 ?
                      reg16 : reg8)) : reg15)) <<< (($unsigned(wire3) <<< $signed(reg37[(3'h4):(3'h4)])) ?
                  (~&wire1) : $unsigned({$unsigned(wire1)})));
            end
          else
            begin
              reg37 <= $unsigned($unsigned(reg11[(3'h4):(2'h2)]));
              reg38 <= $unsigned($signed({reg8, ($unsigned(wire4) <<< wire4)}));
            end
          reg39 <= reg12;
        end
      reg40 <= $unsigned(((~&$signed((wire1 ? wire18 : wire33))) - (&(~(reg6 ?
          reg35 : wire2)))));
    end
  assign wire41 = reg15;
endmodule

module module19
#(parameter param32 = {(-((8'ha3) != (((8'hba) ? (8'hb4) : (8'ha3)) ? ((8'hb0) >= (7'h43)) : {(7'h42)})))})
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire [(4'he):(1'h0)] wire23;
  input wire signed [(5'h10):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  assign y = {wire31, wire30, wire29, wire28, wire27, wire26, wire25, (1'h0)};
  assign wire25 = wire20[(4'h9):(3'h6)];
  assign wire26 = {((&({wire22} ?
                          {wire21,
                              wire23} : $signed(wire23))) <= $signed($unsigned((8'ha7))))};
  assign wire27 = wire21;
  assign wire28 = (^(wire26[(5'h10):(4'he)] ?
                      {($unsigned(wire20) <= wire21),
                          wire23[(4'hc):(3'h4)]} : wire23[(4'ha):(1'h0)]));
  assign wire29 = wire25;
  assign wire30 = $unsigned(wire27[(3'h4):(3'h4)]);
  assign wire31 = (((((8'haf) ?
                              (wire29 >= wire22) : (wire27 ?
                                  wire23 : (8'hb7))) ?
                          ((wire27 == (8'hb9)) ?
                              (wire29 ?
                                  wire26 : wire22) : (8'hbf)) : $unsigned((wire21 >= wire22))) ?
                      {((wire29 & wire25) ? $signed((8'ha0)) : {wire23}),
                          (wire22 ?
                              wire29[(4'hc):(3'h5)] : wire29[(4'ha):(4'h9)])} : ((wire22[(4'h8):(4'h8)] ?
                          $signed((8'h9f)) : ((8'hae) ?
                              wire21 : wire20)) - $unsigned((^~wire29)))) < (!(-$unsigned((-wire28)))));
endmodule
