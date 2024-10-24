module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h275):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire30,
                 wire28,
                 wire27,
                 reg54,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg29,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire3[(2'h3):(2'h2)] ~^ ($unsigned(wire1) >>> {{(wire0 ?
                  (8'ha8) : wire4)}}));
      reg6 <= (wire4 ?
          {$unsigned({$signed((8'hb2)), (^wire1)})} : {(~|{(wire0 ?
                      wire3 : wire3)}),
              $signed(($signed(wire2) ^ (reg5 + wire3)))});
      reg7 <= $signed(($unsigned((|$unsigned(wire3))) & (wire3[(4'ha):(4'h9)] == ((reg6 ?
          (8'hbf) : (7'h42)) <<< wire0))));
      reg8 <= {$unsigned((~^$unsigned($unsigned(wire3))))};
    end
  always
    @(posedge clk) begin
      if ($unsigned({($unsigned((^~wire4)) ?
              (+(wire0 ? wire3 : wire1)) : ($unsigned(wire1) ?
                  $signed(wire4) : reg6[(1'h1):(1'h1)]))}))
        begin
          if ($signed(({(reg5 ^~ {(8'ha4)})} ?
              $signed((reg5 <<< reg7[(1'h1):(1'h0)])) : ((~^$unsigned(wire4)) ?
                  reg8[(5'h10):(3'h4)] : wire0))))
            begin
              reg9 <= {$unsigned(wire3[(4'h8):(3'h4)])};
            end
          else
            begin
              reg9 <= (~^$signed((-wire1[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg9 <= wire0;
          if ((+$unsigned((^~wire1))))
            begin
              reg10 <= $unsigned((8'hb4));
              reg11 <= $signed($unsigned((wire4[(4'ha):(1'h0)] ?
                  $signed($signed(wire0)) : reg6)));
              reg12 <= $unsigned({reg6});
              reg13 <= $unsigned(((~|reg10) ^ (~|wire2[(3'h6):(1'h1)])));
              reg14 <= $unsigned($signed({$signed((~reg8)),
                  $unsigned((8'haa))}));
            end
          else
            begin
              reg10 <= {$unsigned((|$unsigned($signed((8'hb8))))), (8'ha3)};
              reg11 <= (wire4[(4'he):(4'h9)] ?
                  $unsigned($unsigned(reg9[(3'h4):(2'h3)])) : $signed(wire1));
              reg12 <= reg12;
              reg13 <= $signed({$signed((~&wire1))});
              reg14 <= reg8;
            end
          reg15 <= (~|reg5[(2'h3):(2'h2)]);
          reg16 <= wire2[(3'h4):(3'h4)];
          if (reg7)
            begin
              reg17 <= (~^reg13);
            end
          else
            begin
              reg17 <= reg12;
            end
        end
      reg18 <= reg12[(3'h5):(2'h2)];
      reg19 <= (7'h40);
      reg20 <= (8'had);
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg18[(1'h1):(1'h0)]))
        begin
          reg21 <= ((|$unsigned(((reg5 ? wire2 : reg13) ?
              (8'ha2) : $signed(reg13)))) != (8'h9c));
          if (($signed((reg5[(2'h2):(1'h0)] ?
              $signed((reg8 ? wire1 : reg14)) : ((reg20 > (8'h9d)) ?
                  wire0[(5'h11):(2'h3)] : (|reg19)))) >>> reg7[(3'h4):(1'h0)]))
            begin
              reg22 <= reg7[(3'h5):(2'h3)];
              reg23 <= reg16[(1'h1):(1'h1)];
              reg24 <= (^wire4);
            end
          else
            begin
              reg22 <= reg8;
              reg23 <= ((&(wire4[(1'h1):(1'h1)] ?
                  $unsigned($unsigned(reg18)) : $unsigned((reg12 <<< (8'hbe))))) <= reg11[(2'h3):(1'h0)]);
            end
        end
      else
        begin
          reg21 <= (((|{{reg23}}) >= reg13[(1'h1):(1'h0)]) ?
              (($unsigned({wire3, reg17}) - $unsigned(wire4[(4'hc):(4'ha)])) ?
                  $signed(reg10) : {$signed(wire1[(3'h4):(2'h3)]),
                      ($signed(wire4) ?
                          $unsigned(reg6) : (~(8'hab)))}) : (((~$signed(reg6)) ?
                  ($signed(reg15) <= $signed(wire1)) : (+reg7[(3'h5):(3'h4)])) <<< ((+(+reg14)) + ((wire3 ^ reg14) ^ (reg22 >>> (8'ha9))))));
          if ($signed($signed(reg18)))
            begin
              reg22 <= $unsigned((~|((&reg21) > (~^(&reg15)))));
              reg23 <= reg6;
              reg24 <= (&(-(reg8[(5'h11):(2'h2)] >> (!$signed(reg23)))));
              reg25 <= $signed(reg20[(3'h6):(3'h6)]);
              reg26 <= $signed($signed({reg13, (reg25 || (+reg7))}));
            end
          else
            begin
              reg22 <= ($signed((($signed(reg6) ?
                          wire2[(4'hb):(3'h4)] : reg22) ?
                      wire4[(4'hf):(1'h0)] : (reg21 ?
                          reg22 : ((8'hb9) <<< reg15)))) ?
                  reg21 : ((($unsigned(reg23) ?
                      (reg11 + wire3) : reg19[(3'h4):(1'h1)]) << $signed((reg13 ?
                      (8'hae) : reg14))) - reg6));
              reg23 <= $unsigned((~reg20));
              reg24 <= (-{(wire0[(3'h6):(3'h6)] | $unsigned((reg20 ?
                      reg7 : reg13))),
                  (reg26[(2'h3):(2'h2)] ? $signed($signed(reg16)) : (!reg7))});
              reg25 <= ($signed((!$unsigned($unsigned(reg17)))) ?
                  reg11 : reg18);
            end
        end
    end
  assign wire27 = $signed((^$signed(reg15[(3'h7):(3'h5)])));
  assign wire28 = (^{($unsigned(reg9) * wire2[(2'h3):(1'h1)])});
  always
    @(posedge clk) begin
      reg29 <= (8'haf);
    end
  assign wire30 = (^reg11[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      reg31 <= (($unsigned($signed($unsigned(wire28))) - (&({(8'hab)} >> reg22))) ?
          reg26 : reg16[(2'h2):(1'h1)]);
      reg32 <= ((&reg15) ?
          $signed($signed((wire30 ?
              reg12 : $unsigned(reg25)))) : $signed((&wire3[(4'hf):(4'hc)])));
      reg33 <= reg14[(4'h8):(3'h5)];
      if ((|(reg12 ? (!(~$unsigned(reg17))) : reg29)))
        begin
          reg34 <= reg7[(2'h2):(2'h2)];
          if ((8'haa))
            begin
              reg35 <= reg22;
            end
          else
            begin
              reg35 <= {wire1, $unsigned((^$unsigned($unsigned(wire30))))};
              reg36 <= ($signed(($unsigned(reg33) ?
                      reg24 : {wire0, ((8'hae) ? (8'ha4) : reg20)})) ?
                  $signed(wire27[(3'h7):(3'h5)]) : reg12);
            end
          reg37 <= (8'hbc);
        end
      else
        begin
          if ($signed($signed(reg10)))
            begin
              reg34 <= (reg37 ? (+reg15) : reg9[(2'h2):(1'h0)]);
              reg35 <= reg10[(1'h1):(1'h1)];
              reg36 <= $signed($signed(reg13[(4'hf):(4'h8)]));
              reg37 <= (|wire1[(1'h1):(1'h1)]);
            end
          else
            begin
              reg34 <= $signed((!reg10));
              reg35 <= reg25;
              reg36 <= reg25;
              reg37 <= ((~(reg24[(4'ha):(3'h4)] != reg12[(4'h8):(2'h3)])) ?
                  {(reg26 || (~^(^~reg5))),
                      (~|$signed((&(8'h9e))))} : $signed(reg17[(3'h5):(1'h1)]));
              reg38 <= $signed(reg22[(1'h1):(1'h0)]);
            end
          reg39 <= reg13[(1'h0):(1'h0)];
          if ($unsigned({$unsigned($unsigned(reg19[(4'hb):(1'h1)])),
              $signed($unsigned({reg33}))}))
            begin
              reg40 <= reg37[(3'h6):(3'h6)];
              reg41 <= ((($signed($unsigned(reg32)) ?
                  $unsigned(reg36) : reg8[(1'h1):(1'h0)]) >>> ({$unsigned(reg21)} * wire2[(2'h3):(1'h1)])) > {wire1,
                  (((~^reg21) ~^ reg18[(3'h5):(3'h4)]) + ((~|reg34) ?
                      (reg11 >>> reg39) : reg40[(4'ha):(3'h6)]))});
              reg42 <= reg14[(1'h1):(1'h0)];
            end
          else
            begin
              reg40 <= (wire1[(1'h1):(1'h1)] << $signed(((8'ha8) ?
                  (wire2 >>> $unsigned(wire4)) : ($unsigned(reg5) || $unsigned(wire1)))));
            end
          reg43 <= ((((^~wire28[(1'h0):(1'h0)]) ?
              ((8'ha0) ?
                  (~^reg40) : ((8'hb3) ?
                      reg39 : reg16)) : $signed($signed(reg34))) >>> reg19) - reg37);
        end
      if (reg19[(3'h4):(1'h0)])
        begin
          reg44 <= {reg35, reg43};
        end
      else
        begin
          reg44 <= $unsigned(reg12);
        end
    end
  assign wire45 = ((reg11 ?
                      {reg10[(3'h4):(2'h2)],
                          ($unsigned((8'haf)) ^~ (-wire0))} : {(reg17 <= {reg18,
                              wire0})}) != (reg24 ?
                      {reg15[(4'hc):(4'hc)]} : ((reg37 ?
                          reg33[(4'hb):(4'h8)] : $signed(wire4)) == $unsigned({(8'hac),
                          reg38}))));
  assign wire46 = ((($signed($unsigned(reg16)) && {$unsigned(reg19)}) ?
                      (($unsigned(reg36) >>> $unsigned(reg6)) & (8'ha2)) : $signed(reg9)) <<< $unsigned($unsigned(wire1)));
  assign wire47 = ($signed(reg12) ^ reg33);
  assign wire48 = (reg6 ?
                      $signed((~^((wire4 >> reg26) ?
                          (reg26 ? reg25 : reg38) : (reg42 > reg5)))) : wire28);
  assign wire49 = reg25[(1'h1):(1'h0)];
  assign wire50 = (reg9 ?
                      (|reg8[(2'h2):(1'h0)]) : (^$signed($signed($signed(reg38)))));
  assign wire51 = $unsigned((8'hb2));
  assign wire52 = reg18[(3'h5):(1'h0)];
  assign wire53 = wire47;
  always
    @(posedge clk) begin
      reg54 <= reg10;
    end
  assign wire55 = $unsigned($signed(reg17));
  assign wire56 = $signed((7'h44));
endmodule
