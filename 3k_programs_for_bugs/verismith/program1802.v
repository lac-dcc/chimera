module top
#(parameter param37 = ({(^~(^((8'hbf) ? (8'hb9) : (8'ha3))))} > (((((7'h41) > (7'h43)) ? {(8'ha7)} : (|(8'hab))) ^~ (((8'ha8) != (8'hb7)) ? (|(8'hbb)) : (^~(8'h9f)))) + ({((8'hb9) >= (8'ha6)), (&(7'h43))} ? (&((8'hbc) ? (8'hbb) : (8'haf))) : ({(8'ha0)} ? {(8'ha2)} : (^(8'ha7)))))), 
parameter param38 = (~^param37))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire36,
                 wire26,
                 wire6,
                 wire5,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed((|{((wire1 ? wire4 : wire1) <= wire3)}));
  assign wire6 = $signed($signed((~^wire3[(3'h7):(3'h6)])));
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire1[(4'hb):(3'h4)])))
        begin
          if ((8'ha9))
            begin
              reg7 <= (8'ha7);
              reg8 <= {wire1[(1'h0):(1'h0)], wire1};
              reg9 <= $unsigned(wire5[(2'h2):(1'h1)]);
            end
          else
            begin
              reg7 <= wire4[(2'h3):(1'h1)];
            end
          reg10 <= {$signed(($unsigned((reg7 ? wire6 : wire4)) ~^ (&reg9)))};
          reg11 <= (~(&wire3));
          reg12 <= reg8;
          if (wire6[(4'hc):(3'h4)])
            begin
              reg13 <= (wire6[(2'h2):(1'h1)] <= (~wire0[(2'h2):(2'h2)]));
              reg14 <= (|($unsigned(reg7) ?
                  (reg7 > {reg12[(4'h8):(3'h5)]}) : $unsigned(reg9)));
              reg15 <= {$signed({wire4[(3'h5):(3'h4)]})};
              reg16 <= $unsigned((~^$unsigned({((8'hb9) ? wire4 : reg8),
                  $signed(reg12)})));
            end
          else
            begin
              reg13 <= wire5[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg7 <= $unsigned({(~^(8'hb7)),
              (($unsigned(reg11) || ((8'hbf) >> reg12)) ^~ wire5)});
          reg8 <= (((($unsigned((8'hbf)) ? wire5 : wire5[(1'h1):(1'h0)]) ?
                  $signed(wire5) : ((~^reg9) ?
                      (+wire4) : $signed(reg11))) >>> ($unsigned(wire0[(4'ha):(3'h7)]) ?
                  reg12 : reg10[(3'h4):(1'h1)])) ?
              {$unsigned(reg14[(1'h0):(1'h0)])} : ($unsigned($unsigned(reg14[(5'h14):(3'h6)])) != ({(~|reg15)} ?
                  (&$unsigned(reg13)) : {(wire3 ? wire5 : wire2),
                      $signed(reg14)})));
          reg9 <= wire2[(4'h8):(3'h5)];
        end
      if (wire1)
        begin
          reg17 <= reg10;
        end
      else
        begin
          if ({($unsigned((~|$signed(wire0))) >= ((reg9 ?
                      (reg10 - wire2) : $unsigned(reg11)) ?
                  (8'ha4) : $signed({reg8, (8'hb0)})))})
            begin
              reg17 <= (($signed(wire2[(3'h4):(2'h2)]) ?
                      $signed($signed(wire4[(2'h3):(2'h2)])) : wire6[(4'ha):(4'h8)]) ?
                  $unsigned(reg16) : (~{{(8'ha8)}, wire5}));
            end
          else
            begin
              reg17 <= wire0[(4'ha):(4'h9)];
              reg18 <= $unsigned(wire5);
              reg19 <= $unsigned(($signed(wire5) ?
                  ((((8'haa) - wire5) != wire5[(3'h7):(1'h0)]) * $unsigned(reg8[(4'h8):(2'h3)])) : (~&$unsigned($unsigned(reg7)))));
              reg20 <= ((|{$signed(wire4)}) ~^ $signed((^~{(~^reg19)})));
            end
          reg21 <= ((({reg15} != ($signed(wire0) ?
              reg8 : $unsigned(reg13))) << wire3) < reg8);
          if ((~|reg16[(3'h5):(3'h5)]))
            begin
              reg22 <= wire4[(2'h3):(2'h3)];
              reg23 <= $unsigned(reg10[(2'h3):(2'h3)]);
              reg24 <= reg14[(4'h8):(3'h5)];
            end
          else
            begin
              reg22 <= (~|($unsigned(reg16[(1'h1):(1'h0)]) & $signed(wire3[(5'h10):(4'hd)])));
            end
          reg25 <= (8'hae);
        end
    end
  assign wire26 = $unsigned(reg19);
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg27 <= $signed(($unsigned(wire5) > $signed(wire5[(2'h3):(2'h3)])));
          if ((((~&(+(reg11 * reg12))) ?
              reg9 : reg8) <= $unsigned($signed($unsigned(reg18[(2'h2):(2'h2)])))))
            begin
              reg28 <= ($unsigned((reg22 ?
                  ($signed(wire4) & (8'hae)) : wire3[(5'h12):(3'h7)])) <<< wire1[(1'h0):(1'h0)]);
            end
          else
            begin
              reg28 <= (~|{reg22, reg20[(2'h2):(1'h1)]});
              reg29 <= reg28;
              reg30 <= (wire0 ^~ reg14[(5'h12):(5'h11)]);
              reg31 <= {((~$signed(reg28)) ?
                      (!((reg15 ? wire1 : reg22) ?
                          $unsigned(reg27) : (wire3 ^ reg18))) : $unsigned({{wire0}})),
                  {($signed((&reg18)) ~^ reg28)}};
            end
        end
      else
        begin
          reg27 <= ((!reg27) <= reg19);
          reg28 <= ((~^(~|reg7[(3'h4):(1'h0)])) ?
              ((8'hb1) << (8'ha4)) : wire4[(3'h5):(2'h3)]);
          reg29 <= reg22;
          reg30 <= ({$signed($signed((reg22 & (8'h9d)))), (^(8'ha7))} ?
              {(^~wire1)} : ((&$signed($unsigned(reg23))) | (wire3[(4'hb):(3'h7)] && reg31)));
        end
      reg32 <= reg28[(2'h2):(1'h0)];
      reg33 <= $unsigned(($signed(reg27[(2'h2):(1'h1)]) >= {wire26}));
      reg34 <= wire1[(4'hb):(3'h5)];
      reg35 <= wire6;
    end
  assign wire36 = {(8'hae),
                      (~|(reg22 ?
                          ($signed((8'ha2)) ?
                              $unsigned(reg29) : (^reg28)) : (reg23 == $unsigned((8'hb3)))))};
endmodule
